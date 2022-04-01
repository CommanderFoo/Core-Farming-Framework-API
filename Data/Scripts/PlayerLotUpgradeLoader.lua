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
local STATIC_ROOT = script:GetCustomProperty("StaticRoot"):WaitForObject()

-- User Exposed Properties
local REQUIRES_OWNER_TO_LOAD = COMPONENT_ROOT:GetCustomProperty("RequiresOwnerToLoad")
local UPGRADE_COLLECTION_ID = COMPONENT_ROOT:GetCustomProperty("UpgradeCollectionId")
local DEFAULT_UPGRADE_ID = COMPONENT_ROOT:GetCustomProperty("DefaultUpgradeId")
local UPGRADE_ID = COMPONENT_ROOT:GetCustomProperty("UpgradeId")
local TEMPLATE_SET_ID = COMPONENT_ROOT:GetCustomProperty("TemplateSetId")

-- Required APIs
---@type APIPlayerUpgrades
local PLAYER_UPGRADES = require(script:GetCustomProperty("APIPlayerUpgrades"))
---@type APIPlayerLots
local PLAYER_LOTS = require(script:GetCustomProperty("APIPlayerLots"))

-- Wait for Player Lots and data to register
Task.Wait()

-- Private Variables
local lotId = PLAYER_LOTS.FindLotByAncestors(COMPONENT_ROOT)
local object
local staticObject
local isActive = not lotId or PLAYER_LOTS.GetLotState(lotId).isActive
local listeners

local iterations = 0
while not PLAYER_UPGRADES.GetUpgradeCollection(UPGRADE_COLLECTION_ID) and iterations < 30 do
    iterations = iterations + 1
    Task.Wait()
end

if not PLAYER_UPGRADES.GetUpgradeCollection(UPGRADE_COLLECTION_ID) then
    warn(string.format("Could not find Upgrade Collection for id: %s on: %s", UPGRADE_COLLECTION_ID, COMPONENT_ROOT.name))
    return
end

function UpdateTemplates()
    local ownerId = PLAYER_LOTS.GetLotState(lotId).ownerId

    if Object.IsValid(object) then
        object:Destroy()
        object = nil
    end

    if Object.IsValid(staticObject) then
        staticObject:Destroy()
        staticObject = nil
    end

    if not isActive or (REQUIRES_OWNER_TO_LOAD and (ownerId == nil or ownerId == "")) then
        return
    end

    if ownerId then
        if UPGRADE_ID and UPGRADE_ID ~= "" then
            if PLAYER_UPGRADES.HasUpgrade(ownerId, UPGRADE_ID) then
                UpdateTemplatesForUpgrade(PLAYER_UPGRADES.GetUpgradeData(UPGRADE_ID))
            elseif DEFAULT_UPGRADE_ID and DEFAULT_UPGRADE_ID ~= "" then
                UpdateTemplatesForUpgrade(PLAYER_UPGRADES.GetUpgradeData(DEFAULT_UPGRADE_ID))
            end
        else
            UpdateTemplatesForUpgrade(PLAYER_UPGRADES.GetPlayerUpgradeData(ownerId, UPGRADE_COLLECTION_ID))
        end
    elseif DEFAULT_UPGRADE_ID and DEFAULT_UPGRADE_ID ~= "" then
        UpdateTemplatesForUpgrade(PLAYER_UPGRADES.GetUpgradeData(DEFAULT_UPGRADE_ID))
    end
end

function UpdateTemplatesForUpgrade(upgradeData)
    if not upgradeData then return end

    local templateSetData
    if TEMPLATE_SET_ID and TEMPLATE_SET_ID ~= "" then
        templateSetData = upgradeData.templateSets[TEMPLATE_SET_ID]
    else
        -- Just use the first template set found
        for _, data in pairs(upgradeData.templateSets) do
            templateSetData = data
            break
        end
    end

    if not templateSetData then return end

    if Environment.IsServer() then
        if templateSetData.serverAsset and templateSetData.serverAsset ~= "" then
            object = World.SpawnAsset(templateSetData.serverAsset, { parent = script.parent })
        end
    elseif Environment.IsClient() then
        if templateSetData.clientAsset and templateSetData.clientAsset ~= "" then
            object = World.SpawnAsset(templateSetData.clientAsset, { parent = script.parent })
        end
    end

    -- Only spawn static templates once in single player
    if templateSetData.staticAsset and templateSetData.staticAsset ~= "" and not (Environment.IsClient() and IsSinglePlayer()) then
        staticObject = World.SpawnAsset(templateSetData.staticAsset, { parent = STATIC_ROOT, networkContext = NetworkContextType.STATIC_CONTEXT })
    end
end

function IsSinglePlayer()
    return Environment.IsLocalGame() and not Environment.IsMultiplayerPreview()
end

function OnPlayerLotReset(resetLotId)
    if resetLotId ~= lotId then return end

    UpdateTemplates()
end

function OnPlayerLotAssigned(assignedLotId, playerId)
    if assignedLotId ~= lotId then return end

    UpdateTemplates()
end

function OnPlayerLotActive(activeLotId)
    if activeLotId ~= lotId then return end

    isActive = true
    UpdateTemplates()
end

function OnPlayerLotInactive(inactiveLotId)
    if inactiveLotId ~= lotId then return end

    isActive = false
    UpdateTemplates()
end

function OnUpgradeChanged(player, upgradeId)
    if PLAYER_UPGRADES.GetUpgradeCollectionId(upgradeId) == UPGRADE_COLLECTION_ID then
        UpdateTemplates()
    end
end

function OnPlayerLeft(player)
    if PLAYER_LOTS.GetLotState(lotId).ownerId == player.id then
        Task.Wait()
        UpdateTemplates()
    end
end

function OnDestroyed()
    for _, listener in ipairs(listeners) do
        listener:Disconnect()
    end
    listeners = {}
end

UpdateTemplates()

listeners = {
    Events.Connect(PLAYER_LOTS.Events.PlayerLotReset, OnPlayerLotReset),
    Events.Connect(PLAYER_LOTS.Events.PlayerLotAssigned, OnPlayerLotAssigned),
    Events.Connect(PLAYER_LOTS.Events.PlayerLotActive, OnPlayerLotActive),
    Events.Connect(PLAYER_LOTS.Events.PlayerLotInactive, OnPlayerLotInactive),
    Events.Connect(PLAYER_UPGRADES.Events.UpgradeLoaded, OnUpgradeChanged),
    Events.Connect(PLAYER_UPGRADES.Events.UpgradeAdded, OnUpgradeChanged),
    Events.Connect(PLAYER_UPGRADES.Events.UpgradeRemoved, OnUpgradeChanged),
    Game.playerLeftEvent:Connect(OnPlayerLeft),
    script.destroyEvent:Connect(OnDestroyed)
}