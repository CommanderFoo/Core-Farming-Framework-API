local DATABASE = require(script:GetCustomProperty("APIDatabase"))

-- Finds the template by the templateId
function FindByUniqueStorageId(uniqueStorageId)
    assert(uniqueStorageId)
    for key, value in pairs(DATABASE.GatherableGroups) do
        if type(value) == "table" then
            if value.UniqueStorageId == uniqueStorageId then
                return value
            end
        end
    end
end

local UserAPI = {}

function UserAPI.InitializeSettings(replicatorRoot)
    return {}
end

-- This function isnt part of the framework, you can declare this however you want
function UserAPI.CreateInstance(settings, templateId)
    local instance = {}
    instance.id = 0
    instance.uniqueStorageId = templateId
    instance.state = ""

    return instance
end

function UserAPI.CompareInstanceProperties(settings, a, b)
    if a.state == b.state and a.templateId == b.templateId then
        return true
    else
        return false
    end
end

-- Simple example of encoding and decoding in one function
function UserAPI.ReadInstance(settings, s)
    local instance = {}
    instance.id = s:ReadUInt12()
    instance.uniqueStorageId = s:ReadUInt12()
    instance.state = s:ReadString()
    return instance
end

function UserAPI.WriteInstance(settings, s, instance)
    s:WriteUInt12(instance.id)
    s:WriteUInt12(instance.uniqueStorageId)
    s:WriteString(instance.state)
end

-- Callback for spawning a static object
function UserAPI.StaticSpawn(settings, instance, parent)
    local entry = FindByUniqueStorageId(instance.uniqueStorageId)
    if entry then
        return World.SpawnAsset(entry.Static, { parent = parent })
    end
end

-- Callback for spawning a client object
function UserAPI.ClientSpawn(settings, instance, parent)
end

-- Apply instance data onto the client object
function UserAPI.ModifyClient(settings, coreObject, instance, parent)
    -- todo. Check if parent changed as well
end

function UserAPI.ModifyStatic(settings, coreObject, instance, parent)
    Events.Broadcast("GatherableModified", instance)
    return false
end

-- Callback for spawning a server context object
function UserAPI.ServerSpawn(settings, instance)
    -- todo
end

-- Callback for spawning a networked object
function UserAPI.NetworkedSpawn(settings, instance)
    -- todo
end

---Converts an existing object in the replicated folder to an instance and returns it.
---@param settings table
---@param coreObject CoreObject
function UserAPI.ConvertCoreObjectToInstance(settings, coreObject)
    if coreObject:GetCustomProperty("GatherableGroupId") then
        local uniqueStorageId = 0
        local gatherableGroupId = coreObject:GetCustomProperty("GatherableGroupId")
        if DATABASE.GatherableGroups and DATABASE.GatherableGroups[gatherableGroupId] then
            uniqueStorageId = DATABASE.GatherableGroups[gatherableGroupId].UniqueStorageId
        end

        local instance = UserAPI.CreateInstance(settings, uniqueStorageId)
        return instance, true
    else
        local uniqueStorageId = 0
        if coreObject:FindTemplateRoot() == coreObject then
            local template = coreObject.sourceTemplateId
            if template then
                if DATABASE.GatherableGroups then
                    for key, item in pairs(DATABASE.GatherableGroups) do
                        if type(item) == "table" then
                            if CompareAssetReferences(item.Static, template) then
                                uniqueStorageId = item.UniqueStorageId
                            end
                        end
                    end
                end
            end
        end

        local instance = UserAPI.CreateInstance(settings, uniqueStorageId)
        instance.keepWhenInactive = true
        return instance, false
    end
end

function CompareAssetReferences(a, b)
    a = CoreString.Split(a, ":")
    b = CoreString.Split(b, ":")
    return a == b
end

return UserAPI