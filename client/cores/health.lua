
function upgradeHealth(value)
    local a2 = DataView.ArrayBuffer(12 * 8)
    local a3 = DataView.ArrayBuffer(12 * 8)

    local retval, guid1, guid2 = Citizen.InvokeNative(
        0xCB5D11F9508A928D, 
        1, 
        a2:Buffer(), 
        a3:Buffer(), 
        GetHashKey("UPGRADE_HEALTH_TANK_1"), 
        1084182731, 
        (1 * value), 
        752097756
    )
end


function setPlayerHealth(value)
    -- Overpower should be disable to make entity health work (edit: ??? not sure now if needed)
    Citizen.InvokeNative(0xF6A7C08DF2E28B28, PlayerPedId(), 0, 0.0, true) -- EnableAttributeOverpower
    -- Core should be set to 100 
    SetAttributeCoreValue(PlayerPedId(), 0, 100)
    SetEntityHealth(PlayerPedId(), value)
end

function setPlayerMaxHealth(value)
    value = value - 550
    SetEntityMaxHealth(PlayerPedId(), value)
end

function getPlayerMaxHealth()
    return GetEntityMaxHealth(PlayerPedId())
end

function getPlayerHealth()
    return GetEntityHealth(PlayerPedId())
end

function restoreHealth()
    setPlayerHealth(getPlayerMaxHealth())
end

if Config.DevMode then
    -- Max health 600
    RegisterCommand('damage', function(source, args)
        local health = GetEntityHealth(PlayerPedId())
        print('Before damage', health)
        ApplyDamageToPed(PlayerPedId(), tonumber(args[1]), 0, 1, 1)
        local health = GetEntityHealth(PlayerPedId())
        print('After damage', health)
    end)

    RegisterCommand('gethealth', function(source,args)
        print('MaxHealth', GetEntityMaxHealth(PlayerPedId()))
        print('Health', GetEntityHealth(PlayerPedId()))
    end)

    RegisterCommand('sethealth', function(source,args)
        setPlayerHealth(tonumber(args[1]))
    end)

    RegisterCommand('setmaxhealth', function(source,args)
        setPlayerMaxHealth(tonumber(args[1]))
    end)

    RegisterCommand('upgradehealth', function(source,args)
        upgradeHealth(tonumber(args[1]))
    end)
end




--[[
    Example in-game values:

    inner 100

    SetEntityHealth
    100% outer - 600 (aka 500/500)
    50% outer - 350 (aka 250/500)
    25% outer - 225 (aka 125/500)
    0% outer - 100 (aka 0/500)

    inner 50

    SetEntityHealth
    100% outer - 550 (aka 500/500)
    50% outer - 300 (aka 250/500)
    25% outer - 175 (aka 125/500)
    0% outer - 50 (aka 0/500)

    inner 0

    SetEntityHealth
    100% outer - 500 (aka 500/500)
    50% outer - 250 (aka 250/500)
    25% outer - 125 (aka 125/500)
    0% outer - 0 (aka 0/500)
]]

local MAX_INNER_CORE = 100

exports('setInnerCoreHealth', function(value)
    SetAttributeCoreValue(PlayerPedId(), 0, value)
end)

local INNER_CORE_VALUE_LIMIT = 100
local OUTER_CORE_VALUE_LIMIT = 500
exports('setOuterCoreHealth', function(value)
    local perc = value / 100

    local innerCorePercentage = GetAttributeCoreValue(PlayerPedId(), 0)
    local innerCoreValue = INNER_CORE_VALUE_LIMIT * (innerCorePercentage / 100)
    local maxOuterCoreValue = OUTER_CORE_VALUE_LIMIT * (Config.PlayerHealthOuterCoreLevel / 10)
    local output = innerCoreValue + (maxOuterCoreValue * perc)

    SetEntityHealth(PlayerPedId(), math.floor(output))
end)

exports('getInnerCoreHealth', function()
    local coreHealth = GetAttributeCoreValue(PlayerPedId(), 0)
    return coreHealth
end)

exports('getOuterCoreHealth', function()
    local coreHealth = GetAttributeCoreValue(PlayerPedId(), 0)
    local innerCoreValue = INNER_CORE_VALUE_LIMIT * (coreHealth / 100)
    local maxOuterCoreValue = OUTER_CORE_VALUE_LIMIT * (Config.PlayerHealthOuterCoreLevel / 10)
    local value = ((GetEntityHealth(PlayerPedId()) - coreHealth) / maxOuterCoreValue) * 100
    return math.floor(value)
end)