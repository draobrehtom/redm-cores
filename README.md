# About

It's a library for handling health, stamina and dead-eye cores in RedM.

# Usage Example

All values are between 0 and 100. It's a percentages.

```lua
exports['stamina-n-health']:setInnerCoreHealth(value)
exports['stamina-n-health']:setOuterCoreHealth(value)
local value = exports['stamina-n-health']:getInnerCoreHealth()
local value = exports['stamina-n-health']:getOuterCoreHealth()

exports['stamina-n-health']:setInnerCoreStamina(value)
exports['stamina-n-health']:setOuterCoreStamina(value)
local value = exports['stamina-n-health']:getInnerCoreStamina()
local value = exports['stamina-n-health']:getOuterCoreStamina()

exports['stamina-n-health']:setInnerCoreDeadEye(value)
exports['stamina-n-health']:setOuterCoreDeadEye(value)
```