# About

This library is designed to manage health, stamina, and dead-eye cores in RedM using percentage values. It allows you to set inner and/or outer cores using relative values, as opposed to in-game static values that vary based on core level and inner core value offset.


# Usage Example

![image](https://github.com/draobrehtom/redm-cores/assets/6503721/97f84374-e9aa-47c0-a6ac-bbdc65321610)


All values are expressed as percentages between 0 and 100. Here's how you can use the library:

```lua
exports['redm-cores']:setInnerCoreHealth(50)
exports['redm-cores']:setOuterCoreHealth(50)
local value = exports['redm-cores']:getInnerCoreHealth() -- 50
local value = exports['redm-cores']:getOuterCoreHealth() -- 50

exports['redm-cores']:setInnerCoreStamina(50)
exports['redm-cores']:setOuterCoreStamina(50)
local value = exports['redm-cores']:getInnerCoreStamina() -- 50
local value = exports['redm-cores']:getOuterCoreStamina() -- 50

exports['redm-cores']:setInnerCoreDeadEye(50)
exports['redm-cores']:setOuterCoreDeadEye(50)
local value = exports['redm-cores']:getInnerCoreDeadEye() -- 50
local value = exports['redm-cores']:getOuterCoreDeadEye() -- 50
```

Config file:
```lua
Config.PlayerHealthOuterCoreLevel = 5
Config.PlayerStaminaOuterCoreLevel = 5
Config.PlayerDeadEyeOuterCoreLevel = 5
```

# Download

You can download this library from [GitHub](https://github.com/draobrehtom/redm-cores).

[![image](https://github.com/draobrehtom/redm-cores/assets/6503721/8a01ef9e-802a-4ad1-9162-5dd62de5bf94)](https://lumanstudio.tebex.io/)
