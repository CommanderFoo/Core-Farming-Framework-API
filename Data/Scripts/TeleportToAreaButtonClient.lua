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
local BUTTON = script:GetCustomProperty("Button"):WaitForObject()
local ICON = script:GetCustomProperty("Icon"):WaitForObject()
local BINDING_BG = script:GetCustomProperty("BindingBackground"):WaitForObject()
local BINDING_UI_TEXT = script:GetCustomProperty("BindingText"):WaitForObject()

-- User Exposed Properties
local DESTINATION_AREA = COMPONENT_ROOT:GetCustomProperty("DestinationArea"):WaitForObject()
local DESTINATION_AREA_KEY = COMPONENT_ROOT:GetCustomProperty("DestinationAreaKey")
local DESTINATION_TARGET = COMPONENT_ROOT:GetCustomProperty("DestinationTarget"):WaitForObject()
local SPAWN_POINT_KEY = COMPONENT_ROOT:GetCustomProperty("SpawnPointKey")
local ICON_CAMERA_ID = COMPONENT_ROOT:GetCustomProperty("IconCameraId")
local ICON_ASSET = COMPONENT_ROOT:GetCustomProperty("IconAsset")
local IS_2D_ICON = COMPONENT_ROOT:GetCustomProperty("IsKitbashed2DIcon")
local IS_3D_ICON = COMPONENT_ROOT:GetCustomProperty("Is3DIcon")
local IS_IMAGE_ICON = COMPONENT_ROOT:GetCustomProperty("IsImageIcon")
local BINDING = COMPONENT_ROOT:GetCustomProperty("Binding")
local BUTTON_TEXT = COMPONENT_ROOT:GetCustomProperty("ButtonText")

-- Required APIs
---@type APIAreas
local AREAS = require(script:GetCustomProperty("APIAreas"))
---@type APIReliableEvents
local RELIABLE_EVENTS = require(script:GetCustomProperty("APIReliableEvents"))
---@type APIIconManager
local ICON_MANAGER = require(script:GetCustomProperty("APIIconManager"))
---@type APIUILibrary
local UI_LIBRARY = require(script:GetCustomProperty("APIUILibrary"))

-- Private Variables
local bindingListener
local inputTypeChangedListener

function TransferPlayer()
	local position, rotation
	if DESTINATION_TARGET then
		position = DESTINATION_TARGET:GetWorldPosition()
		rotation = DESTINATION_TARGET:GetWorldRotation()
	end

	local areaId
	if DESTINATION_AREA then
		areaId = DESTINATION_AREA.id
	end

	RELIABLE_EVENTS.BroadcastToServer(AREAS.Events.TeleportToArea, areaId, DESTINATION_AREA_KEY, position, rotation, SPAWN_POINT_KEY)
end

function OnClicked(button)
	TransferPlayer()
end

function OnInputTypeChanged(player, inputType)
	if player == Game.GetLocalPlayer() then
		BINDING_UI_TEXT.text = UI_LIBRARY.FormatInputType(Input.GetActionInputLabel(BINDING))
	end
end

function OnActionReleased(player, actionName)
    if player == Game.GetLocalPlayer() and actionName == BINDING then
        TransferPlayer()
    end
end

function OnDestroy(coreObject)
    if bindingListener then
        bindingListener:Disconnect()
        bindingListener = nil
    end
	if inputTypeChangedListener then
        inputTypeChangedListener:Disconnect()
        inputTypeChangedListener = nil
    end
end

function FormatText(text)
	local result = text
	if DESTINATION_AREA then
		local areaState = AREAS.GetAreaState(DESTINATION_AREA.id)
		if areaState then
			result = result:gsub("%{name}", areaState.name)
		end
	end

	if DESTINATION_AREA_KEY and DESTINATION_AREA_KEY ~= "" then
		result = result:gsub("%{type}", DESTINATION_AREA_KEY)
	end

	return result
end

-- Initialize
BUTTON.text = FormatText(BUTTON_TEXT)
BUTTON.clickedEvent:Connect(OnClicked)

if IS_2D_ICON then
    ICON:SetPlayerProfile(nil)
    ICON:SetColor(Color.New(0, 0, 0, 0))
    World.SpawnAsset(ICON_ASSET, { parent = ICON })
elseif IS_3D_ICON then
    ICON_MANAGER.SetIcon(ICON, ICON_CAMERA_ID, ICON_ASSET, CameraCaptureResolution.SMALL)
elseif IS_IMAGE_ICON then
    ICON:SetImage(ICON_ASSET)
else
    ICON.visibility = Visibility.FORCE_OFF
end

if BINDING and BINDING ~= "" then
	BINDING_UI_TEXT.text = UI_LIBRARY.FormatInputType(Input.GetActionInputLabel(BINDING))

	inputTypeChangedListener = Input.inputTypeChangedEvent:Connect(OnInputTypeChanged)
    bindingListener = Input.actionReleasedEvent:Connect(OnActionReleased)
    script.destroyEvent:Connect(OnDestroy)
else
	BINDING_BG.visibility = Visibility.FORCE_OFF
	BINDING_UI_TEXT.text = ""
end