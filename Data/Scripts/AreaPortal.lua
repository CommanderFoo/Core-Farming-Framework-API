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
local TRIGGER = script:GetCustomProperty("Trigger"):WaitForObject()

-- User Exposed Properties
local DESTINATION_AREA = COMPONENT_ROOT:GetCustomProperty("DestinationArea"):WaitForObject()
local DESTINATION_AREA_KEY = COMPONENT_ROOT:GetCustomProperty("DestinationAreaKey")
local DESTINATION_TARGET = COMPONENT_ROOT:GetCustomProperty("DestinationTarget"):WaitForObject()
local SPAWN_POINT_KEY = COMPONENT_ROOT:GetCustomProperty("SpawnPointKey")
local INTERACT_WITH_TRIGGER = COMPONENT_ROOT:GetCustomProperty("InteractWithTrigger")
local INTERACTION_TEXT = COMPONENT_ROOT:GetCustomProperty("InteractionText")

-- Required APIs
---@type APIAreas
local AREAS = require(script:GetCustomProperty("APIAreas"))
---@type APIReliableEvents
local RELIABLE_EVENTS = require(script:GetCustomProperty("APIReliableEvents"))

function TransferPlayer(player)
	local position, rotation
	if DESTINATION_TARGET then
		position = DESTINATION_TARGET:GetWorldPosition()
		rotation = DESTINATION_TARGET:GetWorldRotation()
	end

	local areaId
	if DESTINATION_AREA then
		areaId = DESTINATION_AREA.id
	end

	if Environment.IsServer() then
        Events.Broadcast(AREAS.Events.TeleportToArea, player, areaId, DESTINATION_AREA_KEY, position, rotation, SPAWN_POINT_KEY)
    else
        RELIABLE_EVENTS.BroadcastToServer(AREAS.Events.TeleportToArea, areaId, DESTINATION_AREA_KEY, position, rotation, SPAWN_POINT_KEY)
    end
end

function OnBeginOverlap(trigger, other)
	if not other:IsA("Player") then return end
    if Environment.IsClient() and other ~= Game.GetLocalPlayer() then return end

	if not trigger.isInteractable then
		TransferPlayer(other)
	end
end

function OnInteracted(trigger, player)
	if trigger == TRIGGER then
		TransferPlayer(player)
	end
end

function FormatText(text)
	local result = text
	if DESTINATION_AREA then
		local areaState = AREAS.GetAreaState(DESTINATION_AREA.id)
		result = result:gsub("%{name}", areaState.name)
	end

	if DESTINATION_AREA_KEY and DESTINATION_AREA_KEY ~= "" then
		result = result:gsub("%{type}", DESTINATION_AREA_KEY)
	end

	return result
end

-- Wait for Areas to register
Task.Wait()

-- Initialize
TRIGGER.beginOverlapEvent:Connect(OnBeginOverlap)
TRIGGER.interactedEvent:Connect(OnInteracted)

-- Only client can modify these when they aren't networked
if Environment.IsClient() then
	TRIGGER.isInteractable = INTERACT_WITH_TRIGGER
	if INTERACTION_TEXT and INTERACTION_TEXT ~= "" then
		TRIGGER.interactionLabel = FormatText(INTERACTION_TEXT)
	end
end