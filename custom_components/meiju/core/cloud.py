import logging
import time
import uuid
import urllib
import hashlib
from hashlib import md5, sha256
from urllib.parse import urlparse
from Crypto.Cipher import AES
from Crypto.Util.Padding import unpad
from msmart.security import security
import msmart.cloud as msmart_cloud

_LOGGER = logging.getLogger(__name__)


class MsmartCloud(msmart_cloud.cloud):
    APP_KEY = None
    LOGIN_KEY = None
    device_id = None

    @staticmethod
    def build_params(dat):
        dat['reqId'] = hashlib.md5(uuid.uuid1().bytes).hexdigest()
        dat['stamp'] = time.strftime('%Y%m%d%H%M%S')
        return dat


class MeijuCloud(MsmartCloud):
    SERVER_URL = 'https://mp-prod.smartmidea.net/mas/v5/app/proxy?alias='
    LANGUAGE = 'zh_CN'
    APP_ID = '900'
    SRC = '900'
    APP_KEY = '46579c15'
    LOGIN_KEY = 'ad0ee21d48a64bf49f4fb583ab76e799'

    def __init__(self, username, password):
        super().__init__(username, password)
        self.security = MsmartSecurity(use_china_server=True)
        self.device_id = f'86{int(time.time() * 1000)}'

    def login(self):
        if self.session:
            return
        if not self.login_id:
            self.get_login_id()
        dat = {
            'iotData': self.build_params({
                'clientType': 1,
                'iampwd': self.security.encrypt_iam_password(self.login_id, self.password),
                'iotAppId': self.APP_ID,
                'loginAccount': self.login_account,
                'password': self.security.encryptPassword(self.login_id, self.password),
            }),
            'data': {
                'appKey': self.APP_KEY,
                'deviceId': self.device_id,
                'platform': 2,
            }
        }
        self.session = self.api_request('/mj/user/login', data=dat) or {}
        self.accessToken = self.session.get('mdata', {}).get('accessToken')
        if not self.accessToken:
            _LOGGER.warning('Login failed: %s', [self.login_account, dat, self.session])


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
        return unpad(AES.new(key, AES.MODE_ECB).decrypt(data), 16).decode()
