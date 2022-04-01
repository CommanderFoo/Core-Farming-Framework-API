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
local REQUIRE_OWNER_TO_LOAD = COMPONENT_ROOT:GetCustomProperty("RequireOwnerToLoad")
local TEMPLATE_GROUP = COMPONENT_ROOT:GetCustomProperty("Templates"):WaitForObject()
local RESOURCE_NAME = COMPONENT_ROOT:GetCustomProperty("ResourceName")

local TEMPLATES = {}
for _, template in ipairs(TEMPLATE_GROUP:GetChildren()) do
    table.insert(TEMPLATES, template:GetCustomProperties())
end

-- Required APIs
---@type APIPlayerLots
local PLAYER_LOTS = require(script:GetCustomProperty("APIPlayerLots"))
---@type APIPlayerUpgrades
local PLAYER_UPGRADES = require(script:GetCustomProperty("APIPlayerUpgrades"))

-- Wait for Player Lots to register
Task.Wait()

-- Private Variables
local lotId = PLAYER_LOTS.FindLotByAncestors(COMPONENT_ROOT)
local currentTemplate = nil
local spawnedCoreObject = nil
local isActive = true
local resourceChangedHandler = nil

function GetOwner()
    return PLAYER_LOTS.GetOwner(lotId)
end

function GetTemplate()
    local owner = GetOwner()
    local result = nil

    if Object.IsValid(owner) then
        for _, template in ipairs(TEMPLATES) do
            local valid = true
            local resourceName = RESOURCE_NAME
            if template.ResourceName then
                resourceName = template.ResourceName
            end
            if template.ResourceValue then
                if resourceName then
                    local resourceValue = owner:GetResource(resourceName)
                    if template.ResourceValue ~= resourceValue then
                        valid = false
                    end
                else
                    valid = false
                end
            end
            if template.UpgradeId and template.UpgradeId ~= "" then
                if not PLAYER_UPGRADES.HasUpgrade(owner.id, template.UpgradeId) then
                    valid = false
                end
            end
            if valid then
                result = template.Template
            end
        end
    elseif not REQUIRE_OWNER_TO_LOAD then
        result = TEMPLATES[1].Template
    end

    return result
end

function OnResourceChanged(player, resource)
    if player == GetOwner() then
        --if resource == RESOURCE_NAME then
            UpdateTemplate()
        --end
    end
end

function UpdateResourceChangedHandler()
    local owner = PLAYER_LOTS.GetOwner(lotId)

    if resourceChangedHandler then
        resourceChangedHandler:Disconnect()
        resourceChangedHandler = nil
    end

    if Object.IsValid(owner) then
        resourceChangedHandler = owner.resourceChangedEvent:Connect(OnResourceChanged)
    end
end

function OnPlayerLotReset(playerLot)
    if playerLot ~= lotId then
        return
    end

    UpdateResourceChangedHandler()
    UpdateTemplate()
end

function OnPlayerLotAssigned(playerLot, playerId)
    if playerLot ~= lotId then
        return
    end

    UpdateResourceChangedHandler()
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

    template = GetTemplate()

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
            spawnedCoreObject = World.SpawnAsset(currentTemplate, { parent = script })
        end
    end
end

local handers = {
    Events.Connect(PLAYER_LOTS.Events.PlayerLotReset, OnPlayerLotReset),
    Events.Connect(PLAYER_LOTS.Events.PlayerLotAssigned, OnPlayerLotAssigned),
    Events.Connect(PLAYER_LOTS.Events.PlayerLotSaved, OnPlayerLotSaved),
    Events.Connect(PLAYER_LOTS.Events.PlayerLotActive, OnPlayerLotActive),
    Events.Connect(PLAYER_LOTS.Events.PlayerLotInactive, OnPlayerLotInactive)
}

script.destroyEvent:Connect(function()
    for _, handler in ipairs(handers) do
        handler:Disconnect()
    end
    handers = nil
end)

UpdateResourceChangedHandler()
UpdateTemplate()