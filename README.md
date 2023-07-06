# Midea Meiju for HomeAssistant

## Installing

> [Download](https://github.com/hasscc/meiju/archive/main.zip) and copy `custom_components/meiju` folder to `custom_components` folder in your HomeAssistant config folder

```shell
# Auto install via terminal shell
wget -q -O - https://cdn.jsdelivr.net/gh/hasscc/get/get | HUB_DOMAIN=ghproxy.com/github.com DOMAIN=meiju REPO_PATH=hasscc/meiju ARCHIVE_TAG=main bash -
```


## Config

```yaml
# configuration.yaml

meiju:
  # Single account
  username: 18866668888 # Username of Meiju APP (美的美居)
  password: abcdefghijk # Password
  devices:
    - device_id: 160123456789001
      host: 192.168.1.101
    - device_id: 160123456789002
      host: 192.168.1.102

  # Multiple accounts
  accounts:
    - username: 18866668881
      password: password1
      devices:
        - device_id: 160123456789003
          host: 192.168.1.123
    - username: 18866668882
      password: password2
      scan_interval: 00:00:20
      devices:
        - device_id: 160123456789004
          host: 192.168.1.234
          scan_interval: 00:00:15

  # https://github.com/hasscc/meiju/blob/main/custom_components/meiju/device_customizes.yaml
  customizes:
    B3: # Device type or sn8
      get_extra: {10: 0x31}
      set_extra: {10: 0x21}
      sensors:
        status:
          byte: 11
          dict: [power_off, power_on, working]
          attrs_template: |-
            {{ {
              'preheat': bytes[26]|bitwise_and(0x02) > 0,
              'cooling': bytes[26]|bitwise_and(0x08) > 0,
            } }}
      binary_sensors:
        upstair_door:
          byte: 21
          state_template: '{{ value|bitwise_and(0x04) > 0 }}'
      switches:
        power:
          byte: 11
          on_extra: {16: 0x01, 22: 0x01}
          off_extra: {16: 0x00, 22: 0x00}
        lock:
          byte: 21
          on_value: 0x01
          off_value: 0x00
      selects:
        mode:
          byte: 12
          options:
            0: {name: 空闲, extra: {11: 0x00}}
            23: {name: 保洁(75分钟75℃), extra: {13: 75, 14: 15, 27: 60}}
            26: {name: 长效存储(15分钟60℃), extra: {13: 60, 14: 15, 27: 0}}
          set_extra: {11: 0x02}
      numbers:
        upstair_temp:
          byte: 13
          step: 5
          min: 60
          max: 125
```


## Services

#### Get Meiju Devices
```yaml
service: meiju.get_devices
data:
  username: 18866668881
  throw: true # Show result in HA notifications
```

#### Request Meiju API
```yaml
service: meiju.request_api
data:
  entity_id: sensor.xac_xxxxxx_info # Any sensor entity in the account
  username: 18866668881 # Optional if entity_id is specified
  api: /appliance/home/list/get
  params:
    homegroupId: 666666
```

#### Send control command to device
```yaml
service: meiju.send_command
data:
  entity_id: sensor.xac_xxxxxx_info
  command: AA BB CC # Command bytes like: FF 00 AA
                    # [0xAA, 0xFF, 0x00]
                    # {11: 0xAA, 13: 0xBB}
```

#### Get Meiju device Lua script
```yaml
service: meiju.get_lua
data:
  entity_id: sensor.xac_xxxxxx_info
```

#### Get Meiju device plugin
```yaml
service: meiju.get_plugin
data:
  entity_id: sensor.xac_xxxxxx_info
```


## Thanks
- https://github.com/mac-zhou/midea-msmart
- [@vividmuse](https://github.com/vividmuse)
- [@blindlight86](https://github.com/blindlight86)
