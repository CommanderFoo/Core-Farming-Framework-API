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
    A simple Purchase Screen that allows for buying Purchaseables.
--]]

-- Internal Variables
local COMPONENT_ROOT = script:GetCustomProperty("ComponentRoot"):WaitForObject()

---@type APIPurchasing
local PURCHASING = require(script:GetCustomProperty("APIPurchasing"))
---@type APIInventory
local INVENTORY = require(script:GetCustomProperty("APIInventory"))
---@type APIDatabase
local DATABASE = require(script:GetCustomProperty("APIDatabase"))
---@type APIDrops
local DROPS = require(script:GetCustomProperty("APIDrops"))
---@type APIIconManager
local ICON_MANAGER = require(script:GetCustomProperty("APIIconManager"))
---@type APIInteractionManager
local INTERACTION = require(script:GetCustomProperty("APIInteractionManager"))
local INTERACTION_MODULE = require(script:GetCustomProperty("APIInteractionModule"))
---@type APIPlayerUpgrades
local UPGRADES = require(script:GetCustomProperty("APIPlayerUpgrades"))

local ICON_CAMERA_ID = COMPONENT_ROOT:GetCustomProperty("IconCameraId")
local TITLE = COMPONENT_ROOT:GetCustomProperty("Title"):WaitForObject()
local TABS = COMPONENT_ROOT:GetCustomProperty("Tabs"):WaitForObject()
local BUY_TAB = COMPONENT_ROOT:GetCustomProperty("BuyTab"):WaitForObject()
local SELL_TAB = COMPONENT_ROOT:GetCustomProperty("SellTab"):WaitForObject()
local CLOSE_BUTTON = COMPONENT_ROOT:GetCustomProperty("CloseButton"):WaitForObject()
local ITEMS_PANEL = COMPONENT_ROOT:GetCustomProperty("ItemsPanel"):WaitForObject()
local DETAILS_PANEL = COMPONENT_ROOT:GetCustomProperty("DetailsPanel"):WaitForObject()
local RESULTS_PANEL = COMPONENT_ROOT:GetCustomProperty("ResultsPanel"):WaitForObject()
local ITEM_TEMPLATE = COMPONENT_ROOT:GetCustomProperty("ItemTemplate")
local PADDING = COMPONENT_ROOT:GetCustomProperty("Padding")
local ICON = COMPONENT_ROOT:GetCustomProperty("Icon"):WaitForObject()
local NAME = COMPONENT_ROOT:GetCustomProperty("Name"):WaitForObject()
local DESCRIPTION = COMPONENT_ROOT:GetCustomProperty("Description"):WaitForObject()
local ITEMS_CONTAINER = COMPONENT_ROOT:GetCustomProperty("ItemsContainer"):WaitForObject()
local DETAILS_CONTAINER = COMPONENT_ROOT:GetCustomProperty("DetailsContainer"):WaitForObject()
local RESULTS_CONTAINER = COMPONENT_ROOT:GetCustomProperty("ResultsContainer"):WaitForObject()
local COST_TEMPLATE = COMPONENT_ROOT:GetCustomProperty("CostTemplate")
local OUTPUT_TEMPLATE = COMPONENT_ROOT:GetCustomProperty("OutputTemplate")
local CONFIRM_BUTTON = COMPONENT_ROOT:GetCustomProperty("ConfirmButton"):WaitForObject()
local PERK_PURCHASE_BUTTON = COMPONENT_ROOT:GetCustomProperty("PerkPurchaseButton"):WaitForObject()
local NO_ITEMS = COMPONENT_ROOT:GetCustomProperty("NoItems"):WaitForObject()
local ITEMS_TITLE = COMPONENT_ROOT:GetCustomProperty("ItemsTitle"):WaitForObject()
local DETAILS_TITLE = COMPONENT_ROOT:GetCustomProperty("DetailsTitle"):WaitForObject()
local RESULTS_TITLE = COMPONENT_ROOT:GetCustomProperty("ResultsTitle"):WaitForObject()
local DECREMENT_AMOUNT_BUTTON = COMPONENT_ROOT:GetCustomProperty("DecrementAmountButton"):WaitForObject()
local INCREMENT_AMOUNT_BUTTON = COMPONENT_ROOT:GetCustomProperty("IncrementAmountButton"):WaitForObject()
local AMOUNT = COMPONENT_ROOT:GetCustomProperty("Amount"):WaitForObject()

-- Constants
local PURCHASING_TAG = "PCH_"
local EVENT_ITEM_SELECTED = PURCHASING_TAG .. "storeItemSelected"
local EVENT_BUY_TAB_CLICKED = PURCHASING_TAG .. "buyTabClicked"
local EVENT_SELL_TAB_CLICKED = PURCHASING_TAG .. "sellTabClicked"
local SELECTION_SET = "StoreScreen"
local LOCAL_PLAYER = Game.GetLocalPlayer()

-- Private Variables
local purchaseableDatas
local sellableDatas
local purchaseScreenId
local sellScreenId
local currentStoreId
local currentIndex
local currentPurchaseLimit = 0
local currentIsLocked = false
local currentAmount = 1
local itemObjects = {}
local itemControllers = {}
local dropObjects = {}
local costObjects = {}
local listeners = {}
local showBuyScreen
local storeItemDatas
local storeTitle
local resizeTask

function Initialize(pDatas, sDatas, title, isBuyScreen, pScreenId, sScreenId, storeId)
    purchaseableDatas = pDatas
    sellableDatas = sDatas
    storeTitle = title
    purchaseScreenId = pScreenId
    sellScreenId = sScreenId
    showBuyScreen = isBuyScreen
    currentStoreId = storeId

    COMPONENT_ROOT.destroyEvent:Connect(Cleanup)

    if CLOSE_BUTTON then
        CLOSE_BUTTON.clickedEvent:Connect(Close)
    end

    TITLE.text = storeTitle or "Store"

    -- Show tabs if we have data for both buying and selling
    if #purchaseableDatas > 0 and #sellableDatas > 0 then
        TABS.visibility = Visibility.FORCE_ON
    else
        TABS.visibility = Visibility.FORCE_OFF
        TITLE.width = TITLE.width + TABS.width
    end

    if showBuyScreen then
        ITEMS_TITLE.text = "Stock"
        DETAILS_TITLE.text = "Details"
        RESULTS_TITLE.text = "Price"
        CONFIRM_BUTTON.text = "Buy"

        BUY_TAB.isInteractable = false
        storeItemDatas = purchaseableDatas
    else
        ITEMS_TITLE.text = "Looking For"
        DETAILS_TITLE.text = "Details"
        RESULTS_TITLE.text = "Profit"
        CONFIRM_BUTTON.text = "Sell"

        SELL_TAB.isInteractable = false
        storeItemDatas = sellableDatas
    end

    if #storeItemDatas > 0 then
        currentIndex = 1

        BUY_TAB.clickedEvent:Connect(HandleBuyTabClicked)
        SELL_TAB.clickedEvent:Connect(HandleSellTabClicked)
        DECREMENT_AMOUNT_BUTTON.clickedEvent:Connect(HandleDecrementAmountButtonClicked)
        INCREMENT_AMOUNT_BUTTON.clickedEvent:Connect(HandleIncrementAmountButtonClicked)
        CONFIRM_BUTTON.clickedEvent:Connect(HandleConfirmButtonClicked)
        PERK_PURCHASE_BUTTON.clickedEvent:Connect(HandlePerkPurchaseButtonClicked)

        table.insert(listeners, LOCAL_PLAYER.perkChangedEvent:Connect(HandlePerkChangedEvent))
        table.insert(listeners, LOCAL_PLAYER.privateNetworkedDataChangedEvent:Connect(HandlePrivateNetworkedDataChanged))
        table.insert(listeners, Events.Connect(EVENT_ITEM_SELECTED, HandleItemSelected))
        table.insert(listeners, Events.Connect(EVENT_BUY_TAB_CLICKED, Close))
        table.insert(listeners, Events.Connect(EVENT_SELL_TAB_CLICKED, Close))
        table.insert(listeners, Events.Connect(INVENTORY.Events.InventoryAdded, HandleInventoryChanged))
        table.insert(listeners, Events.Connect(INVENTORY.Events.InventoryRemoved, HandleInventoryChanged))
        table.insert(listeners, Events.Connect(INVENTORY.Events.InventoryCleared, HandleInventoryCleared))

        SetupItems()
        SelectItem()

        ITEMS_PANEL.visibility = Visibility.INHERIT
        DETAILS_PANEL.visibility = Visibility.INHERIT
        RESULTS_PANEL.visibility = Visibility.INHERIT
        NO_ITEMS.visibility = Visibility.FORCE_OFF
    else
        ITEMS_PANEL.visibility = Visibility.FORCE_OFF
        DETAILS_PANEL.visibility = Visibility.FORCE_OFF
        RESULTS_PANEL.visibility = Visibility.FORCE_OFF
        NO_ITEMS.visibility = Visibility.INHERIT
    end

end

function HandlePrivateNetworkedDataChanged(player, key)
    if PURCHASING.IsPurchasingKey(key) then
        local storeId = PURCHASING.GetStoreIdFromKey(key)

        if storeId == currentStoreId then
            SetupItems()
            SelectItem()
        end
    end
end

function Cleanup()
    for _, listener in ipairs(listeners) do
        listener:Disconnect()
    end

    listeners = {}

    if showBuyScreen then
        PURCHASING.SetPendingPerkPurchase(LOCAL_PLAYER, nil)
    end
end

function Close()
    if Object.IsValid(COMPONENT_ROOT) then
        COMPONENT_ROOT:Destroy()
    end
end

function SetupItems()
    ClearItemObjects()

    local itemNum = 0
    local totalHeight = 0

    for _, storeItemData in ipairs(storeItemDatas) do
        local itemObject = World.SpawnAsset(ITEM_TEMPLATE, { parent = ITEMS_CONTAINER })
        itemObject.x = 0
        itemObject.y = itemNum * (itemObject.height + PADDING)
        itemNum = itemNum + 1
        totalHeight = totalHeight + itemObject.height + PADDING

        local itemControllerRef = itemObject:GetCustomProperty("Controller")
        if itemControllerRef then
            local itemController = itemControllerRef:WaitForObject().context
            if itemController and itemController.Initialize then
                itemController.Initialize(storeItemData, itemNum, ICON_CAMERA_ID)
                itemControllers[itemNum] = itemController
                UpdateItemState(itemNum)
            else
                warn("No Controller found for Store Screen Item UI. The \"Controller\" custom property may not be set, or the referenced controller script does not have an \"Initialize(purchaseableData|sellableData, index, cameraId)\" method")
            end
        end

        itemObjects[itemNum] = itemObject
    end

    ITEMS_CONTAINER.height = totalHeight
end

function ClearItemObjects()
    for _, object in pairs(itemObjects) do
        if Object.IsValid(object) then
            object:Destroy()
        end
    end

    itemObjects = {}
end

function HandleItemSelected(index)
    currentIndex = index

    SelectItem()
end

function SelectItem()
    local screenData = storeItemDatas[currentIndex]

    -- Set the selection on the Input Manager
    INTERACTION.DeselectAll(INTERACTION_MODULE.Module, SELECTION_SET, LOCAL_PLAYER)
    INTERACTION.Select(INTERACTION_MODULE.Module, itemObjects[currentIndex], SELECTION_SET, LOCAL_PLAYER)

    -- Setup icon
    if screenData.IsKitbashed2DIcon then
        ICON:SetImage(nil)
        ICON:SetColor(Color.New(0, 0, 0, 0))
        World.SpawnAsset(screenData.IconAsset, { parent = ICON })
    elseif screenData.Is3DIcon then
        ICON_MANAGER.SetIcon(ICON, ICON_CAMERA_ID, screenData.IconAsset, CameraCaptureResolution.MEDIUM)
    elseif screenData.IsImageIcon then
        ICON:SetImage(screenData.IconAsset)
    else
        ICON.visibility = Visibility.FORCE_OFF
    end

    UpdateItemState(currentIndex)

    if showBuyScreen then
        if currentAmount == 0 and (not currentPurchaseLimit or currentPurchaseLimit > 0) then
            currentAmount = 1
        elseif currentPurchaseLimit and currentPurchaseLimit > 0 and currentAmount > currentPurchaseLimit then
            currentAmount = currentPurchaseLimit
        end

        INCREMENT_AMOUNT_BUTTON.isInteractable = (not currentPurchaseLimit or currentAmount < currentPurchaseLimit)
                                                and PURCHASING.CanAfford(LOCAL_PLAYER, screenData, currentAmount + 1)
    else
        local maxSellable = PURCHASING.GetSellLimit(LOCAL_PLAYER, screenData)
        currentAmount = math.min(currentAmount, maxSellable)
        if currentAmount <= 0 then currentAmount = 1 end

        INCREMENT_AMOUNT_BUTTON.isInteractable = PURCHASING.CanSell(LOCAL_PLAYER, screenData, currentAmount + 1)
    end

    DECREMENT_AMOUNT_BUTTON.isInteractable = (currentAmount > 1)

    NAME.text = screenData.Name
    DESCRIPTION.text = screenData.Description
    AMOUNT.text = string.format("x%d", currentAmount)

    if showBuyScreen and PURCHASING.IsPerkPurchase(screenData) then
        CONFIRM_BUTTON.visibility = Visibility.FORCE_OFF
        PERK_PURCHASE_BUTTON.visibility = Visibility.FORCE_ON
        PERK_PURCHASE_BUTTON:SetPerkReference(screenData.PerkReference)
    else
        CONFIRM_BUTTON.visibility = Visibility.FORCE_ON
        PERK_PURCHASE_BUTTON.visibility = Visibility.FORCE_OFF
    end

    -- Setup details and results
    ClearCosts()
    ClearDrops()

    if resizeTask then
        resizeTask:Cancel()
    end

    resizeTask = Task.Spawn(function()
        local textSize
        while not textSize do
            textSize = DESCRIPTION:ComputeApproximateSize()
            Task.Wait()
        end

        DETAILS_CONTAINER.y = DESCRIPTION.y + textSize.y + 40
    end)

    if showBuyScreen then
        SetupDrops(DETAILS_CONTAINER)

        -- Don't show costs for a Perk purchase
        if PURCHASING.IsPerkPurchase(screenData) then
            return
        end

        SetupCosts(RESULTS_CONTAINER)

        CONFIRM_BUTTON.isInteractable = not currentIsLocked
                                        and (not currentPurchaseLimit or currentPurchaseLimit > 0)
                                        and PURCHASING.CanAfford(LOCAL_PLAYER, screenData, currentAmount)
    else
        SetupCosts(DETAILS_CONTAINER)
        SetupDrops(RESULTS_CONTAINER)

        local canAfford = true
        for _, inputData in pairs(screenData.Inputs) do
            if type(inputData) == "table" then
                if not INVENTORY.HasAmountInInventory(LOCAL_PLAYER, nil, INVENTORY.ItemType.Item, inputData.ItemId, inputData.Amount) then
                    canAfford = false
                    break
                end
            end
        end

        CONFIRM_BUTTON.isInteractable = canAfford
    end
end

function UpdateItemState(index)
    if showBuyScreen then
        local display = itemControllers[index]

        -- Check if this purchase is locked by unmet upgrade prerequisites
        local isLocked = false
        local drops = { CoreString.Split(purchaseableDatas[index].DropIds, ",") }
        for _, id in ipairs(drops) do
            local dropId = CoreString.Trim(id)
            if UPGRADES.IsUpgradeRegistered(dropId) and not UPGRADES.IsPrerequisitesMet(Game.GetLocalPlayer(), dropId) then
                isLocked = true
                display.SetLocked()
                break
            end
        end

        -- Check if this purchase has limited availability due to purchase limits
        local purchaseLimit = PURCHASING.GetAvailableAmount(Game.GetLocalPlayer(), purchaseableDatas[index], currentStoreId)
        if not isLocked then
            if not purchaseLimit or purchaseLimit > 0 then
                itemControllers[index].SetAvailable(purchaseLimit)
            else
                itemControllers[index].SetSoldOut()
            end
        end

        if index == currentIndex then
            currentIsLocked = isLocked
            currentPurchaseLimit = purchaseLimit
        end
    else
        local canSellAny = PURCHASING.CanSell(Game.GetLocalPlayer(), sellableDatas[index], 1)
        if canSellAny then
            itemControllers[index].SetAvailable()
        else
            itemControllers[index].SetUnavailable()
        end
    end
end

function ClearDrops()
    for _, dropObject in ipairs(dropObjects) do
        if Object.IsValid(dropObject) then
            dropObject:Destroy()
        end
    end

    dropObjects = {}
end

function ClearCosts()
    for _, costObject in ipairs(costObjects) do
        if Object.IsValid(costObject) then
            costObject:Destroy()
        end
    end

    costObjects = {}
end

function SetupCosts(container)
    local screenData = storeItemDatas[currentIndex]
    local row = 0
    local column = 0
    local totalHeight = 0

    for _, inputData in pairs(screenData.Inputs) do
        if type(inputData) == "table" then
            local costObject = World.SpawnAsset(COST_TEMPLATE, { parent = container })
            if (column + 1) * (costObject.width + PADDING) <= container.width then
                costObject.x = column * (costObject.width + PADDING)
                costObject.y = row * (costObject.height + PADDING)
            else
                row = row + 1
                column = 0
                totalHeight = totalHeight + costObject.height + PADDING

                costObject.x = column * (costObject.width + PADDING)
                costObject.y = row * (costObject.height + PADDING)
            end

            column = column + 1

            local costControllerRef = costObject:GetCustomProperty("Controller")
            if costControllerRef then
                local costController = costControllerRef:WaitForObject().context
                if costController and costController.Initialize then
                    costController.Initialize(inputData, currentAmount, ICON_CAMERA_ID)
                else
                    local errorMessage = "No Controller found for Store Screen Cost UI. The \"Controller\" custom property may not be set, or the referenced controller script does not have an \"Initialize(inputData, cameraId)\" method"
                    warn(errorMessage)
                    Events.Broadcast("Error", errorMessage)
                end
            end

            table.insert(costObjects, costObject)
        end
    end

    container.height = totalHeight
end

function SetupDrops(container)
    local screenData = storeItemDatas[currentIndex]
    local potentialDrops = DROPS.GetDropPercents(screenData.Drops)

    local row = 0
    local column = 0
    local outputObject

    for itemId, potentialDrop in pairs(potentialDrops.Items) do
        local itemData = DATABASE.Items[itemId]
        row, column, outputObject = CreateDropObject(container, row, column, itemData, potentialDrop)
    end

    for currencyId, potentialDrop in pairs(potentialDrops.Currencies) do
        local currencyData = DATABASE.Currencies[currencyId]
        row, column, outputObject = CreateDropObject(container, row, column, currencyData, potentialDrop)
    end

    if outputObject then
        container.height = (outputObject.height + PADDING) * row
    end
end

function CreateDropObject(container, row, column, outputData, potentialDrop)
    local dropObject = World.SpawnAsset(OUTPUT_TEMPLATE, { parent = container })

    if (column + 1) * (dropObject.width + PADDING) <= container.width then
        dropObject.x = column * (dropObject.width + PADDING)
        dropObject.y = row * (dropObject.height + PADDING)
    else
        row = row + 1
        column = 0

        dropObject.x = column * (dropObject.width + PADDING)
        dropObject.y = row * (dropObject.height + PADDING)
    end

    column = column + 1

    local outputControllerRef = dropObject:GetCustomProperty("Controller")
    if outputControllerRef then
        local outputController = outputControllerRef:WaitForObject().context
        if outputController and outputController.Initialize then
            outputController.Initialize(outputData, potentialDrop, currentAmount, ICON_CAMERA_ID)
        else
            local errorMessage = "No Controller found for Store Screen Output UI. The \"Controller\" custom property may not be set, or the referenced controller script does not have an \"Initialize(potentialDrop, cameraId)\" method"
            warn(errorMessage)
            Events.Broadcast("Error", errorMessage)
        end
    end

    table.insert(dropObjects, dropObject)

    return row, column, dropObject
end

function HandleDecrementAmountButtonClicked(button)
    if currentAmount > 1 then
        currentAmount = currentAmount - 1
        SelectItem()
    end
end

function HandleIncrementAmountButtonClicked(button)
    if showBuyScreen then
        if PURCHASING.CanAfford(LOCAL_PLAYER, storeItemDatas[currentIndex], currentAmount + 1) then
            if not currentPurchaseLimit or currentPurchaseLimit > currentAmount then
                currentAmount = currentAmount + 1
                SelectItem()
            end
        end
    else
        if PURCHASING.CanSell(LOCAL_PLAYER, storeItemDatas[currentIndex], currentAmount + 1) then
            currentAmount = currentAmount + 1
            SelectItem()
        end
    end
end

function HandleBuyTabClicked(button)
    Events.Broadcast(EVENT_BUY_TAB_CLICKED, purchaseableDatas, sellableDatas, storeTitle, true, purchaseScreenId, sellScreenId)
    Close()
end

function HandleSellTabClicked(button)
    Events.Broadcast(EVENT_SELL_TAB_CLICKED, purchaseableDatas, sellableDatas, storeTitle, false, purchaseScreenId, sellScreenId)
    Close()
end

function HandleConfirmButtonClicked(button)
    if showBuyScreen then
        local success, errorMessage = PURCHASING.Purchase(LOCAL_PLAYER, storeItemDatas[currentIndex], currentAmount, currentStoreId)
        if success then
            if currentPurchaseLimit and currentPurchaseLimit < currentAmount then
                currentAmount = currentPurchaseLimit
                if currentAmount < 1 then currentAmount = 1 end
            end

            SelectItem()
        else
            Events.Broadcast("Error", errorMessage)
        end
    else
        local success, errorMessage = PURCHASING.Sell(LOCAL_PLAYER, storeItemDatas[currentIndex], currentAmount)
        if success then
            local maxSellable = PURCHASING.GetSellLimit(LOCAL_PLAYER, sellableDatas[currentIndex])
            currentAmount = math.min(currentAmount, maxSellable)
            if currentAmount <= 0 then currentAmount = 1 end

            SelectItem()
        else
            Events.Broadcast("Error", errorMessage)
        end
    end
end

function HandlePerkChangedEvent(player, perkReference)
    -- No action on perk changes
end

function HandlePerkPurchaseButtonClicked(button)
    PURCHASING.SetPendingPerkPurchase(LOCAL_PLAYER, purchaseableDatas[currentIndex])
end

function HandleInventoryChanged(player, id, itemType, itemId, amountData)
    SelectItem()
end

function HandleInventoryCleared(player, id)
    SelectItem()
end