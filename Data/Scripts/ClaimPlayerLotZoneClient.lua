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
local PLAYER_LOT = COMPONENT_ROOT:GetCustomProperty("PlayerLot"):WaitForObject()
local INTERACT_WITH_TRIGGER = COMPONENT_ROOT:GetCustomProperty("InteractWithTrigger")
local INTERACTION_TEXT = COMPONENT_ROOT:GetCustomProperty("InteractionText")
local CANNOT_CLAIM_TEXT = COMPONENT_ROOT:GetCustomProperty("CannotClaimText")

-- Required APIs
---@type APIPlayerLots
local PLAYER_LOTS = require(script:GetCustomProperty("APIPlayerLots"))

-- Constants
local LOCAL_PLAYER = Game.GetLocalPlayer()

-- Private Variables
local lotId
local handlers

-- Wait for Player Lots to register
Task.Wait()

if Object.IsValid(PLAYER_LOT) then
    lotId = PLAYER_LOTS.FindLotByAncestors(PLAYER_LOT)

    if not lotId then
        error(PLAYER_LOT.name .. " must be a Player Lot")
    end
else
    lotId = PLAYER_LOTS.FindLotByAncestors(COMPONENT_ROOT)

    if not lotId then
        error(COMPONENT_ROOT.name .. " must be inside a Player Lot")
    end
end

function ClaimPlayerLot()
    if PLAYER_LOTS.CanOwnLot(lotId, LOCAL_PLAYER.id, false) then
        PLAYER_LOTS.SetLotOwner(lotId, LOCAL_PLAYER.id, true)
    else
        warn(string.format("Player Lot: %s cannot be claimed", lotId))
    end
end

function UpdateTrigger()
    if not Object.IsValid(TRIGGER) then return end

    local ownerId = PLAYER_LOTS.GetLotState(lotId).ownerId

    TRIGGER.isInteractable = INTERACT_WITH_TRIGGER and ownerId == nil

    if PLAYER_LOTS.CanOwnLot(lotId, LOCAL_PLAYER.id, false) then
        if INTERACTION_TEXT and INTERACTION_TEXT ~= "" then
            TRIGGER.interactionLabel = FormatText(INTERACTION_TEXT)
        end
    else
        if CANNOT_CLAIM_TEXT and CANNOT_CLAIM_TEXT ~= "" then
            TRIGGER.interactionLabel = FormatText(CANNOT_CLAIM_TEXT)
        end
    end
end

function OnBeginOverlap(trigger, other)
	if not other:IsA("Player") or other ~= LOCAL_PLAYER then return end

    local ownerId = PLAYER_LOTS.GetLotState(lotId).ownerId
	if not trigger.isInteractable and ownerId == nil then
		ClaimPlayerLot()
	end
end

function OnInteracted(trigger, player)
	if trigger == TRIGGER then
		ClaimPlayerLot()
	end
end

function OnPlayerLotReset(resetLotId)
    UpdateTrigger()
end

function OnPlayerLotAssigned(assignedLotId, playerId)
    UpdateTrigger()
end

function OnDestroyed()
    for _, handler in ipairs(handlers) do
        handler:Disconnect()
    end
    handlers = {}
end

function FormatText(text)
    local result = text
    local lotState = PLAYER_LOTS.GetLotState(lotId)
    result = text:gsub("%{type}", lotState.lotType or "")
	return result:gsub("%{name}", lotState.name)
end

-- Initialize
TRIGGER.beginOverlapEvent:Connect(OnBeginOverlap)

if INTERACT_WITH_TRIGGER then
	TRIGGER.interactedEvent:Connect(OnInteracted)
end

handlers = {
    Events.Connect(PLAYER_LOTS.Events.PlayerLotReset, OnPlayerLotReset),
    Events.Connect(PLAYER_LOTS.Events.PlayerLotAssigned, OnPlayerLotAssigned)
}

script.destroyEvent:Connect(OnDestroyed)

UpdateTrigger()