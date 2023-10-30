# About

It's a library for handling health, stamina and dead-eye cores in RedM.

# Usage Example

All values are between 0 and 100. It's a percentages.

```lua
exports['redm-cores']:setInnerCoreHealth(value)
exports['redm-cores']:setOuterCoreHealth(value)
local value = exports['redm-cores']:getInnerCoreHealth()
local value = exports['redm-cores']:getOuterCoreHealth()

exports['redm-cores']:setInnerCoreStamina(value)
exports['redm-cores']:setOuterCoreStamina(value)
local value = exports['redm-cores']:getInnerCoreStamina()
local value = exports['redm-cores']:getOuterCoreStamina()

exports['redm-cores']:setInnerCoreDeadEye(value)
exports['redm-cores']:setOuterCoreDeadEye(value)
```