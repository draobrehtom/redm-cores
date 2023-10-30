CreateThread(function()
    for k = 1, (Config.PlayerHealthOuterCoreLevel - 1) do
        upgradeHealth(1)
    end

    for k = 1, (Config.PlayerStaminaOuterCoreLevel - 1) do
        upgradeStamina(1)
    end

    for k = 1, (Config.PlayerDeadEyeOuterCoreLevel - 1) do
        upgradeDeadEye(1)
    end
end)