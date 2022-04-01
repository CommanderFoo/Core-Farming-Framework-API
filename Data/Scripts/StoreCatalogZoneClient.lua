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
    This is a simple script to allow for setting the display object, Purchaseable and Sellable datas for display in a
    Store Screen. It assumes there is a BroadcastEventComponentClient child that it can set the data on. This
    BroadcastEventComponent should broadcast a "PCH_storeCatalogClicked" event on the client.

    Purchaseable datas can be set by ids, tags or reference.

    If set by ids or tags, the Purchaseable datas must reside in a Database or have been added to APIDatabase in another way.

    If set by reference, the Purchaseable datas must exist on this object in a referenced parent object.
--]]

local COMPONENT_ROOT = script:GetCustomProperty("ComponentRoot"):WaitForObject()

local DATABASE = require(script:GetCustomProperty("APIDatabase")) ---@type APIDatabase
local INPUT_MANAGER = require(script:GetCustomProperty("APIInteractionManager")) ---@type APIInteractionManager
local TAGS = require(script:GetCustomProperty("APITags")) ---@type APITags

local BROADCAST_EVENT_COMPONENT = script:GetCustomProperty("BroadcastEventComponent"):WaitForObject()
local OUTLINE = script:GetCustomProperty("OutlineObject"):WaitForObject()

local STORE_ID = COMPONENT_ROOT:GetCustomProperty("StoreId") ---@type string
local DISPLAY_OBJECT = COMPONENT_ROOT:GetCustomProperty("DisplayObject"):WaitForObject() ---@type CoreObject

-- Private Variables
local purchaseableDatas = {}
local sellableDatas = {}

function Initialize()
    if not STORE_ID or STORE_ID == "" then
        warn("Store Catalog Zone requires a valid store id.")
        return
    end

    local storeData = DATABASE.Stores[STORE_ID]
    if not storeData then
        warn(string.format("Unable to find StoreData for Store Id %s, is it in the Stores section of the Database?", STORE_ID))
    end

    -- Find Datas
    if storeData.Purchaseables and storeData.Purchaseables ~= "" then
        purchaseableDatas = TAGS.FindMatchingData("Purchaseables", storeData.Purchaseables, true)
    end

    if storeData.Sellables and storeData.Sellables ~= "" then
        sellableDatas = TAGS.FindMatchingData("Sellables", storeData.Sellables, true)
    end

    if #purchaseableDatas == 0 and #sellableDatas == 0 then
        warn(string.format("You need to add at least one Sellable Id to the \"SellableIds\" and/or one Purchaseable Id to the \"PurchaseableIds\" Custom Properties on object: %s", COMPONENT_ROOT.name))
        return
    end

    -- Register Screen overrides if needed
    local purchaseScreenId = "Purchase Screen"
    local sellScreenId = "Sell Screen"

    if storeData.PurchaseScreenOverrideTemplate and storeData.PurchaseScreenOverrideTemplate ~= "" then
        purchaseScreenId = COMPONENT_ROOT.id .. " Purchase Screen"
        local screenData = {
            Screens = {
                [purchaseScreenId] = {
                    ScreenTemplate = storeData.PurchaseScreenOverrideTemplate,
                    OpenBinding = "",
                    CloseBinding = "",
                    OpenScreenParams = {},
                    ShowCursor = true
                }
            }
        }

        DATABASE.AppendData(screenData)
    end

    if storeData.SellScreenOverrideTemplate and storeData.SellScreenOverrideTemplate ~= "" then
        sellScreenId = COMPONENT_ROOT.id .. " Sell Screen"
        local screenData = {
            Screens = {
                [sellScreenId] = {
                    ScreenTemplate = storeData.SellScreenOverrideTemplate,
                    OpenBinding = "",
                    CloseBinding = "",
                    OpenScreenParams = {},
                    ShowCursor = true
                }
            }
        }

        DATABASE.AppendData(screenData)
    end

    -- Setup event data
    INPUT_MANAGER.SetData(COMPONENT_ROOT, BROADCAST_EVENT_COMPONENT, purchaseableDatas, sellableDatas, storeData.StoreName, #purchaseableDatas > 0, purchaseScreenId, sellScreenId, STORE_ID)

    -- Setup outline
    if Object.IsValid(DISPLAY_OBJECT) then
        OUTLINE:SetSmartProperty("Object To Outline", DISPLAY_OBJECT:GetReference())
    end

    OUTLINE.visibility = Visibility.FORCE_OFF
end

-- Let the Input Components register
Task.Wait()

Initialize()