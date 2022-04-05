---
id: areas
name: Areas
title: Areas
---

# Areas

The Areas system is meant to be used to chunk your environment into discrete pieces that can be loaded on demand.
This provides a much more performant experience for Players and lets creators include much more content in their
games.

As Players move through Areas they can be moved to specific spawn points, be placed into pools of Areas, have
templates loaded into client, server or static contexts and more.

## Events

| Event Name | Return Type | Description | Tags |
| ---------- | ----------- | ----------- | ---- |
| `AreaFinishedLoading` | Event&lt;areaId&gt; | This event is sent every time an Area finishes loading. | Server |
| `AreaFinishedUnloading` | Event&lt;areaId&gt; | This event is sent every time an Area finishes unloading. | Server |
| `PlayerAreaChanged` | Event&lt;Player, areaId, lastAreaId&gt; | This event is sent every time a Player moves to an Area. | Server |
| `PlayerFinishedLoadingArea` | Event&lt;Player&gt; | This event is sent from the client to the server when a Player finishes loading an Area. | Server |
| `TeleportToArea` | Event&lt;Player, areaId, areaKey, targetPosition, targetRotation, spawnPointKey&gt; | This event is sent from the client to the server, or server to server when a Player enters a portal or clicks | Server |

## Functions

| Class Function Name | Return Type | Description | Tags |
| ------------------- | ----------- | ----------- | ---- |
| `AssignArea(string, string)` | `None` | Assigns a key to an Area. | None |
| `CanPlayerBeAssignedToArea(string, string)` | `boolean` | Returns true if the Player can be assigned to an Assignable Area with an optional area group key. | None |
| `FindAreaByAncestors(CoreObject)` | `string`,  | Locates an Area by searching upward from the provided CoreObject and returns the Area Id if found. | None |
| `FindAreaByAssignKey(string)` | `string`,  | Returns and Area Id for an Area that matches the provided assign key. | None |
| `FindAreaByName(string)` | `string`,  | Returns and Area Id for an Area that matches the provided name. | None |
| `GetAllAreas()` | `Array&lt;string&gt;` | Returns all registered Areas. | None |
| `GetAllAssignableAreas(string)` | `Array&lt;string&gt;` | Returns all Area ids under a specific Assignable Area Group. | None |
| `GetAndAssignArea(string, string|nil, string|nil)` | `string`,  | Given a key, this function will either find an 'assignable' area that has the same key, or find an empty 'assignable' area and assign it to this key. Returns the Area Id if one is found or assigned. | None |
| `GetArea(string)` | `table` | Returns an Area. | None |
| `GetAreaState(string)` | `table`,  | Returns the state of an Area. | None |
| `GetPlayerArea(Player)` | `string`,  | Returns the Area Id of the Area the Player is currently in. | None |
| `GetPlayersInArea(string)` | `table` | Returns all Players in a specific Area. | None |
| `IsInAssignableAreaGroup(CoreObject, string|nil)` | `boolean` | Returns true if the Area is part of an assignable Areas group. | None |
| `IsPlayerInArea(Player, string)` | `boolean` | Returns true if the Player is in the provided Area. | None |
| `LockPlayer(Player)` | `None` | Restricts Player movement. | None |
| `RegisterArea(string, table)` | `None` | Registers an Area. | None |
| `RegisterAssignableAreaGroup(string, string, integer)` | `None` | Registers an assignable Area group. | None |
| `SendPlayerToArea(Player, string)` | `None` | Assigns a Player to a specific Area. | None |
| `UnlockPlayer(Player)` | `None` | Allows a Player to move. | None |

## Examples

Example using:

### `GetAllAreas`

Get all areas that have been registered in the game.

```lua
-- local API_AREAS = require(script:GetCustomProperty("APIAreas"))

-- local allAreas = API_AREAS.GetAllAreas()

-- for index, area in ipairs(allAreas) do

-- end
```
