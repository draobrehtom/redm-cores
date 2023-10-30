--[[
    In RDR2, the stamina indicator consists of two bars.
    The first bar is a circular gauge. (Outer Core)
    The second bar is an icon of lightning inside the circle. (Inner Core)
    First and foremost, the first bar is consumed, and it also automatically regenerates.
    Once the first bar is depleted, the second bar is consumed.
    The second bar does not regenerate automatically.

    Research findings:
    I can manipulate all values except:
    - Reducing the maximum level of the first bar
    - Disabling stamina depletion when jumping
    - Setting a specific value for the first bar
]]

-- Get the value of the first bar
-- Default value - 11.2
-- Maximum value - 112.0
RegisterCommand('stamina', function()
    local stamina = GetPlayerStamina(PlayerId())
    print(stamina)
end)

-- Increase the maximum value of the first bar
function upgradeStamina(staminaMulti)
    local a2 = DataView.ArrayBuffer(12 * 8)
    local a3 = DataView.ArrayBuffer(12 * 8)

    local retval, guid1, guid2 = Citizen.InvokeNative(
        0xCB5D11F9508A928D, 
        1, 
        a2:Buffer(), 
        a3:Buffer(), 
        GetHashKey("UPGRADE_STAMINA_TANK_1"), 
        1084182731, 
        (1 * staminaMulti), 
        752097756
    )
end


if Config.DevMode then
    RegisterCommand('upgradestamina', function(source, args)
        local staminaMulti = tonumber(args[1]) or 1
        upgradeStamina(staminaMulti)
    end)
end

-- Set the value for the second bar
function setStamina(value)
    if value > 100 then
        value = 100
    end
    SetAttributeCoreValue(PlayerPedId(), 1, value)
end

-- Get the value of the second bar
function getStamina()
    return GetAttributeCoreValue(PlayerPedId(), 1)
end
RegisterCommand('getstamina', function()
    local stamina = getStamina()
    print('stamina', stamina)
end)

-- Temporarily make the second bar invulnerable
function boostStamina(duration)
    duration = duration or 5000.0
    EnableAttributeOverpower(PlayerPedId(), 1, duration, true)
end
if Config.DevMode then
    RegisterCommand('booststamina', function()
        boostStamina()
    end)
end

-- Add to the second bar
function addStamina(val)
    local stamina = getStamina()
    local newStamina = stamina + val
    setStamina(newStamina)
end
if Config.DevMode then
    RegisterCommand('addstamina', function(source, args)
        addStamina(20)
    end)
end

-- Decrease the second bar
function subStamina(val)
    local stamina = getStamina()
    local newStamina = stamina - val
    setStamina(newStamina)
end
if Config.DevMode then
    RegisterCommand('rmstamina', function(source, args)
        subStamina(20)
    end)
end

-- Restore the first bar and second bar
function restoreStamina()
    RestorePlayerStamina(PlayerId(), 1.0) --outer
    setStamina(100) -- inner core
end

-- Toggle the first bar's regeneration on/off
function toggleStaminaRegen(enabled)
    if enabled then
        SetPlayerStaminaRechargeMultiplier(PlayerId(), 1.0)
    else
        SetPlayerStaminaRechargeMultiplier(PlayerId(), 0.0)
    end
end

if Config.DevMode then
    local enabled = true
    RegisterCommand('togglestamina', function()
        enabled = not enabled
        toggleStaminaRegen(enabled)
        print('Enabled', enabled)
    end)
end

-- Toggle the first bar's depletion during sprinting (also affects the second bar)
-- Works the same way for fistfighting stamina depletion
-- Energy still consumpted during bow shooting
-- Energy still consumpted during jumping
function toggleSprint(enabled)
    if enabled then
        SetPlayerStaminaSprintDepletionMultiplier(PlayerId(), 1.0)
    else
        SetPlayerStaminaSprintDepletionMultiplier(PlayerId(), 0.0)
    end
end

if Config.DevMode then
    local enabled2 = true
    RegisterCommand('togglesprint', function()
        enabled2 = not enabled2
        toggleSprint(enabled2)
        print('Enabled', enabled2)
    end)
end

-- Toggle energy consumption during bow shooting
function toggleBowStamina(enabled)
    if enabled then
        SetBowStaminaDrainSpeed(PlayerId(), 1.0)
    else
        SetBowStaminaDrainSpeed(PlayerId(), 0.0)
    end
end
if Config.DevMode then
    local enabled3 = true
    RegisterCommand('bowstamina', function()
        Citizen.InvokeNative(0x5E3BDDBCB83F3D84, PlayerPedId(), GetHashKey('WEAPON_BOW'), 100, false, true, true, 1.0)
        SetCurrentPedWeapon(PlayerPedId(),GetHashKey('WEAPON_BOW'), true)
    
        enabled3 = not enabled3
        toggleBowStamina(enabled3)
        print('Enabled', enabled3)
    end)
end


-------------------------------------------------------------------------------------

-- Malfunctioning code below:

--[[

-- Does not change anything
RegisterCommand('1setmaxstamina', function(source, args)
    local val = tonumber(args[1]) 
    SetPlayerMaxStamina(PlayerId(), val)
    local maxStamina = GetPlayerMaxStamina(PlayerId())
    print('maxstamina', maxStamina)
end)

-- Value is 16
RegisterCommand('1maxstamina', function()
    local maxStamina = GetPlayerMaxStamina(PlayerId())
    print('maxstamina', maxStamina)
end)

-- Does not change anything
RegisterCommand('tt', function(source, args)
    local val = tonumber(args[1])
    SetAttributeBaseRank(PlayerPedId(), 1, val + 0.0)
end)

-- Does not work
RegisterCommand('downgradestamina', function(source, args)
    local inventoryId = 1
    local guid = GetHashKey("UPGRADE_STAMINA_TANK_1")
    local quantity = 1
    local removeReason = 752097756
    InventoryRemoveInventoryItemWithGuid(inventoryId, guid, quantity, removeReason)
end)

-- Does not work
RegisterCommand('setstamina', function(source, args)
    local val = tonumber(args[1])
    SetPlayerStamina(PlayerId(), val + 0.0)
end)
]]


--[[

    -- Disable light on pickup props (leftovers from original game)
    Citizen.InvokeNative(0xFC094EF26DD153FA, 2)

    -- Turning off aim assist (Like choosing a non aim-assist lobby in RDO?)
    SetPlayerTargetingMode(3)

    -- Don't die in water due to stamina
    if Citizen.InvokeNative(0x9DE327631295B4C2, PlayerPedId()) then
        Citizen.InvokeNative(0x675680D089BFA21F, PlayerPedId(), 0.001)
    end

    if stamina <= 1.0 then
        -- Disable sprint
        -- DisableControlAction(0, 0xF84FA74F, true)
        -- DisableControlAction(0, 0x8FFC75D6, true)
        -- DisableControlAction(0, 0xB5EEEFB7, true)
    end
    
    if stamina <= 3.5 then
        -- Disable jump
        DisableControlAction(0, 0xD9D0E1C0, true)
    end
]]

local MAX_STAMINA = 112

exports('setInnerCoreStamina', function(value)
    SetAttributeCoreValue(PlayerPedId(), 1, value)
end)

exports('setOuterCoreStamina', function(value)
    local maxOuterCoreValue = MAX_STAMINA * (Config.PlayerStaminaOuterCoreLevel / 10)
    ChangePedStamina(PlayerPedId(), -GetPlayerStamina(PlayerId())) -- clear
    ChangePedStamina(PlayerPedId(), maxOuterCoreValue * (value / 100)) -- set
end)

exports('getInnerCoreStamina', function()
    local coreStamina = GetAttributeCoreValue(PlayerPedId(), 1)
    return coreStamina
end)

exports('getOuterCoreStamina', function()
    local coreStamina = GetAttributeCoreValue(PlayerPedId(), 1)
    local maxStamina = math.round(MAX_STAMINA * (Config.PlayerStaminaOuterCoreLevel / 10))
    local stamina = math.round(GetPlayerStamina(PlayerId()))
    local value = math.floor((stamina / maxStamina) * 100)
    return value
end)
