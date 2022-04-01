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
local TELEPORT_PLAYER_ON_JOIN = COMPONENT_ROOT:GetCustomProperty("TeleportPlayerOnJoin")
local SPAWN_POINT_KEY = COMPONENT_ROOT:GetCustomProperty("SpawnPointKey")
local RESPAWN_PLAYER_IN_LAST_AREA = COMPONENT_ROOT:GetCustomProperty("RespawnPlayerInLastArea")

-- Required APIs
---@type APIAreas
local AREAS = require(script:GetCustomProperty("APIAreas"))
---@type APISpawnPoints
local SPAWN_POINTS = require(script:GetCustomProperty("APISpawnPoints"))

-- Private Variables
local respawnListeners = {}

function OnPlayerRespawned(player, playerStart, spawnKey)
    local areaId = AREAS.GetPlayerArea(player)
    if areaId then
        local spawnPoints = SPAWN_POINTS.GetSpawnPoints(areaId)
        if #spawnPoints > 0 then
            player:SetWorldPosition(SPAWN_POINTS.GetSpawnPointTargetPosition(spawnPoints[1]))
			player:SetWorldRotation(SPAWN_POINTS.GetSpawnPointTargetRotation(spawnPoints[1]))
        end
    end
end

function OnPlayerJoined(player)
    if RESPAWN_PLAYER_IN_LAST_AREA then
        respawnListeners[player] = player.spawnedEvent:Connect(OnPlayerRespawned)
    end

    if TELEPORT_PLAYER_ON_JOIN and STARTING_AREA then
        local areaId = AREAS.FindAreaByAncestors(STARTING_AREA)
        if areaId then
            Events.Broadcast(AREAS.Events.TeleportToArea, player, areaId, nil, nil, nil, SPAWN_POINT_KEY)
        end
    end
end

function OnPlayerLeft(player)
    if respawnListeners[player] then
        respawnListeners[player]:Disconnect()
        respawnListeners[player] = nil
    end
end

function OnAreaFinishedLoading(areaId)
    for _, player in ipairs(AREAS.GetPlayersInArea(areaId)) do
        if not player.serverUserData.isLoading then
            AREAS.UnlockPlayer(player)
        end
    end
end

function OnPlayerFinishedLoadingArea(player)
    player.serverUserData.isLoading = false

    local area = AREAS.GetPlayerArea(player)
    if AREAS.GetAreaState(area).isLoaded then
        AREAS.UnlockPlayer(player)
    end
end

Events.ConnectForPlayer(AREAS.Events.PlayerFinishedLoadingArea, OnPlayerFinishedLoadingArea)
Events.Connect(AREAS.Events.AreaFinishedLoading, OnAreaFinishedLoading)

Game.playerJoinedEvent:Connect(OnPlayerJoined)
Game.playerLeftEvent:Connect(OnPlayerLeft)