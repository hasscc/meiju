import logging
import urllib
from hashlib import md5, sha256
from urllib.parse import urlparse
from Crypto.Cipher import AES
from Crypto.Util.Padding import pad, unpad
from msmart.security import security
from msmart.packet_builder import packet_builder
from .command import BaseCommand

_LOGGER = logging.getLogger(__name__)


class MsmartSecurity(security):
    def __init__(self, use_china_server=False):
        super().__init__()
        self._use_china_server = use_china_server
        self._iotkey = "meicloud"
        self._loginKey = 'ac21b9f9cbfe4ca5a88562ef25e2b768'
        if self._use_china_server:
            self._iotkey = "prod_secret123@muc"
            self._loginKey = 'ad0ee21d48a64bf49f4fb583ab76e799'

    def sign(self, url, payload):
        # We only need the path
        path = urlparse(url).path
        # This next part cares about the field ordering in the payload signature
        query = sorted(payload.items(), key=lambda x: x[0])
        # Create a query string (?!?) and make sure to unescape the URL encoded characters (!!!)
        query = urllib.parse.unquote_plus(urllib.parse.urlencode(query))
        # Combine all the sign stuff to make one giant string, then SHA256 it
        sign = path + query + self._loginKey
        m = sha256()
        m.update(sign.encode('ASCII'))
        return m.hexdigest()

    def encryptPassword(self, loginId, password):
        # Hash the password
        m = sha256()
        m.update(password.encode('ascii'))
        # Create the login hash with the loginID + password hash + appKey, then hash it all AGAIN
        loginHash = loginId + m.hexdigest() + self._loginKey
        m = sha256()
        m.update(loginHash.encode('ascii'))
        return m.hexdigest()

    def encrypt_iam_password(self, loginId, password):
        """Encrypts password for cloud API"""
        # Hash the password
        md = md5()
        md.update(password.encode("ascii"))
        md_second = md5()
        md_second.update(md.hexdigest().encode("ascii"))
        if self._use_china_server:
            return md_second.hexdigest()
        login_hash = loginId + md_second.hexdigest() + self._loginKey
        sha = sha256()
        sha.update(login_hash.encode("ascii"))
        return sha.hexdigest()

    def decrypt_with_key(self, data, key='96c7acdfdb8af79a'):
        if isinstance(data, str):
            data = bytes.fromhex(data)
        if isinstance(key, str):
            key = key.encode()
        return unpad(AES.new(key, AES.MODE_ECB).decrypt(data), self.blockSize).decode()

    def encrypt_with_key(self, data, key='96c7acdfdb8af79a'):
        if isinstance(data, str):
            data = bytes.fromhex(data)
        if isinstance(key, str):
            key = key.encode()
        return AES.new(key, AES.MODE_ECB).encrypt(pad(data, self.blockSize))


class MsmartPacketBuilder(packet_builder):

    def set_command(self, command: BaseCommand, add_crc8=True, checksum=True):
        self.command = command.finalize(add_crc8=add_crc8, checksum=checksum)

    def finalize(self, encrypt=True):
        cmd = self.command
        # Append the command data(48 bytes) to the packet
        if encrypt:
            cmd = self.security.aes_encrypt(self.command)[:48]
        else:
            self.packet[0x03] = 0x10
        self.packet.extend(cmd)
        # PacketLength
        self.packet[4:6] = (len(self.packet) + 16).to_bytes(2, 'little')
        # Append a basic checksum data(16 bytes) to the packet
        self.packet.extend(self.encode32(self.packet))
        _LOGGER.debug('packet finalize %s', [cmd.hex(' '), self.packet.hex(' '), encrypt])
        return self.packet

