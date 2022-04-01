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
local REQUIRES_OWNER = script:GetCustomProperty("RequiresOwner")
local TEMPLATE = script:GetCustomProperty("Template")

-- Required APIs
---@type APIPlayerLots
local PLAYER_LOTS = require(script:GetCustomProperty("APIPlayerLots"))

-- Wait for Player Lots to register
Task.Wait()

-- Private Variables
local lotId = PLAYER_LOTS.FindLotByAncestors(script)
local currentTemplate = nil
local spawnedCoreObject = nil
local isActive = true
local handlers

function OnPlayerLotReset(playerLot)
    if playerLot ~= lotId then
        return
    end

    UpdateTemplate()
end

function OnPlayerLotAssigned(playerLot, playerId)
    if playerLot ~= lotId then
        return
    end

    UpdateTemplate()
end

function OnPlayerLotSaved(playerLot, playerId)
    if playerLot ~= lotId then
        return
    end
end

function OnPlayerLotActive(playerLot)
    if playerLot ~= lotId then
        return
    end

    isActive = true
    UpdateTemplate()
end

function OnPlayerLotInactive(playerLot)
    if playerLot ~= lotId then
        return
    end

    isActive = false
    UpdateTemplate()
end

function UpdateTemplate()
    local template = nil
    if REQUIRES_OWNER == false or Object.IsValid(PLAYER_LOTS.GetOwner(lotId)) then
        template = TEMPLATE
    end
    if not isActive then
        template = nil
    end

    if template ~= currentTemplate then
        currentTemplate = template
        if Object.IsValid(spawnedCoreObject) then
            spawnedCoreObject:Destroy()
            spawnedCoreObject = nil
        end
        if currentTemplate then
            spawnedCoreObject = World.SpawnAsset(currentTemplate, {parent = script})
        end
    end
end

handlers = {
    Events.Connect(PLAYER_LOTS.Events.PlayerLotReset, OnPlayerLotReset),
    Events.Connect(PLAYER_LOTS.Events.PlayerLotAssigned, OnPlayerLotAssigned),
    Events.Connect(PLAYER_LOTS.Events.PlayerLotSaved, OnPlayerLotSaved),
    Events.Connect(PLAYER_LOTS.Events.PlayerLotActive, OnPlayerLotActive),
    Events.Connect(PLAYER_LOTS.Events.PlayerLotInactive, OnPlayerLotInactive)
}

script.destroyEvent:Connect(function()
    for _, handler in ipairs(handlers) do
        handler:Disconnect()
    end
end)

UpdateTemplate()