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
    A simple Screen that allows for purchasing an item.
--]]

-- Internal Variables
local COMPONENT_ROOT = script:GetCustomProperty("ComponentRoot"):WaitForObject()

---@type APIIconManager
local ICON_MANAGER = require(script:GetCustomProperty("APIIconManager"))
---@type APIInventory
local INVENTORY = require(script:GetCustomProperty("APIInventory"))
---@type APIPurchasing
local PURCHASING = require(script:GetCustomProperty("APIPurchasing"))
---@type APIDatabase
local DATABASE = require(script:GetCustomProperty("APIDatabase"))
---@type APIDrops
local DROPS = require(script:GetCustomProperty("APIDrops"))
---@type APIPlayerUpgrades
local UPGRADES = require(script:GetCustomProperty("APIPlayerUpgrades"))

local ICON_CAMERA_ID = COMPONENT_ROOT:GetCustomProperty("IconCameraId")
local PURCHASE_LIMIT = COMPONENT_ROOT:GetCustomProperty("PurchaseLimit"):WaitForObject() ---@type UIText
local SOLD_OUT = COMPONENT_ROOT:GetCustomProperty("SoldOut"):WaitForObject() ---@type UIText
local LOCKED = COMPONENT_ROOT:GetCustomProperty("Locked"):WaitForObject() ---@type UIText
local DISABLED_ICON_TINT = COMPONENT_ROOT:GetCustomProperty("DisabledIconTint") ---@type Color
local NAME = COMPONENT_ROOT:GetCustomProperty("Name"):WaitForObject()
local DESCRIPTION = COMPONENT_ROOT:GetCustomProperty("Description"):WaitForObject()
local CLOSE_BUTTON = COMPONENT_ROOT:GetCustomProperty("CloseButton"):WaitForObject()
local PADDING = COMPONENT_ROOT:GetCustomProperty("Padding")
local ICON = COMPONENT_ROOT:GetCustomProperty("IconImage"):WaitForObject()
local DETAILS_CONTAINER = COMPONENT_ROOT:GetCustomProperty("DetailsContainer"):WaitForObject()
local RESULTS_CONTAINER = COMPONENT_ROOT:GetCustomProperty("ResultsContainer"):WaitForObject()
local COST_TEMPLATE = COMPONENT_ROOT:GetCustomProperty("CostTemplate")
local OUTPUT_TEMPLATE = COMPONENT_ROOT:GetCustomProperty("OutputTemplate")
local PURCHASE_BUTTON = COMPONENT_ROOT:GetCustomProperty("PurchaseButton"):WaitForObject()
local PERK_PURCHASE_BUTTON = COMPONENT_ROOT:GetCustomProperty("PerkPurchaseButton"):WaitForObject()
local DECREMENT_AMOUNT_BUTTON = COMPONENT_ROOT:GetCustomProperty("DecrementAmountButton"):WaitForObject()
local INCREMENT_AMOUNT_BUTTON = COMPONENT_ROOT:GetCustomProperty("IncrementAmountButton"):WaitForObject()
local AMOUNT = COMPONENT_ROOT:GetCustomProperty("Amount"):WaitForObject()

-- Constants
local LOCAL_PLAYER = Game.GetLocalPlayer()

-- Private Variables
local purchaseableData
local listeners = {}
local costObjects = {}
local dropObjects = {}
local currentAmount = 1
local resizeTask

function Initialize(data)
    purchaseableData = data

    COMPONENT_ROOT.destroyEvent:Connect(Cleanup)
    CLOSE_BUTTON.clickedEvent:Connect(Close)

    if not purchaseableData then
        local errorMessage = "Invalid Purchaseable Data"
        warn(errorMessage)
        Events.Broadcast("Error", errorMessage)
        return
    end

    DECREMENT_AMOUNT_BUTTON.clickedEvent:Connect(HandleDecrementAmountButtonClicked)
    INCREMENT_AMOUNT_BUTTON.clickedEvent:Connect(HandleIncrementAmountButtonClicked)

    -- Setup icon
    if purchaseableData.IsKitbashed2DIcon then
        ICON.visibility = Visibility.FORCE_OFF
        World.SpawnAsset(purchaseableData.IconAsset, { parent = ICON })
    elseif purchaseableData.Is3DIcon then
        ICON.visibility = Visibility.FORCE_ON
        ICON_MANAGER.SetIcon(ICON, ICON_CAMERA_ID, purchaseableData.IconAsset, CameraCaptureResolution.MEDIUM)
    elseif purchaseableData.IsImageIcon then
        ICON.visibility = Visibility.FORCE_ON
        ICON:SetImage(purchaseableData.IconAsset)
    else
        ICON.visibility = Visibility.FORCE_OFF
    end

    SetupDetails()

    table.insert(listeners, Events.Connect(INVENTORY.Events.InventoryAdded, HandleInventoryChanged))
    table.insert(listeners, Events.Connect(INVENTORY.Events.InventoryRemoved, HandleInventoryChanged))
    table.insert(listeners, Events.Connect(INVENTORY.Events.InventoryCleared, HandleInventoryCleared))

    if PURCHASING.IsPerkPurchase(purchaseableData) then
        PURCHASE_BUTTON.visibility = Visibility.FORCE_OFF
        PERK_PURCHASE_BUTTON:SetPerkReference(purchaseableData.PerkReference)
        PERK_PURCHASE_BUTTON.clickedEvent:Connect(HandlePerkPurchaseButtonClicked)

        table.insert(listeners, LOCAL_PLAYER.perkChangedEvent:Connect(HandlePerkChangedEvent))
    else
        PERK_PURCHASE_BUTTON.visibility = Visibility.FORCE_OFF
        PURCHASE_BUTTON.clickedEvent:Connect(HandlePurchaseButtonClicked)
    end
end

function Cleanup()
    for _, listener in ipairs(listeners) do
        listener:Disconnect()
    end
    listeners = {}

    PURCHASING.SetPendingPerkPurchase(LOCAL_PLAYER, nil)
end

function Close()
    COMPONENT_ROOT:Destroy()
end

function SetupDetails()
    if resizeTask then
        resizeTask:Cancel()
    end

    NAME.text = purchaseableData.Name
    DESCRIPTION.text = purchaseableData.Description
    AMOUNT.text = string.format("x%d", currentAmount)

    -- Check if this purchase is locked by unmet upgrade prerequisites
    local isLocked = false
    local drops = { CoreString.Split(purchaseableData.DropIds, ",") }
    for _, id in ipairs(drops) do
        local dropId = CoreString.Trim(id)
        if UPGRADES.IsUpgradeRegistered(dropId) and not UPGRADES.IsPrerequisitesMet(Game.GetLocalPlayer(), dropId) then
            isLocked = true
            ICON:SetColor(DISABLED_ICON_TINT)
            PURCHASE_LIMIT.visibility = Visibility.FORCE_OFF
            SOLD_OUT.visibility = Visibility.FORCE_OFF
            LOCKED.visibility = Visibility.FORCE_ON
            break
        end
    end

    -- Check if this purchase has limited availability due to purchase limits
    local purchaseLimit = PURCHASING.GetAvailableAmount(LOCAL_PLAYER, purchaseableData)
    if not isLocked then
        LOCKED.visibility = Visibility.FORCE_OFF

        if not purchaseLimit then
            ICON:SetColor(Color.WHITE)
            PURCHASE_LIMIT.visibility = Visibility.FORCE_OFF
            SOLD_OUT.visibility = Visibility.FORCE_OFF
        else
            if purchaseLimit > 0 then
                ICON:SetColor(Color.WHITE)
                PURCHASE_LIMIT.visibility = Visibility.FORCE_ON
                PURCHASE_LIMIT.text = tostring(purchaseLimit)
                SOLD_OUT.visibility = Visibility.FORCE_OFF
            else
                ICON:SetColor(DISABLED_ICON_TINT)
                PURCHASE_LIMIT.visibility = Visibility.FORCE_OFF
                SOLD_OUT.visibility = Visibility.FORCE_ON
            end
        end
    end

    resizeTask = Task.Spawn(function()
        local textSize
        while not textSize do
            if Object.IsValid(DESCRIPTION) then
                textSize = DESCRIPTION:ComputeApproximateSize()
                Task.Wait()
            else
                return
            end
        end

        DETAILS_CONTAINER.y = DESCRIPTION.y + textSize.y + 40
    end)

    -- Clear old costs
    ClearCosts()
    ClearDrops()

    SetupDrops(DETAILS_CONTAINER)

    -- Don't show costs for a Perk purchase
    if PURCHASING.IsPerkPurchase(purchaseableData) then
        return
    end

    SetupCosts(RESULTS_CONTAINER)

    DECREMENT_AMOUNT_BUTTON.isInteractable = (currentAmount > 1)
    INCREMENT_AMOUNT_BUTTON.isInteractable = not isLocked
                                             and (not purchaseLimit or currentAmount < purchaseLimit)
                                             and PURCHASING.CanAfford(LOCAL_PLAYER, purchaseableData, currentAmount + 1)
    PURCHASE_BUTTON.isInteractable = not isLocked
                                     and (not purchaseLimit or purchaseLimit > 0)
                                     and PURCHASING.CanAfford(LOCAL_PLAYER, purchaseableData, currentAmount)
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
        costObject:Destroy()
    end

    costObjects = {}
end

function SetupCosts(container)
    local row = 0
    local column = 0
    local totalHeight = 0

    for _, inputData in pairs(purchaseableData.Inputs) do
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
    local potentialDrops = DROPS.GetDropPercents(purchaseableData.Drops)

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
        SetupDetails()
    end
end

function HandleIncrementAmountButtonClicked(button)
    if PURCHASING.CanAfford(LOCAL_PLAYER, purchaseableData, currentAmount + 1) then
        local purchaseLimit = PURCHASING.GetAvailableAmount(LOCAL_PLAYER, purchaseableData)
        if not purchaseLimit or purchaseLimit > currentAmount then
            currentAmount = currentAmount + 1
            SetupDetails()
        end
    end
end

function HandlePurchaseButtonClicked(button)
    local success, errorMessage = PURCHASING.Purchase(LOCAL_PLAYER, purchaseableData, currentAmount)
    if not success then
        Events.Broadcast("Error", errorMessage)
    end
    Close()
end

function HandlePerkChangedEvent(player, perkReference)
    if perkReference == purchaseableData.PerkReference then
        Close()
    end
end

function HandlePerkPurchaseButtonClicked(button)
    PURCHASING.SetPendingPerkPurchase(LOCAL_PLAYER, purchaseableData)
end

function HandleInventoryChanged(player, id, itemType, itemId, amountData)
    if Object.IsValid(COMPONENT_ROOT) then
        SetupDetails()
    end
end

function HandleInventoryCleared(player, id)
    if Object.IsValid(COMPONENT_ROOT) then
        SetupDetails()
    end
end