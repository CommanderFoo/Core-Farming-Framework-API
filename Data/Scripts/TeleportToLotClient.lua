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
local LOT_TYPE = COMPONENT_ROOT:GetCustomProperty("LotType")
local SPAWN_POINT_KEY = COMPONENT_ROOT:GetCustomProperty("SpawnPointKey")
local ASSIGN_PLAYER_TO_LOT = COMPONENT_ROOT:GetCustomProperty("AssignPlayerToLot")
local TAKE_OVER_OFFLINE_LOTS = COMPONENT_ROOT:GetCustomProperty("TakeOverOfflineLots")
local INTERACT_WITH_TRIGGER = COMPONENT_ROOT:GetCustomProperty("InteractWithTrigger")
local INTERACTION_TEXT = COMPONENT_ROOT:GetCustomProperty("InteractionText")

-- Required APIs
---@type APIPlayerLots
local PLAYER_LOTS = require(script:GetCustomProperty("APIPlayerLots"))
---@type APIReliableEvents
local RELIABLE_EVENTS = require(script:GetCustomProperty("APIReliableEvents"))

function TransferPlayer(player)
    -- See if this portal is on a Lot
    local lotId = PLAYER_LOTS.FindLotByAncestors(COMPONENT_ROOT)

    if Environment.IsServer() then
        Events.Broadcast(PLAYER_LOTS.Events.TeleportToLot, player, LOT_TYPE, SPAWN_POINT_KEY, lotId, ASSIGN_PLAYER_TO_LOT, TAKE_OVER_OFFLINE_LOTS)
    else
        RELIABLE_EVENTS.BroadcastToServer(PLAYER_LOTS.Events.TeleportToLot, LOT_TYPE, SPAWN_POINT_KEY, lotId, ASSIGN_PLAYER_TO_LOT, TAKE_OVER_OFFLINE_LOTS)
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
	if LOT_TYPE and LOT_TYPE ~= "" then
		result = result:gsub("%{type}", LOT_TYPE)
	end

	return result
end

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