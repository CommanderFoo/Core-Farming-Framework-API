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

--[[
    This is a simple Currency display that shows an icon and amount. It will keep itself synchronized with Currency
    changes. It expects a CurrencyId property on the Component Root.
--]]

-- Internal Variables
local COMPONENT_ROOT = script:GetCustomProperty("ComponentRoot"):WaitForObject()
local PANEL = script:GetCustomProperty("Panel"):WaitForObject()
local TEXT = script:GetCustomProperty("Text"):WaitForObject()

-- User Exposed Variables
local REPLICATOR_IDENTIFIERS = COMPONENT_ROOT:GetCustomProperty("ReplicatorIdentifiers")
local DISTANCE_FROM_PLAYER = COMPONENT_ROOT:GetCustomProperty("DistanceFromPlayer")

-- Required APIs
---@type APIReplicator
local REPLICATOR = require(script:GetCustomProperty("APIReplicator"))
---@type APIPlaceables
local PLACEABLES = require(script:GetCustomProperty("APIPlaceables"))
---@type APITags
local TAGS = require(script:GetCustomProperty("APITags"))
---@type APIPlayerLots
local PLAYER_LOTS = require(script:GetCustomProperty("APIPlayerLots"))

if not REPLICATOR_IDENTIFIERS or REPLICATOR_IDENTIFIERS == "" then
    warn("ReplicatorIdentifiers must be set on the Component Root")
    return
end

-- Constants
local LOCAL_PLAYER = Game.GetLocalPlayer()

-- Private Variables
local replicatorIdentifiers = {}
local listeners = {}

function Initialize()
    for _, identifier in ipairs(TAGS.SplitTagsString(REPLICATOR_IDENTIFIERS)) do
        replicatorIdentifiers[string.lower(identifier)] = true
    end

    COMPONENT_ROOT.destroyEvent:Connect(Cleanup)
end

function Cleanup()
    for _, listener in ipairs(listeners) do
        listener:Disconnect()
    end

    listeners = {}
end

function Tick(deltaTime)
    local closestReplicatorId, closestReplicatorIdentifier, closestDistance = nil, nil, math.huge
    for _, lotReplicatorState in pairs(PLAYER_LOTS.GetLotReplicators()) do
        local state = lotReplicatorState.GetState()
        if state.lotId and replicatorIdentifiers[string.lower(state.identifier)] then
            local isOwner = PLAYER_LOTS.GetOwner(state.lotId) == LOCAL_PLAYER
            if isOwner then
                local distance = (state.root:GetWorldPosition() - LOCAL_PLAYER:GetWorldPosition()).size
                if distance < closestDistance and distance <= DISTANCE_FROM_PLAYER then
                    closestReplicatorId = state.replicatorId
                    closestReplicatorIdentifier = state.identifier
                    closestDistance = distance
                end
            end
        end
    end

    if closestReplicatorId then
        local hasHitLimit, placeableAmount, totalAmount, placeableMax, totalMax = PLACEABLES.GetPlacementLimitInfo(closestReplicatorId, closestReplicatorIdentifier, nil)

        PANEL.visibility = Visibility.INHERIT

        if totalMax > 0 then
            TEXT.text = string.format("%d/%d Items", totalAmount, totalMax)
        else
            TEXT.text = string.format("%d Items", totalAmount)
        end
    else
        PANEL.visibility = Visibility.FORCE_OFF
    end
end

Initialize()