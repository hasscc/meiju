import logging
import time
import uuid
import hashlib
import msmart.cloud as msmart_cloud

from .util import MsmartSecurity

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
