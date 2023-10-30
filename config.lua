Config = {}

Config.DevMode = true


-- Initial Player Core Levels Configuration
-- These values are applied on the first player connection for upgrading core levels and cannot be changed during client runtime.
-- The player's outer core levels can range from 1 (minimum) to 10 (maximum).

-- Player Health Outer Core Level:
-- Set the initial health outer core level. 1 is the minimum, while 10 is the maximum.
-- On the first player connection, the core level will be upgraded to this specified value.
-- Please be aware that modifying it during runtime may lead to unexpected behavior and potentially result in reaching the maximum core level (10). Reconnecting to the server is required to revert any unintended changes.
Config.PlayerHealthOuterCoreLevel = 5

-- Player Stamina Outer Core Level:
-- Specify the initial stamina outer core level. The range is from 1 (minimum) to 10 (maximum).
-- On the first player connection, the core level will be upgraded to this specified value.
-- Modifying it during runtime may lead to unexpected behavior, and reaching the maximum core level (10) could occur. Reconnecting to the server is necessary to undo any unintended changes.
Config.PlayerStaminaOuterCoreLevel = 5

-- Player Dead Eye Outer Core Level:
-- Define the initial dead eye outer core level. It can be set between 1 (minimum) and 10 (maximum).
-- On the first player connection, the core level will be upgraded to this specified value.
-- Be cautious when modifying this during runtime, as it may result in unexpected behavior, and the core level may reach the maximum (10). Reconnecting to the server is the only way to reverse such changes.
Config.PlayerDeadEyeOuterCoreLevel = 5
