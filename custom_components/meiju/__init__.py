"""The component."""
import logging
import asyncio
import time
import json
import os
import datetime
import functools as fts
import voluptuous as vol

from homeassistant.core import HomeAssistant
from homeassistant.const import *
from homeassistant.util import yaml
from homeassistant.helpers import aiohttp_client
from homeassistant.helpers.storage import Store
from homeassistant.helpers.entity import Entity
from homeassistant.helpers.entity_component import EntityComponent
from homeassistant.helpers.update_coordinator import DataUpdateCoordinator
from homeassistant.helpers.reload import (
    async_integration_yaml_config,
    async_reload_integration_platforms,
)
from homeassistant.helpers.template import Template
from homeassistant.components import persistent_notification
import homeassistant.helpers.config_validation as cv
from aiohttp.client_exceptions import ClientConnectorError

from msmart.security import get_udpid
from .const import *
from .core.cloud import MsmartCloud, MeijuCloud
from .core.device import MsmartDevice

_LOGGER = logging.getLogger(__name__)

SCAN_INTERVAL = datetime.timedelta(seconds=25)

DEVICE_SCHEMA = vol.Schema(
    {
        vol.Required(CONF_HOST): cv.string,
        vol.Optional(CONF_PORT, default=DEFAULT_PORT): cv.positive_int,
        vol.Required(CONF_DEVICE_ID): cv.positive_int,
        vol.Optional(CONF_SCAN_INTERVAL, default=SCAN_INTERVAL): cv.time_period,
        vol.Optional(CONF_LAN_KEY, default=''): cv.string,
        vol.Optional(CONF_LAN_TOKEN, default=''): cv.string,
    },
    extra=vol.ALLOW_EXTRA,
)

ACCOUNT_SCHEMA = vol.Schema(
    {
        vol.Optional(CONF_SCAN_INTERVAL, default=SCAN_INTERVAL): cv.time_period,
        vol.Optional(CONF_CLOUD_SERVER, default=DEFAULT_SERVER): vol.In(CLOUD_SERVICES),
        vol.Required(CONF_USERNAME): cv.string,
        vol.Required(CONF_PASSWORD): cv.string,
        vol.Optional(CONF_DEVICES): vol.All(cv.ensure_list, [DEVICE_SCHEMA]),
    },
    extra=vol.ALLOW_EXTRA,
)

CONFIG_SCHEMA = vol.Schema(
    {
        DOMAIN: ACCOUNT_SCHEMA.extend(
            {
                vol.Optional(CONF_ACCOUNTS): vol.All(cv.ensure_list, [ACCOUNT_SCHEMA]),
            },
        ),
    },
    extra=vol.ALLOW_EXTRA,
)


async def async_setup(hass: HomeAssistant, hass_config: dict):
    hass.data.setdefault(DOMAIN, {})
    config = hass_config.get(DOMAIN) or {}
    await async_reload_integration_config(hass, config)

    hass.data[DOMAIN].setdefault(CONF_ACCOUNTS, {})
    hass.data[DOMAIN].setdefault(CONF_DEVICES, {})
    hass.data[DOMAIN].setdefault(CONF_ENTITIES, {})
    hass.data[DOMAIN].setdefault('add_entities', {})

    component = EntityComponent(_LOGGER, DOMAIN, hass, SCAN_INTERVAL)
    hass.data[DOMAIN]['component'] = component
    await component.async_setup(config)

    als = config.get(CONF_ACCOUNTS) or []
    if CONF_PASSWORD in config:
        acc = {**config}
        acc.pop(CONF_ACCOUNTS, None)
        als.append(acc)

    for cfg in als:
        if not cfg.get(CONF_PASSWORD):
            continue
        acc = MeijuAccount(hass, cfg)
        await acc.async_check_auth()
        if not acc.access_token:
            _LOGGER.warning('Login failed: %s', cfg.get(CONF_USERNAME))
            continue
        await acc.update_devices(cfg.get(CONF_DEVICES) or [])
        hass.data[DOMAIN][CONF_ACCOUNTS][acc.uid] = acc

    for platform in SUPPORTED_DOMAINS:
        hass.async_create_task(
            hass.helpers.discovery.async_load_platform(platform, DOMAIN, {}, config)
        )

    ComponentServices(hass)
    return True


async def async_setup_accounts(hass: HomeAssistant, domain):
    for dvc in hass.data[DOMAIN][CONF_DEVICES].values():
        await dvc.update_hass_entities(domain)


async def async_reload_integration_config(hass, config):
    hass.data[DOMAIN]['config'] = config

    dcs = yaml.load_yaml(os.path.dirname(__file__) + '/device_customizes.yaml') or {}
    DEVICE_CUSTOMIZES.update(dcs)

    dcs = config.get('customizes')
    if dcs and isinstance(dcs, dict):
        for m, cus in dcs.items():
            DEVICE_CUSTOMIZES.setdefault(m, {})
            DEVICE_CUSTOMIZES[m].update(cus)

    return config


class ComponentServices:
    def __init__(self, hass: HomeAssistant):
        self.hass = hass

        hass.helpers.service.async_register_admin_service(
            DOMAIN, SERVICE_RELOAD, self.handle_reload_config,
        )

        hass.services.async_register(
            DOMAIN, 'request_api', self.async_request_api,
            schema=vol.Schema({
                vol.Required('api'): cv.string,
                vol.Optional('params', default={}): vol.Any(dict, None),
                vol.Optional(ATTR_ENTITY_ID): cv.string,
                vol.Optional(CONF_USERNAME): cv.string,
                vol.Optional('throw', default=True): cv.boolean,
            }),
        )

        hass.services.async_register(
            DOMAIN, 'send_command', self.async_send_command,
            schema=vol.Schema({
                vol.Required(ATTR_ENTITY_ID): cv.string,
                vol.Required('command'): vol.Any(cv.string, list, dict),
                vol.Optional('cloud', default=False): cv.boolean,
                vol.Optional('throw', default=True): cv.boolean,
            }),
        )

        hass.services.async_register(
            DOMAIN, 'get_lua', self.async_get_lua,
            schema=vol.Schema({
                vol.Required(ATTR_ENTITY_ID): cv.string,
                vol.Optional('throw', default=True): cv.boolean,
            }),
        )

        hass.services.async_register(
            DOMAIN, 'get_plugin', self.async_get_plugin,
            schema=vol.Schema({
                vol.Required(ATTR_ENTITY_ID): cv.string,
                vol.Optional('throw', default=True): cv.boolean,
            }),
        )

    async def handle_reload_config(self, call):
        config = await async_integration_yaml_config(self.hass, DOMAIN)
        if not config or DOMAIN not in config:
            return
        await async_reload_integration_config(self.hass, config.get(DOMAIN) or {})
        current_entries = self.hass.config_entries.async_entries(DOMAIN)
        reload_tasks = [
            self.hass.config_entries.async_reload(entry.entry_id)
            for entry in current_entries
        ]
        await asyncio.gather(*reload_tasks)
        await async_reload_integration_platforms(self.hass, DOMAIN, SUPPORTED_DOMAINS)

    async def async_request_api(self, call):
        dat = call.data or {}
        eid = dat.get(ATTR_ENTITY_ID)
        unm = dat.get(CONF_USERNAME)
        acc = None
        for a in self.hass.data[DOMAIN][CONF_ACCOUNTS].values():
            if not isinstance(acc, MeijuAccount):
                continue
            if unm and unm != acc.username:
                continue
            acc = a
            break
        ent = self.hass.data[DOMAIN][CONF_ENTITIES].get(eid) if eid else None
        if ent and isinstance(ent, BaseEntity):
            acc = ent.account
        api = dat['api']
        pms = dat.get('params') or {}
        if acc:
            rdt = await acc.async_request(api, pms)
        else:
            rdt = ['Not found logined account.']
        if dat.get('throw', True):
            persistent_notification.async_create(
                self.hass, f'{rdt}', 'Request Meiju API result', f'{DOMAIN}-debug',
            )
        self.hass.bus.async_fire(f'{DOMAIN}.request_api', {
            CONF_USERNAME: acc.username,
            'uid': acc.uid,
            'api': api,
            'params': pms,
            'result': rdt,
        })
        return rdt

    async def async_send_command(self, call):
        dat = call.data or {}
        eid = dat.get(ATTR_ENTITY_ID)
        ent = self.hass.data[DOMAIN][CONF_ENTITIES].get(eid) if eid else None
        if not isinstance(ent, BaseEntity):
            raise ValueError(f'{eid} not found for service: {call}')
        cmd = dat.get(ATTR_COMMAND)
        if isinstance(cmd, str):
            cmd = list(bytes.fromhex(cmd))
        if isinstance(cmd, list):
            cmd = dict(zip(range(0, len(cmd)), cmd))
        if not isinstance(cmd, dict):
            raise ValueError(f'Send command ({cmd}) to {eid} must be str, list or dict for service: {call}')
        res = await ent.device.async_control(cmd, dat.get('cloud', False))

        if dat.get('throw', True):
            persistent_notification.async_create(
                self.hass, f'{res}', 'Send command result', f'{DOMAIN}-debug',
            )
        self.hass.bus.async_fire(f'{DOMAIN}.send_command', {
            ATTR_ENTITY_ID: eid,
            'command': cmd,
        })
        return res

    async def async_get_lua(self, call):
        dat = call.data or {}
        eid = dat.get(ATTR_ENTITY_ID)
        ent = self.hass.data[DOMAIN][CONF_ENTITIES].get(eid) if eid else None
        if not isinstance(ent, BaseEntity):
            raise ValueError(f'{eid} not found for service: {call}')
        api = '/appliance/protocol/lua/luaGet'
        pms = {
            'applianceSn': ent.device.sn,
            'applianceType': ent.device.type_str,
            'applianceMFCode': ent.device.info.get('enterpriseCode', '0000'),
            'version': '0',
            'iotAppId': '900',
        }
        rdt = await ent.account.async_request(api, pms)
        lfn = rdt['fileName']
        if url := (rdt or {}).get('url'):
            res = await ent.account.http.get(url)
            lua = await res.text()
            if lua:
                lua = ent.account.cloud.security.decrypt_with_key(lua)
            if lua:
                rdt = f'-- {url}\n\n```{lua}```'
        if dat.get('throw', True):
            persistent_notification.async_create(
                self.hass, f'{rdt}', f'Meiju Lua for {ent.device.type_str}:', f'{DOMAIN}-debug',
            )
        fnm = f'lua/{lfn}'
        lfp = f'{os.path.dirname(__file__)}/{fnm}'
        if not os.path.exists(lfp):
            with open(lfp, 'w') as fp:
                fp.write(lua)
        return rdt

    async def async_get_plugin(self, call):
        dat = call.data or {}
        eid = dat.get(ATTR_ENTITY_ID)
        ent = self.hass.data[DOMAIN][CONF_ENTITIES].get(eid) if eid else None
        if not isinstance(ent, BaseEntity):
            raise ValueError(f'{eid} not found for service: {call}')
        api = '/plugin/update/getPluginV2'
        pms = {
            'clientType': '1',
            'clientVersion': 101,
            'match': '1',
            'iotAppId': '900',
            'applianceList': json.dumps([{
                'appType': ent.device.type_str,
                'appModel': ent.device.sn8,
                'applianceCode': ent.device.did,
                'appEnterprise': ent.device.info.get('enterpriseCode', '0000'),
                'modelNumber': ent.device.info.get('modelNumber', 0),
            }]),
        }
        rdt = await ent.account.async_request(api, pms)
        if dat.get('throw', True):
            persistent_notification.async_create(
                self.hass, f'{rdt}', f'Meiju Plugin for {ent.device.type_str}:', f'{DOMAIN}-debug',
            )
        return rdt


class MeijuAccount:
    def __init__(self, hass: HomeAssistant, config: dict):
        self.hass = hass
        self.http = aiohttp_client.async_create_clientsession(hass, auto_cleanup=False)
        self.config = config
        self.devices = {}
        if not self.use_china_server:
            self.cloud = MsmartCloud(self.username, self.password)
        else:
            self.cloud = MeijuCloud(self.username, self.password)

    def get_config(self, key, default=None):
        return self.config.get(key, self.hass.data[DOMAIN]['config'].get(key, default))

    @property
    def username(self):
        return self.get_config(CONF_USERNAME)

    @property
    def password(self):
        return self.get_config(CONF_PASSWORD)

    @property
    def cloud_server(self):
        return self.get_config(CONF_CLOUD_SERVER, DEFAULT_SERVER)

    @property
    def use_china_server(self):
        return self.cloud_server == 'china'

    @property
    def session(self):
        return self.cloud.session or {}

    @property
    def uid(self):
        return self.session.get('uid')

    @property
    def access_token(self):
        return self.cloud.accessToken

    @property
    def data_key(self):
        key = self.session.get('key', '')
        return self.cloud.security.decrypt_with_key(key)

    def decrypt_with_key(self, data):
        return self.cloud.security.decrypt_with_key(data, self.data_key)

    def encrypt_with_key(self, data):
        return self.cloud.security.encrypt_with_key(data, self.data_key)

    @property
    def update_interval(self):
        return self.get_config(CONF_SCAN_INTERVAL) or SCAN_INTERVAL

    def api_url(self, api=''):
        if api[:6] == 'https:' or api[:5] == 'http:':
            return api
        bas = self.cloud.SERVER_URL
        return f"{bas.rstrip('/')}/{api.lstrip('/')}"

    async def async_request(self, api, pms=None, **kwargs):
        if self.use_china_server:
            if api[0:3] not in ['/v1', 'v1/']:
                api = f"/v1/{api.lstrip('/')}"
            uri = self.api_url(api)
            pms = self.cloud.build_params(pms or {})
            jso = json.dumps(pms, separators=(',', ':'))
            rnd = str(int(time.time() * 1000))
            hds = {
                'Content-Type': 'application/json; charset=utf-8',
                'User-Agent': f'meiju/7.8.0 (Android;Victoria7.1.1)',
                'sign': self.cloud.security.new_sign(jso, rnd),
                'random': rnd,
                'accessToken': self.cloud.accessToken,
                'secretVersion': '1',
                'platform': '0',
            }
            rsp = await self.http.post(uri, data=jso, headers=hds)
            dat = await rsp.json() or {}
            dat = dat.get('data') or dat
        else:
            try:
                dat = await self.hass.async_add_executor_job(
                    fts.partial(self.cloud.api_request, api, pms, **kwargs)
                ) or {}
            except (ValueError, ClientConnectorError) as exc:
                dat = {}
                _LOGGER.warning('request error: %s', [api, pms, exc])
        code = dat.get('code')
        if code:
            _LOGGER.warning('request api: %s', [api, pms, dat])
        if code in [1008, 40002]:
            await self.async_login()
        return dat

    async def async_login(self):
        self.cloud.login_id = None
        self.cloud.session = None
        await self.hass.async_add_executor_job(self.cloud.login)
        if self.cloud.accessToken:
            await self.async_check_auth(save=True)

    async def async_check_auth(self, save=False):
        fnm = f'{DOMAIN}/auth-{self.username}-{self.cloud_server}.json'
        sto = Store(self.hass, 1, fnm)
        old = await sto.async_load() or {}
        if save:
            cfg = {
                CONF_USERNAME: self.username,
                CONF_SESSION: self.cloud.session,
                CONF_DEVICE_ID: self.cloud.device_id,
                'update_at': f'{datetime.datetime.today()}',
            }
            await sto.async_save(cfg)
            return cfg
        session = old.get(CONF_SESSION) or {}
        token = session.get('mdata', {}).get('accessToken')
        if token:
            self.cloud.session = session
            self.cloud.accessToken = token
            if did := old.get(CONF_DEVICE_ID):
                self.cloud.device_id = did
            await self.get_homegroups(force_update=True)
        else:
            await self.async_login()
        return old

    async def get_homegroups(self, force_update=False):
        if not self.cloud.home_groups or force_update:
            rsp = await self.async_request('homegroup/list/get') or {}
            self.cloud.home_groups = rsp.get('homeList', rsp.get('list', []))
        return self.cloud.home_groups or []

    async def get_devices(self):
        dvs = {}
        hls = await self.get_homegroups()
        for home in hls:
            hgi = home.get('homegroupId') or home.get('id')
            if not hgi or int(home.get('applianceCount', -1)) == 0:
                continue
            rsp = await self.async_request('appliance/home/list/get', {
                'homegroupId': hgi,
                'uiTemplate': '1',
            })
            for h in rsp.get('homeList') or []:
                for r in h.get('roomList') or []:
                    for a in r.get('applianceList'):
                        did = a.get('applianceCode')
                        dvs[did] = a
        return dvs

    async def update_devices(self, devices):
        dls = await self.get_devices()
        for dat in dls.values():
            dvc = BaseDevice(dat, {}, self)
            _LOGGER.warning(' '.join([
                f'{dvc.did}', dvc.type_hex, dvc.sn8, dvc.sn,
                dat.get('enterpriseCode'), dat.get('modelNumber'), dat.get('name'),
            ]))
        for cfg in devices:
            did = cfg.get(CONF_DEVICE_ID)
            dat = dls.get(str(did))
            _LOGGER.info('Setup device: %s', [did, cfg, dat])
            if not dat:
                continue
            dvc = BaseDevice(dat, cfg, self)
            await dvc.auth_device()
            await dvc.coordinator.async_config_entry_first_refresh()
            self.devices[did] = dvc
            self.hass.data[DOMAIN][CONF_DEVICES][did] = dvc
            for d in SUPPORTED_DOMAINS:
                await dvc.update_hass_entities(d)
        return self.devices


class BaseDevice:
    data: dict

    def __init__(self, info: dict, config: dict, account: MeijuAccount):
        self.account = account
        self.hass = account.hass
        self.info = info
        self.config = config
        self.entities = {}
        self.listeners = {}
        self.status = {}
        self.lan_key = self.get_config(CONF_LAN_KEY)
        self.lan_token = self.get_config(CONF_LAN_TOKEN)
        try:
            self.lan_device = MsmartDevice(self.type, self.did, self.host, self.port)
        except TypeError:
            self.lan_device = None
        if self.lan_device:
            self.coordinator = DataUpdateCoordinator(
                self.hass,
                _LOGGER,
                name=f'{DOMAIN}-{self.did}-status',
                update_interval=self.update_interval,
                update_method=self.update_device_status,
            )
            self.coordinator.async_add_listener(self._handle_listeners)

    def _handle_listeners(self):
        for fun in self.listeners.values():
            fun()

    def get_config(self, key, default=None):
        return self.config.get(key, default)

    @property
    def update_interval(self):
        return self.get_config(CONF_SCAN_INTERVAL) or self.account.update_interval

    @property
    def did(self):
        return int(self.info.get('applianceCode') or self.config.get(CONF_DEVICE_ID, 0))

    @property
    def name(self):
        return self.info.get('name', f'Meiju {self.sn8}'.strip())

    @property
    def type(self):
        try:
            return int(self.info.get('type'), 16)
        except (TypeError, ValueError):
            return 0

    @property
    def type_hex(self):
        return bytearray([self.type]).hex()

    @property
    def type_str(self):
        return f'0x{self.type_hex.upper()}'

    @property
    def id6(self):
        return f'{self.did}'[-6:]

    @property
    def sn(self):
        sn = self.info.get('sn', '')
        if sn:
            sn = self.account.decrypt_with_key(sn)
        return sn

    @property
    def sn8(self):
        return self.info.get('sn8', '').upper()

    @property
    def model(self):
        return self.info.get('productModel') or self.sn8

    @property
    def host(self):
        return self.get_config(CONF_HOST)

    @property
    def port(self):
        return int(self.get_config(CONF_PORT) or DEFAULT_PORT)

    @property
    def customizes(self):
        cus = DEVICE_CUSTOMIZES.get(self.type_hex.upper()) or DEVICE_CUSTOMIZES.get(self.type_hex) or {}
        cus.update(DEVICE_CUSTOMIZES.get(self.sn8) or {})
        return cus

    async def update_device_status(self):
        extra = self.customizes.get('get_extra') or {}
        await self.hass.async_add_executor_job(self.lan_device.refresh, extra)
        status = self.lan_device.status
        if status:
            self.status = status
            for ent in self.entities.values():
                await ent.async_update()
        _LOGGER.info('%s: Update device status: %s', self.name, status)
        return status

    async def auth_device(self):
        auth = None
        has_local = self.lan_key and self.lan_token
        if has_local:
            auth = await self.hass.async_add_executor_job(self.lan_device.authenticate, self.lan_key, self.lan_token)
            if auth:
                return
        for byteorder in ['big', 'little']:
            udpid = get_udpid(self.did.to_bytes(6, byteorder)) # noqa
            token, key = await self.hass.async_add_executor_job(self.account.cloud.gettoken, udpid)
            if token:
                auth = await self.hass.async_add_executor_job(self.lan_device.authenticate, key, token)
            if auth:
                self.lan_key = key
                self.lan_token = token
                _LOGGER.debug('%s: Auth device success: %s', self.name, [byteorder, udpid, token, key])
                if has_local:
                    _LOGGER.warning(
                        '%s: Auth device failed use key/token from config, please update them (key: %s, token: %s).',
                        self.name, key, token,
                    )
                break
            _LOGGER.warning('%s: Auth device failed: %s', self.name, [byteorder, udpid, token, key])

    async def async_control(self, cmd: dict, cloud=False):
        cmd = self.lan_device.control_command(cmd)
        if cloud:
            api = '/appliance/transparent/send'
            pkt = self.lan_device.command_packet(cmd, encrypt=False)
            pms = {
                'applianceCode': str(self.did),
                'order': self.account.encrypt_with_key(self.account.cloud.encode(pkt)).hex(),
                'timestamp': 'true',
            }
            rdt = await self.account.async_request(api, pms) or {}
            if rep := rdt.get('reply'):
                rsp = self.account.cloud.decode(
                    bytearray(self.account.decrypt_with_key(rep).encode())
                )
                rsp = bytes(rsp[40:-16])
            else:
                rsp = None
                _LOGGER.warning('%s: Control failed via cloud: %s', self.name, [cmd.data.hex(' '), rdt])
        else:
            rsp = await self.hass.async_add_executor_job(
                self.lan_device.send_command, cmd
            )
        if isinstance(rsp, bytes):
            rsp = rsp.hex()
        _LOGGER.info('%s: Control device: %s', self.name, [cmd.data.hex(' '), rsp])
        return rsp

    async def update_hass_entities(self, domain):
        from .binary_sensor import XBinarySensorEntity
        from .button import XButtonEntity
        from .sensor import XSensorEntity, DeviceInfoSensorEntity
        from .switch import XSwitchEntity
        from .select import XSelectEntity
        from .number import XNumberEntity
        hdk = {
            'switch': 'switches',
        }.get(domain, f'{domain}s')
        cls = self.customizes.get(hdk) or {}
        if domain == 'sensor':
            cls['info'] = {}
        add = self.hass.data[DOMAIN]['add_entities'].get(domain)
        if not add or not cls:
            return
        for k, cfg in cls.items():
            key = f'{domain}.{k}.{self.did}'
            new = None
            if key in self.entities:
                pass
            elif add and domain == 'binary_sensor':
                new = XBinarySensorEntity(k, self, cfg)
            elif add and domain == 'sensor' and k == 'info':
                new = DeviceInfoSensorEntity(self)
            elif add and domain == 'sensor':
                new = XSensorEntity(k, self, cfg)
            elif add and domain == 'button':
                new = XButtonEntity(k, self, cfg)
            elif add and domain == 'switch':
                new = XSwitchEntity(k, self, cfg)
            elif add and domain == 'select':
                new = XSelectEntity(k, self, cfg)
            elif add and domain == 'number':
                new = XNumberEntity(k, self, cfg)
            if new:
                self.entities[key] = new
                add([new])


class BaseEntity(Entity):
    _attr_should_poll = False

    def __init__(self, name, device: BaseDevice, option=None):
        self.device = device
        self.account = device.account
        self._option = option or {}
        self._name = name
        self._byte = self._option.get('byte')
        self._attr_name = f'{device.name} {name}'.strip()
        self._attr_device_id = f'{device.sn8}_{device.did}'
        self._attr_unique_id = f'{self._attr_device_id}-{name}'
        self.entity_id = f'{DOMAIN}.x{device.type_hex}_{device.id6}_{name}'
        self._attr_icon = self._option.get('icon')
        self._attr_device_class = self._option.get('class')
        self._attr_unit_of_measurement = self._option.get('unit')
        self._attr_device_info = {
            'identifiers': {(DOMAIN, self._attr_device_id)},
            'name': device.name,
            'model': device.model,
            'manufacturer': 'Midea',
        }
        self._attr_extra_state_attributes = {}

    async def async_added_to_hass(self):
        await super().async_added_to_hass()
        await self.async_update()
        self.hass.data[DOMAIN][CONF_ENTITIES][self.entity_id] = self
        self.device.listeners[self.entity_id] = self._handle_coordinator_update
        self._handle_coordinator_update()

    def _handle_coordinator_update(self):
        self.async_write_ha_state()

    async def async_update(self):
        updater = self.update_from_device(self._option, 'state_template')
        if callable(updater):
            self._attr_state = await updater()

        updater = self.update_from_device(self._option, 'attrs_template')
        if callable(updater):
            attrs = await updater()
            _LOGGER.debug('%s: update attrs: %s', self.entity_id, [self._attr_state, attrs])
            if isinstance(attrs, dict):
                self._attr_extra_state_attributes.update(attrs)

    def update_from_device(self, cfg, template_filed='state_template'):
        async def fun():
            status = self.device.status
            if not status:
                return None
            try:
                idx = int(cfg.get('byte'))
                val = status.get(idx)
            except (TypeError, ValueError):
                idx = None
                val = None
            if tpl := cfg.get(template_filed):
                tpl = Template(tpl, self.hass)
                dat = status.data if status else {}
                var = {'bype': idx, 'value': val, 'bytes': dat}
                val = tpl.async_render(var)
            elif val is None:
                pass
            elif dic := cfg.get('dict', {}):
                if isinstance(dic, dict):
                    val = dic.get(val, val)
                if isinstance(dic, list):
                    val = dic[val] if len(dic) > val else val
            return val
        return fun

    async def async_set_property(self, val, extra=None):
        try:
            val = int(val)
        except (TypeError, ValueError):
            return False
        dic = {
            **(self.device.customizes.get('set_extra') or {}),
            **(self._option.get('set_extra') or {}),
            **(extra or {}),
        }
        if self._byte is not None:
            dic[self._byte] = val
        return await self.device.async_control(dic)
