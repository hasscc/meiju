local JSON = require "cjson"
local uptable = {}
uptable["KEY_VERSION"] = "version"
uptable["VALUE_VERSION"] = "16"

uptable["BYTE_DEVICE_TYPE"] = 0xCA
uptable["BYTE_MSG_TYPE_CONTROL"] = 0x02
uptable["BYTE_MSG_TYPE_QUERY"] = 0x03
uptable["BYTE_PROTOCOL_HEAD"] = 0xAA
uptable["BYTE_PROTOCOL_HEAD_LENGTH"] = 0x0A

uptable["codeMode"] = 0
uptable["freezingMode"] = 0
uptable["smartMode"] = 0
uptable["energySavingMode"] = 0
uptable["holidayMode"] = 0
uptable["moisturizeMode"] = 0
uptable["preservationMode"] = 0
uptable["acmeFreezingMode"] = 0
uptable["refrigerationPowerValue"] = 0
uptable["lVariablePowerValue"] = 0
uptable["rVariablePowerValue"] = 0
uptable["freezingPowerValue"] = 0
uptable["functionZonePowerValue"] = 0
uptable["crossPeakElectricity"] = 0
uptable["allRefrigerationPower"] = 0
uptable["refrigerationTemperature"] = 0
uptable["freezingTemperature"] = 0
uptable["lVariableTemperature"] = 0
uptable["rVariableTemperature"] = 0
uptable["variableModeValue"] = 0
uptable["removeDew"] = 0
uptable["humidify"] = 0
uptable["unfreeze"] = 0
uptable["temperatureUnit"] = 0
uptable["floodlight"] = 0
uptable["functionSwitch"] = 0
uptable["radarMode"] = 0
uptable["milkMode"] = 0
uptable["icedMode"] = 0
uptable["plasmaAsepticMode"] = 0
uptable["acquireIceaMode"] = 0
uptable["brashIceaMode"] = 0
uptable["acquireWaterMode"] = 0
uptable["freezingIceMachinePower"] = 0
uptable["freezingFahrenheit"] = 0
uptable["refrigerationFahrenheit"] = 0
uptable["leachExpireDay"] = 0
uptable["powerConsumptionLow"] = 0
uptable["powerConsumptionHigh"] = 0
uptable["freezingMotorResetStatus"] = 0
uptable["freezingMotorDeicingStatus"] = 0
uptable["freezingIceMachineWaterStatus"] = 0
uptable["freezingAllIceStatus"] = 0
uptable["humanInduction"] = 0
uptable["refrigerationDoorPower"] = 0
uptable["freezingDoorPower"] = 0
uptable["variableDoorPower"] = 0
uptable["storageIceHomeDoorState"] = 0
uptable["barDoorPower"] = 0
uptable["iceMouthPower"] = 0
uptable["isError"] = 0
uptable["intervalRoomHumidityLevel"] = 0
uptable["refrigerationRealTemperature"] = 0
uptable["freezingRealTemperature"] = 0
uptable["lVariableRealTemperature"] = 0
uptable["rVariableRealTemperature"] = 0
uptable["fastColdMinuteLow"] = 0
uptable["fastColdMinuteHigh"] = 0
uptable["fastFreezeMinuteLow"] = 0
uptable["fastFreezeMinuteHigh"] = 0
uptable["foodSite"] = 0
uptable["beef"] = 0
uptable["pork"] = 0
uptable["mutton"] = 0
uptable["chicken"] = 0
uptable["duckMeat"] = 0
uptable["fish"] = 0
uptable["shrimp"] = 0
uptable["dumplings"] = 0
uptable["gluePudding"] = 0
uptable["iceCream"] = 0
uptable["microcrystalFresh"] = 0
uptable["dryZone"] = 0
uptable["electronicSmell"] = 0
uptable["eradicatePesticideResidue"] = 0
uptable["eradicatePesticideResidueProgress"] = 0
uptable["eradicatePesticideResidueCompletion"] = 0
uptable["humidity"] = 0
uptable["storageModeCompletion"] = 0
uptable["freezingModeCompletion"] = 0
uptable["humidifierWaterShortage"] = 0
uptable["plasmaAsepticCompletion"] = 0
uptable["acmeFreezingCompletion"] = 0
uptable["performanceMode"] = 0
uptable["normalTemperatureLevel"] = 0
uptable["functionZoneLevel"] = 0
uptable["humiditySetting"] = 0
uptable["smartHumidity"] = 0
uptable["storageLeftDoorAuto"] = 0
uptable["storageRightDoorAuto"] = 0
uptable["freezerDoorAuto"] = 0
uptable["freezerDoorAutoControl"] = 0
uptable["storageDoorAutoControl"] = 0
uptable["storageIceMachinePower"] = 0
uptable["storageMotorResetStatus"] = 0
uptable["storageMotorDeicingStatus"] = 0
uptable["storageIceMachineWaterStatus"] = 0
uptable["storageAllIceStatus"] = 0
uptable["filterExpiresMildWarning"] = 0
uptable["filterExpiresSevereWarning"] = 0
uptable["filterReplacementWarningElimination"] = 0
uptable["iceRoomRealTemperature"] = 0
uptable["storageFTemperature"] = 0
uptable["freezingFTemperature"] = 0
uptable["leftFlexzoneFTemperature"] = 0
uptable["electronicCleanStrong"] = 0
uptable["electronicCleanTimeout"] = 0
uptable["quickBeverageTime"] = 0
uptable["quickBeverage"] = 0
uptable["quickBeverageCompletion"] = 0
uptable["dataType"] = 0
uptable["storageDoorOpenOvertime"] = 0
uptable["freezerDoorOpenOvertime"] = 0
uptable["barDoorOpenOvertime"] = 0
uptable["variableDoorOpenOvertime"] = 0
uptable["iceMachineFull"] = 0
uptable["refrigerationSensorError"] = 0
uptable["refrigerationDefrostingSensorError"] = 0
uptable["ringTemperatureSensorError"] = 0
uptable["flexzoneSensorError"] = 0
uptable["rightFlexzoneSensorError"] = 0
uptable["freezingHighTemperature"] = 0
uptable["freezingSensorError"] = 0
uptable["freezingDefrostingSensorError"] = 0
uptable["iceElectricalMachineryError"] = 0
uptable["refrigerationDefrostingOvertime"] = 0
uptable["freezingDefrostingOvertime"] = 0
uptable["zeroCrossingCheckError"] = 0
uptable["eepromReadWriteError"] = 0
uptable["leftFlexzoneSensorError"] = 0
uptable["iceRoomSensorError"] = 0
uptable["mainDisplayCorrespondError"] = 0
uptable["iceMachineTemperatureError"] = 0
uptable["flexzoneDefrostingSensorError"] = 0
uptable["flexzoneDefrostingSensor2Error"] = 0
uptable["yogurtMachineSensorError"] = 0
uptable["iceMachineFrettingSwitchError"] = 0
uptable["iceMachinePipeFilterOvertime"] = 0
uptable["ambientHumiditySensorError"] = 0
uptable["storageHumiditySensorError"] = 0
uptable["radarSensor1Error"] = 0
uptable["radarSensor2Error"] = 0
uptable["radarSensor3Error"] = 0
uptable["radarSensor4Error"] = 0
uptable["radarSensor5Error"] = 0
uptable["functionZoneTemperatureSensorError"] = 0
uptable["normalZoneTemperatureSensorError"] = 0
uptable["humidityControlSensorError"] = 0
uptable["openDoorTooFrequently"] = 0
uptable["storageDoorAloneOpenFrequently"] = 0
uptable["freezingDoorAloneOpenFrequently"] = 0
uptable["barDoorAloneOpenFrequently"] = 0
uptable["snWritingError"] = 0
uptable["storageTemperatureOverheating"] = 0
uptable["storageTemperatureTooLow"] = 0
uptable["storageHeatingWireSensorError"] = 0
uptable["uartReceiverError"] = 0
uptable["crystalliteMainSensorError"] = 0
uptable["crystalliteBase1SensorError"] = 0
uptable["crystalliteBase2SensorError"] = 0
uptable["crystalliteBase3SensorError"] = 0
uptable["crystalliteBase4SensorError"] = 0
uptable["iceRoomDoorOpenOvertime"] = 0
uptable["storageIceFullTips"] = 0
uptable["iceMachineSensorError"] = 0
uptable["storageIceMachineSensorError"] = 0
uptable["storageIceOperationError"] = 0
uptable["freezingIceOperationError"] = 0
uptable["mcuIceCommunicationError"] = 0

local function print_lua_table(lua_table, indent)
    indent = indent or 0
    for k, v in pairs(lua_table) do
        if type(k) == "string" then
            k = string.format("%q", k)
        end
        local szSuffix = ""
        if type(v) == "table" then
            szSuffix = "{"
        end
        local szPrefix = string.rep(" ", indent)
        formatting = szPrefix .. "[" .. k .. "]" .. " = " .. szSuffix
        if type(v) == "table" then
            print(formatting)
            print_lua_table(v, indent + 1)
            print(szPrefix .. "},")
        else
            local szValue = ""
            if type(v) == "string" then
                szValue = string.format("%q", v)
            else
                szValue = tostring(v)
            end
            print(formatting .. szValue .. ",")
        end
    end
end

local function checkBoundary(data, min, max)
    if (not data) then
        data = 0
    end
    data = tonumber(data)
    if (data == nil) then
        data = 0
    end
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

local function string2Int(data)
    if (not data) then
        data = tonumber("0")
    end
    data = tonumber(data)
    if (data == nil) then
        data = 0
    end
    return data
end

local function int2String(data)
    if (not data) then
        data = tostring(0)
    end
    data = tostring(data)
    if (data == nil) then
        data = "0"
    end
    return data
end

local function table2string(cmd)
    local ret = ""
    local i
    for i = 1, #cmd do
        ret = ret .. string.char(cmd[i])
    end
    return ret
end

local function string2table(hexstr)
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

local function string2hexstring(str)
    local ret = ""
    for i = 1, #str do
        ret = ret .. string.format("%02x", str:byte(i))
    end
    return ret
end

local function encode(cmd)
    local tb
    if JSON == nil then
        JSON = require "cjson"
    end
    tb = JSON.encode(cmd)
    return tb
end

local function decode(cmd)
    local tb
    if JSON == nil then
        JSON = require "cjson"
    end
    tb = JSON.decode(cmd)
    return tb
end

local function makeSum(tmpbuf, start_pos, end_pos)
    local resVal = 0
    for si = start_pos, end_pos do
        resVal = resVal + tmpbuf[si]
    end
    resVal = bit.bnot(resVal) + 1
    resVal = bit.band(resVal, 0x00ff)
    return resVal
end

local crc8_854_table = { 0, 94, 188, 226, 97, 63, 221, 131, 194, 156, 126, 32, 163, 253, 31, 65, 157, 195, 33, 127, 252, 162, 64, 30, 95, 1, 227, 189, 62, 96, 130, 220, 35, 125, 159, 193, 66, 28, 254, 160, 225, 191, 93, 3, 128, 222, 60, 98, 190, 224, 2, 92, 223, 129, 99, 61, 124, 34, 192, 158, 29, 67, 161, 255, 70, 24, 250, 164, 39, 121, 155, 197, 132, 218, 56, 102, 229, 187, 89, 7, 219, 133, 103, 57, 186, 228, 6, 88, 25, 71, 165, 251, 120, 38, 196, 154, 101, 59, 217, 135, 4, 90, 184, 230, 167, 249, 27, 69, 198, 152, 122, 36, 248, 166, 68, 26, 153, 199, 37, 123, 58, 100, 134, 216, 91, 5, 231, 185, 140, 210, 48, 110, 237, 179, 81, 15, 78, 16, 242, 172, 47, 113, 147, 205, 17, 79, 173, 243, 112, 46, 204, 146, 211, 141, 111, 49, 178, 236, 14, 80, 175, 241, 19, 77, 206, 144, 114, 44, 109, 51, 209, 143, 12, 82, 176, 238, 50, 108, 142, 208, 83, 13, 239, 177, 240, 174, 76, 18, 145, 207, 45, 115, 202, 148, 118, 40, 171, 245, 23, 73, 8, 86, 180, 234, 105, 55, 213, 139, 87, 9, 235, 181, 54, 104, 138, 212, 149, 203, 41, 119, 244, 170, 72, 22, 233, 183, 85, 11, 136, 214, 52, 106, 43, 117, 151, 201, 74, 20, 246, 168, 116, 42, 200, 150, 21, 75, 169, 247, 182, 232, 10, 84, 215, 137, 107, 53 }
local function crc8_854(dataBuf, start_pos, end_pos)
    local crc = 0
    for si = start_pos, end_pos do
        crc = crc8_854_table[bit.band(bit.bxor(crc, dataBuf[si]), 0xFF) + 1]
    end
    return crc
end

local function getTotalMsg(bodyData, cType)
    local bodyLength = #bodyData
    local msgLength = bodyLength + uptable["BYTE_PROTOCOL_HEAD_LENGTH"] + 1
    local msgBytes = {}
    for i = 0, msgLength do
        msgBytes[i] = 0
    end
    msgBytes[0] = uptable["BYTE_PROTOCOL_HEAD"]
    msgBytes[1] = bodyLength + uptable["BYTE_PROTOCOL_HEAD_LENGTH"] + 1
    msgBytes[2] = uptable["BYTE_DEVICE_TYPE"]
    msgBytes[3] = bit.bxor((bodyLength + uptable["BYTE_PROTOCOL_HEAD_LENGTH"] + 1), uptable["BYTE_DEVICE_TYPE"])
    msgBytes[9] = cType
    for i = 0, bodyLength do
        msgBytes[i + uptable["BYTE_PROTOCOL_HEAD_LENGTH"]] = bodyData[i]
    end
    msgBytes[msgLength] = makeSum(msgBytes, 1, msgLength - 1)
    local msgFinal = {}
    for i = 1, msgLength + 1 do
        msgFinal[i] = msgBytes[i - 1]
    end
    return msgFinal
end

local function jsonToModel(jsonCmd)
    local streams = jsonCmd
    if (streams["storage_mode"] == "on") then
        uptable["codeMode"] = 0x01
    elseif (streams["storage_mode"] == "off") then
        uptable["codeMode"] = 0x00
    end
    if (streams["freezing_mode"] == "on") then
        uptable["freezingMode"] = 0x02
    elseif (streams["freezing_mode"] == "off") then
        uptable["freezingMode"] = 0x00
    end
    if (streams["intelligent_mode"] == "on") then
        uptable["smartMode"] = 0x04
    elseif (streams["intelligent_mode"] == "off") then
        uptable["smartMode"] = 0x00
    end
    if (streams["energy_saving_mode"] == "on") then
        uptable["energySavingMode"] = 0x08
    elseif (streams["energy_saving_mode"] == "off") then
        uptable["energySavingMode"] = 0x00
    end
    if (streams["holiday_mode"] == "on") then
        uptable["holidayMode"] = 0x10
    elseif (streams["holiday_mode"] == "off") then
        uptable["holidayMode"] = 0x00
    end
    if (streams["moisturize_mode"] == "on") then
        uptable["moisturizeMode"] = 0x20
    elseif (streams["moisturize_mode"] == "off") then
        uptable["moisturizeMode"] = 0x00
    end
    if (streams["preservation_mode"] == "on") then
        uptable["preservationMode"] = 0x40
    elseif (streams["preservation_mode"] == "off") then
        uptable["preservationMode"] = 0x00
    end
    if (streams["acme_freezing_mode"] == "on") then
        uptable["acmeFreezingMode"] = 0x80
    elseif (streams["acme_freezing_mode"] == "off") then
        uptable["acmeFreezingMode"] = 0x00
    end
    if (streams["storage_temperature"] ~= nil) then
        uptable["refrigerationTemperature"] = checkBoundary(streams["storage_temperature"], -2, 10)
    end
    if (streams["freezing_temperature"] ~= nil) then
        uptable["freezingTemperature"] = checkBoundary(streams["freezing_temperature"], -30, -10)
        uptable["freezingTemperature"] = uptable["freezingTemperature"] + (((-15 - uptable["freezingTemperature"]) * 2) + 18)
    end
    if (streams["left_flexzone_temperature"] ~= nil) then
        uptable["lVariableTemperature"] = checkBoundary(streams["left_flexzone_temperature"], -30, 20)
        if ((uptable["lVariableTemperature"] >= -18) and (uptable["lVariableTemperature"] <= 10)) then
            uptable["lVariableTemperature"] = uptable["lVariableTemperature"] + 19
        elseif ((uptable["lVariableTemperature"] >= -24) and (uptable["lVariableTemperature"] <= -19)) then
            uptable["lVariableTemperature"] = uptable["lVariableTemperature"] + 30
        else
            uptable["lVariableTemperature"] = 0
        end
    end
    if (streams["right_flexzone_temperature"] ~= nil) then
        uptable["rVariableTemperature"] = checkBoundary(streams["right_flexzone_temperature"], -30, 20)
        if ((uptable["rVariableTemperature"] >= -18) and (uptable["rVariableTemperature"] <= 10)) then
            uptable["rVariableTemperature"] = uptable["rVariableTemperature"] + 19
        elseif ((uptable["rVariableTemperature"] >= -24) and (uptable["rVariableTemperature"] <= -19)) then
            uptable["rVariableTemperature"] = uptable["rVariableTemperature"] + 30
        else
            uptable["rVariableTemperature"] = 0
        end
    end
    if (streams["variable_mode"] == "soft_freezing_mode") then
        uptable["variableModeValue"] = 0x01
    elseif (streams["variable_mode"] == "zero_fresh_mode") then
        uptable["variableModeValue"] = 0x02
    elseif (streams["variable_mode"] == "cold_drink_mode") then
        uptable["variableModeValue"] = 0x03
    elseif (streams["variable_mode"] == "fresh_product_mode") then
        uptable["variableModeValue"] = 0x04
    elseif (streams["variable_mode"] == "partial_freezing_mode") then
        uptable["variableModeValue"] = 0x05
    elseif (streams["variable_mode"] == "dry_zone_mode") then
        uptable["variableModeValue"] = 0x06
    elseif (streams["variable_mode"] == "freeze_warm_mode") then
        uptable["variableModeValue"] = 0x07
    elseif (streams["variable_mode"] == "freeze_mode") then
        uptable["variableModeValue"] = 0x08
    end
    if (streams["storage_power"] == "on") then
        uptable["refrigerationPowerValue"] = 0x00
    elseif (streams["storage_power"] == "off") then
        uptable["refrigerationPowerValue"] = 0x01
    end
    if (streams["left_flexzone_power"] == "on") then
        uptable["lVariablePowerValue"] = 0x00
    elseif (streams["left_flexzone_power"] == "off") then
        uptable["lVariablePowerValue"] = 0x04
    end
    if (streams["right_flexzone_power"] == "on") then
        uptable["rVariablePowerValue"] = 0x00
    elseif (streams["right_flexzone_power"] == "off") then
        uptable["rVariablePowerValue"] = 0x08
    end
    if (streams["freezing_power"] == "on") then
        uptable["freezingPowerValue"] = 0x00
    elseif (streams["freezing_power"] == "off") then
        uptable["freezingPowerValue"] = 0x10
    end
    if (streams["function_zone_power"] == "on") then
        uptable["functionZonePowerValue"] = 0x00
    elseif (streams["function_zone_power"] == "off") then
        uptable["functionZonePowerValue"] = 0x20
    end
    if (streams["cross_peak_electricity"] == "on") then
        uptable["crossPeakElectricity"] = 0x40
    elseif (streams["cross_peak_electricity"] == "off") then
        uptable["crossPeakElectricity"] = 0x00
    end
    if (streams["all_refrigeration_power"] == "on") then
        uptable["allRefrigerationPower"] = 0x80
    elseif (streams["all_refrigeration_power"] == "off") then
        uptable["allRefrigerationPower"] = 0x00
    end
    if (streams["remove_dew_power"] == "on") then
        uptable["removeDew"] = 0x01
    elseif (streams["remove_dew_power"] == "off") then
        uptable["removeDew"] = 0x00
    end
    if (streams["humidify_power"] == "on") then
        uptable["humidify"] = 0x02
    elseif (streams["humidify_power"] == "off") then
        uptable["humidify"] = 0x00
    end
    if (streams["unfreeze_power"] == "on") then
        uptable["unfreeze"] = 0x04
    elseif (streams["unfreeze_power"] == "off") then
        uptable["unfreeze"] = 0x00
    end
    if (streams["temperature_unit"] == "fahrenheit") then
        uptable["temperatureUnit"] = 0x08
    elseif (streams["temperature_unit"] == "celsius") then
        uptable["temperatureUnit"] = 0x00
    end
    if (streams["floodlight_power"] == "on") then
        uptable["floodlight"] = 0x10
    elseif (streams["floodlight_power"] == "off") then
        uptable["floodlight"] = 0x00
    end
    if (streams["icea_bar_function_switch"] == "default") then
        uptable["functionSwitch"] = 0x00
    elseif (streams["icea_bar_function_switch"] == "refrigeration") then
        uptable["functionSwitch"] = 0x40
    elseif (streams["icea_bar_function_switch"] == "freezing") then
        uptable["functionSwitch"] = 0x80
    end
    if (streams["radar_mode_power"] == "on") then
        uptable["radarMode"] = 0x01
    elseif (streams["radar_mode_power"] == "off") then
        uptable["radarMode"] = 0x00
    end
    if (streams["milk_mode_power"] == "on") then
        uptable["milkMode"] = 0x02
    elseif (streams["milk_mode_power"] == "off") then
        uptable["milkMode"] = 0x00
    end
    if (streams["icea_mode_power"] == "on") then
        uptable["icedMode"] = 0x04
    elseif (streams["icea_mode_power"] == "off") then
        uptable["icedMode"] = 0x00
    end
    if (streams["plasma_aseptic_mode_power"] == "on") then
        uptable["plasmaAsepticMode"] = 0x08
    elseif (streams["plasma_aseptic_mode_power"] == "off") then
        uptable["plasmaAsepticMode"] = 0x00
    end
    if (streams["acquire_icea_mode_power"] == "on") then
        uptable["acquireIceaMode"] = 0x10
    elseif (streams["acquire_icea_mode_power"] == "off") then
        uptable["acquireIceaMode"] = 0x00
    end
    if (streams["brash_icea_mode_power"] == "on") then
        uptable["brashIceaMode"] = 0x20
    elseif (streams["brash_icea_mode_power"] == "off") then
        uptable["brashIceaMode"] = 0x00
    end
    if (streams["acquire_water_mode_power"] == "on") then
        uptable["acquireWaterMode"] = 0x40
    elseif (streams["acquire_water_mode_power"] == "off") then
        uptable["acquireWaterMode"] = 0x00
    end
    if (streams["freezing_ice_machine_power"] == "on") then
        uptable["freezingIceMachinePower"] = 0x80
    elseif (streams["freezing_ice_machine_power"] == "off") then
        uptable["freezingIceMachinePower"] = 0x00
    end
    if (streams["interval_room_humidity_level"] ~= nil) then
        uptable["intervalRoomHumidityLevel"] = checkBoundary(streams["interval_room_humidity_level"], 0, 127)
    end
    if (streams["food_site"] == "left_freezing_room") then
        uptable["foodSite"] = 0x00
    elseif (streams["food_site"] == "right_freezing_room") then
        uptable["foodSite"] = 0x01
    end
    if (streams["microcrystal_fresh"] == "on") then
        uptable["microcrystalFresh"] = 0x01
    elseif (streams["microcrystal_fresh"] == "off") then
        uptable["microcrystalFresh"] = 0x00
    end
    if (streams["dry_zone"] == "on") then
        uptable["dryZone"] = 0x02
    elseif (streams["dry_zone"] == "off") then
        uptable["dryZone"] = 0x00
    end
    if (streams["electronic_smell"] == "on") then
        uptable["electronicSmell"] = 0x04
    elseif (streams["electronic_smell"] == "off") then
        uptable["electronicSmell"] = 0x00
    end
    if (streams["eradicate_pesticide_residue"] == "on") then
        uptable["eradicatePesticideResidue"] = 0x08
    elseif (streams["eradicate_pesticide_residue"] == "off") then
        uptable["eradicatePesticideResidue"] = 0x00
    end
    if (streams["humidity"] == "high") then
        uptable["humidity"] = 0x10
    elseif (streams["humidity"] == "low") then
        uptable["humidity"] = 0x20
    end
    if (streams["performance_mode"] == "on") then
        uptable["performanceMode"] = 0x80
    elseif (streams["performance_mode"] == "off") then
        uptable["performanceMode"] = 0x00
    end
    if (streams["normal_zone_level"] ~= nil) then
        uptable["normalTemperatureLevel"] = checkBoundary(streams["normal_zone_level"], 1, 10)
    end
    if (streams["function_zone_level"] ~= nil) then
        uptable["functionZoneLevel"] = checkBoundary(streams["function_zone_level"], 1, 10)
    end
    if (streams["humidify_setting"] ~= nil) then
        uptable["humiditySetting"] = checkBoundary(streams["humidify_setting"], 1, 99)
    end
    if (streams["smart_humidify"] == "on") then
        uptable["smartHumidity"] = 0x80
    elseif (streams["smart_humidify"] == "off") then
        uptable["smartHumidity"] = 0x00
    end
    if (streams["storage_left_door_auto"] == "on") then
        uptable["storageLeftDoorAuto"] = 0x01
    elseif (streams["storage_left_door_auto"] == "off") then
        uptable["storageLeftDoorAuto"] = 0x02
    elseif (streams["storage_left_door_auto"] == "invalid") then
        uptable["storageLeftDoorAuto"] = 0x00
    end
    if (streams["storage_right_door_auto"] == "on") then
        uptable["storageRightDoorAuto"] = 0x01
    elseif (streams["storage_right_door_auto"] == "off") then
        uptable["storageRightDoorAuto"] = 0x02
    elseif (streams["storage_right_door_auto"] == "invalid") then
        uptable["storageRightDoorAuto"] = 0x00
    end
    if (streams["freezer_door_auto"] == "on") then
        uptable["freezerDoorAuto"] = 0x01
    elseif (streams["freezer_door_auto"] == "off") then
        uptable["freezerDoorAuto"] = 0x02
    elseif (streams["freezer_door_auto"] == "invalid") then
        uptable["freezerDoorAuto"] = 0x00
    end
    if (streams["freezer_door_auto_control"] == "on") then
        uptable["freezerDoorAutoControl"] = 0x40
    elseif (streams["freezer_door_auto_control"] == "off") then
        uptable["freezerDoorAutoControl"] = 0x00
    end
    if (streams["storage_door_auto_control"] == "on") then
        uptable["storageDoorAutoControl"] = 0x80
    elseif (streams["storage_door_auto_control"] == "off") then
        uptable["storageDoorAutoControl"] = 0x00
    end
    if (streams["storage_ice_machine_power"] == "on") then
        uptable["storageIceMachinePower"] = 0x01
    elseif (streams["storage_ice_machine_power"] == "off") then
        uptable["storageIceMachinePower"] = 0x00
    end
    if (streams["filter_replacement_warning_elimination"] == "valid") then
        uptable["filterReplacementWarningElimination"] = 0x80
    elseif (streams["filter_replacement_warning_elimination"] == "invalid") then
        uptable["filterReplacementWarningElimination"] = 0x00
    end
    if (streams["storage_F_temperature"] ~= nil) then
        uptable["storageFTemperature"] = checkBoundary(streams["storage_F_temperature"], 10, 50)
    end
    if (streams["freezing_F_temperature"] ~= nil) then
        uptable["freezingFTemperature"] = checkBoundary(streams["freezing_F_temperature"], -20, 20)
        uptable["freezingFTemperature"] = 11 - uptable["freezingFTemperature"]
    end
    if (streams["left_flexzone_F_temperature"] ~= nil) then
        uptable["leftFlexzoneFTemperature"] = checkBoundary(streams["left_flexzone_F_temperature"], 10, 50) + 1
    end
    if (streams["electronic_clean_strong"] == "on") then
        uptable["electronicCleanStrong"] = 0x01
    elseif (streams["electronic_clean_strong"] == "off") then
        uptable["electronicCleanStrong"] = 0x00
    end
    if (streams["quick_beverage_time"] ~= nil) then
        uptable["quickBeverageTime"] = checkBoundary(streams["quick_beverage_time"], 0, 127)
    end
    if (streams["quick_beverage"] == "on") then
        uptable["quickBeverage"] = 0x80
    elseif (streams["quick_beverage"] == "off") then
        uptable["quickBeverage"] = 0x00
    end
end

local function binToModel(binData)
    if (#binData < 6) then
        return nil
    end
    local messageBytes = binData
    if ((uptable["dataType"] == 0x02 and messageBytes[0] == 0x00) or (uptable["dataType"] == 0x03 and messageBytes[0] == 0x00) or (uptable["dataType"] == 0x04 and messageBytes[0] == 0x02)) then
        uptable["codeMode"] = bit.band(messageBytes[1], 0x01)
        uptable["freezingMode"] = bit.band(messageBytes[1], 0x02)
        uptable["smartMode"] = bit.band(messageBytes[1], 0x04)
        uptable["energySavingMode"] = bit.band(messageBytes[1], 0x08)
        uptable["holidayMode"] = bit.band(messageBytes[1], 0x10)
        uptable["moisturizeMode"] = bit.band(messageBytes[1], 0x20)
        uptable["preservationMode"] = bit.band(messageBytes[1], 0x40)
        uptable["acmeFreezingMode"] = bit.band(messageBytes[1], 0x80)
        uptable["refrigerationTemperature"] = bit.band(messageBytes[2], 0x0F)
        uptable["freezingTemperature"] = bit.rshift(bit.band(messageBytes[2], 0xF0), 4)
        uptable["lVariableTemperature"] = messageBytes[3]
        uptable["rVariableTemperature"] = messageBytes[4]
        uptable["variableModeValue"] = messageBytes[5]
        uptable["refrigerationPowerValue"] = bit.band(messageBytes[6], 0x01)
        uptable["lVariablePowerValue"] = bit.band(messageBytes[6], 0x04)
        uptable["rVariablePowerValue"] = bit.band(messageBytes[6], 0x08)
        uptable["freezingPowerValue"] = bit.band(messageBytes[6], 0x10)
        uptable["functionZonePowerValue"] = bit.band(messageBytes[6], 0x20)
        uptable["crossPeakElectricity"] = bit.band(messageBytes[6], 0x40)
        uptable["allRefrigerationPower"] = bit.band(messageBytes[6], 0x80)
        uptable["removeDew"] = bit.band(messageBytes[7], 0x01)
        uptable["humidify"] = bit.band(messageBytes[7], 0x02)
        uptable["unfreeze"] = bit.band(messageBytes[7], 0x04)
        uptable["temperatureUnit"] = bit.band(messageBytes[7], 0x08)
        uptable["floodlight"] = bit.band(messageBytes[7], 0x10)
        uptable["functionSwitch"] = bit.band(messageBytes[7], 0xC0)
        uptable["radarMode"] = bit.band(messageBytes[8], 0x01)
        uptable["milkMode"] = bit.band(messageBytes[8], 0x02)
        uptable["icedMode"] = bit.band(messageBytes[8], 0x04)
        uptable["plasmaAsepticMode"] = bit.band(messageBytes[8], 0x08)
        uptable["acquireIceaMode"] = bit.band(messageBytes[8], 0x10)
        uptable["brashIceaMode"] = bit.band(messageBytes[8], 0x20)
        uptable["acquireWaterMode"] = bit.band(messageBytes[8], 0x40)
        uptable["freezingIceMachinePower"] = bit.band(messageBytes[8], 0x80)
        uptable["freezingFahrenheit"] = messageBytes[9]
        uptable["refrigerationFahrenheit"] = bit.band(messageBytes[10], 0xFC)
        uptable["leachExpireDay"] = messageBytes[11]
        uptable["powerConsumptionLow"] = messageBytes[12]
        uptable["powerConsumptionHigh"] = messageBytes[13]
        uptable["freezingMotorResetStatus"] = bit.band(messageBytes[14], 0x01)
        uptable["freezingMotorDeicingStatus"] = bit.band(messageBytes[14], 0x02)
        uptable["freezingIceMachineWaterStatus"] = bit.band(messageBytes[14], 0x04)
        uptable["freezingAllIceStatus"] = bit.band(messageBytes[14], 0x08)
        uptable["humanInduction"] = bit.band(messageBytes[14], 0x10)
        uptable["refrigerationDoorPower"] = bit.band(messageBytes[15], 0x01)
        uptable["freezingDoorPower"] = bit.band(messageBytes[15], 0x02)
        uptable["variableDoorPower"] = bit.band(messageBytes[15], 0x10)
        uptable["storageIceHomeDoorState"] = bit.band(messageBytes[15], 0x20)
        uptable["barDoorPower"] = bit.band(messageBytes[15], 0x04)
        uptable["iceMouthPower"] = bit.band(messageBytes[15], 0x08)
        uptable["isError"] = bit.band(messageBytes[16], 0x01)
        uptable["intervalRoomHumidityLevel"] = bit.band(messageBytes[16], 0xFE)
        uptable["refrigerationRealTemperature"] = messageBytes[17]
        uptable["freezingRealTemperature"] = messageBytes[18]
        uptable["lVariableRealTemperature"] = messageBytes[19]
        uptable["rVariableRealTemperature"] = messageBytes[20]
        uptable["fastColdMinuteLow"] = messageBytes[21]
        uptable["fastColdMinuteHigh"] = messageBytes[22]
        uptable["fastFreezeMinuteLow"] = messageBytes[23]
        uptable["fastFreezeMinuteHigh"] = messageBytes[24]
        if (#messageBytes > 25) then
            uptable["foodSite"] = bit.band(messageBytes[25], 0x0F)
            uptable["beef"] = bit.band(messageBytes[25], 0x40)
            uptable["pork"] = bit.band(messageBytes[25], 0x80)
            uptable["mutton"] = bit.band(messageBytes[26], 0x01)
            uptable["chicken"] = bit.band(messageBytes[26], 0x02)
            uptable["duckMeat"] = bit.band(messageBytes[26], 0x04)
            uptable["fish"] = bit.band(messageBytes[26], 0x08)
            uptable["shrimp"] = bit.band(messageBytes[26], 0x10)
            uptable["dumplings"] = bit.band(messageBytes[26], 0x20)
            uptable["gluePudding"] = bit.band(messageBytes[26], 0x40)
            uptable["iceCream"] = bit.band(messageBytes[26], 0x80)
            uptable["microcrystalFresh"] = bit.band(messageBytes[27], 0x01)
            uptable["dryZone"] = bit.band(messageBytes[27], 0x02)
            uptable["electronicSmell"] = bit.band(messageBytes[27], 0x04)
            uptable["eradicatePesticideResidue"] = bit.band(messageBytes[27], 0x08)
            uptable["humidity"] = bit.band(messageBytes[27], 0x70)
            uptable["performanceMode"] = bit.band(messageBytes[27], 0x80)
            uptable["normalTemperatureLevel"] = messageBytes[28]
            uptable["functionZoneLevel"] = messageBytes[29]
            if (#messageBytes > 30) then
                uptable["humiditySetting"] = bit.band(messageBytes[30], 0x7F)
                uptable["smartHumidity"] = bit.band(messageBytes[30], 0x80)
                if (#messageBytes > 31) then
                    uptable["storageLeftDoorAuto"] = bit.band(messageBytes[31], 0x03)
                    uptable["storageRightDoorAuto"] = bit.band(messageBytes[31], 0x0C)
                    uptable["freezerDoorAuto"] = bit.band(messageBytes[31], 0x30)
                    uptable["freezerDoorAutoControl"] = bit.band(messageBytes[31], 0x40)
                    uptable["storageDoorAutoControl"] = bit.band(messageBytes[31], 0x80)
                    uptable["eradicatePesticideResidueProgress"] = bit.band(messageBytes[32], 0x7F)
                    uptable["eradicatePesticideResidueCompletion"] = bit.band(messageBytes[32], 0x80)
                    if (#messageBytes > 33) then
                        uptable["storageIceMachinePower"] = bit.band(messageBytes[33], 0x01)
                        uptable["storageMotorResetStatus"] = bit.band(messageBytes[33], 0x02)
                        uptable["storageMotorResetStatus"] = bit.band(messageBytes[33], 0x04)
                        uptable["storageIceMachineWaterStatus"] = bit.band(messageBytes[33], 0x08)
                        uptable["storageAllIceStatus"] = bit.band(messageBytes[33], 0x10)
                        uptable["filterExpiresMildWarning"] = bit.band(messageBytes[33], 0x20)
                        uptable["filterExpiresSevereWarning"] = bit.band(messageBytes[33], 0x40)
                        uptable["iceRoomRealTemperature"] = messageBytes[34]
                        if (#messageBytes > 35) then
                            uptable["storageFTemperature"] = messageBytes[35]
                            uptable["freezingFTemperature"] = messageBytes[36]
                            uptable["leftFlexzoneFTemperature"] = messageBytes[37]
                            if (#messageBytes > 38) then
                                uptable["electronicCleanStrong"] = bit.band(messageBytes[38], 0x01)
                                uptable["electronicCleanTimeout"] = bit.band(messageBytes[38], 0xFE)
                                if (uptable["electronicCleanTimeout"] ~= 0) then
                                    uptable["electronicCleanTimeout"] = bit.rshift(uptable["electronicCleanTimeout"], 1)
                                end
                                if (#messageBytes > 39) then
                                    uptable["quickBeverageTime"] = bit.band(messageBytes[39], 0x7F)
                                    uptable["quickBeverage"] = bit.band(messageBytes[39], 0x80)
                                end
                            end
                        end
                    end
                end
            end
        end
    elseif ((uptable["dataType"] == 0x04 and messageBytes[0] == 0x01) or (uptable["dataType"] == 0x03 and messageBytes[0] == 0x01)) then
        uptable["codeMode"] = bit.band(messageBytes[33], 0x01)
        uptable["freezingMode"] = bit.band(messageBytes[33], 0x02)
        uptable["smartMode"] = bit.band(messageBytes[33], 0x04)
        uptable["energySavingMode"] = bit.band(messageBytes[33], 0x08)
        uptable["holidayMode"] = bit.band(messageBytes[33], 0x10)
        uptable["moisturizeMode"] = bit.band(messageBytes[33], 0x20)
        uptable["preservationMode"] = bit.band(messageBytes[33], 0x40)
        uptable["radarMode"] = bit.band(messageBytes[34], 0x01)
        uptable["milkMode"] = bit.band(messageBytes[34], 0x02)
        uptable["icedMode"] = bit.band(messageBytes[34], 0x04)
        uptable["plasmaAsepticMode"] = bit.band(messageBytes[34], 0x08)
        uptable["freezingIceMachinePower"] = bit.band(messageBytes[34], 0x10)
        uptable["acmeFreezingMode"] = bit.band(messageBytes[34], 0x20)
        uptable["removeDew"] = bit.band(messageBytes[35], 0x01)
        uptable["humidify"] = bit.band(messageBytes[35], 0x02)
        uptable["unfreeze"] = bit.band(messageBytes[35], 0x04)
        uptable["temperatureUnit"] = bit.band(messageBytes[35], 0x08)
        uptable["floodlight"] = bit.band(messageBytes[35], 0x10)
        uptable["functionSwitch"] = bit.band(messageBytes[35], 0xC0)
        uptable["refrigerationPowerValue"] = bit.band(messageBytes[36], 0x01)
        uptable["lVariablePowerValue"] = bit.band(messageBytes[36], 0x04)
        uptable["rVariablePowerValue"] = bit.band(messageBytes[36], 0x08)
        uptable["freezingPowerValue"] = bit.band(messageBytes[36], 0x10)
        uptable["functionZonePowerValue"] = bit.band(messageBytes[36], 0x20)
        uptable["allRefrigerationPower"] = bit.band(messageBytes[36], 0x80)
        uptable["refrigerationTemperature"] = messageBytes[37]
        uptable["freezingTemperature"] = messageBytes[38]
        uptable["lVariableTemperature"] = messageBytes[39]
        uptable["rVariableTemperature"] = messageBytes[40]
        uptable["intervalRoomHumidityLevel"] = messageBytes[42]
        uptable["refrigerationFahrenheit"] = messageBytes[43]
        uptable["freezingFahrenheit"] = messageBytes[44]
        uptable["variableModeValue"] = messageBytes[49]
        uptable["normalTemperatureLevel"] = messageBytes[50]
        uptable["functionZoneLevel"] = messageBytes[51]
        if (#messageBytes > 54) then
            uptable["microcrystalFresh"] = bit.band(messageBytes[56], 0x01)
            uptable["humidity"] = bit.band(messageBytes[56], 0x70)
            uptable["performanceMode"] = bit.band(messageBytes[56], 0x80)
            if (#messageBytes > 57) then
                uptable["electronicCleanStrong"] = bit.band(messageBytes[66], 0x01)
                uptable["electronicCleanTimeout"] = bit.band(messageBytes[66], 0xFE)
                if (uptable["electronicCleanTimeout"] ~= 0) then
                    uptable["electronicCleanTimeout"] = bit.rshift(uptable["electronicCleanTimeout"], 1)
                end
            end
        end
    elseif (uptable["dataType"] == 0x04 and messageBytes[0] == 0x00) then
        uptable["refrigerationDoorPower"] = bit.band(messageBytes[1], 0x01)
        uptable["freezingDoorPower"] = bit.band(messageBytes[1], 0x02)
        uptable["barDoorPower"] = bit.band(messageBytes[1], 0x04)
        uptable["iceMouthPower"] = bit.band(messageBytes[1], 0x08)
        uptable["variableDoorPower"] = bit.band(messageBytes[1], 0x10)
        uptable["storageIceHomeDoorState"] = bit.band(messageBytes[2], 0x10)
        uptable["storageModeCompletion"] = bit.band(messageBytes[3], 0x01)
        uptable["freezingModeCompletion"] = bit.band(messageBytes[3], 0x02)
        uptable["humidifierWaterShortage"] = bit.band(messageBytes[3], 0x04)
        uptable["plasmaAsepticCompletion"] = bit.band(messageBytes[3], 0x08)
        uptable["acmeFreezingCompletion"] = bit.band(messageBytes[3], 0x10)
        uptable["eradicatePesticideResidueCompletion"] = bit.band(messageBytes[3], 0x20)
        uptable["quickBeverageCompletion"] = bit.band(messageBytes[3], 0x80)
    elseif ((uptable["dataType"] == 0x06 and messageBytes[0] == 0x01) or (uptable["dataType"] == 0x03 and messageBytes[0] == 0x02)) then
        if (messageBytes[1] ~= 0x00 or messageBytes[2] ~= 0x00 or messageBytes[3] ~= 0x00 or messageBytes[4] ~= 0x00 or messageBytes[5] ~= 0x00 or messageBytes[6] ~= 0x00 or messageBytes[7] ~= 0x00) then
            uptable["isError"] = 0x01
        else
            uptable["isError"] = 0x00
        end
        uptable["storageDoorOpenOvertime"] = bit.band(messageBytes[1], 0x01)
        uptable["freezerDoorOpenOvertime"] = bit.band(messageBytes[1], 0x02)
        uptable["barDoorOpenOvertime"] = bit.band(messageBytes[1], 0x04)
        uptable["variableDoorOpenOvertime"] = bit.band(messageBytes[1], 0x08)
        uptable["iceMachineFull"] = bit.band(messageBytes[1], 0x10)
        uptable["refrigerationSensorError"] = bit.band(messageBytes[2], 0x01)
        uptable["refrigerationDefrostingSensorError"] = bit.band(messageBytes[2], 0x02)
        uptable["ringTemperatureSensorError"] = bit.band(messageBytes[2], 0x04)
        uptable["flexzoneSensorError"] = bit.band(messageBytes[2], 0x08)
        uptable["rightFlexzoneSensorError"] = bit.band(messageBytes[2], 0x10)
        uptable["freezingHighTemperature"] = bit.band(messageBytes[2], 0x20)
        uptable["freezingSensorError"] = bit.band(messageBytes[2], 0x40)
        uptable["freezingDefrostingSensorError"] = bit.band(messageBytes[2], 0x80)
        uptable["iceElectricalMachineryError"] = bit.band(messageBytes[3], 0x01)
        uptable["refrigerationDefrostingOvertime"] = bit.band(messageBytes[3], 0x02)
        uptable["freezingDefrostingOvertime"] = bit.band(messageBytes[3], 0x04)
        uptable["zeroCrossingCheckError"] = bit.band(messageBytes[3], 0x08)
        uptable["eepromReadWriteError"] = bit.band(messageBytes[3], 0x10)
        uptable["leftFlexzoneSensorError"] = bit.band(messageBytes[3], 0x20)
        uptable["iceRoomSensorError"] = bit.band(messageBytes[3], 0x40)
        uptable["mainDisplayCorrespondError"] = bit.band(messageBytes[3], 0x80)
        uptable["iceMachineTemperatureError"] = bit.band(messageBytes[4], 0x01)
        uptable["flexzoneDefrostingSensorError"] = bit.band(messageBytes[4], 0x02)
        uptable["flexzoneDefrostingSensor2Error"] = bit.band(messageBytes[4], 0x04)
        uptable["yogurtMachineSensorError"] = bit.band(messageBytes[4], 0x08)
        uptable["iceMachineFrettingSwitchError"] = bit.band(messageBytes[4], 0x10)
        uptable["iceMachinePipeFilterOvertime"] = bit.band(messageBytes[4], 0x20)
        uptable["ambientHumiditySensorError"] = bit.band(messageBytes[4], 0x40)
        uptable["storageHumiditySensorError"] = bit.band(messageBytes[4], 0x80)
        uptable["radarSensor1Error"] = bit.band(messageBytes[5], 0x01)
        uptable["radarSensor2Error"] = bit.band(messageBytes[5], 0x02)
        uptable["radarSensor3Error"] = bit.band(messageBytes[5], 0x04)
        uptable["radarSensor4Error"] = bit.band(messageBytes[5], 0x08)
        uptable["radarSensor5Error"] = bit.band(messageBytes[5], 0x10)
        uptable["functionZoneTemperatureSensorError"] = bit.band(messageBytes[5], 0x20)
        uptable["normalZoneTemperatureSensorError"] = bit.band(messageBytes[5], 0x40)
        uptable["humidityControlSensorError"] = bit.band(messageBytes[5], 0x80)
        uptable["openDoorTooFrequently"] = bit.band(messageBytes[6], 0x01)
        uptable["storageDoorAloneOpenFrequently"] = bit.band(messageBytes[6], 0x02)
        uptable["freezingDoorAloneOpenFrequently"] = bit.band(messageBytes[6], 0x04)
        uptable["barDoorAloneOpenFrequently"] = bit.band(messageBytes[6], 0x08)
        uptable["snWritingError"] = bit.band(messageBytes[6], 0x20)
        uptable["storageTemperatureOverheating"] = bit.band(messageBytes[6], 0x40)
        uptable["storageTemperatureTooLow"] = bit.band(messageBytes[6], 0x80)
        uptable["storageHeatingWireSensorError"] = bit.band(messageBytes[7], 0x01)
        uptable["uartReceiverError"] = bit.band(messageBytes[7], 0x02)
        uptable["crystalliteMainSensorError"] = bit.band(messageBytes[7], 0x08)
        uptable["crystalliteBase1SensorError"] = bit.band(messageBytes[7], 0x10)
        uptable["crystalliteBase2SensorError"] = bit.band(messageBytes[7], 0x20)
        uptable["crystalliteBase3SensorError"] = bit.band(messageBytes[7], 0x40)
        uptable["crystalliteBase4SensorError"] = bit.band(messageBytes[7], 0x80)
        uptable["iceRoomDoorOpenOvertime"] = bit.band(messageBytes[8], 0x01)
        uptable["storageIceFullTips"] = bit.band(messageBytes[8], 0x02)
        uptable["iceMachineSensorError"] = bit.band(messageBytes[8], 0x04)
        uptable["storageIceMachineSensorError"] = bit.band(messageBytes[8], 0x08)
        uptable["storageIceOperationError"] = bit.band(messageBytes[8], 0x10)
        uptable["freezingIceOperationError"] = bit.band(messageBytes[8], 0x20)
        uptable["mcuIceCommunicationError"] = bit.band(messageBytes[8], 0x40)
    end
end

function jsonToData(jsonCmd)
    if (#jsonCmd == 0) then
        return nil
    end
    local infoM = {}
    local bodyBytes = {}
    local json = decode(jsonCmd)
    local deviceSubType = json["deviceinfo"]["deviceSubType"]
    if (deviceSubType == 1) then
    end
    local query = json["query"]
    local control = json["control"]
    local status = json["status"]
    if (query) then
        bodyBytes[0] = 0x00
        infoM = getTotalMsg(bodyBytes, uptable["BYTE_MSG_TYPE_QUERY"])
    elseif (control) then
        if (status) then
            jsonToModel(status)
        end
        if (control) then
            jsonToModel(control)
        end
        for i = 0, 39 do
            bodyBytes[i] = 0
        end
        bodyBytes[0] = 0x00
        bodyBytes[1] = bit.bor(bit.bor(bit.bor(bit.bor(bit.bor(bit.bor(bit.bor(bit.band(uptable["codeMode"], 0x01), bit.band(uptable["freezingMode"], 0x02)), bit.band(uptable["smartMode"], 0x04)), bit.band(uptable["energySavingMode"], 0x08)), bit.band(uptable["holidayMode"], 0x10)), bit.band(uptable["moisturizeMode"], 0x20)), bit.band(uptable["preservationMode"], 0x40)), bit.band(uptable["acmeFreezingMode"], 0x80))
        bodyBytes[2] = bit.bor(bit.lshift(bit.band(uptable["freezingTemperature"], 0x0F), 4), bit.band(uptable["refrigerationTemperature"], 0x0F))
        bodyBytes[3] = uptable["lVariableTemperature"]
        bodyBytes[4] = uptable["rVariableTemperature"]
        bodyBytes[5] = uptable["variableModeValue"]
        bodyBytes[6] = bit.bor(bit.bor(bit.bor(bit.bor(bit.bor(bit.bor(bit.band(uptable["refrigerationPowerValue"], 0x01), bit.band(uptable["lVariablePowerValue"], 0x04)), bit.band(uptable["rVariablePowerValue"], 0x08)), bit.band(uptable["freezingPowerValue"], 0x10)), bit.band(uptable["functionZonePowerValue"], 0x20)), bit.band(uptable["crossPeakElectricity"], 0x40)), bit.band(uptable["allRefrigerationPower"], 0x80))
        bodyBytes[7] = bit.bor(bit.bor(bit.bor(bit.bor(bit.bor(bit.band(uptable["removeDew"], 0x01), bit.band(uptable["humidify"], 0x02)), bit.band(uptable["unfreeze"], 0x04)), bit.band(uptable["temperatureUnit"], 0x08)), bit.band(uptable["floodlight"], 0x10)), bit.band(uptable["functionSwitch"], 0xC0))
        bodyBytes[8] = bit.bor(bit.bor(bit.bor(bit.bor(bit.bor(bit.bor(bit.bor(bit.band(uptable["radarMode"], 0x01), bit.band(uptable["milkMode"], 0x02)), bit.band(uptable["icedMode"], 0x04)), bit.band(uptable["plasmaAsepticMode"], 0x08)), bit.band(uptable["acquireIceaMode"], 0x10)), bit.band(uptable["brashIceaMode"], 0x20)), bit.band(uptable["acquireWaterMode"], 0x40)), bit.band(uptable["freezingIceMachinePower"], 0x80))
        bodyBytes[16] = bit.band(uptable["intervalRoomHumidityLevel"], 0xFE)
        if (uptable["foodSite"] ~= nil) then
            bodyBytes[25] = bit.band(uptable["foodSite"], 0x0F)
        end
        if (uptable["microcrystalFresh"] ~= nil and uptable["dryZone"] ~= nil and uptable["performanceMode"] ~= nil and uptable["electronicSmell"] ~= nil and uptable["eradicatePesticideResidue"] ~= nil) then
            bodyBytes[27] = bit.bor(bit.bor(bit.bor(bit.bor(bit.bor(bit.band(uptable["microcrystalFresh"], 0x01), bit.band(uptable["dryZone"], 0x02)), bit.band(uptable["electronicSmell"], 0x04)), bit.band(uptable["eradicatePesticideResidue"], 0x08)), bit.band(uptable["humidity"], 0x70)), bit.band(uptable["performanceMode"], 0x80))
        end
        if (uptable["normalTemperatureLevel"] ~= nil) then
            bodyBytes[28] = uptable["normalTemperatureLevel"]
        end
        if (uptable["functionZoneLevel"] ~= nil) then
            bodyBytes[29] = uptable["functionZoneLevel"]
        end
        if (uptable["humiditySetting"] ~= nil and uptable["smartHumidity"] ~= nil) then
            bodyBytes[30] = bit.bor(bit.band(uptable["humiditySetting"], 0x7F), bit.band(uptable["smartHumidity"], 0x80))
        end
        if (uptable["storageLeftDoorAuto"] ~= nil and uptable["storageRightDoorAuto"] ~= nil and uptable["freezerDoorAuto"] ~= nil and uptable["freezerDoorAutoControl"] ~= nil and uptable["storageDoorAutoControl"] ~= nil) then
            bodyBytes[31] = bit.bor(bit.bor(bit.bor(bit.bor(bit.band(uptable["storageLeftDoorAuto"], 0x03), bit.band(uptable["storageRightDoorAuto"], 0x0C)), bit.band(uptable["freezerDoorAuto"], 0x30)), bit.band(uptable["freezerDoorAutoControl"], 0x40)), bit.band(uptable["storageDoorAutoControl"], 0x80))
        end
        if (uptable["storageIceMachinePower"] ~= nil and uptable["filterReplacementWarningElimination"] ~= nil) then
            bodyBytes[33] = bit.bor(bit.band(uptable["storageIceMachinePower"], 0x01), bit.band(uptable["filterReplacementWarningElimination"], 0x80))
        end
        bodyBytes[35] = uptable["storageFTemperature"]
        bodyBytes[36] = uptable["freezingFTemperature"]
        bodyBytes[37] = uptable["leftFlexzoneFTemperature"]
        if (uptable["electronicCleanStrong"] ~= nil) then
            bodyBytes[38] = bit.band(uptable["electronicCleanStrong"], 0x01)
        end
        if (uptable["quickBeverageTime"] ~= nil and uptable["quickBeverage"] ~= nil) then
            bodyBytes[39] = bit.bor(bit.band(uptable["quickBeverageTime"], 0x7F), bit.band(uptable["quickBeverage"], 0x80))
        end
        infoM = getTotalMsg(bodyBytes, uptable["BYTE_MSG_TYPE_CONTROL"])
    end
    local ret = table2string(infoM)
    ret = string2hexstring(ret)
    return ret
end

function dataToJson(jsonCmd)
    if (not jsonCmd) then
        return nil
    end
    local json = decode(jsonCmd)
    local deviceinfo = json["deviceinfo"]
    local deviceSubType = deviceinfo["deviceSubtype"]
    if (deviceSubType == 1) then
    end
    local status = json["status"]
    if (status) then
        jsonToModel(status)
    end
    local binData = json["msg"]["data"]
    local info = {}
    local msgBytes = {}
    local bodyBytes = {}
    local msgLength = 0
    local bodyLength = 0
    info = string2table(binData)
    uptable["dataType"] = info[10];
    for i = 1, #info do
        msgBytes[i - 1] = info[i]
    end
    msgLength = msgBytes[1]
    bodyLength = msgLength - uptable["BYTE_PROTOCOL_HEAD_LENGTH"] - 1
    for i = 0, bodyLength do
        bodyBytes[i] = msgBytes[i + uptable["BYTE_PROTOCOL_HEAD_LENGTH"]]
    end
    binToModel(bodyBytes)
    local streams = {}
    streams[uptable["KEY_VERSION"]] = uptable["VALUE_VERSION"]
    if ((uptable["dataType"] == 0x02 and bodyBytes[0] == 0x00) or (uptable["dataType"] == 0x03 and bodyBytes[0] == 0x00) or (uptable["dataType"] == 0x04 and bodyBytes[0] == 0x02)) then
        if (uptable["codeMode"] == 0x01) then
            streams["storage_mode"] = "on"
        elseif (uptable["codeMode"] == 0x00) then
            streams["storage_mode"] = "off"
        end
        if (uptable["freezingMode"] == 0x02) then
            streams["freezing_mode"] = "on"
        elseif (uptable["freezingMode"] == 0x00) then
            streams["freezing_mode"] = "off"
        end
        if (uptable["smartMode"] == 0x04) then
            streams["intelligent_mode"] = "on"
        elseif (uptable["smartMode"] == 0x00) then
            streams["intelligent_mode"] = "off"
        end
        if (uptable["energySavingMode"] == 0x08) then
            streams["energy_saving_mode"] = "on"
        elseif (uptable["energySavingMode"] == 0x00) then
            streams["energy_saving_mode"] = "off"
        end
        if (uptable["holidayMode"] == 0x10) then
            streams["holiday_mode"] = "on"
        elseif (uptable["holidayMode"] == 0x00) then
            streams["holiday_mode"] = "off"
        end
        if (uptable["moisturizeMode"] == 0x20) then
            streams["moisturize_mode"] = "on"
        elseif (uptable["moisturizeMode"] == 0x00) then
            streams["moisturize_mode"] = "off"
        end
        if (uptable["preservationMode"] == 0x40) then
            streams["preservation_mode"] = "on"
        elseif (uptable["preservationMode"] == 0x00) then
            streams["preservation_mode"] = "off"
        end
        if (uptable["acmeFreezingMode"] == 0x80) then
            streams["acme_freezing_mode"] = "on"
        elseif (uptable["acmeFreezingMode"] == 0x00) then
            streams["acme_freezing_mode"] = "off"
        end
        streams["storage_temperature"] = int2String(uptable["refrigerationTemperature"])
        streams["freezing_temperature"] = int2String(-12 - uptable["freezingTemperature"])
        if ((uptable["lVariableTemperature"] >= 1) and (uptable["lVariableTemperature"] <= 29)) then
            streams["left_flexzone_temperature"] = int2String(uptable["lVariableTemperature"] - 19)
        elseif ((uptable["lVariableTemperature"] >= 49) and (uptable["lVariableTemperature"] <= 54)) then
            streams["left_flexzone_temperature"] = int2String(30 - uptable["lVariableTemperature"])
        else
            streams["left_flexzone_temperature"] = "0"
        end
        if ((uptable["rVariableTemperature"]) and (uptable["rVariableTemperature"] <= 29)) then
            streams["right_flexzone_temperature"] = int2String(uptable["rVariableTemperature"] - 19)
        elseif ((uptable["rVariableTemperature"] >= 49) and (uptable["rVariableTemperature"] <= 54)) then
            streams["right_flexzone_temperature"] = int2String(30 - uptable["rVariableTemperature"])
        else
            streams["right_flexzone_temperature"] = "0"
        end
        if (uptable["variableModeValue"] == 0x01) then
            streams["variable_mode"] = "soft_freezing_mode"
        elseif (uptable["variableModeValue"] == 0x00) then
            streams["variable_mode"] = "none_mode"
        elseif (uptable["variableModeValue"] == 0x02) then
            streams["variable_mode"] = "zero_fresh_mode"
        elseif (uptable["variableModeValue"] == 0x03) then
            streams["variable_mode"] = "cold_drink_mode"
        elseif (uptable["variableModeValue"] == 0x04) then
            streams["variable_mode"] = "fresh_product_mode"
        elseif (uptable["variableModeValue"] == 0x05) then
            streams["variable_mode"] = "partial_freezing_mode"
        elseif (uptable["variableModeValue"] == 0x06) then
            streams["variable_mode"] = "dry_zone_mode"
        elseif (uptable["variableModeValue"] == 0x07) then
            streams["variable_mode"] = "freeze_warm_mode"
        elseif (uptable["variableModeValue"] == 0x08) then
            streams["variable_mode"] = "freeze_mode"
        end
        if (uptable["refrigerationPowerValue"] == 0x00) then
            streams["storage_power"] = "on"
        elseif (uptable["refrigerationPowerValue"] == 0x01) then
            streams["storage_power"] = "off"
        end
        if (uptable["lVariablePowerValue"] == 0x00) then
            streams["left_flexzone_power"] = "on"
        elseif (uptable["lVariablePowerValue"] == 0x04) then
            streams["left_flexzone_power"] = "off"
        end
        if (uptable["rVariablePowerValue"] == 0x00) then
            streams["right_flexzone_power"] = "on"
        elseif (uptable["rVariablePowerValue"] == 0x08) then
            streams["right_flexzone_power"] = "off"
        end
        if (uptable["freezingPowerValue"] == 0x00) then
            streams["freezing_power"] = "on"
        elseif (uptable["freezingPowerValue"] == 0x10) then
            streams["freezing_power"] = "off"
        end
        if (uptable["functionZonePowerValue"] == 0x00) then
            streams["function_zone_power"] = "on"
        elseif (uptable["functionZonePowerValue"] == 0x20) then
            streams["function_zone_power"] = "off"
        end
        if (uptable["crossPeakElectricity"] == 0x40) then
            streams["cross_peak_electricity"] = "on"
        elseif (uptable["crossPeakElectricity"] == 0x00) then
            streams["cross_peak_electricity"] = "off"
        end
        if (uptable["allRefrigerationPower"] == 0x80) then
            streams["all_refrigeration_power"] = "on"
        elseif (uptable["allRefrigerationPower"] == 0x00) then
            streams["all_refrigeration_power"] = "off"
        end
        if (uptable["removeDew"] == 0x01) then
            streams["remove_dew_power"] = "on"
        elseif (uptable["removeDew"] == 0x00) then
            streams["remove_dew_power"] = "off"
        end
        if (uptable["humidify"] == 0x02) then
            streams["humidify_power"] = "on"
        elseif (uptable["humidify"] == 0x00) then
            streams["humidify_power"] = "off"
        end
        if (uptable["unfreeze"] == 0x04) then
            streams["unfreeze_power"] = "on"
        elseif (uptable["unfreeze"] == 0x00) then
            streams["unfreeze_power"] = "off"
        end
        if (uptable["temperatureUnit"] == 0x08) then
            streams["temperature_unit"] = "fahrenheit"
        elseif (uptable["temperatureUnit"] == 0x00) then
            streams["temperature_unit"] = "celsius"
        end
        if (uptable["floodlight"] == 0x10) then
            streams["floodlight_power"] = "on"
        elseif (uptable["floodlight"] == 0x00) then
            streams["floodlight_power"] = "off"
        end
        if (uptable["functionSwitch"] == 0x00) then
            streams["icea_bar_function_switch"] = "default"
        elseif (uptable["functionSwitch"] == 0x40) then
            streams["icea_bar_function_switch"] = "refrigeration"
        elseif (uptable["functionSwitch"] == 0x80) then
            streams["icea_bar_function_switch"] = "freezing"
        end
        if (uptable["radarMode"] == 0x01) then
            streams["radar_mode_power"] = "on"
        elseif (uptable["radarMode"] == 0x00) then
            streams["radar_mode_power"] = "off"
        end
        if (uptable["milkMode"] == 0x02) then
            streams["milk_mode_power"] = "on"
        elseif (uptable["milkMode"] == 0x00) then
            streams["milk_mode_power"] = "off"
        end
        if (uptable["icedMode"] == 0x04) then
            streams["icea_mode_power"] = "on"
        elseif (uptable["icedMode"] == 0x00) then
            streams["icea_mode_power"] = "off"
        end
        if (uptable["plasmaAsepticMode"] == 0x08) then
            streams["plasma_aseptic_mode_power"] = "on"
        elseif (uptable["plasmaAsepticMode"] == 0x00) then
            streams["plasma_aseptic_mode_power"] = "off"
        end
        if (uptable["acquireIceaMode"] == 0x10) then
            streams["acquire_icea_mode_power"] = "on"
        elseif (uptable["acquireIceaMode"] == 0x00) then
            streams["acquire_icea_mode_power"] = "off"
        end
        if (uptable["brashIceaMode"] == 0x20) then
            streams["brash_icea_mode_power"] = "on"
        elseif (uptable["brashIceaMode"] == 0x00) then
            streams["brash_icea_mode_power"] = "off"
        end
        if (uptable["acquireWaterMode"] == 0x40) then
            streams["acquire_water_mode_power"] = "on"
        elseif (uptable["acquireWaterMode"] == 0x00) then
            streams["acquire_water_mode_power"] = "off"
        end
        if (uptable["freezingIceMachinePower"] == 0x80) then
            streams["freezing_ice_machine_power"] = "on"
        elseif (uptable["freezingIceMachinePower"] == 0x00) then
            streams["freezing_ice_machine_power"] = "off"
        end
        streams["freeze_fahrenheit_level"] = int2String(uptable["freezingFahrenheit"])
        streams["refrigeration_fahrenheit_level"] = int2String(uptable["refrigerationFahrenheit"])
        streams["leach_expire_day"] = int2String(uptable["leachExpireDay"])
        streams["power_consumption_low"] = int2String(uptable["powerConsumptionLow"])
        streams["power_consumption_high"] = int2String(uptable["powerConsumptionHigh"])
        if (uptable["freezingMotorResetStatus"] == 0x01) then
            streams["freezing_motor_reset_status"] = "valid"
        elseif (uptable["freezingMotorResetStatus"] == 0x00) then
            streams["freezing_motor_reset_status"] = "invalid"
        end
        if (uptable["freezingMotorDeicingStatus"] == 0x02) then
            streams["freezing_motor_deicing_status"] = "valid"
        elseif (uptable["freezingMotorDeicingStatus"] == 0x00) then
            streams["freezing_motor_deicing_status"] = "invalid"
        end
        if (uptable["freezingIceMachineWaterStatus"] == 0x04) then
            streams["freezing_ice_machine_water_status"] = "valid"
        elseif (uptable["freezingIceMachineWaterStatus"] == 0x00) then
            streams["freezing_ice_machine_water_status"] = "invalid"
        end
        if (uptable["freezingAllIceStatus"] == 0x08) then
            streams["freezing_all_ice_status"] = "valid"
        elseif (uptable["freezingAllIceStatus"] == 0x00) then
            streams["freezing_all_ice_status"] = "invalid"
        end
        if (uptable["humanInduction"] == 0x10) then
            streams["human_induction_status"] = "valid"
        elseif (uptable["humanInduction"] == 0x00) then
            streams["human_induction_status"] = "invalid"
        end
        if (uptable["refrigerationDoorPower"] == 0x01) then
            streams["storage_door_state"] = "on"
        elseif (uptable["refrigerationDoorPower"] == 0x00) then
            streams["storage_door_state"] = "off"
        end
        if (uptable["freezingDoorPower"] == 0x02) then
            streams["freezer_door_state"] = "on"
        elseif (uptable["freezingDoorPower"] == 0x00) then
            streams["freezer_door_state"] = "off"
        end
        if (uptable["variableDoorPower"] == 0x10) then
            streams["flexzone_door_state"] = "on"
        elseif (uptable["variableDoorPower"] == 0x00) then
            streams["flexzone_door_state"] = "off"
        end
        if (uptable["storageIceHomeDoorState"] == 0x20) then
            streams["storage_ice_home_door_state"] = "on"
        elseif (uptable["storageIceHomeDoorState"] == 0x00) then
            streams["storage_ice_home_door_state"] = "off"
        end
        if (uptable["barDoorPower"] == 0x04) then
            streams["bar_door_state"] = "on"
        elseif (uptable["barDoorPower"] == 0x00) then
            streams["bar_door_state"] = "off"
        end
        if (uptable["iceMouthPower"] == 0x08) then
            streams["ice_mouth_power"] = "on"
        elseif (uptable["iceMouthPower"] == 0x00) then
            streams["ice_mouth_power"] = "off"
        end
        if (uptable["isError"] == 0x01) then
            streams["is_error"] = "yes"
        elseif (uptable["isError"] == 0x00) then
            streams["is_error"] = "no"
        end
        streams["interval_room_humidity_level"] = int2String(uptable["intervalRoomHumidityLevel"])
        streams["refrigeration_real_temperature"] = int2String(math.floor((uptable["refrigerationRealTemperature"] - 100) / 2))
        streams["freezing_real_temperature"] = int2String(math.floor((uptable["freezingRealTemperature"] - 100) / 2))
        streams["left_variable_real_temperature"] = int2String(math.floor((uptable["lVariableRealTemperature"] - 100) / 2))
        streams["right_variable_real_temperature"] = int2String(math.floor((uptable["rVariableRealTemperature"] - 100) / 2))
        streams["fast_cold_minute"] = int2String(256 * uptable["fastColdMinuteHigh"] + uptable["fastColdMinuteLow"])
        streams["fast_freeze_minute"] = int2String(256 * uptable["fastFreezeMinuteLow"] + uptable["fastFreezeMinuteHigh"])
        if (bodyLength > 25) then
            if (uptable["foodSite"] == 0x00) then
                streams["food_site"] = "left_freezing_room"
            elseif (uptable["foodSite"] == 0x01) then
                streams["food_site"] = "right_freezing_room"
            end
            if (uptable["beef"] == 0x40) then
                streams["beef"] = "exist"
            elseif (uptable["foodSite"] == 0x00) then
                streams["beef"] = "nonexistence"
            end
            if (uptable["pork"] == 0x80) then
                streams["pork"] = "exist"
            elseif (uptable["pork"] == 0x00) then
                streams["pork"] = "nonexistence"
            end
            if (uptable["mutton"] == 0x01) then
                streams["mutton"] = "exist"
            elseif (uptable["mutton"] == 0x00) then
                streams["mutton"] = "nonexistence"
            end
            if (uptable["chicken"] == 0x02) then
                streams["chicken"] = "exist"
            elseif (uptable["chicken"] == 0x00) then
                streams["chicken"] = "nonexistence"
            end
            if (uptable["duckMeat"] == 0x04) then
                streams["duck_meat"] = "exist"
            elseif (uptable["duckMeat"] == 0x00) then
                streams["duck_meat"] = "nonexistence"
            end
            if (uptable["fish"] == 0x08) then
                streams["fish"] = "exist"
            elseif (uptable["fish"] == 0x00) then
                streams["fish"] = "nonexistence"
            end
            if (uptable["shrimp"] == 0x10) then
                streams["shrimp"] = "exist"
            elseif (uptable["shrimp"] == 0x00) then
                streams["shrimp"] = "nonexistence"
            end
            if (uptable["dumplings"] == 0x20) then
                streams["dumplings"] = "exist"
            elseif (uptable["dumplings"] == 0x00) then
                streams["dumplings"] = "nonexistence"
            end
            if (uptable["gluePudding"] == 0x40) then
                streams["gluepudding"] = "exist"
            elseif (uptable["gluePudding"] == 0x00) then
                streams["gluepudding"] = "nonexistence"
            end
            if (uptable["iceCream"] == 0x80) then
                streams["ice_cream"] = "exist"
            elseif (uptable["iceCream"] == 0x00) then
                streams["ice_cream"] = "nonexistence"
            end
            if (uptable["microcrystalFresh"] == 0x01) then
                streams["microcrystal_fresh"] = "on"
            elseif (uptable["microcrystalFresh"] == 0x00) then
                streams["microcrystal_fresh"] = "off"
            end
            if (uptable["dryZone"] == 0x02) then
                streams["dry_zone"] = "on"
            elseif (uptable["dryZone"] == 0x00) then
                streams["dry_zone"] = "off"
            end
            if (uptable["electronicSmell"] == 0x04) then
                streams["electronic_smell"] = "on"
            elseif (uptable["electronicSmell"] == 0x00) then
                streams["electronic_smell"] = "off"
            end
            if (uptable["eradicatePesticideResidue"] == 0x08) then
                streams["eradicate_pesticide_residue"] = "on"
            elseif (uptable["eradicatePesticideResidue"] == 0x00) then
                streams["eradicate_pesticide_residue"] = "off"
            end
            if (uptable["humidity"] == 0x10) then
                streams["humidity"] = "high"
            elseif (uptable["humidity"] == 0x20) then
                streams["humidity"] = "low"
            end
            if (uptable["performanceMode"] == 0x80) then
                streams["performance_mode"] = "on"
            elseif (uptable["performanceMode"] == 0x00) then
                streams["performance_mode"] = "off"
            end
            streams["normal_zone_level"] = int2String(uptable["normalTemperatureLevel"])
            streams["function_zone_level"] = int2String(uptable["functionZoneLevel"])
            if (bodyLength > 30) then
                streams["humidify_setting"] = int2String(uptable["humiditySetting"])
                if (uptable["smartHumidity"] == 0x80) then
                    streams["smart_humidify"] = "on"
                elseif (uptable["smartHumidity"] == 0x00) then
                    streams["smart_humidify"] = "off"
                end
                if (bodyLength > 31) then
                    if (uptable["storageLeftDoorAuto"] == 0x01) then
                        streams["storage_left_door_auto"] = "on"
                    elseif (uptable["storageLeftDoorAuto"] == 0x02) then
                        streams["storage_left_door_auto"] = "off"
                    elseif (uptable["storageLeftDoorAuto"] == 0x00) then
                        streams["storage_left_door_auto"] = "invalid"
                    end
                    if (uptable["storageRightDoorAuto"] == 0x01) then
                        streams["storage_right_door_auto"] = "on"
                    elseif (uptable["storageRightDoorAuto"] == 0x02) then
                        streams["storage_right_door_auto"] = "off"
                    elseif (uptable["storageRightDoorAuto"] == 0x00) then
                        streams["storage_right_door_auto"] = "invalid"
                    end
                    if (uptable["freezerDoorAuto"] == 0x01) then
                        streams["freezer_door_auto"] = "on"
                    elseif (uptable["freezerDoorAuto"] == 0x02) then
                        streams["freezer_door_auto"] = "off"
                    elseif (uptable["freezerDoorAuto"] == 0x00) then
                        streams["freezer_door_auto"] = "invalid"
                    end
                    if (uptable["freezerDoorAutoControl"] == 0x40) then
                        streams["freezer_door_auto_control"] = "on"
                    elseif (uptable["freezerDoorAutoControl"] == 0x00) then
                        streams["freezer_door_auto_control"] = "off"
                    end
                    if (uptable["storageDoorAutoControl"] == 0x80) then
                        streams["storage_door_auto_control"] = "on"
                    elseif (uptable["storageDoorAutoControl"] == 0x00) then
                        streams["storage_door_auto_control"] = "off"
                    end
                    streams["eradicate_pesticide_residue_progress"] = int2String(uptable["eradicatePesticideResidueProgress"])
                    if (uptable["eradicatePesticideResidueCompletion"] == 0x80) then
                        streams["eradicate_pesticide_residue_completion"] = "yes"
                    elseif (uptable["eradicatePesticideResidueCompletion"] == 0x00) then
                        streams["eradicate_pesticide_residue_completion"] = "no"
                    end
                    if (bodyLength > 33) then
                        if (uptable["storageIceMachinePower"] == 0x01) then
                            streams["storage_ice_machine_power"] = "on"
                        elseif (uptable["storageIceMachinePower"] == 0x00) then
                            streams["storage_ice_machine_power"] = "off"
                        end
                        if (uptable["storageMotorResetStatus"] == 0x02) then
                            streams["storage_motor_reset_status"] = "valid"
                        elseif (uptable["storageMotorResetStatus"] == 0x00) then
                            streams["storage_motor_reset_status"] = "invalid"
                        end
                        if (uptable["storageMotorDeicingStatus"] == 0x04) then
                            streams["storage_motor_deicing_status"] = "valid"
                        elseif (uptable["storageMotorDeicingStatus"] == 0x00) then
                            streams["storage_motor_deicing_status"] = "invalid"
                        end
                        if (uptable["storageIceMachineWaterStatus"] == 0x08) then
                            streams["storage_ice_machine_water_status"] = "valid"
                        elseif (uptable["storageIceMachineWaterStatus"] == 0x00) then
                            streams["storage_ice_machine_water_status"] = "invalid"
                        end
                        if (uptable["storageAllIceStatus"] == 0x10) then
                            streams["storage_all_ice_status"] = "valid"
                        elseif (uptable["storageAllIceStatus"] == 0x00) then
                            streams["storage_all_ice_status"] = "invalid"
                        end
                        if (uptable["filterExpiresMildWarning"] == 0x20) then
                            streams["filter_expires_mild_warning"] = "valid"
                        elseif (uptable["filterExpiresMildWarning"] == 0x00) then
                            streams["filter_expires_mild_warning"] = "invalid"
                        end
                        if (uptable["filterExpiresSevereWarning"] == 0x40) then
                            streams["filter_expires_severe_warning"] = "valid"
                        elseif (uptable["filterExpiresSevereWarning"] == 0x00) then
                            streams["filter_expires_severe_warning"] = "invalid"
                        end
                        streams["ice_room_real_temperature"] = int2String(math.floor((uptable["iceRoomRealTemperature"] - 100) / 2))
                        if (bodyLength > 35) then
                            streams["storage_F_temperature"] = int2String(uptable["storageFTemperature"])
                            streams["freezing_F_temperature"] = int2String(11 - uptable["freezingFTemperature"])
                            streams["left_flexzone_F_temperature"] = int2String(uptable["leftFlexzoneFTemperature"] - 1)
                            if (bodyLength > 38) then
                                if (uptable["electronicCleanStrong"] == 0x01) then
                                    streams["electronic_clean_strong"] = "on"
                                elseif (uptable["electronicCleanStrong"] == 0x00) then
                                    streams["electronic_clean_strong"] = "off"
                                end
                                streams["electronic_clean_timeout"] = int2String(uptable["electronicCleanTimeout"])
                                if (bodyLength > 39) then
                                    streams["quick_beverage_time"] = int2String(uptable["quickBeverageTime"])
                                    if (uptable["quickBeverage"] == 0x80) then
                                        streams["quick_beverage"] = "on"
                                    elseif (uptable["quickBeverage"] == 0x00) then
                                        streams["quick_beverage"] = "off"
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    elseif ((uptable["dataType"] == 0x04 and bodyBytes[0] == 0x01) or (uptable["dataType"] == 0x03 and bodyBytes[0] == 0x01)) then
        if (uptable["codeMode"] == 0x01) then
            streams["storage_mode"] = "on"
        elseif (uptable["codeMode"] == 0x00) then
            streams["storage_mode"] = "off"
        end
        if (uptable["freezingMode"] == 0x02) then
            streams["freezing_mode"] = "on"
        elseif (uptable["freezingMode"] == 0x00) then
            streams["freezing_mode"] = "off"
        end
        if (uptable["smartMode"] == 0x04) then
            streams["intelligent_mode"] = "on"
        elseif (uptable["smartMode"] == 0x00) then
            streams["intelligent_mode"] = "off"
        end
        if (uptable["energySavingMode"] == 0x08) then
            streams["energy_saving_mode"] = "on"
        elseif (uptable["energySavingMode"] == 0x00) then
            streams["energy_saving_mode"] = "off"
        end
        if (uptable["holidayMode"] == 0x10) then
            streams["holiday_mode"] = "on"
        elseif (uptable["holidayMode"] == 0x00) then
            streams["holiday_mode"] = "off"
        end
        if (uptable["moisturizeMode"] == 0x20) then
            streams["moisturize_mode"] = "on"
        elseif (uptable["moisturizeMode"] == 0x00) then
            streams["moisturize_mode"] = "off"
        end
        if (uptable["preservationMode"] == 0x40) then
            streams["preservation_mode"] = "on"
        elseif (uptable["preservationMode"] == 0x00) then
            streams["preservation_mode"] = "off"
        end
        if (uptable["acmeFreezingMode"] == 0x80) then
            streams["acme_freezing_mode"] = "on"
        elseif (uptable["acmeFreezingMode"] == 0x00) then
            streams["acme_freezing_mode"] = "off"
        end
        if (uptable["radarMode"] == 0x01) then
            streams["radar_mode_power"] = "on"
        elseif (uptable["radarMode"] == 0x00) then
            streams["radar_mode_power"] = "off"
        end
        if (uptable["milkMode"] == 0x02) then
            streams["milk_mode_power"] = "on"
        elseif (uptable["milkMode"] == 0x00) then
            streams["milk_mode_power"] = "off"
        end
        if (uptable["icedMode"] == 0x04) then
            streams["icea_mode_power"] = "on"
        elseif (uptable["icedMode"] == 0x00) then
            streams["icea_mode_power"] = "off"
        end
        if (uptable["plasmaAsepticMode"] == 0x08) then
            streams["plasma_aseptic_mode_power"] = "on"
        elseif (uptable["plasmaAsepticMode"] == 0x00) then
            streams["plasma_aseptic_mode_power"] = "off"
        end
        if (uptable["freezingIceMachinePower"] == 0x80) then
            streams["freezing_ice_machine_power"] = "on"
        elseif (uptable["freezingIceMachinePower"] == 0x00) then
            streams["freezing_ice_machine_power"] = "off"
        end
        if (uptable["removeDew"] == 0x01) then
            streams["remove_dew_power"] = "on"
        elseif (uptable["removeDew"] == 0x00) then
            streams["remove_dew_power"] = "off"
        end
        if (uptable["humidify"] == 0x02) then
            streams["humidify_power"] = "on"
        elseif (uptable["humidify"] == 0x00) then
            streams["humidify_power"] = "off"
        end
        if (uptable["unfreeze"] == 0x04) then
            streams["unfreeze_power"] = "on"
        elseif (uptable["unfreeze"] == 0x00) then
            streams["unfreeze_power"] = "off"
        end
        if (uptable["temperatureUnit"] == 0x08) then
            streams["temperature_unit"] = "fahrenheit"
        elseif (uptable["temperatureUnit"] == 0x00) then
            streams["temperature_unit"] = "celsius"
        end
        if (uptable["floodlight"] == 0x10) then
            streams["floodlight_power"] = "on"
        elseif (uptable["floodlight"] == 0x00) then
            streams["floodlight_power"] = "off"
        end
        if (uptable["functionSwitch"] == 0x00) then
            streams["icea_bar_function_switch"] = "default"
        elseif (uptable["functionSwitch"] == 0x40) then
            streams["icea_bar_function_switch"] = "refrigeration"
        elseif (uptable["functionSwitch"] == 0x80) then
            streams["icea_bar_function_switch"] = "freezing"
        end
        if (uptable["refrigerationPowerValue"] == 0x00) then
            streams["storage_power"] = "on"
        elseif (uptable["refrigerationPowerValue"] == 0x01) then
            streams["storage_power"] = "off"
        end
        if (uptable["lVariablePowerValue"] == 0x00) then
            streams["left_flexzone_power"] = "on"
        elseif (uptable["lVariablePowerValue"] == 0x04) then
            streams["left_flexzone_power"] = "off"
        end
        if (uptable["rVariablePowerValue"] == 0x00) then
            streams["right_flexzone_power"] = "on"
        elseif (uptable["rVariablePowerValue"] == 0x08) then
            streams["right_flexzone_power"] = "off"
        end
        if (uptable["freezingPowerValue"] == 0x00) then
            streams["freezing_power"] = "on"
        elseif (uptable["freezingPowerValue"] == 0x10) then
            streams["freezing_power"] = "off"
        end
        if (uptable["functionZonePowerValue"] == 0x00) then
            streams["function_zone_power"] = "on"
        elseif (uptable["functionZonePowerValue"] == 0x20) then
            streams["function_zone_power"] = "off"
        end
        if (uptable["crossPeakElectricity"] == 0x40) then
            streams["cross_peak_electricity"] = "on"
        elseif (uptable["crossPeakElectricity"] == 0x00) then
            streams["cross_peak_electricity"] = "off"
        end
        if (uptable["allRefrigerationPower"] == 0x80) then
            streams["all_refrigeration_power"] = "on"
        elseif (uptable["allRefrigerationPower"] == 0x00) then
            streams["all_refrigeration_power"] = "off"
        end
        streams["storage_temperature"] = int2String(uptable["refrigerationTemperature"])
        streams["freezing_temperature"] = int2String(-12 - uptable["freezingTemperature"])
        if ((uptable["lVariableTemperature"] >= 1) and (uptable["lVariableTemperature"] <= 29)) then
            streams["left_flexzone_temperature"] = int2String(uptable["lVariableTemperature"] - 19)
        elseif ((uptable["lVariableTemperature"] >= 49) and (uptable["lVariableTemperature"] <= 54)) then
            streams["left_flexzone_temperature"] = int2String(30 - uptable["lVariableTemperature"])
        else
            streams["left_flexzone_temperature"] = "0"
        end
        if ((uptable["rVariableTemperature"]) and (uptable["rVariableTemperature"] <= 29)) then
            streams["right_flexzone_temperature"] = int2String(uptable["rVariableTemperature"] - 19)
        elseif ((uptable["rVariableTemperature"] >= 49) and (uptable["rVariableTemperature"] <= 54)) then
            streams["right_flexzone_temperature"] = int2String(30 - uptable["rVariableTemperature"])
        else
            streams["right_flexzone_temperature"] = "0"
        end
        streams["interval_room_humidity_level"] = int2String(uptable["intervalRoomHumidityLevel"])
        if (uptable["variableModeValue"] == 0x01) then
            streams["variable_mode"] = "soft_freezing_mode"
        elseif (uptable["variableModeValue"] == 0x00) then
            streams["variable_mode"] = "none_mode"
        elseif (uptable["variableModeValue"] == 0x02) then
            streams["variable_mode"] = "zero_fresh_mode"
        elseif (uptable["variableModeValue"] == 0x03) then
            streams["variable_mode"] = "cold_drink_mode"
        elseif (uptable["variableModeValue"] == 0x04) then
            streams["variable_mode"] = "fresh_product_mode"
        elseif (uptable["variableModeValue"] == 0x05) then
            streams["variable_mode"] = "partial_freezing_mode"
        elseif (uptable["variableModeValue"] == 0x06) then
            streams["variable_mode"] = "dry_zone_mode"
        elseif (uptable["variableModeValue"] == 0x07) then
            streams["variable_mode"] = "freeze_warm_mode"
        elseif (uptable["variableModeValue"] == 0x08) then
            streams["variable_mode"] = "freeze_mode"
        end
        streams["freeze_fahrenheit_level"] = int2String(uptable["freezingFahrenheit"])
        streams["refrigeration_fahrenheit_level"] = int2String(uptable["refrigerationFahrenheit"])
        streams["normal_zone_level"] = int2String(uptable["normalTemperatureLevel"])
        streams["function_zone_level"] = int2String(uptable["functionZoneLevel"])
        if (uptable["microcrystalFresh"] == 0x01) then
            streams["microcrystal_fresh"] = "on"
        elseif (uptable["microcrystalFresh"] == 0x00) then
            streams["microcrystal_fresh"] = "off"
        end
        if (uptable["humidity"] == 0x10) then
            streams["humidity"] = "high"
        elseif (uptable["humidity"] == 0x20) then
            streams["humidity"] = "low"
        end
        if (uptable["performanceMode"] == 0x80) then
            streams["performance_mode"] = "on"
        elseif (uptable["performanceMode"] == 0x00) then
            streams["performance_mode"] = "off"
        end
        if (uptable["electronicCleanStrong"] == 0x01) then
            streams["electronic_clean_strong"] = "on"
        elseif (uptable["electronicCleanStrong"] == 0x00) then
            streams["electronic_clean_strong"] = "off"
        end
        streams["electronic_clean_timeout"] = int2String(uptable["electronicCleanTimeout"])
        streams["quick_beverage_time"] = int2String(uptable["quickBeverageTime"])
        if (uptable["quickBeverage"] == 0x80) then
            streams["quick_beverage"] = "on"
        elseif (uptable["quickBeverage"] == 0x00) then
            streams["quick_beverage"] = "off"
        end
    elseif (uptable["dataType"] == 0x04 and bodyBytes[0] == 0x00) then
        if (uptable["refrigerationDoorPower"] == 0x01) then
            streams["storage_door_state"] = "on"
        elseif (uptable["refrigerationDoorPower"] == 0x00) then
            streams["storage_door_state"] = "off"
        end
        if (uptable["freezingDoorPower"] == 0x02) then
            streams["freezer_door_state"] = "on"
        elseif (uptable["freezingDoorPower"] == 0x00) then
            streams["freezer_door_state"] = "off"
        end
        if (uptable["barDoorPower"] == 0x04) then
            streams["bar_door_state"] = "on"
        elseif (uptable["barDoorPower"] == 0x00) then
            streams["bar_door_state"] = "off"
        end
        if (uptable["iceMouthPower"] == 0x08) then
            streams["ice_mouth_power"] = "on"
        elseif (uptable["iceMouthPower"] == 0x00) then
            streams["ice_mouth_power"] = "off"
        end
        if (uptable["variableDoorPower"] == 0x10) then
            streams["flexzone_door_state"] = "on"
        elseif (uptable["variableDoorPower"] == 0x00) then
            streams["flexzone_door_state"] = "off"
        end
        if (uptable["storageIceHomeDoorState"] == 0x10) then
            streams["storage_ice_home_door_state"] = "on"
        elseif (uptable["storageIceHomeDoorState"] == 0x00) then
            streams["storage_ice_home_door_state"] = "off"
        end
        if (uptable["storageModeCompletion"] == 0x01) then
            streams["storage_mode_completion"] = "yes"
        elseif (uptable["storageModeCompletion"] == 0x00) then
            streams["storage_mode_completion"] = "no"
        end
        if (uptable["freezingModeCompletion"] == 0x02) then
            streams["freezing_mode_completion"] = "yes"
        elseif (uptable["freezingModeCompletion"] == 0x00) then
            streams["freezing_mode_completion"] = "no"
        end
        if (uptable["humidifierWaterShortage"] == 0x04) then
            streams["humidifier_water_shortage"] = "yes"
        elseif (uptable["humidifierWaterShortage"] == 0x00) then
            streams["humidifier_water_shortage"] = "no"
        end
        if (uptable["plasmaAsepticCompletion"] == 0x08) then
            streams["plasma_aseptic_completion"] = "yes"
        elseif (uptable["plasmaAsepticCompletion"] == 0x00) then
            streams["plasma_aseptic_completion"] = "no"
        end
        if (uptable["acmeFreezingCompletion"] == 0x10) then
            streams["acme_freezing_completion"] = "yes"
        elseif (uptable["acmeFreezingCompletion"] == 0x00) then
            streams["acme_freezing_completion"] = "no"
        end
        if (uptable["eradicatePesticideResidueCompletion"] == 0x20) then
            streams["eradicate_pesticide_residue_completion"] = "yes"
        elseif (uptable["eradicatePesticideResidueCompletion"] == 0x00) then
            streams["eradicate_pesticide_residue_completion"] = "no"
        end
        if (uptable["quickBeverageCompletion"] == 0x80) then
            streams["quick_beverage_completion"] = "yes"
        elseif (uptable["quickBeverageCompletion"] == 0x00) then
            streams["quick_beverage_completion"] = "no"
        end
    elseif ((uptable["dataType"] == 0x06 and bodyBytes[0] == 0x01) or (uptable["dataType"] == 0x03 and bodyBytes[0] == 0x02)) then
        if (uptable["isError"] == 0x01) then
            streams["is_error"] = "yes"
        elseif (uptable["isError"] == 0x00) then
            streams["is_error"] = "no"
        end
        if (uptable["storageDoorOpenOvertime"] == 0x01) then
            streams["storage_door_open_overtime"] = "yes"
        elseif (uptable["storageDoorOpenOvertime"] == 0x00) then
            streams["storage_door_open_overtime"] = "no"
        end
        if (uptable["freezerDoorOpenOvertime"] == 0x02) then
            streams["freezer_door_open_overtime"] = "yes"
        elseif (uptable["freezerDoorOpenOvertime"] == 0x00) then
            streams["freezer_door_open_overtime"] = "no"
        end
        if (uptable["barDoorOpenOvertime"] == 0x04) then
            streams["bar_door_open_overtime"] = "yes"
        elseif (uptable["barDoorOpenOvertime"] == 0x00) then
            streams["bar_door_open_overtime"] = "no"
        end
        if (uptable["variableDoorOpenOvertime"] == 0x08) then
            streams["variable_door_open_overtime"] = "yes"
        elseif (uptable["variableDoorOpenOvertime"] == 0x00) then
            streams["variable_door_open_overtime"] = "no"
        end
        if (uptable["iceMachineFull"] == 0x10) then
            streams["ice_machine_full"] = "yes"
        elseif (uptable["iceMachineFull"] == 0x00) then
            streams["ice_machine_full"] = "no"
        end
        if (uptable["refrigerationSensorError"] == 0x01) then
            streams["refrigeration_sensor_error"] = "yes"
        elseif (uptable["refrigerationSensorError"] == 0x00) then
            streams["refrigeration_sensor_error"] = "no"
        end
        if (uptable["refrigerationDefrostingSensorError"] == 0x02) then
            streams["refrigeration_defrosting_sensor_error"] = "yes"
        elseif (uptable["refrigerationDefrostingSensorError"] == 0x00) then
            streams["refrigeration_defrosting_sensor_error"] = "no"
        end
        if (uptable["ringTemperatureSensorError"] == 0x04) then
            streams["ring_temperature_sensor_error"] = "yes"
        elseif (uptable["ringTemperatureSensorError"] == 0x00) then
            streams["ring_temperature_sensor_error"] = "no"
        end
        if (uptable["flexzoneSensorError"] == 0x08) then
            streams["flexzone_sensor_error"] = "yes"
        elseif (uptable["flexzoneSensorError"] == 0x00) then
            streams["flexzone_sensor_error"] = "no"
        end
        if (uptable["rightFlexzoneSensorError"] == 0x10) then
            streams["right_flexzone_sensor_error"] = "yes"
        elseif (uptable["rightFlexzoneSensorError"] == 0x00) then
            streams["right_flexzone_sensor_error"] = "no"
        end
        if (uptable["freezingHighTemperature"] == 0x20) then
            streams["freezing_high_temperature"] = "yes"
        elseif (uptable["freezingHighTemperature"] == 0x00) then
            streams["freezing_high_temperature"] = "no"
        end
        if (uptable["freezingSensorError"] == 0x40) then
            streams["freezing_sensor_error"] = "yes"
        elseif (uptable["freezingSensorError"] == 0x00) then
            streams["freezing_sensor_error"] = "no"
        end
        if (uptable["freezingDefrostingSensorError"] == 0x80) then
            streams["freezing_defrosting_sensor_error"] = "yes"
        elseif (uptable["freezingDefrostingSensorError"] == 0x00) then
            streams["freezing_defrosting_sensor_error"] = "no"
        end
        if (uptable["iceElectricalMachineryError"] == 0x01) then
            streams["ice_electrical_machinery_error"] = "yes"
        elseif (uptable["iceElectricalMachineryError"] == 0x00) then
            streams["ice_electrical_machinery_error"] = "no"
        end
        if (uptable["refrigerationDefrostingOvertime"] == 0x02) then
            streams["refrigeration_defrosting_overtime"] = "yes"
        elseif (uptable["refrigerationDefrostingOvertime"] == 0x00) then
            streams["refrigeration_defrosting_overtime"] = "no"
        end
        if (uptable["freezingDefrostingOvertime"] == 0x04) then
            streams["freezing_defrosting_overtime"] = "yes"
        elseif (uptable["freezingDefrostingOvertime"] == 0x00) then
            streams["freezing_defrosting_overtime"] = "no"
        end
        if (uptable["zeroCrossingCheckError"] == 0x08) then
            streams["zero_crossing_check_error"] = "yes"
        elseif (uptable["zeroCrossingCheckError"] == 0x00) then
            streams["zero_crossing_check_error"] = "no"
        end
        if (uptable["eepromReadWriteError"] == 0x10) then
            streams["eeprom_read_write_error"] = "yes"
        elseif (uptable["eepromReadWriteError"] == 0x00) then
            streams["eeprom_read_write_error"] = "no"
        end
        if (uptable["leftFlexzoneSensorError"] == 0x20) then
            streams["left_flexzone_sensor_error"] = "yes"
        elseif (uptable["leftFlexzoneSensorError"] == 0x00) then
            streams["left_flexzone_sensor_error"] = "no"
        end
        if (uptable["iceRoomSensorError"] == 0x40) then
            streams["ice_room_sensor_error"] = "yes"
        elseif (uptable["iceRoomSensorError"] == 0x00) then
            streams["ice_room_sensor_error"] = "no"
        end
        if (uptable["mainDisplayCorrespondError"] == 0x80) then
            streams["main_display_correspond_error"] = "yes"
        elseif (uptable["mainDisplayCorrespondError"] == 0x00) then
            streams["main_display_correspond_error"] = "no"
        end
        if (uptable["iceMachineTemperatureError"] == 0x01) then
            streams["ice_machine_temperature_error"] = "yes"
        elseif (uptable["iceMachineTemperatureError"] == 0x00) then
            streams["ice_machine_temperature_error"] = "no"
        end
        if (uptable["flexzoneDefrostingSensorError"] == 0x02) then
            streams["flexzone_defrosting_sensor_error"] = "yes"
        elseif (uptable["flexzoneDefrostingSensorError"] == 0x00) then
            streams["flexzone_defrosting_sensor_error"] = "no"
        end
        if (uptable["flexzoneDefrostingSensor2Error"] == 0x04) then
            streams["flexzone_defrosting_sensor2_error"] = "yes"
        elseif (uptable["flexzoneDefrostingSensor2Error"] == 0x00) then
            streams["flexzone_defrosting_sensor2_error"] = "no"
        end
        if (uptable["yogurtMachineSensorError"] == 0x08) then
            streams["yogurt_machine_sensor_error"] = "yes"
        elseif (uptable["yogurtMachineSensorError"] == 0x00) then
            streams["yogurt_machine_sensor_error"] = "no"
        end
        if (uptable["iceMachineFrettingSwitchError"] == 0x10) then
            streams["ice_machine_fretting_switch_error"] = "yes"
        elseif (uptable["iceMachineFrettingSwitchError"] == 0x00) then
            streams["ice_machine_fretting_switch_error"] = "no"
        end
        if (uptable["iceMachinePipeFilterOvertime"] == 0x20) then
            streams["ice_machine_pipe_filter_overtime"] = "yes"
        elseif (uptable["iceMachinePipeFilterOvertime"] == 0x00) then
            streams["ice_machine_pipe_filter_overtime"] = "no"
        end
        if (uptable["ambientHumiditySensorError"] == 0x40) then
            streams["ambient_humidity_sensor_error"] = "yes"
        elseif (uptable["ambientHumiditySensorError"] == 0x00) then
            streams["ambient_humidity_sensor_error"] = "no"
        end
        if (uptable["storageHumiditySensorError"] == 0x80) then
            streams["storage_humidity_sensor_error"] = "yes"
        elseif (uptable["storageHumiditySensorError"] == 0x00) then
            streams["storage_humidity_sensor_error"] = "no"
        end
        if (uptable["radarSensor1Error"] == 0x01) then
            streams["radar_sensor1_error"] = "yes"
        elseif (uptable["radarSensor1Error"] == 0x00) then
            streams["radar_sensor1_error"] = "no"
        end
        if (uptable["radarSensor2Error"] == 0x02) then
            streams["radar_sensor2_error"] = "yes"
        elseif (uptable["radarSensor2Error"] == 0x00) then
            streams["radar_sensor2_error"] = "no"
        end
        if (uptable["radarSensor3Error"] == 0x04) then
            streams["radar_sensor3_error"] = "yes"
        elseif (uptable["radarSensor3Error"] == 0x00) then
            streams["radar_sensor3_error"] = "no"
        end
        if (uptable["radarSensor4Error"] == 0x08) then
            streams["radar_sensor4_error"] = "yes"
        elseif (uptable["radarSensor4Error"] == 0x00) then
            streams["radar_sensor4_error"] = "no"
        end
        if (uptable["radarSensor5Error"] == 0x10) then
            streams["radar_sensor5_error"] = "yes"
        elseif (uptable["radarSensor5Error"] == 0x00) then
            streams["radar_sensor5_error"] = "no"
        end
        if (uptable["functionZoneTemperatureSensorError"] == 0x20) then
            streams["function_zone_temperature_sensor_error"] = "yes"
        elseif (uptable["functionZoneTemperatureSensorError"] == 0x00) then
            streams["function_zone_temperature_sensor_error"] = "no"
        end
        if (uptable["normalZoneTemperatureSensorError"] == 0x40) then
            streams["normal_zone_temperature_sensor_error"] = "yes"
        elseif (uptable["normalZoneTemperatureSensorError"] == 0x00) then
            streams["normal_zone_temperature_sensor_error"] = "no"
        end
        if (uptable["humidityControlSensorError"] == 0x80) then
            streams["humidity_control_sensor_error"] = "yes"
        elseif (uptable["humidityControlSensorError"] == 0x00) then
            streams["humidity_control_sensor_error"] = "no"
        end
        if (uptable["openDoorTooFrequently"] == 0x01) then
            streams["open_door_too_frequently"] = "yes"
        elseif (uptable["openDoorTooFrequently"] == 0x00) then
            streams["open_door_too_frequently"] = "no"
        end
        if (uptable["storageDoorAloneOpenFrequently"] == 0x02) then
            streams["storage_door_alone_open_frequently"] = "yes"
        elseif (uptable["storageDoorAloneOpenFrequently"] == 0x00) then
            streams["storage_door_alone_open_frequently"] = "no"
        end
        if (uptable["freezingDoorAloneOpenFrequently"] == 0x04) then
            streams["freezing_door_alone_open_frequently"] = "yes"
        elseif (uptable["freezingDoorAloneOpenFrequently"] == 0x00) then
            streams["freezing_door_alone_open_frequently"] = "no"
        end
        if (uptable["barDoorAloneOpenFrequently"] == 0x08) then
            streams["bar_door_alone_open_frequently"] = "yes"
        elseif (uptable["barDoorAloneOpenFrequently"] == 0x00) then
            streams["bar_door_alone_open_frequently"] = "no"
        end
        if (uptable["snWritingError"] == 0x20) then
            streams["sn_writing_error"] = "yes"
        elseif (uptable["snWritingError"] == 0x00) then
            streams["sn_writing_error"] = "no"
        end
        if (uptable["storageTemperatureOverheating"] == 0x40) then
            streams["storage_temperature_overheating"] = "yes"
        elseif (uptable["storageTemperatureOverheating"] == 0x00) then
            streams["storage_temperature_overheating"] = "no"
        end
        if (uptable["storageTemperatureTooLow"] == 0x80) then
            streams["storage_temperature_too_low"] = "yes"
        elseif (uptable["storageTemperatureTooLow"] == 0x00) then
            streams["storage_temperature_too_low"] = "no"
        end
        if (uptable["storageHeatingWireSensorError"] == 0x01) then
            streams["storage_heating_wire_sensor_error"] = "yes"
        elseif (uptable["storageHeatingWireSensorError"] == 0x00) then
            streams["storage_heating_wire_sensor_error"] = "no"
        end
        if (uptable["uartReceiverError"] == 0x02) then
            streams["uart_receiver_error"] = "yes"
        elseif (uptable["uartReceiverError"] == 0x00) then
            streams["uart_receiver_error"] = "no"
        end
        if (uptable["crystalliteMainSensorError"] == 0x08) then
            streams["crystallite_main_sensor_error"] = "yes"
        elseif (uptable["crystalliteMainSensorError"] == 0x00) then
            streams["crystallite_main_sensor_error"] = "no"
        end
        if (uptable["crystalliteBase1SensorError"] == 0x10) then
            streams["crystallite_base1_sensor_error"] = "yes"
        elseif (uptable["crystalliteBase1SensorError"] == 0x00) then
            streams["crystallite_base1_sensor_error"] = "no"
        end
        if (uptable["crystalliteBase2SensorError"] == 0x20) then
            streams["crystallite_base2_sensor_error"] = "yes"
        elseif (uptable["crystalliteBase2SensorError"] == 0x00) then
            streams["crystallite_base2_sensor_error"] = "no"
        end
        if (uptable["crystalliteBase3SensorError"] == 0x40) then
            streams["crystallite_base3_sensor_error"] = "yes"
        elseif (uptable["crystalliteBase3SensorError"] == 0x00) then
            streams["crystallite_base3_sensor_error"] = "no"
        end
        if (uptable["crystalliteBase4SensorError"] == 0x80) then
            streams["crystallite_base4_sensor_error"] = "yes"
        elseif (uptable["crystalliteBase4SensorError"] == 0x00) then
            streams["crystallite_base4_sensor_error"] = "no"
        end
        if (uptable["iceRoomDoorOpenOvertime"] == 0x01) then
            streams["ice_room_door_open_overtime"] = "yes"
        elseif (uptable["iceRoomDoorOpenOvertime"] == 0x00) then
            streams["ice_room_door_open_overtime"] = "no"
        end
        if (uptable["storageIceFullTips"] == 0x02) then
            streams["storage_ice_full_tips"] = "yes"
        elseif (uptable["storageIceFullTips"] == 0x00) then
            streams["storage_ice_full_tips"] = "no"
        end
        if (uptable["iceMachineSensorError"] == 0x04) then
            streams["ice_machine_sensor_error"] = "yes"
        elseif (uptable["iceMachineSensorError"] == 0x00) then
            streams["ice_machine_sensor_error"] = "no"
        end
        if (uptable["storageIceMachineSensorError"] == 0x08) then
            streams["storage_ice_machine_sensor_error"] = "yes"
        elseif (uptable["storageIceMachineSensorError"] == 0x00) then
            streams["storage_ice_machine_sensor_error"] = "no"
        end
        if (uptable["storageIceOperationError"] == 0x10) then
            streams["storage_ice_operation_error"] = "yes"
        elseif (uptable["storageIceOperationError"] == 0x00) then
            streams["storage_ice_operation_error"] = "no"
        end
        if (uptable["freezingIceOperationError"] == 0x20) then
            streams["freezing_ice_operation_error"] = "yes"
        elseif (uptable["freezingIceOperationError"] == 0x00) then
            streams["freezing_ice_operation_error"] = "no"
        end
        if (uptable["mcuIceCommunicationError"] == 0x40) then
            streams["mcu_ice_communication_error"] = "yes"
        elseif (uptable["mcuIceCommunicationError"] == 0x00) then
            streams["mcu_ice_communication_error"] = "no"
        end
    end
    local retTable = {}
    retTable["status"] = streams
    local ret = encode(retTable)
    return ret
end
