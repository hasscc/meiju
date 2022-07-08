"""Support for switch."""
import logging
import asyncio

from homeassistant.core import HomeAssistant
from homeassistant.components.switch import (
    SwitchEntity,
    DOMAIN as ENTITY_DOMAIN,
)

from . import (
    DOMAIN,
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


class XSwitchEntity(BaseEntity, SwitchEntity):
    _attr_is_on = None

    async def async_update(self):
        await super().async_update()
        if self._attr_state is None:
            self._attr_is_on = None
        else:
            self._attr_is_on = not not self._attr_state

    async def async_turn_switch(self, on=True, **kwargs):
        """Turn the entity on/off."""
        if on:
            val = self._option.get('on_value', 0x01)
            ext = self._option.get('on_extra', {})
        else:
            val = self._option.get('off_value', 0x00)
            ext = self._option.get('off_extra', {})
        ret = await self.async_set_property(val, ext)
        if ret:
            self._attr_is_on = not not on
            self.async_write_ha_state()
            await asyncio.sleep(1)
            self._handle_coordinator_update()
        return ret

    async def async_turn_on(self, **kwargs):
        """Turn the entity on."""
        return await self.async_turn_switch(True)

    async def async_turn_off(self, **kwargs):
        """Turn the entity off."""
        return await self.async_turn_switch(False)
