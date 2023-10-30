# About

It's a library for handling health, stamina and dead-eye cores in RedM.

# Usage Example

All values are between 0 and 100. It's a percentages.

```lua
exports['redm-cores']:setInnerCoreHealth(100)
exports['redm-cores']:setOuterCoreHealth(50)
local value = exports['redm-cores']:getInnerCoreHealth() -- 100
local value = exports['redm-cores']:getOuterCoreHealth() -- 50

exports['redm-cores']:setInnerCoreStamina(100)
exports['redm-cores']:setOuterCoreStamina(50)
local value = exports['redm-cores']:getInnerCoreStamina() -- 100
local value = exports['redm-cores']:getOuterCoreStamina() -- 50

exports['redm-cores']:setInnerCoreDeadEye(100)
exports['redm-cores']:setOuterCoreDeadEye(50)
local value = exports['redm-cores']:getInnerCoreDeadEye() -- 100
local value = exports['redm-cores']:getOuterCoreDeadEye() -- 50
```

![image](https://github.com/draobrehtom/redm-cores/assets/6503721/b807a472-a906-4877-a58e-6fb1bd47e524)
