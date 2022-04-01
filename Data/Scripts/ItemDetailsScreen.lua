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
    A simple screen for displaying the 'Details' information on ItemData.
--]]

-- Internal Variables
local COMPONENT_ROOT = script:GetCustomProperty("ComponentRoot"):WaitForObject()
local DATABASE = require(script:GetCustomProperty("APIDatabase")) ---@type APIDatabase
local INVENTORY = require(script:GetCustomProperty("APIInventory")) ---@type APIInventory
local ICON_MANAGER = require(script:GetCustomProperty("APIIconManager")) ---@type APIIconManager

local ICON_CAMERA_ID = COMPONENT_ROOT:GetCustomProperty("IconCameraId") ---@type string
local ICON = COMPONENT_ROOT:GetCustomProperty("Icon"):WaitForObject() ---@type UIImage
local TITLE = COMPONENT_ROOT:GetCustomProperty("Title"):WaitForObject() ---@type UIText
local DETAILS_TEXT = COMPONENT_ROOT:GetCustomProperty("DetailsText"):WaitForObject() ---@type UIText
local CLOSE_BUTTON = COMPONENT_ROOT:GetCustomProperty("CloseButton"):WaitForObject() ---@type UIButton
local STARTING_OFFSET = COMPONENT_ROOT:GetCustomProperty("StartingOffset") ---@type Vector2

function Initialize(data)
    if CLOSE_BUTTON then
        CLOSE_BUTTON.clickedEvent:Connect(Close)
    end

    local itemData = DATABASE.Items[data.itemId]

    ICON.visibility = Visibility.INHERIT
    ICON:SetColor(Color.New(1, 1, 1, 1))

    if itemData.DetailsIconAsset then
        if itemData.IsDetailsKitbashed2DIcon then
            ICON:SetPlayerProfile(nil)
            ICON:SetColor(Color.New(0, 0, 0, 0))
            World.SpawnAsset(itemData.DetailsIconAsset, { parent = ICON })
        elseif itemData.IsDetails3DIcon then
            ICON_MANAGER.SetIcon(ICON, ICON_CAMERA_ID, itemData.DetailsIconAsset, CameraCaptureResolution.MEDIUM)
        elseif itemData.IsDetailsImageIcon then
            ICON:SetImage(itemData.DetailsIconAsset)
        else
            ICON:SetImage(INVENTORY.GetSetting(data.inventoryId, INVENTORY.Setting.DefaultIcon))
        end
    else
        if itemData.IsKitbashed2DIcon then
            ICON:SetPlayerProfile(nil)
            ICON:SetColor(Color.New(0, 0, 0, 0))
            World.SpawnAsset(itemData.IconAsset, { parent = ICON })
        elseif itemData.Is3DIcon then
            ICON_MANAGER.SetIcon(ICON, ICON_CAMERA_ID, itemData.IconAsset, CameraCaptureResolution.MEDIUM)
        elseif itemData.IsImageIcon then
            ICON:SetImage(itemData.IconAsset)
        else
            ICON:SetImage(INVENTORY.GetSetting(data.inventoryId, INVENTORY.Setting.DefaultIcon))
        end
    end

    if not itemData then
        TITLE.text = "Data Missing"
        DETAILS_TEXT.text = ""
        DETAILS_TEXT.height = 0
    else
        TITLE.text = itemData.Name
        DETAILS_TEXT.text = itemData.DetailsText

        Task.Spawn(function()
            local textSize
            while not textSize do
                textSize = DETAILS_TEXT:ComputeApproximateSize()
                Task.Wait()
            end

            DETAILS_TEXT.height = textSize.y
        end)
    end

    COMPONENT_ROOT.x = STARTING_OFFSET.x
    COMPONENT_ROOT.y = STARTING_OFFSET.y
end

function Close()
    if Object.IsValid(COMPONENT_ROOT) then
        COMPONENT_ROOT:Destroy()
    end
end