local JSON = require 'cjson'
local KEY_VERSION = 'version'
local KEY_POWER = 'power'
local KEY_WORK_STATUS = 'work_status'
local KEY_MODE = 'mode'
local KEY_ERROR_CODE = 'error_code'
local KEY_LOCK = 'lock'
local KEY_HOUR = 'hour'
local KEY_MINUTES = 'minutes'
local KEY_TEMPERATURE = 'temperature'
local KEY_FURNACE_LIGHT = 'furnace_light'
local VALUE_VERSION = 4
local VALUE_ON = 'on'
local VALUE_OFF = 'off'
local VALUE_WORK_STATUS_NONE = 'none'
local VALUE_WORK_STATUS_CANCEL = 'cancel'
local VALUE_WORK_STATUS_WORK = 'work'
local VALUE_WORK_STATUS_PAUSE = 'pause'
local VALUE_WORK_STATUS_END = 'end'
local VALUE_WORK_STATUS_APPOINTMENT = 'appointment'
local VALUE_UNKNOWN = 'unknown'
local VALUE_INVALID = 'invalid'
local BYTE_DEVICE_TYPE = 0xB1
local BYTE_CONTROL_REQUEST = 0x02
local BYTE_QUERY_REQUEST = 0x03
local BYTE_PROTOCOL_HEAD = 0xAA
local BYTE_PROTOCOL_LENGTH = 0x0A
local BYTE_POWER_ON = 0x01
local BYTE_POWER_OFF = 0x07
local BYTE_STATUS_NONE = 0xFF
local BYTE_STATUS_CANCEL = 0x01
local BYTE_STATUS_WORK = 0x02
local BYTE_STATUS_PAUSE = 0x03
local BYTE_STATUS_END = 0x04
local BYTE_STATUS_APPOINTMENT = 0x06
local BYTE_MODE_KEEP_WARM = 0x01
local BYTE_MODE_STERO_BAKING = 0x02
local BYTE_MODE_WHOLE_BAKING = 0x03
local BYTE_MODE_UP_DOWN_BAKING = 0x04
local BYTE_MODE_UNFREEZE = 0x05
local BYTE_MODE_HOTAIR_CONVECTION = 0x06
local BYTE_MODE_POWER_SAVING = 0x07
local BYTE_MODE_CENTER_BAKING = 0x08
local BYTE_MODE_ROTARY_BAKING = 0x09
local BYTE_LOCK_ON = 0x01
local BYTE_LOCK_OFF = 0x00
local workstatus
local mode = 0
local hour = 0
local minutes = 0
local temperature = 0
local curTemp = 0
local lock = 0
local furnaceLight = 0
local errorCode = 0
local dataType = 0
local deviceSubType

function updateGlobalPropertyValueByJson(luaTable)
    if luaTable[KEY_POWER] == VALUE_ON then
        workstatus = BYTE_POWER_ON
    elseif luaTable[KEY_POWER] == VALUE_OFF then
        workstatus = BYTE_POWER_OFF
    end
    if luaTable[KEY_WORK_STATUS] == VALUE_WORK_STATUS_NONE then
        workstatus = BYTE_STATUS_NONE
    elseif luaTable[KEY_WORK_STATUS] == VALUE_WORK_STATUS_CANCEL then
        workstatus = BYTE_STATUS_CANCEL
    elseif luaTable[KEY_WORK_STATUS] == VALUE_WORK_STATUS_WORK then
        workstatus = BYTE_STATUS_WORK
    elseif luaTable[KEY_WORK_STATUS] == VALUE_WORK_STATUS_PAUSE then
        workstatus = BYTE_STATUS_PAUSE
    end
    if luaTable[KEY_MODE] == 'keep_warm' then
        mode = BYTE_MODE_KEEP_WARM
    elseif luaTable[KEY_MODE] == 'stero_baking' then
        mode = BYTE_MODE_STERO_BAKING
    elseif luaTable[KEY_MODE] == 'whole_baking' then
        mode = BYTE_MODE_WHOLE_BAKING
    elseif luaTable[KEY_MODE] == 'up_down_baking' then
        mode = BYTE_MODE_UP_DOWN_BAKING
    elseif luaTable[KEY_MODE] == 'unfreeze' then
        mode = BYTE_MODE_UNFREEZE
    elseif luaTable[KEY_MODE] == 'hot_air_convection' then
        mode = BYTE_MODE_HOTAIR_CONVECTION
    elseif luaTable[KEY_MODE] == 'power_saving' then
        mode = BYTE_MODE_POWER_SAVING
    elseif luaTable[KEY_MODE] == 'center_baking' then
        mode = BYTE_MODE_CENTER_BAKING
    elseif luaTable[KEY_MODE] == 'rotary_baking' then
        mode = BYTE_MODE_ROTARY_BAKING
    end
    if luaTable[KEY_LOCK] == VALUE_ON then
        lock = BYTE_LOCK_ON
    elseif luaTable[KEY_LOCK] == VALUE_OFF then
        lock = BYTE_LOCK_OFF
    end
    if luaTable[KEY_HOUR] ~= nil then
        hour = luaTable[KEY_HOUR]
    end
    if luaTable[KEY_MINUTES] ~= nil then
        minutes = luaTable[KEY_MINUTES]
    end
    if luaTable[KEY_TEMPERATURE] ~= nil then
        temperature = luaTable[KEY_TEMPERATURE]
    end
end

function updateGlobalPropertyValueByJsonForNewProtocal(luaTable)
    if luaTable[KEY_MODE] == 'keep_warm' then
        mode = 0xD0
    elseif luaTable[KEY_MODE] == 'stero_baking' then
        mode = 0x44
    elseif luaTable[KEY_MODE] == 'whole_baking' then
        mode = 0x47
    elseif luaTable[KEY_MODE] == 'up_down_baking' then
        mode = 0x4C
    elseif luaTable[KEY_MODE] == 'unfreeze' then
        mode = 0xA1
    elseif luaTable[KEY_MODE] == 'hot_air_convection' then
        mode = 0x41
    elseif luaTable[KEY_MODE] == 'power_saving' then
        mode = 0x4D
    elseif luaTable[KEY_MODE] == 'center_baking' then
        mode = 0x46
    elseif luaTable[KEY_MODE] == 'rotary_baking' then
        mode = 0x4E
    elseif luaTable[KEY_MODE] == 'fermentation' then
        mode = 0xB0
    elseif luaTable[KEY_MODE] == 'stoving' then
        mode = 0xC4
    elseif luaTable[KEY_MODE] == 'down_baking' then
        mode = 0x49
    elseif luaTable[KEY_MODE] == 'pizza' then
        mode = 0xB1
    elseif luaTable[KEY_MODE] == 'up_infrared_fan' then
        mode = 0x51
    end
    if luaTable[KEY_HOUR] ~= nil then
        hour = luaTable[KEY_HOUR]
    end
    if luaTable[KEY_MINUTES] ~= nil then
        minutes = luaTable[KEY_MINUTES]
    end
    if luaTable[KEY_TEMPERATURE] ~= nil then
        temperature = luaTable[KEY_TEMPERATURE]
    end
end

function updateGlobalPropertyValueByByte(messageBytes)
    if #messageBytes >= 16 then
        workstatus = messageBytes[0]
        mode = messageBytes[1]
        hour = messageBytes[2]
        minutes = messageBytes[3]
        if messageBytes[4] < 0 then
            curTemp = messageBytes[4] + 256
        else
            curTemp = messageBytes[4]
        end
        errorCode = messageBytes[5]
        if messageBytes[8] < 0 then
            temperature = (messageBytes[8] + 256)
        else
            temperature = messageBytes[8]
        end
        lock = messageBytes[16]
    end
end

function updateGlobalPropertyValueByByteForNewProtocal(messageBytes)
    if dataType == BYTE_CONTROL_REQUEST then
        if messageBytes[0] == 0x22 then
            if messageBytes[1] == 0x02 then
                workstatus = messageBytes[2]
                lock = messageBytes[3]
                furnaceLight = messageBytes[4]
            end
            if messageBytes[1] == 0x01 then
                hour = messageBytes[7]
                minutes = messageBytes[8]
                mode = messageBytes[10]
                temperature = bit.lshift(messageBytes[11], 8) + messageBytes[12]
            end
        end
    end
    if dataType == BYTE_QUERY_REQUEST then
        if messageBytes[0] == 0x31 then
            workstatus = messageBytes[1]
            mode = messageBytes[9]
            hour = messageBytes[6]
            minutes = messageBytes[7]
            curTemp = bit.lshift(messageBytes[10], 8) + messageBytes[11]
            errorCode = 0
            temperature = bit.lshift(messageBytes[18], 8) + messageBytes[19]
            if bit.band(messageBytes[16], 0x01) == 0x01 then
                lock = 0x01
            else
                lock = 0x00
            end
            if bit.band(messageBytes[17], 0x04) == 0x04 then
                furnaceLight = 0x01
            else
                furnaceLight = 0x00
            end
        end
    end
end

function assembleJsonByGlobalProperty()
    local streams = {}
    streams[KEY_VERSION] = VALUE_VERSION
    if (workstatus == BYTE_POWER_ON) then
        streams[KEY_POWER] = VALUE_ON
    elseif (workstatus == BYTE_POWER_OFF) then
        streams[KEY_POWER] = VALUE_OFF
    end
    if (workstatus == BYTE_STATUS_NONE) then
        streams[KEY_WORK_STATUS] = VALUE_WORK_STATUS_NONE
    elseif (workstatus == BYTE_STATUS_CANCEL) then
        streams[KEY_WORK_STATUS] = VALUE_WORK_STATUS_CANCEL
    elseif workstatus == BYTE_STATUS_WORK then
        streams[KEY_WORK_STATUS] = VALUE_WORK_STATUS_WORK
    elseif workstatus == BYTE_STATUS_PAUSE then
        streams[KEY_WORK_STATUS] = VALUE_WORK_STATUS_PAUSE
    elseif workstatus == BYTE_STATUS_END then
        streams[KEY_WORK_STATUS] = VALUE_WORK_STATUS_END
    elseif workstatus == BYTE_STATUS_APPOINTMENT then
        streams[KEY_WORK_STATUS] = VALUE_WORK_STATUS_APPOINTMENT
    end
    if (mode == BYTE_MODE_KEEP_WARM) then
        streams[KEY_MODE] = 'keep_warm'
    elseif (mode == BYTE_MODE_STERO_BAKING) then
        streams[KEY_MODE] = 'stero_baking'
    elseif (mode == BYTE_MODE_WHOLE_BAKING) then
        streams[KEY_MODE] = 'whole_baking'
    elseif (mode == BYTE_MODE_UP_DOWN_BAKING) then
        streams[KEY_MODE] = 'up_down_baking'
    elseif (mode == BYTE_MODE_UNFREEZE) then
        streams[KEY_MODE] = 'unfreeze'
    elseif (mode == BYTE_MODE_HOTAIR_CONVECTION) then
        streams[KEY_MODE] = 'hot_air_convection'
    elseif (mode == BYTE_MODE_POWER_SAVING) then
        streams[KEY_MODE] = 'power_saving'
    elseif (mode == BYTE_MODE_CENTER_BAKING) then
        streams[KEY_MODE] = 'center_baking'
    elseif (mode == BYTE_MODE_ROTARY_BAKING) then
        streams[KEY_MODE] = 'rotary_baking'
    else
        streams[KEY_MODE] = VALUE_INVALID
    end
    streams[KEY_ERROR_CODE] = errorCode
    if (lock == BYTE_LOCK_ON) then
        streams[KEY_LOCK] = VALUE_ON
    elseif (lock == BYTE_LOCK_OFF) then
        streams[KEY_LOCK] = VALUE_OFF
    end
    streams[KEY_HOUR] = hour
    streams[KEY_MINUTES] = minutes
    streams[KEY_TEMPERATURE] = temperature
    return streams
end

function assembleJsonByGlobalPropertyForNewProtocal()
    local streams = {}
    streams[KEY_VERSION] = VALUE_VERSION
    if (workstatus == 0x01) then
        streams[KEY_POWER] = VALUE_OFF
    else
        streams[KEY_POWER] = VALUE_ON
    end
    if (workstatus == 0x02) then
        streams[KEY_WORK_STATUS] = VALUE_WORK_STATUS_CANCEL
    elseif workstatus == 0x03 then
        streams[KEY_WORK_STATUS] = VALUE_WORK_STATUS_WORK
    elseif workstatus == 0x06 then
        streams[KEY_WORK_STATUS] = VALUE_WORK_STATUS_PAUSE
    elseif workstatus == 0x04 then
        streams[KEY_WORK_STATUS] = VALUE_WORK_STATUS_END
    elseif workstatus == 0x05 then
        streams[KEY_WORK_STATUS] = VALUE_WORK_STATUS_APPOINTMENT
    end
    if (mode == 0xD0) then
        streams[KEY_MODE] = 'keep_warm'
    elseif (mode == 0x44) then
        streams[KEY_MODE] = 'stero_baking'
    elseif (mode == 0x47) then
        streams[KEY_MODE] = 'whole_baking'
    elseif (mode == 0x4C) then
        streams[KEY_MODE] = 'up_down_baking'
    elseif (mode == 0xA1) then
        streams[KEY_MODE] = 'unfreeze'
    elseif (mode == 0x41) then
        streams[KEY_MODE] = 'hot_air_convection'
    elseif (mode == 0x4D) then
        streams[KEY_MODE] = 'power_saving'
    elseif (mode == 0x46) then
        streams[KEY_MODE] = 'center_baking'
    elseif (mode == 0x4E) then
        streams[KEY_MODE] = 'rotary_baking'
    elseif (mode == 0xB0) then
        streams[KEY_MODE] = 'fermentation'
    elseif (mode == 0xC4) then
        streams[KEY_MODE] = 'stoving'
    elseif (mode == 0x49) then
        streams[KEY_MODE] = 'down_baking'
    elseif (mode == 0xB1) then
        streams[KEY_MODE] = 'pizza'
    elseif (mode == 0x51) then
        streams[KEY_MODE] = 'up_infrared_fan'
    else
        streams[KEY_MODE] = VALUE_INVALID
    end
    streams[KEY_ERROR_CODE] = errorCode
    if (lock == 0x01) then
        streams[KEY_LOCK] = VALUE_ON
    else
        streams[KEY_LOCK] = VALUE_OFF
    end
    if (furnaceLight == 0x01) then
        streams[KEY_FURNACE_LIGHT] = VALUE_ON
    else
        streams[KEY_FURNACE_LIGHT] = VALUE_OFF
    end
    streams[KEY_HOUR] = hour
    streams[KEY_MINUTES] = minutes
    streams[KEY_TEMPERATURE] = temperature
    return streams
end

function jsonToData(jsonCmdStr)
    if (#jsonCmdStr == 0) then
        return 'json is incorrect'
    end
    local msgBytes = {}
    local jsonTable = decodeJsonToTable(jsonCmdStr)
    deviceSubType = jsonTable['deviceinfo']['deviceSubType']
    local query = jsonTable['query']
    local control = jsonTable['control']
    local status = jsonTable['status']
    if getSoftVersion() == 1 then
        if (control) then
            local bodyBytes = {}
            if
            (control[KEY_POWER] ~= nil) or (control[KEY_WORK_STATUS] ~= nil) or (control[KEY_LOCK] ~= nil) or
                    (control[KEY_FURNACE_LIGHT] ~= nil)
            then
                bodyBytes[0] = 0x22
                bodyBytes[1] = 0x02
                bodyBytes[2] = 0xff
                bodyBytes[3] = 0xff
                bodyBytes[4] = 0xff
                if control[KEY_POWER] == VALUE_ON then
                    bodyBytes[2] = 0x02
                elseif control[KEY_POWER] == VALUE_OFF then
                    bodyBytes[2] = 0x01
                end
                if control[KEY_WORK_STATUS] == VALUE_WORK_STATUS_CANCEL then
                    bodyBytes[2] = 0x02
                elseif control[KEY_WORK_STATUS] == VALUE_WORK_STATUS_WORK then
                    bodyBytes[2] = 0x03
                elseif control[KEY_WORK_STATUS] == VALUE_WORK_STATUS_PAUSE then
                    bodyBytes[2] = 0x06
                end
                if control[KEY_LOCK] == VALUE_ON then
                    bodyBytes[3] = 0x01
                elseif control[KEY_LOCK] == VALUE_OFF then
                    bodyBytes[3] = 0x00
                end
                if control[KEY_FURNACE_LIGHT] == VALUE_ON then
                    bodyBytes[4] = 0x01
                elseif control[KEY_FURNACE_LIGHT] == VALUE_OFF then
                    bodyBytes[4] = 0x00
                end
            else
                if (status) then
                    updateGlobalPropertyValueByJsonForNewProtocal(status)
                end
                if (control) then
                    updateGlobalPropertyValueByJsonForNewProtocal(control)
                end
                local bodyLength = 19
                for i = 0, bodyLength - 1 do
                    bodyBytes[i] = 0
                end
                bodyBytes[0] = 0x22
                bodyBytes[1] = 0x01
                bodyBytes[2] = 0x00
                bodyBytes[3] = 0x00
                bodyBytes[4] = 0x00
                bodyBytes[5] = 0x00
                bodyBytes[6] = 0x00
                bodyBytes[7] = hour
                bodyBytes[8] = minutes
                bodyBytes[9] = 0x00
                bodyBytes[10] = mode
                bodyBytes[11] = bit.rshift(temperature, 8)
                bodyBytes[12] = bit.band(temperature, 0xFF)
                bodyBytes[13] = bit.rshift(temperature, 8)
                bodyBytes[14] = bit.band(temperature, 0xFF)
                bodyBytes[15] = 0xFF
                bodyBytes[16] = 0xFF
                bodyBytes[17] = 0xFF
            end
            msgBytes = assembleUart(bodyBytes, BYTE_CONTROL_REQUEST)
        elseif (query) then
            local bodyLength = 1
            local bodyBytes = {}
            for i = 0, bodyLength - 1 do
                bodyBytes[i] = 0
            end
            bodyBytes[0] = 0x31
            msgBytes = assembleUart(bodyBytes, BYTE_QUERY_REQUEST)
        end
    else
        if (control) then
            if (status) then
                updateGlobalPropertyValueByJson(status)
            end
            if (control) then
                updateGlobalPropertyValueByJson(control)
            end
            local bodyLength = 15
            local bodyBytes = {}
            for i = 0, bodyLength - 1 do
                bodyBytes[i] = 0
            end
            bodyBytes[0] = workstatus
            bodyBytes[1] = mode
            bodyBytes[2] = hour
            bodyBytes[3] = minutes
            bodyBytes[4] = temperature
            bodyBytes[10] = lock
            msgBytes = assembleUart(bodyBytes, BYTE_CONTROL_REQUEST)
        elseif (query) then
            local bodyLength = 1
            local bodyBytes = {}
            for i = 0, bodyLength - 1 do
                bodyBytes[i] = 0
            end
            msgBytes = assembleUart(bodyBytes, BYTE_QUERY_REQUEST)
        end
    end
    local infoM = {}
    local length = #msgBytes + 1
    for i = 1, length do
        infoM[i] = msgBytes[i - 1]
    end
    local ret = table2string(infoM)
    ret = string2hexstring(ret)
    return ret
end

function dataToJson(jsonStr)
    if (not jsonStr) then
        return nil
    end
    local jsonTable = decodeJsonToTable(jsonStr)
    deviceSubType = jsonTable['deviceinfo']['deviceSubType']
    local binData = jsonTable['msg']['data']
    local status = jsonTable['status']
    if getSoftVersion() == 1 then
        if (status) then
            updateGlobalPropertyValueByJsonForNewProtocal(status)
        end
    else
        if (status) then
            updateGlobalPropertyValueByJson(status)
        end
    end
    local byteData = string2table(binData)
    dataType = byteData[10]
    local bodyBytes = extractBodyBytes(byteData)
    if getSoftVersion() == 1 then
        updateGlobalPropertyValueByByteForNewProtocal(bodyBytes)
    else
        updateGlobalPropertyValueByByte(bodyBytes)
    end
    local retTable = {}
    if getSoftVersion() == 1 then
        retTable['status'] = assembleJsonByGlobalPropertyForNewProtocal()
    else
        retTable['status'] = assembleJsonByGlobalProperty()
    end
    local ret = encodeTableToJson(retTable)
    return ret
end

function getSoftVersion()
    if (deviceSubType == '5') then
        return 1
    else
        return 0
    end
end

function extractBodyBytes(byteData)
    local msgLength = #byteData
    local msgBytes = {}
    local bodyBytes = {}
    for i = 1, msgLength do
        msgBytes[i - 1] = byteData[i]
    end
    local bodyLength = msgLength - BYTE_PROTOCOL_LENGTH - 1
    for i = 0, bodyLength - 1 do
        bodyBytes[i] = msgBytes[i + BYTE_PROTOCOL_LENGTH]
    end
    return bodyBytes
end

function assembleUart(bodyBytes, type)
    local bodyLength = #bodyBytes + 1
    if bodyLength == 0 then
        return nil
    end
    local msgLength = (bodyLength + BYTE_PROTOCOL_LENGTH + 1)
    local msgBytes = {}
    for i = 0, msgLength - 1 do
        msgBytes[i] = 0
    end
    msgBytes[0] = BYTE_PROTOCOL_HEAD
    msgBytes[1] = msgLength - 1
    msgBytes[2] = BYTE_DEVICE_TYPE
    msgBytes[9] = type
    for i = 0, bodyLength - 1 do
        msgBytes[i + BYTE_PROTOCOL_LENGTH] = bodyBytes[i]
    end
    msgBytes[msgLength - 1] = makeSum(msgBytes, 1, msgLength - 2)
    return msgBytes
end

function makeSum(tmpbuf, start_pos, end_pos)
    local resVal = 0
    for si = start_pos, end_pos do
        resVal = resVal + tmpbuf[si]
        if resVal > 0xff then
            resVal = bit.band(resVal, 0xff)
        end
    end
    resVal = 255 - resVal + 1
    return resVal
end

local crc8_854_table = { 0, 94, 188, 226, 97, 63, 221, 131, 194, 156, 126, 32, 163, 253, 31, 65, 157, 195, 33, 127, 252, 162, 64, 30, 95, 1, 227, 189, 62, 96, 130, 220, 35, 125, 159, 193, 66, 28, 254, 160, 225, 191, 93, 3, 128, 222, 60, 98, 190, 224, 2, 92, 223, 129, 99, 61, 124, 34, 192, 158, 29, 67, 161, 255, 70, 24, 250, 164, 39, 121, 155, 197, 132, 218, 56, 102, 229, 187, 89, 7, 219, 133, 103, 57, 186, 228, 6, 88, 25, 71, 165, 251, 120, 38, 196, 154, 101, 59, 217, 135, 4, 90, 184, 230, 167, 249, 27, 69, 198, 152, 122, 36, 248, 166, 68, 26, 153, 199, 37, 123, 58, 100, 134, 216, 91, 5, 231, 185, 140, 210, 48, 110, 237, 179, 81, 15, 78, 16, 242, 172, 47, 113, 147, 205, 17, 79, 173, 243, 112, 46, 204, 146, 211, 141, 111, 49, 178, 236, 14, 80, 175, 241, 19, 77, 206, 144, 114, 44, 109, 51, 209, 143, 12, 82, 176, 238, 50, 108, 142, 208, 83, 13, 239, 177, 240, 174, 76, 18, 145, 207, 45, 115, 202, 148, 118, 40, 171, 245, 23, 73, 8, 86, 180, 234, 105, 55, 213, 139, 87, 9, 235, 181, 54, 104, 138, 212, 149, 203, 41, 119, 244, 170, 72, 22, 233, 183, 85, 11, 136, 214, 52, 106, 43, 117, 151, 201, 74, 20, 246, 168, 116, 42, 200, 150, 21, 75, 169, 247, 182, 232, 10, 84, 215, 137, 107, 53 }

function crc8_854(dataBuf, start_pos, end_pos)
    local crc = 0
    for si = start_pos, end_pos do
        crc = crc8_854_table[bit.band(bit.bxor(crc, dataBuf[si]), 0xFF) + 1]
    end
    return crc
end

function decodeJsonToTable(cmd)
    local tb
    if JSON == nil then
        JSON = require 'cjson'
    end
    tb = JSON.decode(cmd)
    return tb
end

function encodeTableToJson(luaTable)
    local jsonStr
    if JSON == nil then
        JSON = require 'cjson'
    end
    jsonStr = JSON.encode(luaTable)
    return jsonStr
end

function string2table(hexstr)
    local tb = {}
    local i = 1
    local j = 1
    for i = 1, #hexstr - 1, 2 do
        local doublebytestr = string.sub(hexstr, i, i + 1)
        tb[j] = tonumber(doublebytestr, 16)
        j = j + 1
    end
    return tb
end

function string2hexstring(str)
    local ret = ''
    for i = 1, #str do
        ret = ret .. string.format('%02x', str:byte(i))
    end
    return ret
end

function table2string(cmd)
    local ret = ''
    local i
    for i = 1, #cmd do
        ret = ret .. string.char(cmd[i])
    end
    return ret
end

function checkBoundary(data, min, max)
    if (not data) then
        data = 0
    end
    data = tonumber(data)
    if ((data >= min) and (data <= max)) then
        return data
    else
        if (data < min) then
            return min
        else
            return max
        end
    end
end

function print_lua_table(lua_table, indent)
    indent = indent or 0
    for k, v in pairs(lua_table) do
        if type(k) == 'string' then
            k = string.format('%q', k)
        end
        local szSuffix = ''
        if type(v) == 'table' then
            szSuffix = '{'
        end
        local szPrefix = string.rep('    ', indent)
        formatting = szPrefix .. '[' .. k .. ']' .. ' = ' .. szSuffix
        if type(v) == 'table' then
            print(formatting)
            print_lua_table(v, indent + 1)
            print(szPrefix .. '},')
        else
            local szValue = ''
            if type(v) == 'string' then
                szValue = string.format('%q', v)
            else
                szValue = tostring(v)
            end
            print(formatting .. szValue .. ',')
        end
    end
end
