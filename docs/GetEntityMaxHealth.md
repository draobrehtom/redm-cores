## Function: GetEntityMaxHealth

### Description:
The `GetEntityMaxHealth` function, when called with the `PlayerPedId()` parameter, calculates and returns the total maximum health value for the player. This maximum health value is obtained by summing the constant maximum inner core value (set to 100.0) and the dynamic maximum outer core value, which depends on the `HEALTH_TANK_1` parameter.

### Parameters:
- `entity` (e.g., `PlayerPedId()`): The entity for which the maximum health is to be calculated.

### Return Value:
- `GetEntityMaxHealth(PlayerPedId())` returns a numerical value representing the sum of the constant maximum inner core and the maximum outer core value, providing the player's maximum health.

### Examples:
```lua
-- Example 1:
HEALTH_TANK_1 = 10
Max Inner Core = 100.0
Max Outer Core = 500.0
GetEntityMaxHealth(PlayerPedId()) -- Returns 600.0

-- Example 2:
HEALTH_TANK_1 = 5
Max Inner Core = 100.0
Max Outer Core = 250.0
GetEntityMaxHealth(PlayerPedId()) -- Returns 350.0

-- Example 3:
HEALTH_TANK_1 = 1
Max Inner Core = 100.0
Max Outer Core = 50.0
GetEntityMaxHealth(PlayerPedId()) -- Returns 150.0
```