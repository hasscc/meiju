from msmart.command import base_command


class BaseCommand(base_command):
    def finalize(self, add_crc8=True, checksum=True):
        super().finalize(add_crc8)
        if not checksum:
            self.data = self.data[:-1]
        return self.data

    def from_dict(self, dic: dict):
        for k, v in dic.items():
            idx = int(k)
            cnt = len(self.data)
            if cnt <= idx:
                for _ in range(cnt, idx + 1):
                    self.data.append(0xFF)
            self.data[idx] = int(v)
        self.data[0x01] = len(self.data)


class ControlCommand(BaseCommand):
    def __init__(self, device_type):
        super().__init__(device_type)
        self.data[0x09] = 0x02
        self.data = self.data[:-1]
        for n in range(11, len(self.data)):
            self.data[n] = 0xFF
