import logging
from msmart.device.base import device as base_device
from msmart.command import base_command, set_command
from msmart.packet_builder import packet_builder
from msmart.const import CMD_TYPE_QUERRY, CMD_TYPE_REPORT

_LOGGER = logging.getLogger(__name__)


class MsmartDevice(base_device):
    def __init__(self, device_type, device_id, host, port=6444):
        super().__init__(host, device_id, port)
        self._type = device_type
        self._status = None

    def __str__(self):
        return str(self.__dict__)

    def refresh(self):
        cmd = base_command(self.type)
        self.send_command(cmd)

    @staticmethod
    def friendly_command(cmd):
        lst = []
        idx = 0
        for c in cmd.data:
            lst.append(f'{idx}:{bytearray([c]).hex().upper()}')
            idx += 1
        return ' '.join(lst)

    def control_command(self, dic: dict):
        cmd = set_command(self.type)
        for k, v in dic.items():
            idx = int(k)
            cnt = len(cmd.data)
            if cnt <= idx:
                for _ in range(cnt, idx + 1):
                    cmd.data.append(0xFF)
            cmd.data[idx] = int(v)
        cmd.data[1] = len(cmd.data) - 1
        _LOGGER.warning('control_command: %s', [dic, self.friendly_command(cmd), self._last_responses])
        return self.send_command(cmd)

    def send_command(self, cmd):
        pkt_builder = packet_builder(self.id)
        pkt_builder.set_command(cmd, False)
        data = pkt_builder.finalize()
        if self._protocol_version == 3:
            responses = self._lan_service.appliance_transparent_send_8370(data)
        else:
            responses = self._lan_service.appliance_transparent_send(data)
        if len(responses) == 0:
            self._active = False
            self._support = False
            return False
        # sort, put CMD_TYPE_QUERRY last, so we can get END(machine_status) from the last response
        responses.sort()
        self._last_responses = responses
        for response in responses:
            self.process_response(response)
        return responses

    def process_response(self, data):
        if len(data) > 0:
            self._online = True
            self._active = True
            if data == b'ERROR':
                self._support = False
                return
            response = DeviceStatus(data)
            self._defer_update = False
            self._support = True
            self.update(response)

    def update(self, res: 'DeviceStatus'):
        if res.update:
            self._status = res

    @property
    def status(self):
        if isinstance(self._status, DeviceStatus):
            return self._status
        return None

    def get(self, index, default=None):
        if self.status:
            return self.status.get(index, default)
        return default


class DeviceStatus:
    def __init__(self, data: bytearray):
        self.data = data
        self.type = self.get(0x09)
        self.update = self.type in [CMD_TYPE_QUERRY, CMD_TYPE_REPORT]  # and data[10] in [0x31, 0x41]
        _LOGGER.debug('msmart response: %s', [hex(self.type), data])

    def get(self, index, default=None):
        if len(self.data) > index:
            return self.data[index]
        return default

    def __str__(self):
        return f'{list(self.data)}'
