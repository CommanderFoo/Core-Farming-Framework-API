--[[
Copyright 2021 Manticore Games, Inc.

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated
documentation files (the "Software"), to deal in the Software without restriction, including without limitation the
rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit
persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the
Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE
WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
--]]

-- Internal Properties
local COMPONENT_ROOT = script:GetCustomProperty("ComponentRoot"):WaitForObject()

-- User Exposed Properties
local STARTING_AREA = COMPONENT_ROOT:GetCustomProperty("StartingArea"):WaitForObject()
local SPAWN_POINT_KEY = COMPONENT_ROOT:GetCustomProperty("SpawnPointKey")

if STARTING_AREA == nil then
	warn("You need to set the 'StartingArea' reference on " .. COMPONENT_ROOT.name)
	return
end

-- Required APIs
---@type APIAreas
local AREAS = require(script:GetCustomProperty("APIAreas"))

-- Wait for areas to register
Task.Wait()

local areaId = AREAS.FindAreaByAncestors(STARTING_AREA)
if areaId == nil then
	warn("You need to set the 'StartingArea' reference to an Area on " .. COMPONENT_ROOT.name)
	return
end

local areaState = AREAS.GetAreaState(areaId)
if areaState.isAssignable then
	warn("You cannot set the 'StartingArea' reference to an Assignable Area")
	return
end

function OnPlayerJoined(player)
	Events.Broadcast(AREAS.Events.TeleportToArea, player, areaId, nil, nil, nil, SPAWN_POINT_KEY)
end

for _, player in ipairs(Game.GetPlayers()) do
	OnPlayerJoined(player)
end

Game.playerJoinedEvent:Connect(OnPlayerJoined)