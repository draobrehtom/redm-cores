## Function: GetPedMaxStamina

### Description:
The `GetPedMaxStamina` function, when called with the `PlayerPedId()` entity parameter, calculates and returns the total maximum stamina value for the player character. This maximum stamina value is determined by combining the constant maximum inner core value (set at 22.4) and the dynamic maximum outer core value, which varies based on the `STAMINA_TANK_1` parameter.

### Parameters:
- `entity` (e.g., `PlayerPedId()`): The entity representing the player character for which the maximum stamina is to be calculated.

### Return Value:
- `GetPedMaxStamina(PlayerPedId())` returns a numerical value representing the sum of the constant maximum inner core and the maximum outer core value, providing the player's maximum stamina.

### Examples:
```lua
-- Example 1:
STAMINA_TANK_1 = 10
Max Inner Core = 22.4
Max Outer Core = 112.0
MaxStamina = 134.4
GetPedMaxStamina(PlayerPedId()) -- Returns 134.4

-- Example 2:
STAMINA_TANK_1 = 5
Max Outer Core = 56.0
MaxStamina = 78.4
GetPedMaxStamina(PlayerPedId()) -- Returns 78.4

-- Example 3:
STAMINA_TANK_1 = 1
Max Outer Core = 11.2
MaxStamina = 33.6
GetPedMaxStamina(PlayerPedId()) -- Returns 33.6
```