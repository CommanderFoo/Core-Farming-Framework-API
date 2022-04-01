local Database = require(script:GetCustomProperty("Database"))

--- Obtain a table of templates
local REPLICATOR_TEMPLATES = Database.replicatorTemplates

---Looks in our database to find a client template based on a templateId
---@param templateId integer
---@return string
function GetClientTemplate(templateId)
    return REPLICATOR_TEMPLATES[templateId].client
end

---Looks in our database to find a static template based on a templateId
---@param templateId integer
---@return string
function GetStaticTemplate(templateId)
    return REPLICATOR_TEMPLATES[templateId].static
end

---@class UserFunctions
local UserAPI = {}

---@class SpawnParams
---@field parentId number|nil
---@field position Vector3|nil
---@field rotation Rotation|Quaternion|nil
---@field scale Vector3|nil

---We we wish to have settings we can read them from the root of the replicator in the scene
---@param replicatorRoot CoreObject
---@return table
function UserAPI.InitializeSettings(replicatorRoot)
    -- We can load settings here

    ---@class userSettings
    return {}
end

---Creates an instance based on the parameters. This function can have any signature
---@param templateId integer
---@param params SpawnParams
---@return instance
function UserAPI.CreateInstance(settings, templateId, params)
    local instance = {}
    instance.id = 0
    instance.templateId = templateId
    instance.parentId = params.parentId or 0
    instance.position = params and params.position or Vector3.ZERO
    instance.rotation = params and params.rotation or Rotation.IDENTITY
    instance.scale = params.scale or Vector3.ONE
    return instance
end

---Compares two instances. This function is optional as the replicator will compare bit strings
---and it is only used for comparing a server instance with a client added instance to see if they match
---@param a instance
---@param b instance
---@return boolean
function UserAPI.CompareInstanceProperties(settings, a, b)
    if a.templateId == b.templateId
    and a.parentId == b.parentId
    and a.position == b.position
    and a.rotation == b.rotation
    and a.scale == b.scale then
        return true
    else
        return false
    end
end

---Decodes an instance from a BitString
---@param s BitStringReader
---@return instance
function UserAPI.ReadInstance(settings, s)
    local instance = {}
    instance.id = s:ReadUInt12()
    instance.templateId = s:ReadUInt12()
    instance.parentId = s:ReadUInt12()
    instance.position = s:ReadVector3()
    instance.rotation = s:ReadRotation()
    instance.scale = s:ReadVector3()
    return instance
end

---Encodes an instance to a BitString
---@param s BitStringWriter
---@param instance instance
function UserAPI.WriteInstance(settings, s, instance)
    s:WriteUInt12(instance.id)
    s:WriteUInt12(instance.templateId)
    s:WriteUInt12(instance.parentId)
    s:WriteVector3(instance.position)
    s:WriteRotation(instance.rotation)
    s:WriteVector3(instance.scale)
end

---Callback when the spawner wants us to spawn a static object
---@param instance instance
---@param parent CoreObject
---@return CoreObject
function UserAPI.StaticSpawn(settings, instance, parent)
    local template = GetStaticTemplate(instance.templateId)
    if template == nil then
        return
    end
    return World.SpawnAsset(template, {position = instance.position, rotation = instance.rotation, scale = instance.scale, parent = parent})
end

---Callback when the spawner wants us to spawn a client object
---@param instance instance
---@param parent CoreObject
---@return CoreObject
function UserAPI.ClientSpawn(settings, instance, parent)
    local template = GetClientTemplate(instance.templateId)
    if template == nil then
        return
    end
    local coreObject = World.SpawnAsset(template, {position = instance.position, rotation = instance.rotation, scale = instance.scale, parent = parent})
    return coreObject
end

---Callback when the spawner wants to modify the client core object with the instance data
---@param coreObject CoreObject
---@param instance instance
---@param parent CoreObject
---@return boolean|nil
function UserAPI.ModifyClient(settings, coreObject, instance, parent)
    local newPosition = instance.position
    local newRotation = instance.rotation
    local newScale = instance.scale

    coreObject.parent = parent
    coreObject:SetTransform(Transform.New(newRotation, newPosition, newScale))
    -- todo. Check if parent changed as well
end

---Callback when the spawner wants to modify the static core object with the instance data
---@param coreObject CoreObject
---@param instance instance
---@param parent CoreObject
---@return boolean
function UserAPI.ModifyStatic(settings, coreObject, instance, parent)
    return true
end


return UserAPI