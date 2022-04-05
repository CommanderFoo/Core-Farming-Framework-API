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
    This defines the base class for reactive components to reduce boilerplate code.
--]]

---@type APIBuffs
local BUFFS = require(script:GetCustomProperty("APIBuffs"))
---@type APIProducers
local PRODUCERS = require(script:GetCustomProperty("APIProducers"))
---@type APIAreas
local AREAS = require(script:GetCustomProperty("APIAreas"))
---@type APIGatherables
local GATHERABLES = require(script:GetCustomProperty("APIGatherables"))
---@type APICrafting
local CRAFTING = require(script:GetCustomProperty("APICrafting"))
---@type APITags
local TAGS = require(script:GetCustomProperty("APITags"))

---@class APIReactiveComponent
local API = {}

---@class ReactiveComponentBehavior
API.BehaviorType = {
    ChangeColor = 1,
    ToggleEffects = 2,
    ToggleEnabled = 3,
    ToggleVisibility = 4,
    SpawnObject = 5,
    ChangeMaterial = 6
}

---------------------------
---   Component Types   ---
---------------------------

local ComponentBase = {}
ComponentBase.__index = ComponentBase

function ComponentBase.New(target, updateOverTime, behaviorType, behaviorParams)
    ---@class ComponentBase
    local self = setmetatable({
		Target = target,
		Behavior = GetBehavior(target, behaviorType, behaviorParams),
        UpdateOverTime = updateOverTime,
		Listeners = {}
	}, ComponentBase)

    self.DestroyListener = target.destroyEvent:Connect(function()
        self.DestroyListener:Disconnect()
        self.DestroyListener = nil
        self.Behavior:Destroy()
        self:Destroy()
    end)

    if updateOverTime then
        self.UpdateTask = Task.Spawn(function()
            while true do
                local deltaTime = Task.Wait()
                self:Update(deltaTime)
            end
        end)
    end

	return self
end

function ComponentBase:Update(deltaTime)
    self.Behavior:Update(deltaTime)
end

function ComponentBase:Destroy()
    for _, listener in ipairs(self.Listeners) do
        listener:Disconnect()
    end
    self.Listeners = nil

    if self.UpdateTask then
        self.UpdateTask:Cancel()
        self.UpdateTask = nil
    end
end

--- Buff Component ---

local BuffComponent = setmetatable({}, {__index = ComponentBase})
BuffComponent.__index = BuffComponent

function BuffComponent.New(target, buffTargetId, buffId, updateOverTime, behaviorType, behaviorParams)
    ---@class BuffComponent
    local self = setmetatable(ComponentBase.New(target, updateOverTime, behaviorType, behaviorParams), BuffComponent)

    self.BuffId = buffId
    self.BuffTargetId = buffTargetId

    function OnBuffChanged(targetId, changedBuffId)
        if not self.UpdateOverTime and targetId == self.BuffTargetId and changedBuffId == self.BuffId then
            self.Behavior:Apply(BUFFS.HasBuff(self.BuffTargetId, self.BuffId))
        end
    end

    if not self.UpdateOverTime then
        self.Behavior:Apply(BUFFS.HasBuff(self.BuffTargetId, self.BuffId))
    end

    local targetEvents = BUFFS.GetTargetEvents(buffTargetId)

    self.Listeners =  {
        targetEvents.buffAddedEvent:Connect(OnBuffChanged),
        targetEvents.buffChangedEvent:Connect(OnBuffChanged),
        targetEvents.buffRemovedEvent:Connect(OnBuffChanged)
    }

    return self
end

function BuffComponent:Update(deltaTime)
    if self.UpdateOverTime then
        if BUFFS.HasBuff(self.BuffTargetId, self.BuffId) then
            self.Behavior:Update(deltaTime, BUFFS.GetBuffRemainingTime(self.BuffTargetId, self.BuffId) / BUFFS.GetBuffDuration(self.BuffTargetId, self.BuffId))
            self.HadBuff = true
        elseif self.HadBuff then
            self.Behavior:Update(deltaTime, 0.0)
            self.HadBuff = false
        end
    end
end

--- Producer Component ---

local ProducerComponent = setmetatable({}, {__index = ComponentBase})
ProducerComponent.__index = ProducerComponent

function ProducerComponent.New(target, producerBaseId, changeOnEmpty, changeOnPlaced, changeOnBuild, changeOnReady, changeOnCollected, changeOnExpired, changeOnRemoved, updateOverTime, behaviorType, behaviorParams)
    ---@class ProducerComponent
    local self = setmetatable(ComponentBase.New(target, updateOverTime, behaviorType, behaviorParams), ProducerComponent)

    self.ProducerBaseId = producerBaseId
    self.ChangeOnEmpty = changeOnEmpty
    self.ChangeOnPlaced = changeOnPlaced
    self.ChangeOnBuild = changeOnBuild
    self.ChangeOnReady = changeOnReady
    self.ChangeOnCollected = changeOnCollected
    self.ChangeOnExpired = changeOnExpired
    self.ChangeOnRemoved = changeOnRemoved

    local producerBaseState = PRODUCERS.GetProducerBaseState(self.ProducerBaseId)
    if producerBaseState then
        if producerBaseState.hasExpired and not self.UpdateOverTime then
            self.Behavior:Apply(self.ChangeOnExpired)
        elseif producerBaseState.isReadyForCollect then
            self.Behavior:Apply(self.ChangeOnReady)
        elseif producerBaseState.hasStartedBuilding and not self.UpdateOverTime then
            self.Behavior:Apply(self.ChangeOnBuild)
        elseif producerBaseState.producerId then
            self.Behavior:Apply(self.ChangeOnPlaced)
        elseif not producerBaseState.producerId then
            self.Behavior:Apply(self.ChangeOnEmpty)
        else
            self.Behavior:Apply(false)
        end
    end

    function OnProducerPlaced(objectId, placeableId, producerId)
        if objectId == self.ProducerBaseId then
            self.Behavior:Apply(self.ChangeOnPlaced)
        end
    end

    function OnProducerBuild(objectId, placeableId, producerId)
        if objectId == self.ProducerBaseId and not self.UpdateOverTime then
            self.Behavior:Apply(self.ChangeOnBuild)
        end
    end

    function OnProducerReady(objectId, placeableId, producerId)
        if objectId == self.ProducerBaseId then
            self.Behavior:Apply(self.ChangeOnReady)
        end
    end

    function OnProducerCollected(objectId, placeableId, producerId)
        if objectId == self.ProducerBaseId then
            self.Behavior:Apply(self.ChangeOnCollected)
            local state = PRODUCERS.GetProducerBaseState(self.ProducerBaseId)
            if not state.producerId then
                self.Behavior:Apply(self.ChangeOnEmpty)
            end
        end
    end

    function OnProducerExpired(objectId, placeableId, producerId)
        if objectId == self.ProducerBaseId and not self.UpdateOverTime then
            self.Behavior:Apply(self.ChangeOnExpired)
        end
    end

    function OnProducerRemoved(objectId, placeableId, producerId)
        if objectId == self.ProducerBaseId then
            self.Behavior:Apply(self.ChangeOnRemoved)
            self.Behavior:Apply(self.ChangeOnEmpty)
        end
    end

    self.Listeners = {
        Events.Connect(PRODUCERS.Events.ProducerPlaced, OnProducerPlaced),
        Events.Connect(PRODUCERS.Events.ProducerStartedBuilding, OnProducerBuild),
        Events.Connect(PRODUCERS.Events.ProducerReadyForCollect, OnProducerReady),
        Events.Connect(PRODUCERS.Events.ProducerCollected, OnProducerCollected),
        Events.Connect(PRODUCERS.Events.ProducerExpired, OnProducerExpired),
        Events.Connect(PRODUCERS.Events.ProducerRemoved, OnProducerRemoved),
    }

    return self
end

function ProducerComponent:Update(deltaTime)
    if self.UpdateOverTime then
        if self.ChangeOnBuild then
            local producerBaseState = PRODUCERS.GetProducerBaseState(self.ProducerBaseId)
            if producerBaseState and producerBaseState.buildAmount > 0 then
                self.Behavior:Update(deltaTime, producerBaseState.buildAmount)
            end
        elseif self.ChangeOnExpired then
            local producerBaseState = PRODUCERS.GetProducerBaseState(self.ProducerBaseId)
            if producerBaseState and producerBaseState.expireAmount > 0 then
                self.Behavior:Update(deltaTime, producerBaseState.expireAmount)
            end
        end
    end
end

--- Area Component ---

local AreaComponent = setmetatable({}, {__index = ComponentBase})
AreaComponent.__index = AreaComponent

function AreaComponent.New(target, areaIds, changeOnEnter, changeOnExit, localOnly, behaviorType, behaviorParams)
    ---@class AreaComponent
    local self = setmetatable(ComponentBase.New(target, false, behaviorType, behaviorParams), AreaComponent)

    self.AreaIds = areaIds
    self.ChangeOnEnter = changeOnEnter
    self.ChangeOnExit = changeOnExit
    self.LocalOnly = localOnly

    function OnPlayerAreaChanged(player, newAreaId, lastAreaId)
        if not self.LocalOnly or player == Game.GetLocalPlayer() then
            if self:IsValidArea(newAreaId) then
                self.Behavior:Apply(self.ChangeOnEnter)
            elseif self:IsValidArea(lastAreaId) then
                self.Behavior:Apply(self.ChangeOnExit)
            else
                self.Behavior:Apply(false)
            end
        end
    end

    self.Listeners =  {
        Events.Connect(AREAS.Events.PlayerAreaChanged, OnPlayerAreaChanged)
    }

    return self
end

function AreaComponent:IsValidArea(areaId)
    for _, validAreaId in ipairs(self.AreaIds) do
        if validAreaId == areaId then
            return true
        end
    end
    return false
end

--- Crafting Station Component ---

local CraftingStationComponent = setmetatable({}, {__index = ComponentBase})
CraftingStationComponent.__index = CraftingStationComponent

function CraftingStationComponent.New(target, craftingStationId, recipes, changeOnCraft, changeOnReady, changeOnCollected, updateOverTime, behaviorType, behaviorParams)
    ---@class CraftingStationComponent
    local self = setmetatable(ComponentBase.New(target, updateOverTime, behaviorType, behaviorParams), CraftingStationComponent)

    self.CraftingStationId = craftingStationId
    self.Recipes = recipes
    self.ChangeOnCraft = changeOnCraft
    self.ChangeOnReady = changeOnReady
    self.ChangeOnCollected = changeOnCollected

    function DoesMatchRecipes(recipes, recipeId)
        -- Blank string always matches
        if not recipes or recipes == "" or not recipeId or recipeId == "" then return true end

        -- Exact recipeId matches
        if TAGS.AnyMatch(recipes, recipeId) then return true end

        -- Recipe tags match
        local recipeData = CRAFTING.GetRecipeData(recipeId)
        if recipeData then
            return TAGS.AnyMatch(recipes, recipeData.Tags)
        end
        return false
    end

    local craftingStationState = CRAFTING.GetCraftingStationState(self.CraftingStationId)
    if craftingStationState then
        if craftingStationState.isReadyForCollect and DoesMatchRecipes(self.Recipes, craftingStationState.recipeId) then
            self.Behavior:Apply(self.ChangeOnReady)
        elseif craftingStationState.hasStartedCrafting and not self.UpdateOverTime and DoesMatchRecipes(self.Recipes, craftingStationState.recipeId) then
            self.Behavior:Apply(self.ChangeOnCraft)
        else
            self.Behavior:Apply(false)
        end
    end

    function OnCraftingStarted(craftingStationId, recipeId, amount)
        if craftingStationId == self.CraftingStationId and not self.UpdateOverTime and DoesMatchRecipes(self.Recipes, recipeId) then
            self.Behavior:Apply(self.ChangeOnCraft)
        end
    end

    function OnCraftingReady(craftingStationId, recipeId, amount)
        if craftingStationId == self.CraftingStationId and DoesMatchRecipes(self.Recipes, recipeId) then
            self.Behavior:Apply(self.ChangeOnReady)
        end
    end

    function OnCraftingCollected(craftingStationId, recipeId, amount)
        if craftingStationId == self.CraftingStationId and DoesMatchRecipes(self.Recipes, recipeId) then
            self.Behavior:Apply(self.ChangeOnCollected)
        end
    end

    self.Listeners =  {
        Events.Connect(CRAFTING.Events.StartedCrafting, OnCraftingStarted),
        Events.Connect(CRAFTING.Events.CraftingReadyForCollect, OnCraftingReady),
        Events.Connect(CRAFTING.Events.CraftingCollected, OnCraftingCollected)
    }

    return self
end

function CraftingStationComponent:Update(deltaTime)
    if self.UpdateOverTime then
        if self.ChangeOnCraft then
            local craftingStationState = CRAFTING.GetCraftingStationState(self.CraftingStationId)
            if craftingStationState and craftingStationState.craftAmount > 0 then
                self.Behavior:Update(deltaTime, craftingStationState.craftAmount)
            end
        end
    end
end

---------------------------
--- Component Behaviors ---
---------------------------

local BehaviorBase = {}
BehaviorBase.__index = BehaviorBase

function BehaviorBase.New(target, behaviorParams)
    ---@class BehaviorBase
    local self = setmetatable({
		Target = target,
		Params = behaviorParams,
        Task = nil
	}, BehaviorBase)
	return self
end

function BehaviorBase:Apply(isActive)
    if self.Task then
        self.Task:Cancel()
    end

    if self.Params.DelaySeconds and self.Params.DelaySeconds > 0 then
        self.Task = Task.Spawn(function()
            Task.Wait(self.Params.DelaySeconds)
            self:ApplyBehavior(isActive)
            self.Task = nil
        end)
    else
        self:ApplyBehavior(isActive)
    end
end

function BehaviorBase:ApplyBehavior(isActive)
    error("ApplyBehavior must be overridden by the derived class")
end

function BehaviorBase:Update(deltaTime)
end

function BehaviorBase:Destroy()
    self.Target = nil
    self.Params = nil
end

--- Color Change Behavior ---

local ColorChangeBehavior = setmetatable({}, {__index = BehaviorBase})
ColorChangeBehavior.__index = ColorChangeBehavior

function ColorChangeBehavior.New(target, behaviorParams)
    ---@class ColorChangeBehavior
    local self = setmetatable(BehaviorBase.New(target, behaviorParams), ColorChangeBehavior)

    self.Objects = {}
    self:CacheObjects(target)

	return self
end

function ColorChangeBehavior:Destroy()
    self.Target = nil
    self.Params = nil
    self.Objects = nil
end

function ColorChangeBehavior:CacheObjects(coreObject)
    if coreObject:IsA("StaticMesh") or coreObject:IsA("AnimatedMesh") then
        table.insert(self.Objects, coreObject)
    end
    if self.Params.IncludeDescendants then
        for _, child in ipairs(coreObject:GetChildren()) do
            self:CacheObjects(child)
        end
    end
end

function ColorChangeBehavior:ApplyBehavior(isActive)
    if isActive then
        self:ChangeColor(self.Params.ActiveColor)
    else
        self:ChangeColor(self.Params.InactiveColor)
    end
end

function ColorChangeBehavior:Update(deltaTime, ratio)
    ratio = 1 - ((1-ratio) * (1-ratio) * (1-ratio))

    local color = Color.Lerp(self.Params.InactiveColor, self.Params.ActiveColor, ratio)
    local diff = self:GetColor() - color

    if math.abs(diff.r) > 0.01 or math.abs(diff.g) > 0.01 or math.abs(diff.b) > 0.01 then
        self:ChangeColor(color)
    end
end

function ColorChangeBehavior:ChangeColor(color)
    for _, object in ipairs(self.Objects) do
        object:SetColor(color)
    end
end

function ColorChangeBehavior:GetColor()
    return self.Objects[1]:GetColor()
end

--- Toggle Effects Behavior ---

local ToggleEffectsBehavior = setmetatable({}, {__index = BehaviorBase})
ToggleEffectsBehavior.__index = ToggleEffectsBehavior

function ToggleEffectsBehavior.New(target, behaviorParams)
    ---@class ToggleEffectsBehavior
    local self = setmetatable(BehaviorBase.New(target, behaviorParams), ToggleEffectsBehavior)

    self.Effects = {}
    self:CacheEffects(target)

	return self
end

function ToggleEffectsBehavior:Destroy()
    self.Target = nil
    self.Params = nil
    self.Effects = nil
end

function ToggleEffectsBehavior:CacheEffects(coreObject)
    if coreObject:IsA("Vfx") or coreObject:IsA("Audio") or coreObject:IsA("SmartAudio") then
        table.insert(self.Effects, coreObject)
    end
    if self.Params.IncludeDescendants then
        for _, child in ipairs(coreObject:GetChildren()) do
            self:CacheEffects(child)
        end
    end
end

function ToggleEffectsBehavior:ApplyBehavior(isActive)
    if isActive then
        self:PlayEffects()
    else
        self:StopEffects()
    end
end

function ToggleEffectsBehavior:PlayEffects()
    for _, effect in ipairs(self.Effects) do
        effect:Play()
    end
end

function ToggleEffectsBehavior:StopEffects()
    for _, effect in ipairs(self.Effects) do
        effect:Stop()
    end
end

--- Toggle Enabled Behavior ---

local ToggleEnabledBehavior = setmetatable({}, {__index = BehaviorBase})
ToggleEnabledBehavior.__index = ToggleEnabledBehavior

function ToggleEnabledBehavior.New(target, behaviorParams)
    ---@class ToggleEnabledBehavior
    local self = setmetatable(BehaviorBase.New(target, behaviorParams), ToggleEnabledBehavior)

	return self
end

function ToggleEnabledBehavior:ApplyBehavior(isActive)
    if isActive then
        self.Target.isEnabled = not self.Params.DisableOnChange
    else
        self.Target.isEnabled = self.Params.DisableOnChange
    end
end

--- Toggle Visibility Behavior ---

local ToggleVisibilityBehavior = setmetatable({}, {__index = BehaviorBase})
ToggleVisibilityBehavior.__index = ToggleVisibilityBehavior

function ToggleVisibilityBehavior.New(target, behaviorParams)
    ---@class ToggleVisibilityBehavior
    local self = setmetatable(BehaviorBase.New(target, behaviorParams), ToggleVisibilityBehavior)

	return self
end

function ToggleVisibilityBehavior:ApplyBehavior(isActive)
    if isActive then
        if self.Params.HideOnChange then
            self.Target.visibility = Visibility.FORCE_OFF
        else
            self.Target.visibility = Visibility.INHERIT
        end
    else
        if self.Params.HideOnChange then
            self.Target.visibility = Visibility.INHERIT
        else
            self.Target.visibility = Visibility.FORCE_OFF
        end
    end
end

--- Spawn Object Behavior ---

local SpawnObjectBehavior = setmetatable({}, {__index = BehaviorBase})
SpawnObjectBehavior.__index = SpawnObjectBehavior

function SpawnObjectBehavior.New(target, behaviorParams)
    ---@class SpawnObjectBehavior
    local self = setmetatable(BehaviorBase.New(target, behaviorParams), SpawnObjectBehavior)
    self.Object = nil
	return self
end

function SpawnObjectBehavior:Destroy()
    if self.Params.DestroyWhenInactive and Object.IsValid(self.Object) then
        self.Object:Destroy()
    end

    self.Target = nil
    self.Params = nil
    self.Object = nil
end

function SpawnObjectBehavior:ApplyBehavior(isActive)
    if isActive then
        if self.Params.Asset and self.Params.Asset ~= "" then
            if Object.IsValid(self.Object) then
                self.Object:Destroy()
            end

            self.Object = World.SpawnAsset(self.Params.Asset, { parent = self.Target, position = self.Params.Offset, rotation = self.Params.Rotation, scale = self.Params.Scale })

            if not self.Params.LocalSpace then
                self.Object.parent = nil
                self.Object:SetWorldPosition(self.Params.Offset)
                self.Object:SetWorldRotation(self.Params.Rotation)
                self.Object:SetWorldScale(self.Params.Scale)
            end
        end
    else
        if self.Params.DestroyWhenInactive and Object.IsValid(self.Object) then
            self.Object:Destroy()
            self.Object = nil
        end
    end
end

--- Material Change Behavior ---

local MaterialChangeBehavior = setmetatable({}, {__index = BehaviorBase})
MaterialChangeBehavior.__index = MaterialChangeBehavior

function MaterialChangeBehavior.New(target, behaviorParams)
    ---@class MaterialChangeBehavior
    local self = setmetatable(BehaviorBase.New(target, behaviorParams), MaterialChangeBehavior)

    self.Objects = {}
    self:CacheObjects(target)

	return self
end

function MaterialChangeBehavior:Destroy()
    self.Target = nil
    self.Params = nil
    self.Objects = nil
end

function MaterialChangeBehavior:CacheObjects(coreObject)
    if coreObject:IsA("StaticMesh") or coreObject:IsA("AnimatedMesh") then
        table.insert(self.Objects, coreObject)
    end
    if self.Params.IncludeDescendants then
        for _, child in ipairs(coreObject:GetChildren()) do
            self:CacheObjects(child)
        end
    end
end

function MaterialChangeBehavior:ApplyBehavior(isActive)
    if isActive then
        self:ChangeMaterial(self.Params.ActiveMaterial, self.Params.ActiveColor)
    else
        self:ChangeMaterial(self.Params.InactiveMaterial, self.Params.InactiveColor)
    end
end

function MaterialChangeBehavior:ChangeMaterial(material, color)
    for _, object in ipairs(self.Objects) do
        for _, slot in ipairs(object:GetMaterialSlots()) do
            object:SetMaterialForSlot(material, slot.slotName)
            slot:SetColor(color)
        end
    end
end

---------------------------
---    API Functions    ---
---------------------------

function API.NewBuffComponent(caller, target, buffId, updateOverTime, behaviorType, behaviorParams, clientOnly)
    Task.Spawn(function()
        if not Object.IsValid(caller) then return end

        if not ValidateEnvironment(caller, clientOnly) then
            return
        end

        if not BUFFS.IsValidBuff(buffId) then
            error(string.format("The Buff Id: %s was invalid for component: %s", buffId, caller.name))
        end

        local buffTargetId = BUFFS.FindTargetByAncestors(caller)
        if buffTargetId == nil then
            Task.Wait()
            if not Object.IsValid(caller) then return end
        end

        buffTargetId = BUFFS.FindTargetByAncestors(caller)
        if buffTargetId == nil then
            -- Check for a Gatherable
            local gatherableGroupId = GATHERABLES.FindGatherableGroupId(caller)
            if gatherableGroupId then
                local index = GATHERABLES.FindGatherableIndex(gatherableGroupId, caller)
                if index and BUFFS.IsBuffTarget(gatherableGroupId .. tostring(index)) then
                    buffTargetId = gatherableGroupId .. tostring(index)
                end
            end
        end

        if buffTargetId == nil then
            warn(string.format("No Buff target was found for component: %s", caller.name))
            return
        end

        BuffComponent.New(target, buffTargetId, buffId, updateOverTime, behaviorType, behaviorParams)
    end)
end

function API.NewProducerComponent(caller, target, changeOnEmpty, changeOnPlaced, changeOnBuild, changeOnReady, changeOnCollected, changeOnExpired, changeOnRemoved, updateOverTime, behaviorType, behaviorParams, clientOnly)
    Task.Spawn(function()
        if not Object.IsValid(caller) then return end

        if not ValidateEnvironment(caller, clientOnly) then
            return
        end

        local producerBaseId = PRODUCERS.FindProducerBaseIdByAncestors(caller)
        if producerBaseId == nil then
            warn(string.format("No Producer Base was found for component: %s", caller.name))
            return
        end

        ProducerComponent.New(target, producerBaseId, changeOnEmpty, changeOnPlaced, changeOnBuild, changeOnReady, changeOnCollected, changeOnExpired, changeOnRemoved, updateOverTime, behaviorType, behaviorParams)
    end)
end

function API.NewAreaComponent(caller, target, area, areaGroupKey, changeOnEnter, changeOnExit, localOnly, behaviorType, behaviorParams, clientOnly)
    Task.Spawn(function()
        if not Object.IsValid(caller) then return end

        if not ValidateEnvironment(caller, clientOnly) then
            return
        end

        -- Wait for Areas to register
        Task.Wait()

        if not Object.IsValid(caller) then return end

        local areaIds = {}
        if area then
            table.insert(areaIds, AREAS.FindAreaByAncestors(area))
        end

        if areaGroupKey then
            for _, areaId in ipairs(AREAS.GetAllAssignableAreas(areaGroupKey)) do
                table.insert(areaIds, areaId)
            end
        end

        if #areaIds == 0 then
            warn(string.format("No Areas found for component: %s", caller.name))
            return
        end

        AreaComponent.New(target, areaIds, changeOnEnter, changeOnExit, localOnly, behaviorType, behaviorParams)
    end)
end

function API.NewCraftingStationComponent(caller, target, recipes, changeOnCraft, changeOnReady, changeOnCollected, updateOverTime, behaviorType, behaviorParams, clientOnly)
    Task.Spawn(function()
        if not Object.IsValid(caller) then return end

        if not ValidateEnvironment(caller, clientOnly) then
            return
        end

        local craftingStationId = CRAFTING.FindCraftingStationIdByAncestors(caller)
        if craftingStationId == nil then
            warn(string.format("No Crafting Station was found for component: %s", caller.name))
            return
        end

        CraftingStationComponent.New(target, craftingStationId, recipes, changeOnCraft, changeOnReady, changeOnCollected, updateOverTime, behaviorType, behaviorParams)
    end)
end

---------------------------
---  Private Functions  ---
---------------------------

function ValidateEnvironment(caller, clientOnly)
    if clientOnly and not Environment.IsClient() then
        local isSinglePlayer = (Environment.IsLocalGame() and not Environment.IsMultiplayerPreview()) or Environment.IsSinglePlayerPreview()
        if caller.isStatic and isSinglePlayer then
            warn(string.format("%s on parent: %s only works in Multiplayer Preview", caller.name, caller.parent.name))
        else
            warn(string.format("%s on parent: %s only works on the client", caller.name, caller.parent.name))
        end
        return false
    end
    return true
end

function GetBehavior(target, behaviorType, behaviorParams)
    if behaviorType == API.BehaviorType.ChangeColor then
        return ColorChangeBehavior.New(target, behaviorParams)
    elseif behaviorType == API.BehaviorType.ToggleEffects then
        return ToggleEffectsBehavior.New(target, behaviorParams)
    elseif behaviorType == API.BehaviorType.ToggleEnabled then
        return ToggleEnabledBehavior.New(target, behaviorParams)
    elseif behaviorType == API.BehaviorType.ToggleVisibility then
        return ToggleVisibilityBehavior.New(target, behaviorParams)
    elseif behaviorType == API.BehaviorType.SpawnObject then
        return SpawnObjectBehavior.New(target, behaviorParams)
    elseif behaviorType == API.BehaviorType.ChangeMaterial then
        return MaterialChangeBehavior.New(target, behaviorParams)
    end
end

return API