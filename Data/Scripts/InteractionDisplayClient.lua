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
local PANEL = script:GetCustomProperty("Panel"):WaitForObject()
local ACTION_TEXT = script:GetCustomProperty("ActionText"):WaitForObject()
local COSTS_PANEL = script:GetCustomProperty("CostsPanel"):WaitForObject()
local BUFFS_PANEL = script:GetCustomProperty("BuffsPanel"):WaitForObject()
local PROGRESS_BAR = script:GetCustomProperty("ProgressBar"):WaitForObject()
local PROGRESS_TEXT = script:GetCustomProperty("ProgressText"):WaitForObject()

-- User Exposed Properties
local ALWAYS_VISIBLE = COMPONENT_ROOT:GetCustomProperty("AlwaysVisible")
local POSITION_OVER_INTERACTABLE = COMPONENT_ROOT:GetCustomProperty("PositionOverInteractable")
local POSITION_OFFSET = COMPONENT_ROOT:GetCustomProperty("PositionOffset")
local STAY_ON_SCREEN = COMPONENT_ROOT:GetCustomProperty("StayOnScreen")
local SCREEN_EDGE_PADDING = COMPONENT_ROOT:GetCustomProperty("ScreenEdgePadding")
local COST_ITEM_ASSET = COMPONENT_ROOT:GetCustomProperty("CostItemAsset")
local BUFF_ITEM_ASSET = COMPONENT_ROOT:GetCustomProperty("BuffItemAsset")
local PADDING = COMPONENT_ROOT:GetCustomProperty("Padding")

-- Required APIs
---@type APIDatabase
local DATABASE = require(script:GetCustomProperty("APIDatabase"))
---@type APIPlaceables
local PLACEABLES = require(script:GetCustomProperty("APIPlaceables"))
---@type APIProducers
local PRODUCERS = require(script:GetCustomProperty("APIProducers"))
---@type APIGatherables
local GATHERABLES = require(script:GetCustomProperty("APIGatherables"))
---@type APIInventory
local INVENTORY = require(script:GetCustomProperty("APIInventory"))
---@type APICurrency
local CURRENCY = require(script:GetCustomProperty("APICurrency"))
---@type APIIconManager
local ICON_MANAGER = require(script:GetCustomProperty("APIIconManager"))
---@type APIBuffs
local BUFFS = require(script:GetCustomProperty("APIBuffs"))
---@type APIUILibrary
local UI_LIBRARY = require(script:GetCustomProperty("APIUILibrary"))
---@type APIRealTime
local REALTIME = require(script:GetCustomProperty("APIRealTime"))
---@type APIEquipment
local EQUIPMENT = require(script:GetCustomProperty("APIEquipment"))
---@type APICrafting
local CRAFTING = require(script:GetCustomProperty("APICrafting"))

-- For single player preview mode to get the server version
local STATIC_GATHERABLES
if Environment.IsLocalGame() and not Environment.IsMultiplayerPreview() then
    _G.StaticContext.Call(function()
        STATIC_GATHERABLES = require(script:GetCustomProperty("APIGatherables"))
    end)
end

-- Constants
local LOCAL_PLAYER = Game.GetLocalPlayer()
local INTERACTION_PRIORITY = {
    PlaceProducer = 1,
    BuildProducer = 2,
    CollectProducer = 3,
    BuffPlaceable = 4,
    BuffProducer = 5,
    GatherFromGatherable = 6,
    RemoveProducer = 7,
    RemovePlaceable = 8,
    NoInteraction = 9,
    PlacePlaceable = 10,
    OpenPlaceableInventory = 11,
    OpenCraftingStation = 12,
    None = math.huge
}
local BUFF_PANEL_OFFSET_Y = 30

-- Private Variables
local currentObjectId
local currentTargetId
local currentTarget
local currentInteractionType
local currentToolType
local currentEquipmentSettings
local currentPosition
local currentReplicatorId
local currentReplicatorIdentifier
local initialHeight = PANEL.height
local costObjects = {}
local buffObjects = {}
local hideTask
local listeners
local lastItemUpdate
local lastItemUpdateTime = 0
local producerDataChangeHandlerId

function Tick(deltaTime)
    if not UpdateUI() then
        ShowPanel(nil)
    else
        ShowPanel(currentPosition)
    end

    -- This is cleared each frame since we have multiple potential interactions come in per frame
    currentInteractionType = "None"
end

function UpdateInfo(objectId, targetId, interactionType, target, toolType, equipmentSettings, position, replicatorId, replicatorIdentifier)
    if not interactionType then return end

    -- Only track highest priority interaction
    if not currentInteractionType or (INTERACTION_PRIORITY[interactionType] or INTERACTION_PRIORITY.None) < (INTERACTION_PRIORITY[currentInteractionType] or INTERACTION_PRIORITY.None) then
        currentObjectId = objectId
        currentTargetId = targetId
        currentTarget = target
        currentInteractionType = interactionType
        currentToolType = toolType
        currentEquipmentSettings = equipmentSettings
        currentPosition = position
        currentReplicatorId = replicatorId
        currentReplicatorIdentifier = replicatorIdentifier

        if not lastItemUpdate or lastItemUpdate ~= GetCurrentToken() or time() - lastItemUpdateTime >= 0.5 then
            ClearBuffs()
            UpdateCosts()
            lastItemUpdate = GetCurrentToken()
            lastItemUpdateTime = time()
        end
    end
end

function UpdateUI()
    local function SetBuffInteractionText(buffs, producerBaseId, producerData, placeableData)
        for buffId, _ in pairs(buffs) do
            if not BUFFS.HasBuff(producerBaseId, buffId) then
                local buffData
                if producerData and producerData.InputBuffs and producerData.InputBuffs[buffId] then
                    buffData = producerData.InputBuffs[buffId]
                elseif placeableData and placeableData.InputBuffs and placeableData.InputBuffs[buffId] then
                    buffData = placeableData.InputBuffs[buffId]
                end

                if buffData and buffData.InteractionText and buffData.InteractionText ~= "" then
                    ACTION_TEXT.text = buffData.InteractionText
                    return true
                end
            end
        end
    end

    local function SetPlacementText()
        local hasHitLimit, placeableAmount, totalAmount, placeableMax, totalMax = PLACEABLES.GetPlacementLimitInfo(currentReplicatorId, currentReplicatorIdentifier, currentTargetId)
        if not hasHitLimit then
            if placeableMax > 0 then
                ACTION_TEXT.text = string.format("Place %s (%d/%d)", GetNameForPlaceable(currentTargetId), placeableAmount, placeableMax)
            else
                ACTION_TEXT.text = string.format("Place %s", GetNameForPlaceable(currentTargetId))
            end
        else
            ACTION_TEXT.text = string.format("Can't place %s (%d/%d)", GetNameForPlaceable(currentTargetId), placeableAmount, placeableMax)
        end
    end

    local producerBaseState = PRODUCERS.GetProducerBaseState(currentObjectId)
    local craftingStationState = CRAFTING.GetCraftingStationState(currentTargetId)

    PROGRESS_BAR.visibility = Visibility.FORCE_OFF
    ACTION_TEXT.text = ""
    PROGRESS_TEXT.text = ""

    if currentInteractionType == "PlacePlaceable" then
        SetPlacementText()
    elseif currentInteractionType == "PlaceProducer" then
        ACTION_TEXT.text = string.format("Use %s on %s", GetNameForProducer(currentEquipmentSettings.ItemId), GetNameForPlaceable(currentTargetId))
    elseif currentInteractionType == "CollectProducer" then
        ACTION_TEXT.text = string.format("Collect from %s", GetNameForPlaceable(currentTargetId))
    elseif currentInteractionType == "RemovePlaceable" then
        ACTION_TEXT.text = string.format("Remove %s", GetNameForPlaceable(currentTargetId))
    elseif currentInteractionType == "BuffPlaceable" then
        ACTION_TEXT.text = string.format("Use %s on %s", GetNameForItem(currentEquipmentSettings.ItemId), GetNameForPlaceable(currentTargetId))
    elseif currentInteractionType == "BuffProducer" then
        ACTION_TEXT.text = string.format("Use %s on %s", GetNameForItem(currentEquipmentSettings.ItemId), GetNameForProducer(currentTargetId))
    elseif currentInteractionType == "BuildProducer" then
        ACTION_TEXT.text = string.format("Use %s on %s", GetNameForItem(currentEquipmentSettings.ItemId), GetNameForPlaceable(currentTargetId))
    elseif currentInteractionType == "RemoveProducer" then
        ACTION_TEXT.text = string.format("Remove %s", GetNameForProducer(currentTargetId))
    elseif currentInteractionType == "GatherFromGatherable" then
        if currentTargetId and currentTargetId ~= "" then
            ACTION_TEXT.text = string.format("Gather from %s", currentTargetId)
        else
            ACTION_TEXT.text = "Gather from this"
        end
    elseif currentInteractionType == "OpenPlaceableInventory" then
        ACTION_TEXT.text = string.format("Open %s", GetNameForItem(currentTargetId))
    elseif currentInteractionType == "OpenCraftingStation" then
        if craftingStationState then
            -- Show progress
            if not craftingStationState.isReadyForCollect and craftingStationState.craftRate > 0 and craftingStationState.craftTimeRemaining then
                local recipeData = CRAFTING.GetRecipeData(craftingStationState.recipeId)
                ACTION_TEXT.text = string.format("%s x%d", recipeData.Name, craftingStationState.amountToCraft)
            -- Show collect
            elseif craftingStationState.isReadyForCollect then
                ACTION_TEXT.text = "Crafting Complete"
            else
                ACTION_TEXT.text = string.format("Open %s", GetNameForItem(currentTargetId))
            end
        else
            ACTION_TEXT.text = string.format("Open %s", GetNameForItem(currentTargetId))
        end
    elseif currentInteractionType == "NoInteraction" then
        -- Show producer or crafting progress
        if producerBaseState and not producerBaseState.hasExpired then
            local placeableData = DATABASE.Placeables[producerBaseState.placeableId]
            local producerData = DATABASE.Producers[producerBaseState.producerId]

            -- Show progress
            if not producerBaseState.isReadyForCollect and producerBaseState.buildRate > 0 and producerBaseState.buildTimeRemaining then
                ACTION_TEXT.text = string.format("%s", GetNameForProducer(currentTargetId))
            -- Show collect
            elseif producerBaseState.isReadyForCollect and producerData.CollectInteractionText and producerData.CollectInteractionText ~= "" then
                ACTION_TEXT.text = producerData.CollectInteractionText
            -- Show requirements
            elseif not producerBaseState.hasProducer and placeableData.AddProducerText and placeableData.AddProducerText ~= "" then
                local producerPlacementText = placeableData.AddProducerText
                local producerId = PRODUCERS.GetProducerIdForSourceItem(currentEquipmentSettings.ItemId)
                if producerId then
                    local placingProducerData = DATABASE.Producers[producerId]
                    if placingProducerData.PlaceInteractionText and placingProducerData.PlaceInteractionText ~= "" then
                        producerPlacementText = placingProducerData.PlaceInteractionText
                    end
                end

                ACTION_TEXT.text = producerPlacementText
            -- Show required buffs
            elseif not producerBaseState.isRebuilding and not PRODUCERS.CheckHasAllBuffs(currentObjectId, producerBaseState.buffData.requireWhileBuildingBuffs) then
                SetBuffInteractionText(producerBaseState.buffData.requireWhileBuildingBuffs, producerBaseState.producerBaseId, producerData, placeableData)
            elseif producerBaseState.isRebuilding and not PRODUCERS.CheckHasAllBuffs(currentObjectId, producerBaseState.buffData.requireWhileRebuildingBuffs) then
                SetBuffInteractionText(producerBaseState.buffData.requireWhileRebuildingBuffs, producerBaseState.producerBaseId, producerData, placeableData)
            end
        end
    else
        return false
    end

    -- Show producer or crafting progress
    if producerBaseState and not producerBaseState.isReadyForCollect and producerBaseState.buildRate > 0 then
        PROGRESS_BAR.visibility = Visibility.INHERIT
        PROGRESS_BAR.progress = producerBaseState.buildAmount
        PROGRESS_TEXT.text = UI_LIBRARY.FormatTime(producerBaseState.buildTimeRemaining + 1, UI_LIBRARY.TimeFormatStyle.Character)
    elseif craftingStationState and not craftingStationState.isReadyForCollect and craftingStationState.craftRate > 0 then
        PROGRESS_BAR.visibility = Visibility.INHERIT
        PROGRESS_BAR.progress = craftingStationState.craftAmount
        PROGRESS_TEXT.text = UI_LIBRARY.FormatTime(craftingStationState.craftTimeRemaining + 1, UI_LIBRARY.TimeFormatStyle.Character)
    end

    -- Show buff progress
    local buffs = BUFFS.GetBuffs(currentObjectId)
    if #buffs > 0 then
        BUFFS_PANEL.visibility = Visibility.INHERIT
        for _, buffId in ipairs(buffs) do
            if BUFFS.GetBuffSetting(buffId, BUFFS.Settings.Duration) > 0 then
                local buffObject = buffObjects[buffId]
                if not buffObject then
                    buffObject = CreateBuffObject(buffId)
                end

                local buffName = BUFFS.GetBuffSetting(buffId, BUFFS.Settings.Name)
                local timeRemaining = BUFFS.GetBuffRemainingTime(currentObjectId, buffId, REALTIME.GetRealTime())
                local label = buffObject:GetCustomProperty("Label"):WaitForObject()
                if label then
                    label.text = string.format("%s - %s", buffName, UI_LIBRARY.FormatTime(timeRemaining, UI_LIBRARY.TimeFormatStyle.Character))
                end
            end
        end

        -- Clear old Buff objects
        for buffId, buffObject in ipairs(buffObjects) do
            local foundBuff = false
            for _, activeBuffId in ipairs(buffs) do
                if activeBuffId == buffId then
                    foundBuff = true
                    break
                end
            end
            if not foundBuff then
                buffObject:Destroy()
                buffObjects[buffId] = nil
            end
        end
    else
        BUFFS_PANEL.visibility = Visibility.FORCE_OFF
        ClearBuffs()
    end

    if ACTION_TEXT.text == "" then
        return false
    end

    UpdateSize()

    return true
end

function GetCurrentToken()
    if currentEquipmentSettings and currentEquipmentSettings.ItemId then
        return currentInteractionType .. (currentObjectId or "") .. (currentTargetId or "") .. currentToolType .. currentEquipmentSettings.ItemId
    else
        return currentInteractionType .. (currentObjectId or "") .. (currentTargetId or "") .. currentToolType
    end
end

function ClearCosts()
    for _, costObject in ipairs(costObjects) do
        costObject:Destroy()
    end
    costObjects = {}
end

function UpdateCosts()
    ClearCosts()

    if currentInteractionType == "PlacePlaceable" then
        if DATABASE.Placeables and DATABASE.Placeables[currentTargetId] then
            local placeableData = DATABASE.Placeables[currentTargetId]
            if placeableData.RemoveItemWhenPlaced and currentEquipmentSettings then
                if placeableData.IsInventory then
                    CreateItemCostItem(currentEquipmentSettings.ItemType, currentEquipmentSettings.State, 1, currentEquipmentSettings.InventoryId, currentEquipmentSettings.SlotIndex)
                else
                    CreateItemCostItem(currentEquipmentSettings.ItemType, currentTargetId, 1, currentEquipmentSettings.InventoryId, currentEquipmentSettings.SlotIndex)
                end
            end

            if placeableData.Costs then
                for _, costData in pairs(placeableData.Costs) do
                    if costData.ItemId and costData.ItemId ~= "" then
                        -- Get Item Type
                        local costItemData = DATABASE.Items[costData.ItemId]
                        if costItemData then
                            local costItemType = INVENTORY.ItemType.Item
                            if costItemData.IsInventory then
                                costItemType = INVENTORY.ItemType.Inventory
                            end
                            CreateItemCostItem(costItemType, costData.ItemId, costData.Amount, nil, 0)
                        end
                    elseif costData.CurrencyId and costData.CurrencyId ~= "" then
                        CreateCurrencyCostItem(costData.CurrencyId, costData.Amount)
                    end
                end
            end
        end
    elseif currentInteractionType == "PlaceProducer" then
        local producerId = PRODUCERS.FindProducerIdFromEquipment(currentObjectId, currentToolType, currentEquipmentSettings)
        if producerId then
            local producerData = DATABASE.Producers[producerId]
            if producerData.NumberOfSeeds > 0 then
                if producerData.SourceItemId and producerData.SourceItemId ~= "" then
                    CreateItemCostItem(currentEquipmentSettings.ItemType, producerData.SourceItemId, producerData.NumberOfSeeds, currentEquipmentSettings.InventoryId, currentEquipmentSettings.SlotIndex)
                else
                    CreateItemCostItem(currentEquipmentSettings.ItemType, producerId, producerData.NumberOfSeeds, currentEquipmentSettings.InventoryId, currentEquipmentSettings.SlotIndex)
                end
            end

            if producerData.ToolsConsumedWhenPlaced and producerData.ToolsConsumedWhenPlaced > 0 then
                CreateItemCostItem(currentEquipmentSettings.ItemType, currentEquipmentSettings.ItemId, producerData.ToolsConsumedWhenPlaced, currentEquipmentSettings.InventoryId, currentEquipmentSettings.SlotIndex)
            end
        end
    elseif currentInteractionType == "BuildProducer" then
        local producerId = PRODUCERS.GetProducerBaseState(currentObjectId).producerId
        if producerId then
            local producerData = DATABASE.Producers[producerId]
            if producerData.ToolsConsumedWhenBuilt and producerData.ToolsConsumedWhenBuilt > 0 then
                CreateItemCostItem(currentEquipmentSettings.ItemType, currentEquipmentSettings.ItemId, producerData.ToolsConsumedWhenBuilt, currentEquipmentSettings.InventoryId, currentEquipmentSettings.SlotIndex)
            end
        end
    elseif currentInteractionType == "CollectProducer" then
        local producerId = PRODUCERS.GetProducerBaseState(currentObjectId).producerId
        if producerId then
            local producerData = DATABASE.Producers[producerId]
            if producerData.ToolsConsumedWhenCollected and producerData.ToolsConsumedWhenCollected > 0 then
                CreateItemCostItem(currentEquipmentSettings.ItemType, currentEquipmentSettings.ItemId, producerData.ToolsConsumedWhenCollected, currentEquipmentSettings.InventoryId, currentEquipmentSettings.SlotIndex)
            end
        end
    elseif currentInteractionType == "BuffProducer" then
        local buffData = PRODUCERS.GetProducerBaseState(currentObjectId).buffData
        if buffData then
            for buffId, buffValidToolTypes in pairs(buffData.buffValidToolTypes) do
                if buffValidToolTypes[currentToolType] or buffValidToolTypes[currentEquipmentSettings.ItemId] then
                    CreateItemCostItem(currentEquipmentSettings.ItemType, currentEquipmentSettings.ItemId, buffData.toolsConsumedWhenAdded[buffId], currentEquipmentSettings.InventoryId, currentEquipmentSettings.SlotIndex)
                    break
                end
            end
        end
    elseif currentInteractionType == "RemoveProducer" then
        local producerId = PRODUCERS.GetProducerBaseState(currentObjectId).producerId
        if producerId then
            local producerData = DATABASE.Producers[producerId]
            if producerData.ToolsConsumedWhenDestroyed and producerData.ToolsConsumedWhenDestroyed > 0 then
                CreateItemCostItem(currentEquipmentSettings.ItemType, currentEquipmentSettings.ItemId, producerData.ToolsConsumedWhenDestroyed, currentEquipmentSettings.InventoryId, currentEquipmentSettings.SlotIndex)
            end
        end
    elseif currentInteractionType == "GatherFromGatherable" then
        local gatherableData
        if GATHERABLES.IsGatherable(currentTarget) then
            local gatherableIndex = GATHERABLES.FindGatherableIndex(currentObjectId, currentTarget)
            gatherableData = GATHERABLES.GetGatherableAtIndex(currentObjectId, gatherableIndex).gatherableData
        elseif STATIC_GATHERABLES.IsGatherable(currentTarget) then
            local gatherableIndex = STATIC_GATHERABLES.FindGatherableIndex(currentObjectId, currentTarget)
            gatherableData = STATIC_GATHERABLES.GetGatherableAtIndex(currentObjectId, gatherableIndex).gatherableData
        end

        if gatherableData and gatherableData.ToolsConsumedPerGather > 0 then
            CreateItemCostItem(currentEquipmentSettings.ItemType, currentEquipmentSettings.ItemId, gatherableData.ToolsConsumedPerGather, currentEquipmentSettings.InventoryId, currentEquipmentSettings.SlotIndex)
        end
    end
end

function CreateItemCostItem(itemType, itemId, amount, inventoryId, slotIndex)
    if amount <= 0 then return end
    local baseItemId = INVENTORY.GetContainerItemId(itemId)
    if DATABASE.Items and DATABASE.Items[baseItemId] then
        local costObject = SpawnItem(COSTS_PANEL, COST_ITEM_ASSET, costObjects)
        SetIcon(costObject, DATABASE.Items[baseItemId])

        local playerAmount = INVENTORY.GetAmountInInventory(LOCAL_PLAYER, inventoryId, itemType, itemId, slotIndex, false)
        SetAmountText(costObject, playerAmount, amount)
    end
end

function CreateCurrencyCostItem(currencyId, amount)
    if amount <= 0 then return end
    if DATABASE.Currencies and DATABASE.Currencies[currencyId] then
        local costObject = SpawnItem(COSTS_PANEL, COST_ITEM_ASSET, costObjects)
        SetIcon(costObject, DATABASE.Currencies[currencyId])

        local playerAmount = CURRENCY.GetCurrencyAmount(LOCAL_PLAYER, currencyId)
        SetAmountText(costObject, playerAmount, amount)
    end
end

function SpawnItem(panel, itemAsset, collection, collectionId)
    local itemObject = World.SpawnAsset(itemAsset, { parent = panel })
    local columns = math.floor(panel.width / itemObject.width)
    local row = math.floor(#collection / columns)
    local column = #collection % columns

    itemObject.x = column * itemObject.width
    itemObject.y = row * itemObject.height

    if collectionId then
        collection[collectionId] = itemObject
    else
        table.insert(collection, itemObject)
    end

    return itemObject
end

function SetIcon(costObject, iconData)
    local icon = costObject:GetCustomProperty("Icon"):WaitForObject() or costObject:FindDescendantByType("UIImage")
    if icon then
        if iconData.IsKitbashed2DIcon then
            icon:SetImage(nil)
            icon:SetColor(Color.New(0, 0, 0, 0))
            World.SpawnAsset(iconData.IconAsset, { parent = icon })
        elseif iconData.Is3DIcon then
            ICON_MANAGER.SetIcon(icon, iconData.IconCameraId, iconData.IconAsset, CameraCaptureResolution.SMALL)
        elseif iconData.IsImageIcon then
            icon:SetImage(iconData.IconAsset)
        else
            icon.visibility = Visibility.FORCE_OFF
        end
    end
end

function SetAmountText(costObject, playerAmount, amount)
    local amountText = costObject:GetCustomProperty("Amount"):WaitForObject() or costObject:FindDescendantByType("UIText")
    if amountText then
        amountText.text = string.format("%d / %d", playerAmount, amount)
    end
end

function ClearBuffs()
    for _, buffObject in pairs(buffObjects) do
        buffObject:Destroy()
    end
    buffObjects = {}
end

function CreateBuffObject(buffId)
    return SpawnItem(BUFFS_PANEL, BUFF_ITEM_ASSET, buffObjects, buffId)
end

function UpdateSize()
    local currentHeight = initialHeight

    if PROGRESS_BAR:IsVisibleInHierarchy() then
        currentHeight = currentHeight + PROGRESS_BAR.height + PADDING
        COSTS_PANEL.y = PROGRESS_BAR.y + PROGRESS_BAR.height
    else
        COSTS_PANEL.y = PROGRESS_BAR.y
    end

    if #costObjects > 0 then
        local columns = math.floor(COSTS_PANEL.width / costObjects[1].width)
        local costsHeight = ((costObjects[1].height + PADDING) * math.ceil(#costObjects / columns))
        currentHeight = currentHeight + costsHeight

        BUFFS_PANEL.y = COSTS_PANEL.y + costsHeight + BUFF_PANEL_OFFSET_Y
    else
        BUFFS_PANEL.y = COSTS_PANEL.y + BUFF_PANEL_OFFSET_Y
    end

    local buffObjectCount = 0
    local buffObjectWidth = 0
    local buffObjectHeight = 0

    for _, buffObject in pairs(buffObjects) do
        buffObjectWidth = buffObject.width
        buffObjectHeight = buffObject.height
        buffObjectCount = buffObjectCount + 1
    end

    if buffObjectCount > 0 then
        local columns = math.floor(BUFFS_PANEL.width / buffObjectWidth)
        currentHeight = currentHeight + ((buffObjectHeight + PADDING) * math.ceil(buffObjectCount / columns)) + BUFF_PANEL_OFFSET_Y
    end

    PANEL.height = currentHeight
end

function GetNameForPlaceable(placeableId)
    if DATABASE.Placeables and DATABASE.Placeables[placeableId] and DATABASE.Placeables[placeableId].Name and DATABASE.Placeables[placeableId].Name ~= "" then
        return DATABASE.Placeables[placeableId].Name
    else
        -- Fall back to using the Item Id
        return GetNameForItem(placeableId)
    end
end

function GetNameForProducer(producerId)
    if DATABASE.Producers and DATABASE.Producers[producerId] and DATABASE.Producers[producerId].Name and DATABASE.Producers[producerId].Name ~= "" then
        return DATABASE.Producers[producerId].Name
    else
        -- Fall back to using the Item Id
        return GetNameForItem(producerId)
    end
end

function GetNameForItem(itemId)
    if itemId then
        itemId = INVENTORY.GetContainerItemId(itemId)
    end

    if not itemId and currentToolType == EQUIPMENT.GetSetting(EQUIPMENT.Setting.HandToolType) then
        return "hands"
    end

    -- See if an ItemData exists for this Item
    if DATABASE.Items and DATABASE.Items[itemId] and DATABASE.Items[itemId].Name and DATABASE.Items[itemId].Name ~= "" then
        return DATABASE.Items[itemId].Name
    else
        if CRAFTING.IsCraftingStationRegistered(itemId) then
            itemId = CRAFTING.GetCraftingStationState(itemId).placeableId
            if DATABASE.Items and DATABASE.Items[itemId] and DATABASE.Items[itemId].Name and DATABASE.Items[itemId].Name ~= "" then
                return DATABASE.Items[itemId].Name
            end
        end

        -- Fall back to using the Item Id
        return itemId
    end
end

function ShowPanel(position)
    -- No position means we don't have a valid target
    if position then
        if hideTask then
            hideTask:Cancel()
        end

        hideTask = Task.Spawn(HidePanelAfterDelay)

        if not ALWAYS_VISIBLE then
            PANEL.visibility = Visibility.INHERIT
        end

        if POSITION_OVER_INTERACTABLE then
            local screenPosition = UI.GetScreenPosition(position)
            if screenPosition then
                local targetX = screenPosition.x + POSITION_OFFSET.x
                local targetY = screenPosition.y + POSITION_OFFSET.y

                if STAY_ON_SCREEN then
                    local screenSize = UI.GetScreenSize() - SCREEN_EDGE_PADDING

                    if targetX < SCREEN_EDGE_PADDING.x then
                        targetX = SCREEN_EDGE_PADDING.x
                    elseif targetX + PANEL.width > screenSize.x then
                        targetX = screenSize.x - PANEL.width
                    end

                    if targetY < SCREEN_EDGE_PADDING.y then
                        targetY = SCREEN_EDGE_PADDING.y
                    elseif targetY + PANEL.height > screenSize.y then
                        targetY = screenSize.y - PANEL.height
                    end

                    if UI_LIBRARY.IsCenter(PANEL.anchor) then
                        targetX = targetX - PANEL.width * 0.5
                    elseif UI_LIBRARY.IsRight(PANEL.anchor) then
                        targetX = targetX - PANEL.width
                    end

                    if UI_LIBRARY.IsMiddle(PANEL.anchor) then
                        targetY = targetY - PANEL.height * 0.5
                    elseif UI_LIBRARY.IsBottom(PANEL.anchor) then
                        targetY = targetY - PANEL.height
                    end
                end

                PANEL.x = targetX
                PANEL.y = targetY
            end
        end
    else
        if not ALWAYS_VISIBLE then
            PANEL.visibility = Visibility.FORCE_OFF
        end
    end
end

function HidePanelAfterDelay()
    Task.Wait(0.1)

    if Object.IsValid(PANEL) then
        ShowPanel(nil)
    end

    hideTask = nil
end

function OnTryPlacePlaceableUpdate(placeableId, position, toolType, equipmentSettings, replicatorId, replicatorIdentifier)
    if placeableId then
        UpdateInfo(nil, placeableId, "PlacePlaceable", nil, toolType, equipmentSettings, position, replicatorId, replicatorIdentifier)
    end
end

function OnCanEquipmentInteract(interactionType, target, toolType, equipmentSettings)
    local producerTargetId = PRODUCERS.FindProducerBaseIdByAncestors(target)
    if producerTargetId then
        local producerId = PRODUCERS.GetProducerBaseState(producerTargetId).producerId
        if interactionType ~= "RemovePlaceable" and producerId then
            UpdateInfo(producerTargetId, producerId, interactionType, target, toolType, equipmentSettings, target:GetWorldPosition())
        else
            local placeableId = PLACEABLES.GetPlaceableState(producerTargetId).placeableId
            if placeableId then
                UpdateInfo(producerTargetId, placeableId, interactionType, target, toolType, equipmentSettings, target:GetWorldPosition())
            end
        end
    else
        local placeableTargetId = PLACEABLES.FindPlaceableIdByAncestors(target)
        if placeableTargetId then
            local placeableId = PLACEABLES.GetPlaceableState(placeableTargetId).placeableId
            if placeableId then
                local craftingStationId = CRAFTING.FindCraftingStationIdByAncestors(target)
                if craftingStationId then
                    UpdateInfo(placeableTargetId, craftingStationId, interactionType, target, toolType, equipmentSettings, target:GetWorldPosition())
                else
                    UpdateInfo(placeableTargetId, placeableId, interactionType, target, toolType, equipmentSettings, target:GetWorldPosition())
                end
            end
        else
            local gatherableTargetId = GATHERABLES.FindGatherableGroupId(target)
            local gatherableData

            if gatherableTargetId then
                local gatherableIndex = GATHERABLES.FindGatherableIndex(gatherableTargetId, target)
                gatherableData = GATHERABLES.GetGatherableAtIndex(gatherableTargetId, gatherableIndex).gatherableData
            else
                gatherableTargetId = STATIC_GATHERABLES.FindGatherableGroupId(target)
                if gatherableTargetId then
                    local gatherableIndex = STATIC_GATHERABLES.FindGatherableIndex(gatherableTargetId, target)
                    gatherableData = STATIC_GATHERABLES.GetGatherableAtIndex(gatherableTargetId, gatherableIndex).gatherableData
                end
            end

            if gatherableTargetId then
                UpdateInfo(gatherableTargetId, gatherableData.Name, interactionType, target, toolType, equipmentSettings, target:GetWorldPosition())
            end
        end
    end
end

function OnDestroy()
    if hideTask then
        hideTask:Cancel()
        hideTask = nil
    end

    DATABASE.UnregisterDataChangeHandler(producerDataChangeHandlerId)

    for _, listener in ipairs(listeners) do
        listener:Disconnect()
    end
    listeners = nil
end

listeners = {
    Events.Connect("TryPlacePlaceableUpdate", OnTryPlacePlaceableUpdate),
    Events.Connect("CanEquipmentInteract", OnCanEquipmentInteract)
}

if not ALWAYS_VISIBLE then
    PANEL.visibility = Visibility.FORCE_OFF
end

script.destroyEvent:Connect(OnDestroy)