-- Static scripts need to ensure API scripts have been loaded in the correct contexts
local REQUIRED_VERSION = 1
while not _G.AreFrameworkDependenciesLoaded do
    Task.Wait()
end

if not _G.CheckFrameworkVersionUpToDate(REQUIRED_VERSION) then
    return
end

local COMPONENT_ROOT = script:GetCustomProperty("ComponentRoot"):WaitForObject()

---@type APIGatherables
local API = require(script:GetCustomProperty("APIGatherables"))
---@type APIReplicator
local API_REPLICATOR = require(script:GetCustomProperty("APIReplicator"))
---@type APIBitField
local BitField = require(script:GetCustomProperty("BitField"))
---@type APIActiveCoreObjects
local API_ACTIVE = require(script:GetCustomProperty("APIActiveCoreObjects"))
---@type APIEquipment
local EQUIPMENT = require(script:GetCustomProperty("APIEquipment"))
---@type APIDatabase
local DATABASE = require(script:GetCustomProperty("APIDatabase"))
---@type APICurrency
local CURRENCY = require(script:GetCustomProperty("APICurrency"))
---@type APIPlayerUpgrades
local UPGRADES = require(script:GetCustomProperty("APIPlayerUpgrades"))
---@type APIItemPickups
local ITEM_PICKUPS = require(script:GetCustomProperty("APIItemPickups"))
---@type APIDrops
local DROPS = require(script:GetCustomProperty("APIDrops"))
---@type APIInventory
local INVENTORY = require(script:GetCustomProperty("APIInventory"))

local GROUP = script:GetCustomProperty("Group"):WaitForObject()

local RESPAWN = COMPONENT_ROOT:GetCustomProperty("Respawn")
local RESPAWN_PLAYER_MIN_DISTANCE = COMPONENT_ROOT:GetCustomProperty("RespawnPlayerMinDistance")
local RESPAWN_PLAYER_MAX_DISTANCE = COMPONENT_ROOT:GetCustomProperty("RespawnPlayerMaxDistance")
local RESPAWN_WHEN_NOT_VISIBLE = COMPONENT_ROOT:GetCustomProperty("RespawnWhenNotVisible")
local RANDOM_SPAWN = COMPONENT_ROOT:GetCustomProperty("RandomSpawn")
local RANDOM_SPAWN_PERCENT = COMPONENT_ROOT:GetCustomProperty("RandomSpawnPercent")

-- Try to get Database values if none exist
if RESPAWN == nil then
    local template = COMPONENT_ROOT.sourceTemplateId
    if template and DATABASE.GatherableGroups then
        local function CompareAssetReferences(a, b)
            if a == nil or b == nil then return false end
            a = CoreString.Split(a, ":")
            b = CoreString.Split(b, ":")
            return a == b
        end

        for key, gatherableGroupData in pairs(DATABASE.GatherableGroups) do
            if type(gatherableGroupData) == "table" then
                if CompareAssetReferences(gatherableGroupData.Static, template) then
                    RESPAWN = gatherableGroupData.Respawn
                    RESPAWN_PLAYER_MIN_DISTANCE = gatherableGroupData.RespawnPlayerMinDistance
                    RESPAWN_PLAYER_MAX_DISTANCE = gatherableGroupData.RespawnPlayerMaxDistance
                    RESPAWN_WHEN_NOT_VISIBLE = gatherableGroupData.RespawnWhenNotVisible
                    RANDOM_SPAWN = gatherableGroupData.RandomSpawn
                    RANDOM_SPAWN_PERCENT = gatherableGroupData.RandomSpawnPercent
                    break
                end
            end
        end
    end
end

if RESPAWN == nil then
    error(string.format("Gatherable Group data could not be found on the object: %s or in the Database", COMPONENT_ROOT.name))
end

if not RESPAWN_PLAYER_MIN_DISTANCE or RESPAWN_PLAYER_MIN_DISTANCE < 0 then
    RESPAWN_PLAYER_MIN_DISTANCE = 0
end

if not RESPAWN_PLAYER_MAX_DISTANCE or RESPAWN_PLAYER_MAX_DISTANCE < RESPAWN_PLAYER_MIN_DISTANCE then
    RESPAWN_PLAYER_MAX_DISTANCE = RESPAWN_PLAYER_MIN_DISTANCE
end

if not RANDOM_SPAWN_PERCENT then
    RANDOM_SPAWN_PERCENT = 100
end

RANDOM_SPAWN_PERCENT = CoreMath.Clamp(RANDOM_SPAWN_PERCENT, 0, 100)

local IsSinglePlayer = (Environment.IsLocalGame() and not Environment.IsMultiplayerPreview()) or Environment.IsSinglePlayerPreview()

---@type gatherableEntry[]
local entries = {}

---@type table<CoreObject, integer>
local coreObjectToIndex = {
    Static = {},
    Client = {},
    Server = {}
}

local isActive = true
local pendingRandomSpawn = false
local pendingRespawns = {}
local needsUpdating = false

-- Find our instance
local instance = API_REPLICATOR.GetCurrentInstance()

-- If our object already exists in the replicator, we might need to wait
if instance == nil then
    instance = API_REPLICATOR.WaitForInstance(script.parent, 10)
    if instance == nil then
        return
    end
end

function GetCustomPropertyInParents(coreObject, property)
    local value = coreObject:GetCustomProperty(property)
    if value == nil then
        if coreObject.parent == nil then
            return nil
        end
        return GetCustomPropertyInParents(coreObject.parent, property)
    else
        return value
    end
end

local bitIndex = 0

function GetNumberOfBits(value)
    if value <= 2 then return 1 end
    if value <= 4 then return 2 end
    if value <= 8 then return 3 end
    if value <= 16 then return 4 end
    if value <= 32 then return 5 end
    error("You have more than 32 states for one item, this isn't supported")
end

function IsEntryDestroyable(entry)
    local state = GetEntryState(entry)
    if state == entry.gatheredStateIndex or state == entry.numberOfStates then
        return false
    end
    return true
end

function IsEntryDestroyedOrGathered(entry)
    return not IsEntryDestroyable(entry)
end

function CanEquipmentInteract(player, target, toolType, equipmentSettings)
    if API_REPLICATOR.IsReplicatorLocked(instance.replicatorId) then
        return false, nil
    end

    for _, entry in pairs(entries) do
        if entry.staticCoreObject == target and IsEntryDestroyable(entry) then
            local isValid = true

            -- Check for a valid Tool type
            if entry.data and entry.data.ValidGatheringToolTypes then
                isValid = EQUIPMENT.IsValidToolType(entry.data.ValidGatheringToolTypes, toolType, equipmentSettings)
            end
            if isValid then
                -- If this Gatherable consumes tools, validate that
                if entry.data and entry.data.ToolsConsumedPerGather and entry.data.ToolsConsumedPerGather > 0 then
                    if equipmentSettings.InventoryId and equipmentSettings.InventoryId ~= "" then
                        if not INVENTORY.HasAmountInInventory(player, equipmentSettings.InventoryId, INVENTORY.ItemType.Item, equipmentSettings.ItemId, entry.data.ToolsConsumedPerGather, equipmentSettings.SlotIndex) then
                            local message = "Not enough items"
                            if DATABASE.Items then
                                local itemData = DATABASE.Items[equipmentSettings.ItemId]
                                message = string.format("Not enough %s", itemData.Name)
                            end
                            return false, message
                        end
                    end
                end

                Events.Broadcast("CanEquipmentInteract", "GatherFromGatherable", target, toolType, equipmentSettings)
                return true, nil
            else
                local message = ""
                if entry.data.InteractionError and entry.data.InteractionError ~= "" then
                    message = entry.data.InteractionError
                elseif entry.data.ValidGatheringToolTypes and entry.data.ValidGatheringToolTypes ~= "" then
                    message = string.format("Use %s on this", entry.data.ValidGatheringToolTypes)
                end
                return false, message
            end
        end
    end
    return false, nil
end

function EquipmentInteract(player, target, toolType, equipmentSettings)
    if API_REPLICATOR.IsReplicatorLocked(instance.replicatorId) then
        return false, nil
    end

    for _, entry in pairs(entries) do
        if entry.staticCoreObject == target and IsEntryDestroyable(entry)  then
            local canGather, errorMessage = CanEquipmentInteract(player, target, toolType, equipmentSettings)
            if not canGather then
                return false, errorMessage
            end

            -- Consume the Tools if required
            if entry.data and entry.data.ToolsConsumedPerGather and entry.data.ToolsConsumedPerGather > 0 then
                if equipmentSettings.InventoryId and equipmentSettings.InventoryId ~= "" then
                    if Environment.IsClient() then
                        ---@type APIInventory
                        local CLIENT_INVENTORY = require(script:GetCustomProperty("APIInventory"))
                        CLIENT_INVENTORY.RemoveFromInventory(player, equipmentSettings.InventoryId, INVENTORY.ItemType.Item, equipmentSettings.ItemId, entry.data.ToolsConsumedPerGather, equipmentSettings.SlotIndex, false)
                    end
                end
            end

            DestroyGatherableAtIndex(player, entry.index)
            return true, nil
        end
    end
    return false, "Can not gather this"
end

function AddEntriesFromGroup(group)
    for index, child in ipairs(group:GetChildren()) do
        if child:IsA("StaticMesh") or child:IsA("Script") or child:GetCustomProperty("State1") or child:GetCustomProperty("GatherableId") then
            if child ~= script then
                ---@class gatherableEntry
                local entry = {}
                entry.bitIndex = bitIndex
                entry.gatherableId = child:GetCustomProperty("GatherableId")
                entry.states = {
                    Static = {},
                    Server = {},
                    Client = {}
                }

                -- Check for existing data
                if entry.gatherableId and entry.gatherableId ~= "" and DATABASE.Gatherables and DATABASE.Gatherables[entry.gatherableId] then
                    entry.data = DATABASE.Gatherables[entry.gatherableId]
                else
                    -- Generate data from the child if it doesn't exist in the Database
                    entry.data = DATABASE.ParseCoreObject(child, true, false)
                end

                -- handle potentially missing columns
                entry.data.ToolsConsumedPerGather = entry.data.ToolsConsumedPerGather or 0
                entry.data.GatherEffectsOffset = entry.data.GatherEffectsOffset or Vector3.ZERO
                entry.data.DestroyGatheredStateDelaySeconds = entry.data.DestroyGatheredStateDelaySeconds or 0
                entry.data.RespawnEffectsOffset = entry.data.RespawnEffectsOffset or Vector3.ZERO
                entry.data.ToolsConsumedPerGather = entry.data.ToolsConsumedPerGather or 0

                -- Generate state data if it is in a separate table
                if entry.data.GatherableStatesId then
                    -- Ensure States data exists
                    if not DATABASE.GatherableStates then
                        warn("Could not find the GatherableStates category in the Database for Gatherable: " .. entry.gatherableId)
                    else
                        local stateData = DATABASE.GatherableStates[entry.data.GatherableStatesId]
                        if stateData then
                            for i = 1, 32 do
                                entry.states.Client[i] = stateData["State" .. tostring(i) .. "_Client"]
                                entry.states.Server[i] = stateData["State" .. tostring(i) .. "_Server"]
                                entry.states.Static[i] = stateData["State" .. tostring(i) .. "_Static"]

                                -- Currently requiring every state to have a static template for interaction
                                if entry.states.Static[i] == nil or entry.states.Static[i] == "" then
                                    entry.states.Static[i] = nil
                                    break
                                end
                            end

                            entry.gatheredStateIndex = #entry.states.Static + 1

                            if stateData.GatheredState_Client and stateData.GatheredState_Client ~= "" then
                                entry.states.Client[entry.gatheredStateIndex] = stateData.GatheredState_Client
                            end

                            if stateData.GatheredState_Server and stateData.GatheredState_Server ~= "" then
                                entry.states.Server[entry.gatheredStateIndex] = stateData.GatheredState_Server
                            end

                            if stateData.GatheredState_Static and stateData.GatheredState_Static ~= "" then
                                entry.states.Static[entry.gatheredStateIndex] = stateData.GatheredState_Static
                            end
                        end
                    end
                else
                    -- Support older format with state data as custom properties
                    for i = 1, 32 do
                        entry.states.Client[i] = entry.data["State" .. tostring(i) .. "_Client"]
                        entry.states.Server[i] = entry.data["State" .. tostring(i) .. "_Server"]
                        entry.states.Static[i] = entry.data["State" .. tostring(i)]

                        -- Currently requiring every state to have a static template for interaction
                        if entry.states.Static[i] == nil then
                            break
                        end
                    end

                    entry.gatheredStateIndex = #entry.states.Static + 1

                    if entry.data.GatheredState then
                        entry.states.Static[entry.gatheredStateIndex] = entry.data.GatheredState
                    end

                    if entry.data.GatheredState_Client then
                        entry.states.Client[entry.gatheredStateIndex] = entry.data.GatheredState_Client
                    end

                    if entry.data.GatheredState_Server then
                        entry.states.Server[entry.gatheredStateIndex] = entry.data.GatheredState_Server
                    end
                end

                -- Try to add an existing template if there are no states as of yet
                if child == child:FindTemplateRoot() and #entry.states.Static == 0 then
                    entry.states.Static[1] = child.sourceTemplateId
                end

                entry.hasTemplatedStates = #entry.states.Static > 0

                local numberOfStates = #entry.states.Static + 1

                -- We need at least 2 states, normal and destroyed
                if numberOfStates < 2 then
                    numberOfStates = 2
                end

                -- Generate Drops data if it is in a separate table
                if entry.data.DropIds then
                    if not DATABASE.Drops then
                        warn("Could not find the Drops category in the Database for Gatherable: " .. entry.gatherableId)
                    else
                        entry.drops = {}
                        local dropIds = { CoreString.Split(entry.data.DropIds, ",", { removeEmptyResults  = true }) }
                        for i, dropId in ipairs(dropIds) do
                            dropId = CoreString.Trim(dropId)
                            local dropData = DATABASE.Drops[dropId]
                            if dropData then
                                entry.drops[i] = dropData
                            end
                        end
                    end
                else
                    -- Support older format with drops data as nested data
                    entry.drops = entry.data.Drops
                end

                entry.transform = child:GetTransform()
                entry.worldTransform = child:GetWorldTransform()
                entry.staticCoreObject = child
                entry.parent = child.parent
                entry.state = 1
                entry.numberOfStates = numberOfStates
                entry.destroyedTime = time()
                entry.bitLength = GetNumberOfBits(entry.numberOfStates)
                entry.dropPosition = child:GetWorldPosition()

                if child:GetCustomProperty("DropPosition") then
                    local dropPosObject = child:GetCustomProperty("DropPosition"):WaitForObject()
                    if dropPosObject then
                        entry.dropPosition = dropPosObject:GetWorldPosition()
                    end
                end

                table.insert(entries, entry)

                entry.index = #entries
                coreObjectToIndex.Static[child] = entry.index
                bitIndex = bitIndex + entry.bitLength

                EQUIPMENT.RegisterEquipmentTarget(entry.staticCoreObject, {
                    CanEquipmentInteract = CanEquipmentInteract,
                    EquipmentInteract = EquipmentInteract
                })

                if entry.hasTemplatedStates and entry.data.SpawnTemplateOnLoad then
                    entry.state = nil
                    if Object.IsValid(entry.staticCoreObject) then
                        entry.staticCoreObject:Destroy()
                        coreObjectToIndex.Static[entry.staticCoreObject] = nil
                        entry.staticCoreObject = nil
                    end
                end
            end
        else
            AddEntriesFromGroup(child)
        end
        if index % 1000 == 0 then
            Task.Wait()
        end
    end
end

-- Setup our entries
AddEntriesFromGroup(GROUP)

local BIT_COUNT = bitIndex + 1
local bitField = BitField.New(BIT_COUNT)

-- Updates the instance with our bit field
function WriteToInstance()
    instance.state = bitField.raw
end

-- Loads the bit field from the instance
function LoadFromInstance()
    if instance.state and instance.state ~= "" then
        bitField = BitField.New(BIT_COUNT, instance.state)
    else
        bitField = BitField.New(BIT_COUNT)
    end
end

-- Spawns or destroys core objects based on the bitField
function RefreshCoreObjects()
    for index, entry in ipairs(entries) do
        local state = GetEntryState(entry)
        if not isActive then
            state = nil
        end

        if state ~= entry.state then
            local isFirstSpawn = entry.state == nil
            entry.state = state
            DestroyIndex(index)
            SpawnIndex(index, entry, state, isFirstSpawn)
        end
    end
end

function RandomSpawnObjects()
    local numberSpawned = GetSpawnedObjectCount()
    local totalToSpawn = CoreMath.Round(#entries * RANDOM_SPAWN_PERCENT / 100)
    local availableIndexes = {}

    if numberSpawned < totalToSpawn then -- We need to spawn more!
        for index, entry in ipairs(entries) do
            local state = GetEntryState(entry)
            if state == entry.numberOfStates or state == entry.gatheredStateIndex then
                table.insert(availableIndexes, index)
            end
        end
        while numberSpawned < totalToSpawn and #availableIndexes > 0 do
            local index = table.remove(availableIndexes, math.random(1, #availableIndexes))
            local entry = entries[index]

            SetEntryState(entry, 1)
            numberSpawned = numberSpawned + 1
        end

        WriteToInstance()
        API_REPLICATOR.ModifyInstance(instance, true)
        needsUpdating = true
    elseif numberSpawned > totalToSpawn then -- We need to unspawn
        for index, entry in ipairs(entries) do
            local state = GetEntryState(entry)
            if state < entry.numberOfStates then
                table.insert(availableIndexes, index)
            end
        end
        while numberSpawned > totalToSpawn do
            local index = table.remove(availableIndexes, math.random(1, #availableIndexes))
            local entry = entries[index]

            SetEntryState(entry, entry.numberOfStates)
            numberSpawned = numberSpawned - 1
        end

        WriteToInstance()
        API_REPLICATOR.ModifyInstance(instance, true)
        needsUpdating = true
    end
end

function GetSpawnedObjectCount()
    local total = 0
    for _, entry in pairs(entries) do
        local state = GetEntryState(entry)
        if state < entry.numberOfStates then
            total = total + 1
        end
    end

    return total
end

-- Additional functionality that should be in BitField

-- Find the largest value
function GetMaxBitValue(bitCount)
    return (1 << bitCount) - 1
end

-- Find a value based on a number of bits
function GetBitValue(index, bitCount)
    local value = 0
    for i=1, bitCount do
        value = (value << 1) + (bitField:Get(index+i-1) and 1 or 0)
    end
    return value
end

-- Sets multiple bits on a bit field
function SetBitValue(index, value, bitCount)
    assert(value >= 0 and value <= GetMaxBitValue(bitCount))

    for i=1, bitCount do
        local shift = (bitCount-i)
        local boolean = ((1 << shift & value) >> shift) == 1
        bitField:Set(index+i-1, boolean)
    end
end

-- Writes the value into the bit field for an entry
function SetEntryState(entry, value)
    SetBitValue(entry.bitIndex, value-1, entry.bitLength)
end

-- Gets the value from the bit field for an entry
function GetEntryState(entry)
    return GetBitValue(entry.bitIndex, entry.bitLength)+1
end

-- Server function
function OnPlayerDestroyGatherable(player, replicatorId, instanceId, index)
    if instance and instance.replicatorId == replicatorId and instance.id == instanceId then
        local entry = entries[index]
        if entry == nil then
            return
        end

        if entry.staticCoreObject == nil then
            return
        end

        local value = GetEntryState(entry)
        if value < entry.numberOfStates then
            value = math.min(value + 1, entry.numberOfStates, entry.gatheredStateIndex)

            SetEntryState(entry, value)

            WriteToInstance()
            API_REPLICATOR.ModifyInstance(instance, true)

            if entry.data.DropEveryGather then
                DropGatherable(player, entry)
            else
                if value >= math.min(entry.numberOfStates, entry.gatheredStateIndex) then
                    DropGatherable(player, entry)
                end
            end

            Events.Broadcast(API.EVENT_GATHERABLE_GATHERED, player, entry)
            if value >= math.min(entry.numberOfStates, entry.gatheredStateIndex) then
                entries[index].destroyedTime = time()
                AddPendingRespawn(entry)

                Events.Broadcast(API.EVENT_GATHERABLE_DESTROYED, player, entry)
            end
        end
    end
end

-- Client function
function DestroyGatherableAtIndex(player, index)
    local entry = entries[index]
    if entry == nil then
        return
    end

    local coreObject = entry.staticCoreObject
    if coreObject == nil then
        return
    end

    local state =  GetEntryState(entry)
    if state < math.min(entry.numberOfStates, entry.gatheredStateIndex) then
        if entry.data.GatherEffects and entry.data.GatherEffects ~= "" then
            local offset = entry.data.GatherEffectsOffset or Vector3.ZERO
            local effects = World.SpawnAsset(entry.data.GatherEffects, { position = coreObject:GetWorldPosition() + offset, rotation = coreObject:GetWorldRotation() })

            -- Ensure these don't stack up
            if effects.lifeSpan == 0 then
                effects.lifeSpan = 5
            end
        end
    end

    if Environment.IsLocalGame() and not Environment.IsMultiplayerPreview() then
        -- In single player preview mode we're accessing the same static data so we dont want
        -- to modify it twice
    else
        -- Published game or multiplayer preview, we're fine to modify this
        local value = GetEntryState(entry)
        value = math.min(value + 1, entry.numberOfStates, entry.gatheredStateIndex)

        SetEntryState(entry, value)

        Events.Broadcast(API.EVENT_GATHERABLE_GATHERED, player, entry)
        if value >= entry.numberOfStates then
            entries[index].destroyedTime = time()
            AddPendingRespawn(entry)

            Events.Broadcast(API.EVENT_GATHERABLE_DESTROYED, player, entry)
        end
    end

    WriteToInstance()
    API_REPLICATOR.ModifyInstance(instance, true)

    if Environment.IsClient() then
        --- This function is in the 'client' environment so we need to do the require here otherwise
        --- we'll get the server version of the the API
        local RELIABLE_EVENTS = require(script:GetCustomProperty("APIReliableEvents"))
        RELIABLE_EVENTS.BroadcastToServer("DestroyGatherable", instance.replicatorId, instance.id, index)
    end
end

function DropGatherable(player, entry)
    if entry.drops then
        if not INVENTORY.IsAnyInventoryRegistered(false) then
            warn("No Inventory could be found. Do you have an Inventory Template in the scene?")
            return
        end

        local drops = DROPS.CalculateDrops(entry.drops)
        if entry.data.DropOnGather then
            -- Support new Drop Behavior as well as old data format
            local dropBehaviorData
            if entry.data.DropBehaviorId then
                if DATABASE.DropBehaviors then
                    if DATABASE.DropBehaviors[entry.data.DropBehaviorId] then
                        dropBehaviorData = DATABASE.DropBehaviors[entry.data.DropBehaviorId]
                    else
                        warn("Could not find the Drop Behavior Data in the Database for Gatherable: " .. entry.gatherableId)
                    end
                else
                    warn("Could not find the DropBehaviors category in the Database for Gatherable: " .. entry.gatherableId)
                end
            else
                dropBehaviorData = entry.data
            end

            if dropBehaviorData then
                ITEM_PICKUPS.CreateItemPickupsForDrops(
                    player,
                    drops,
                    dropBehaviorData.DropItemPickupTemplate,
                    entry.dropPosition,
                    dropBehaviorData.DropMinDistance,
                    dropBehaviorData.DropMaxDistance,
                    dropBehaviorData.DropForAllPlayers,
                    dropBehaviorData.SinglePlayerDrops,
                    dropBehaviorData.DropTimeoutSeconds,
                    dropBehaviorData.MaxPickupsPerDrop
                )
            end
        else
            for itemId, amount in pairs(drops.Items) do
                INVENTORY.AddToInventory(player, nil, INVENTORY.ItemType.Item, itemId, amount, 0, false)
            end

            for currencyId, amount in pairs(drops.Currencies) do
                CURRENCY.AddCurrencyAmount(player, currencyId, amount)
            end
        end

        for upgradeId, _ in pairs(drops.Upgrades) do
            UPGRADES.AddUpgrade(player, upgradeId)
        end
    end
end

function FindGatherableIndex(coreObject)
    local o = coreObject
    while o ~= nil do
        if coreObjectToIndex.Static[o] then
            return coreObjectToIndex.Static[o]
        end
        o = o.parent
    end

    o = coreObject
    while o ~= nil do
        if coreObjectToIndex.Client[o] then
            return coreObjectToIndex.Client[o]
        end
        o = o.parent
    end

    o = coreObject
    while o ~= nil do
        if coreObjectToIndex.Server[o] then
            return coreObjectToIndex.Server[o]
        end
        o = o.parent
    end
    return nil
end

function GetGatherableAtIndex(index)
    local entry = entries[index]

    ---@class gatherable
    local result = {
        groupId = GROUP.id,
        index = index,
        staticCoreObject = entry.staticCoreObject,
        clientCoreObject = entry.clientCoreObject,
        serverCoreObject = entry.serverCoreObject,
        gatherableData = entry.data,
        isGatherable = GetEntryState(entry) < math.min(entry.numberOfStates, entry.gatheredStateIndex),
        dropPosition = entry.dropPosition
    }
    return result
end

function GetState()
    local result = {
        name = COMPONENT_ROOT.name,
        group = GROUP,
        instance = instance,
        replicatorId = instance.replicatorId
    }
    return result
end

function DestroyIndex(index)
    local entry = entries[index]
    if Object.IsValid(entry.staticCoreObject) then
        EQUIPMENT.UnregisterEquipmentTarget(entry.staticCoreObject)
        entry.staticCoreObject:Destroy()
        coreObjectToIndex.Static[entry.staticCoreObject] = nil
        entry.staticCoreObject = nil

        if entry.clientCoreObject then
            entry.clientCoreObject:Destroy()
            coreObjectToIndex.Client[entry.clientCoreObject] = nil
            entry.clientCoreObject = nil
        end

        if entry.serverCoreObject then
            entry.serverCoreObject:Destroy()
            coreObjectToIndex.Server[entry.serverCoreObject] = nil
            entry.serverCoreObject = nil
        end
    end
end

function SpawnIndex(index, entry, state, isFirstSpawn)
    local params = {
        parent = entry.parent,
        position = entry.transform:GetPosition(),
        rotation = entry.transform:GetRotation(),
        scale = entry.transform:GetScale()
    }

    if entry.states.Static[state] then
        entry.staticCoreObject = World.SpawnAsset(entry.states.Static[state], params)
        coreObjectToIndex.Static[entry.staticCoreObject] = index

        EQUIPMENT.RegisterEquipmentTarget(entry.staticCoreObject, {
            CanEquipmentInteract = CanEquipmentInteract,
            EquipmentInteract = EquipmentInteract
        })
    end

    if Environment.IsClient() or IsSinglePlayer then
        if not isFirstSpawn and entry.state == 1 and entry.data.RespawnEffects and entry.data.RespawnEffects ~= "" then
            local offset = entry.data.RespawnEffectsOffset or Vector3.ZERO
            local effects = _G.ClientContext.SpawnAsset(entry.data.RespawnEffects, { position = entry.worldTransform:GetPosition() + offset })

            -- Ensure these don't stack up
            if effects.lifeSpan == 0 then
                effects.lifeSpan = 5
            end
        end

        if entry.states.Client[state] and entry.states.Client[state] ~= "" then
            params.networkContext = NetworkContextType.CLIENT_CONTEXT
            entry.clientCoreObject = _G.ClientContext.SpawnAsset(entry.states.Client[state], params)
            coreObjectToIndex.Client[entry.clientCoreObject] = index
        end
    end

    if Environment.IsServer() then
        if entry.states.Server[state] and entry.states.Server[state] ~= "" then
            params.networkContext = NetworkContextType.SERVER_CONTEXT
            entry.serverCoreObject = World.SpawnAsset(entry.states.Server[state], params)
            coreObjectToIndex.Server[entry.serverCoreObject] = index
        end
    end
end

function OnInstanceModified(modifiedInstance)
    if modifiedInstance == instance then
        LoadFromInstance()
        needsUpdating = true
    end
end

function OnActivationChanged(coreObject, newIsActive)
    isActive = newIsActive
    needsUpdating = true

    if isActive and pendingRandomSpawn then
        pendingRandomSpawn = false
        Task.Spawn(function()
            Task.Wait()
            RandomSpawnObjects()
        end)
    end
end

function AddPendingRespawn(entry)
    -- Only adding for normal spawns since random spawn needs to check everything
    if RESPAWN and not RANDOM_SPAWN then
        pendingRespawns[entry] = true
    end
end

function RespawnGatherables()
    local didRespawn = false
    if RANDOM_SPAWN then
        local numberSpawned = GetSpawnedObjectCount()
        local totalToSpawn = CoreMath.Round(#entries * RANDOM_SPAWN_PERCENT / 100)
        local availableEntries = {}

        for _, entry in pairs(entries) do
            local delay = entry.data.DestroyGatheredStateDelaySeconds or 0
            if delay > 0 and GetEntryState(entry) == entry.gatheredStateIndex and entry.destroyedTime + delay < time() then
                SetEntryState(entry, entry.numberOfStates)
                Events.Broadcast(API.EVENT_GATHERABLE_RESPAWNED, entry)
            else
                table.insert(availableEntries, entry)
            end
        end

        while #availableEntries > 0 and numberSpawned < totalToSpawn do
            local entry = table.remove(availableEntries, math.random(1, #availableEntries))
            local spawned = RespawnGatherable(entry)
            if spawned then
                numberSpawned = numberSpawned + 1
                didRespawn = true
            end
        end
    else
        for entry, _ in pairs(pendingRespawns) do
            local spawned = RespawnGatherable(entry)
            if spawned then
                pendingRespawns[entry] = nil
                didRespawn = true
            end
        end
    end

    if didRespawn then
        WriteToInstance()
        API_REPLICATOR.ModifyInstance(instance, true)
        needsUpdating = true
    end
end

function RespawnGatherable(entry)
    if entry.hasTemplatedStates and entry.data.RespawnSeconds then
        if IsEntryDestroyedOrGathered(entry) then
            if entry.destroyedTime + entry.data.RespawnSeconds <= time() then
                local canSpawn = true
                for _, player in ipairs(Game.GetPlayers()) do
                    local playerDistance = (entry.worldTransform:GetPosition() - player:GetWorldPosition()).size
                    if canSpawn and RESPAWN_PLAYER_MIN_DISTANCE > 0 then
                        if playerDistance < RESPAWN_PLAYER_MIN_DISTANCE then
                            canSpawn = false
                            break
                        end
                    end

                    if canSpawn and RESPAWN_WHEN_NOT_VISIBLE and playerDistance < RESPAWN_PLAYER_MAX_DISTANCE then
                        local objToPlayer = (entry.worldTransform:GetPosition() - player:GetWorldPosition()):GetNormalized()
                        local lookForward = (player:GetLookWorldRotation() * Vector3.FORWARD):GetNormalized()

                        if objToPlayer .. lookForward > 0 and (objToPlayer ^ lookForward).size < math.sin(math.rad(90)) then
                            canSpawn = false
                            break
                        end
                    end
                end

                if canSpawn then
                    SetEntryState(entry, 1)
                    Events.Broadcast(API.EVENT_GATHERABLE_RESPAWNED, entry)
                    return true
                end
            end
        end
    end
    return false
end

function Tick()
    if Environment.IsServer() and RESPAWN then
        RespawnGatherables()
    end

    if needsUpdating then
        needsUpdating = false
        RefreshCoreObjects()
    end
end

function HandleReset(gatherableGroupId)
    if gatherableGroupId == COMPONENT_ROOT.id or IsChildGroupOfParent(gatherableGroupId) then
        for _, entry in ipairs(entries) do
            SetEntryState(entry, 1)
        end

        WriteToInstance()
        API_REPLICATOR.ModifyInstance(instance, true)
    end
end

function IsChildGroupOfParent(gatherableGroupId)
    local parent = COMPONENT_ROOT.parent
    while parent ~= nil do
        if parent.id == gatherableGroupId then
            return true
        end
        parent = parent.parent
    end
    return false
end

local functionTable = {
    FindGatherableIndex = FindGatherableIndex,
    GetGatherableAtIndex = GetGatherableAtIndex,
    DestroyGatherableAtIndex = DestroyGatherableAtIndex,
    GetState = GetState
}

API.RegisterGatherableGroup(GROUP.id, functionTable)

local modifiedListener = Events.Connect("GatherableModified", OnInstanceModified)
local resetListener = Events.Connect(API.EVENT_RESET_GATHERABLE_GROUP, HandleReset)

API_ACTIVE.ConnectToActivationChange(script, OnActivationChanged)
isActive = API_ACTIVE.IsActive(script)

local onDestroyListener = nil
Events.Broadcast("ServerFunction", function()
    onDestroyListener = Events.ConnectForPlayer("DestroyGatherable", OnPlayerDestroyGatherable)
end)

script.destroyEvent:Connect(
    function()
        API.UnregisterGatherableGroup(GROUP.id)

        modifiedListener:Disconnect()
        resetListener:Disconnect()

        if onDestroyListener then
            onDestroyListener:Disconnect()
        end
    end
)

LoadFromInstance()
RefreshCoreObjects()

for _, entry in ipairs(entries) do
    if entry.state >= entry.numberOfStates then
        AddPendingRespawn(entry)
    end
end

if Environment.IsServer() and RANDOM_SPAWN then
    if isActive then
        RandomSpawnObjects()
    else
        pendingRandomSpawn = true
    end
end