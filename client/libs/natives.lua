function GetPlayerStamina(playerId)
    return Citizen.InvokeNative(0x0FF421E467373FCF, playerId, Citizen.ResultAsFloat())
end

function GetPlayerMaxStamina(playerId)
    return Citizen.InvokeNative(0xD014AB79, playerId, Citizen.ResultAsInteger())
end

function GetPlayerStaminaRechargeMultiplier(playerId)
    return Citizen.InvokeNative(0x617D3494AD58200F, playerId)
end

function SetPlayerStaminaRechargeMultiplier(playerId, value)
    Citizen.InvokeNative(0xFECA17CF3343694B, playerId, value)
end

function SetPlayerMaxStamina(playerId, value) -- doesn't work
    Citizen.InvokeNative(0x35594F67, value + 0.0)
end

function SetPlayerStaminaSprintDepletionMultiplier(playerId, value)
    Citizen.InvokeNative(0xBBADFB5E5E5766FB, playerId, value)
end

function SetBowStaminaDrainSpeed(playerId, value)
    Citizen.InvokeNative(0xFE7C9CF376D23342, playerId, value)
end

function InventoryRemoveInventoryItemWithGuid(inventoryId, guid, quantity, removeReason)
    return Citizen.InvokeNative(0x3E4E811480B3AE79, inventoryId, guid, quantity, removeReason, Citizen.ResultAsInteger())
end

function SetPlayerStamina(playerId, value)
    Citizen.InvokeNative(0xA9EC16C7, playerId, value)
end

function GetDeadeyeAbilityLevel(playerId)
    return Citizen.InvokeNative(0xCCE7C695C164C35F, playerId)
end

function GetPlayerMaxDeadEye(playerId)
    return Citizen.InvokeNative(0x592F58BC4D2A2CF3, playerId, Citizen.ResultAsFloat())
end

-- Max level is 5.
function SetDeadeyeAbilityLevel(playerId, level)
    Citizen.InvokeNative(0xF0FE8E790BFEB5BB, playerId, level)
end

-- Restores Deadeye Outer Ring
function SpecialAbilityRestoreOuterRing(playerId, amount)
    Citizen.InvokeNative(0x2498035289B5688F, playerId, amount)
end

--[[
    coreIndex = {
        0 = ATTRIBUTE_CORE_HEALTH,
        1 = ATTRIBUTE_CORE_STAMINA,
        2 = ATTRIBUTE_CORE_DEADEYE,
    }
]]
function SetAttributeCoreValue(ped, coreIndex, value)
    Citizen.InvokeNative(0xC6258F41D86676E0, ped, coreIndex, value)
end

-- Returns Deadeye value from player
function SpecialAbilityGetAmountCached(playerId)
    return Citizen.InvokeNative(0x029884FB65821B07, playerId)
end

function ChangePedStamina(ped, amount)
    Citizen.InvokeNative(0xC3D4B754C0E86B9E, ped, amount)
end

function RestorePedStamina(ped, percentage)
    Citizen.InvokeNative(0x675680D089BFA21F, ped, percentage)
end

function GetPlayerDeadEye(playerId)
    return Citizen.InvokeNative(0xA81D24AE0AF99A5E, playerId)
end

function GetPlayerCachedDeadEyeAmount(playerId)
    -- https://github.com/ByJerome/RedM-LuaWrapper/blob/e22ce31fa1a688c6f0562ebdaef957a25387428b/natives/native_player.lua#L1968
    return Citizen.InvokeNative(0xDF66A37936D5F3D9, playerId, Citizen.ResultAsFloat())
end

function SetHealthRechargeMultiplier(ped, multiplier)
    Citizen.InvokeNative(0xDE1B1907A83A1550, ped, multiplier)
end

function GetPedMaxStamina(ped)
    return Citizen.InvokeNative(0xCB42AFE2B613EE55, ped, Citizen.ResultAsFloat())
end