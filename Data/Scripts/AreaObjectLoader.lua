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
local LOCAL_ROOT = script:GetCustomProperty("LocalRoot"):WaitForObject()

-- User Exposed Properties
local CLIENT_ASSET = COMPONENT_ROOT:GetCustomProperty("ClientAsset")
local SERVER_ASSET = COMPONENT_ROOT:GetCustomProperty("ServerAsset")
local STATIC_ASSET = COMPONENT_ROOT:GetCustomProperty("StaticAsset")
local LOCAL_ASSET = COMPONENT_ROOT:GetCustomProperty("LocalAsset")

-- Required APIs
---@type APIAreaLoaders
local AREA_LOADERS = require(script:GetCustomProperty("APIAreaLoaders"))
---@type APIAreas
local AREAS = require(script:GetCustomProperty("APIAreas"))

-- Private Variables
local object
local staticObject
local localObject
local loadingProgress = 0
local areaId

-- Use a flag because checking for staticObject won't work if checked twice quickly since staticObject doesn't exist for a couple frames
local hasLoaded = false

function FindExistingTemplate()
    local asset
    if Environment.IsServer() then
        if SERVER_ASSET and SERVER_ASSET ~= "" then
            asset = SERVER_ASSET
        end
    elseif Environment.IsClient() then
        if CLIENT_ASSET and CLIENT_ASSET ~= "" then
            asset = CLIENT_ASSET
        end
    end

    if asset then
        for _, child in ipairs(script.parent:GetChildren()) do
            if DoesTemplateIdMatch(child.sourceTemplateId, asset) then
                object = child
                hasLoaded = true
                break
            end
        end
    end

    if STATIC_ASSET and STATIC_ASSET ~= "" then
        for _, child in ipairs(STATIC_ROOT:GetChildren()) do
            if DoesTemplateIdMatch(child.sourceTemplateId, STATIC_ASSET) then
                staticObject = child
                hasLoaded = true
                break
            end
        end
    end

    if LOCAL_ASSET and LOCAL_ASSET ~= "" then
        for _, child in ipairs(LOCAL_ROOT:GetChildren()) do
            if DoesTemplateIdMatch(child.sourceTemplateId, LOCAL_ASSET) then
                localObject = child
                hasLoaded = true
                break
            end
        end
    end
end

function LoadArea()
    if hasLoaded then
        loadingProgress = 1
        return
    end

    loadingProgress = 0

    if Environment.IsServer() then
        if SERVER_ASSET and SERVER_ASSET ~= "" then
            object = World.SpawnAsset(SERVER_ASSET, { parent = script.parent })
        end
    elseif Environment.IsClient() then
        if CLIENT_ASSET and CLIENT_ASSET ~= "" then
            object = World.SpawnAsset(CLIENT_ASSET, { parent = script.parent })
        end
    end

    -- Only spawn static templates once in single player
    if STATIC_ASSET and STATIC_ASSET ~= "" and not (Environment.IsClient() and IsSinglePlayer()) then
        staticObject = World.SpawnAsset(STATIC_ASSET, { parent = STATIC_ROOT, networkContext = NetworkContextType.STATIC_CONTEXT })
    end

    -- Only spawn local templates once in single player
    if LOCAL_ASSET and LOCAL_ASSET ~= "" and not (Environment.IsClient() and IsSinglePlayer()) then
        localObject = World.SpawnAsset(LOCAL_ASSET, { parent = LOCAL_ROOT, networkContext = NetworkContextType.LOCAL_CONTEXT })
    end

    loadingProgress = 1
    hasLoaded = true
end

function UnloadArea()
    if not hasLoaded then
        loadingProgress = 1
        return
    end

    loadingProgress = 0
    if Object.IsValid(object) then
        object:Destroy()
        object = nil
    end

    if Object.IsValid(staticObject) then
        staticObject:Destroy()
        staticObject = nil
    end

    if Object.IsValid(localObject) then
        localObject:Destroy()
        localObject = nil
    end

    loadingProgress = 1
    hasLoaded = false
end

function GetState()
    local result = {}
    result.areaId = areaId
    result.progress = loadingProgress
    return result
end

function DoesTemplateIdMatch(id1, id2)
    if not id1 or not id2 then return false end

    -- Strip everything after the first part of the ids
    id1 = CoreString.Split(id1, ":")
    id2 = CoreString.Split(id2, ":")

    return id1 == id2
end

function IsSinglePlayer()
    return Environment.IsLocalGame() and not Environment.IsMultiplayerPreview()
end

FindExistingTemplate()

local functionTable = {}
functionTable.LoadArea = LoadArea
functionTable.UnloadArea = UnloadArea
functionTable.GetState = GetState

AREA_LOADERS.RegisterAreaLoader(COMPONENT_ROOT.id, functionTable)

-- Wait for Areas to register
Task.Wait()

areaId = AREAS.FindAreaByAncestors(COMPONENT_ROOT)