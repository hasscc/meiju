"""Support for select."""
import logging

from homeassistant.core import HomeAssistant
from homeassistant.components.select import (
    SelectEntity,
    DOMAIN as ENTITY_DOMAIN,
)

from . import (
    DOMAIN,
    BaseDevice,
    BaseEntity,
    async_setup_accounts,
)

_LOGGER = logging.getLogger(__name__)

DATA_KEY = f'{ENTITY_DOMAIN}.{DOMAIN}'


async def async_setup_entry(hass, config_entry, async_add_entities):
    cfg = {**config_entry.data, **config_entry.options}
    await async_setup_platform(hass, cfg, async_setup_platform, async_add_entities)


async def async_setup_platform(hass: HomeAssistant, config, async_add_entities, discovery_info=None):
    hass.data[DOMAIN]['add_entities'][ENTITY_DOMAIN] = async_add_entities
    await async_setup_accounts(hass, ENTITY_DOMAIN)


class XSelectEntity(BaseEntity, SelectEntity):
    _attr_current_option = None

    def __init__(self, name, device: BaseDevice, option=None):
        super().__init__(name, device, option)
        self._options = self._option.get('options') or {}
        self._attr_options = []
        if isinstance(self._options, dict):
            self._attr_options = [
                v.get('name', k) if isinstance(v, dict) else v
                for k, v in self._options.items()
            ]

    async def async_update(self):
        await super().async_update()
        self._attr_current_option = self._options.get(self._attr_state, self._attr_state)

    async def async_select_option(self, option: str):
        """Change the selected option."""
        extra = {}
        if isinstance(self._options, dict):
            for k, v in self._options.items():
                opt = v if isinstance(v, dict) else {'name': v}
                if option == opt.get('name', k):
                    option = k
                    extra = opt.get('extra') or {}
                    break
        return await self.async_set_property(option, extra)
