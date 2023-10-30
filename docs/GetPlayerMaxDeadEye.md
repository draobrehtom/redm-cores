# Function: GetPlayerMaxDeadEye

## Description:
The `GetPlayerMaxDeadEye` function calculates and returns the total Dead Eye value for a player by summing the maximum inner core and maximum outer core values. The maximum inner core value is a constant, always set to 28.0, while the maximum outer core value is dynamically determined based on the level of the outer core, as defined by the `STAMINA_TANK_1` parameter.

### Parameters:
- `playerId` (e.g., `PlayerId()`): The player ID for which the maximum Dead Eye is to be calculated.


## Return Value:
- `GetPlayerMaxDeadEye` returns a numerical value representing the sum of the maximum inner core and maximum outer core values, providing the player's maximum Dead Eye value.

## Examples:
```lua
-- Example 1:
STAMINA_TANK_1 = 10
Max inner core = 28.0
Max outer core = 140.0
GetPlayerMaxDeadEye(PlayerId()) -- Returns 168

-- Example 2:
STAMINA_TANK_1 = 5
Max inner core = 28.0
Max outer core = 70.0
GetPlayerMaxDeadEye(PlayerId()) -- Returns 98

-- Example 3:
STAMINA_TANK_1 = 1
Max inner core = 28.0
Max outer core = 14.0
GetPlayerMaxDeadEye(PlayerId()) -- Returns 42
```