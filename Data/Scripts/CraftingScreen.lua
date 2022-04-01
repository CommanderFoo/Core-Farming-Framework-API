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
    A simple Crafting Screen that allows for crafting recipes.
--]]

-- Internal Variables
local COMPONENT_ROOT = script:GetCustomProperty("ComponentRoot"):WaitForObject()
local RECIPE_PANEL_CONTROLLER = script:GetCustomProperty("RecipePanelController"):WaitForObject()
local CRAFTING_PANEL_CONTROLLER = script:GetCustomProperty("CraftingPanelController"):WaitForObject()
local READY_PANEL_CONTROLLER = script:GetCustomProperty("ReadyPanelController"):WaitForObject()

---@type APICrafting
local CRAFTING = require(script:GetCustomProperty("APICrafting"))
---@type APIDatabase
local DATABASE = require(script:GetCustomProperty("APIDatabase"))

local ICON_CAMERA_ID = COMPONENT_ROOT:GetCustomProperty("IconCameraId")
local TITLE = COMPONENT_ROOT:GetCustomProperty("Title"):WaitForObject()
local CLOSE_BUTTON = COMPONENT_ROOT:GetCustomProperty("CloseButton"):WaitForObject()

-- Constants
local RECIPE_PANEL = RECIPE_PANEL_CONTROLLER.context
local CRAFTING_PANEL = CRAFTING_PANEL_CONTROLLER.context
local READY_PANEL = READY_PANEL_CONTROLLER.context
local LOCAL_PLAYER = Game.GetLocalPlayer()
local PANEL = {
    Recipes = 1,
    Crafting = 2,
    Ready = 3
}

-- Private Variables
local craftingStationId
local craftingStationDataId
local craftingStationData
local craftingStationItemData
local currentPanel
local listeners

function Initialize(id, dataId)
    craftingStationId = id
    craftingStationDataId = dataId

    -- Support crafting with or without a station
    if craftingStationDataId then
        craftingStationData = DATABASE.CraftingStations[craftingStationDataId]
        craftingStationItemData = DATABASE.Items[craftingStationData.ItemId]
    else
        -- Ensure we are allowed to open the screen for global crafting
        if not CRAFTING.GetSetting(CRAFTING.Setting.AllowGlobalCrafting) then
            Close()
            return
        end
    end

    COMPONENT_ROOT.destroyEvent:Connect(Cleanup)

    if CLOSE_BUTTON then
        CLOSE_BUTTON.clickedEvent:Connect(Close)
    end

    if TITLE then
        if craftingStationItemData then
            TITLE.text = craftingStationItemData.Name
        else
            TITLE.text = "Crafting"
        end
    end

    UpdateState()

    listeners = {
        Events.Connect(CRAFTING.Events.StartedCrafting, OnCraftingEvent),
        Events.Connect(CRAFTING.Events.CraftingReadyForCollect, OnCraftingEvent),
        Events.Connect(CRAFTING.Events.CraftingCollected, OnCraftingCollected),
        Events.Connect(CRAFTING.Events.CraftingReset, OnCraftingReset)
    }
end

function Cleanup()
    if currentPanel then
        currentPanel.Cleanup()
        currentPanel = nil
    end

    if listeners then
        for _, listener in ipairs(listeners) do
            listener:Disconnect()
        end
        listeners = nil
    end
end

function Close()
    COMPONENT_ROOT:Destroy()
end

function UpdateState()
    if CRAFTING.IsCrafting(LOCAL_PLAYER, craftingStationId) then
        local state
        if craftingStationId then
            state = CRAFTING.GetCraftingStationState(craftingStationId)
        else
            state = CRAFTING.GetCraftingState(LOCAL_PLAYER.id)
        end

        if state.isReadyForCollect then
            ShowPanel(PANEL.Ready)
        else
            ShowPanel(PANEL.Crafting)
        end
    else
        ShowPanel(PANEL.Recipes)
    end
end

function ShowPanel(panelType)
    if currentPanel then
        currentPanel.Cleanup()
        currentPanel = nil
    end

    if panelType == PANEL.Recipes then
        currentPanel = RECIPE_PANEL
        RECIPE_PANEL.Initialize(craftingStationId, craftingStationDataId, ICON_CAMERA_ID)
    elseif panelType == PANEL.Crafting then
        currentPanel = CRAFTING_PANEL
        CRAFTING_PANEL.Initialize(craftingStationId, craftingStationDataId, ICON_CAMERA_ID)
    elseif panelType == PANEL.Ready then
        currentPanel = READY_PANEL
        READY_PANEL.Initialize(craftingStationId, craftingStationDataId, ICON_CAMERA_ID)
    end
end

function OnCraftingEvent(id, recipeId, amountToCraft)
    if id == craftingStationId then
        UpdateState()
    end
end

function OnCraftingCollected(id, recipeId, amountToCraft)
    if id == craftingStationId then
        Close()
    end
end

function OnCraftingReset(id)
    if id == craftingStationId then
        Close()
    end
end