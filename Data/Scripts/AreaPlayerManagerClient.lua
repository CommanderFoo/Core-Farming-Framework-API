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

-- Required APIs
---@type APIAreas
local AREAS = require(script:GetCustomProperty("APIAreas"))
---@type APIReliableEvents
local RELIABLE_EVENTS = require(script:GetCustomProperty("APIReliableEvents"))

-- Constants
local LOCAL_PLAYER = Game.GetLocalPlayer()

-- Private Variables
local isLocalPlayerTransfering = false
local isLocalPlayerLoading = false
local loadingStartTime = 0

function Tick()
    if isLocalPlayerLoading then
        local transferArea = AREAS.GetPlayerArea(LOCAL_PLAYER)
        local areaState = AREAS.GetAreaState(transferArea)
        local progress = areaState.loadingProgress

        Events.Broadcast("UpdateLoadingScreenProgress", progress)

        if areaState.isLoaded then
            isLocalPlayerLoading = false
            RELIABLE_EVENTS.BroadcastToServer(AREAS.Events.PlayerFinishedLoadingArea)
        end
    elseif isLocalPlayerTransfering then
        if LOCAL_PLAYER.isMovementEnabled then
            if time() - loadingStartTime > 0.5 then
                Events.Broadcast("HideLoadingScreen")
                isLocalPlayerTransfering = false
            end
        end
    end
end

function OnPlayerAreaChanged(player, areaId, lastAreaId)
    if player == LOCAL_PLAYER then
        local areaState = AREAS.GetAreaState(areaId)
        if areaState then
            isLocalPlayerTransfering = true
            isLocalPlayerLoading = true

            Events.Broadcast("ShowLoadingScreen", "Transfering to " .. areaState.name)

            loadingStartTime = time()
        end
    end
end

Events.Connect(AREAS.Events.PlayerAreaChanged, OnPlayerAreaChanged)