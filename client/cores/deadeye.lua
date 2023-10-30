ActiveEagleEye = true
ActiveDeadEye = true
InfiniteDeadEye = false

CreateThread(function()
    Citizen.InvokeNative(0xA63FCAD3A6FEC6D2, PlayerId(), ActiveEagleEye)
    Citizen.InvokeNative(0x95EE1DEE1DCD9070, PlayerId(), ActiveDeadEye)
    Citizen.InvokeNative(0x28A13BF6B05C3D83, PlayerId(), InfiniteDeadEye)
    -- SetDeadeyeAbilityLevel(PlayerId(), 1) -- Not researched
    -- print('Deadeye level', GetDeadeyeAbilityLevel(PlayerId())) -- 1
end)

function upgradeDeadEye(deadEyeMulti)
    local a2 = DataView.ArrayBuffer(12 * 8)
    local a3 = DataView.ArrayBuffer(12 * 8)
    local retval, guid1, guid2 = Citizen.InvokeNative(
        0xCB5D11F9508A928D, 
        1, 
        a2:Buffer(), 
        a3:Buffer(), 
        GetHashKey("UPGRADE_DEADEYE_TANK_1"), 
        0x1084182731, 
        (1 * deadEyeMulti), 
        0x752097756
    )
end

exports('setInnerCoreDeadEye', function(value)
    SetAttributeCoreValue(PlayerPedId(), 2, value)
end)

local INNER_CORE_VALUE_LIMIT = 28
local OUTER_CORE_VALUE_LIMIT = 140
exports('setOuterCoreDeadEye', function(value)
    local perc = value / 100

    local innerCorePercentage = GetAttributeCoreValue(PlayerPedId(), 2)
    local innerCoreValue = INNER_CORE_VALUE_LIMIT * (innerCorePercentage / 100)
    local maxOuterCoreValue = OUTER_CORE_VALUE_LIMIT * (Config.PlayerDeadEyeOuterCoreLevel / 10)
    local output = innerCoreValue + (maxOuterCoreValue * perc)
    SpecialAbilityRestoreOuterRing(PlayerId(), output + 0.0)
end)

exports('getInnerCoreDeadEye', function()
    local coreDeadEye = GetAttributeCoreValue(PlayerPedId(), 2)
    return coreDeadEye
end)

exports('getOuterCoreDeadEye', function()
    local maxOuterCoreValue = OUTER_CORE_VALUE_LIMIT * (Config.PlayerDeadEyeOuterCoreLevel / 10)
    local outerCoreValue = GetPlayerCachedDeadEyeAmount(PlayerId())
    local value = math.floor((outerCoreValue / maxOuterCoreValue) * 100)
    return value
end)
