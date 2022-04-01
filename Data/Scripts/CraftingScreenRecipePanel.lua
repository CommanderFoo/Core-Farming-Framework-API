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

-- Internal Variables
local COMPONENT_ROOT = script:GetCustomProperty("ComponentRoot"):WaitForObject()

---@type APICrafting
local CRAFTING = require(script:GetCustomProperty("APICrafting"))
---@type APIDatabase
local DATABASE = require(script:GetCustomProperty("APIDatabase"))
---@type APIIconManager
local ICON_MANAGER = require(script:GetCustomProperty("APIIconManager"))
---@type APIInteractionManager
local INTERACTION_MANAGER = require(script:GetCustomProperty("APIInteractionManager"))
local INTERACTION_MODULE = require(script:GetCustomProperty("APIInteractionModule"))
---@type APIUILibrary
local UI = require(script:GetCustomProperty("APIUILibrary"))
---@type APITags
local TAGS = require(script:GetCustomProperty("APITags"))

local RECIPES_PANEL = COMPONENT_ROOT:GetCustomProperty("RecipesPanel"):WaitForObject()
local SELECTED_RECIPE_PANEL = COMPONENT_ROOT:GetCustomProperty("SelectedRecipePanel"):WaitForObject()
local RECIPES_CONTAINER = COMPONENT_ROOT:GetCustomProperty("RecipesContainer"):WaitForObject()
local RECIPE_TEMPLATE = COMPONENT_ROOT:GetCustomProperty("RecipeTemplate")
local RECIPES_PER_PAGE = COMPONENT_ROOT:GetCustomProperty("RecipesPerPage")
local PADDING = COMPONENT_ROOT:GetCustomProperty("Padding")
local PAGINATION = COMPONENT_ROOT:GetCustomProperty("Pagination"):WaitForObject()
local PREVIOUS_PAGE_BUTTON = COMPONENT_ROOT:GetCustomProperty("PreviousPageButton"):WaitForObject()
local NEXT_PAGE_BUTTON = COMPONENT_ROOT:GetCustomProperty("NextPageButton"):WaitForObject()
local CURRENT_PAGE = COMPONENT_ROOT:GetCustomProperty("CurrentPage"):WaitForObject()
local OUTPUT_ICON = COMPONENT_ROOT:GetCustomProperty("OutputIcon"):WaitForObject()
local OUTPUT_NAME = COMPONENT_ROOT:GetCustomProperty("OutputName"):WaitForObject()
local INGREDIENTS_CONTAINER = COMPONENT_ROOT:GetCustomProperty("IngredientsContainer"):WaitForObject()
local INGREDIENT_TEMPLATE = COMPONENT_ROOT:GetCustomProperty("IngredientTemplate")
local CRAFT_BUTTON = COMPONENT_ROOT:GetCustomProperty("CraftButton"):WaitForObject()
local ERROR_TEXT = COMPONENT_ROOT:GetCustomProperty("ErrorText"):WaitForObject()
local DECREMENT_AMOUNT_BUTTON = COMPONENT_ROOT:GetCustomProperty("DecrementAmountButton"):WaitForObject()
local INCREMENT_AMOUNT_BUTTON = COMPONENT_ROOT:GetCustomProperty("IncrementAmountButton"):WaitForObject()
local AMOUNT = COMPONENT_ROOT:GetCustomProperty("Amount"):WaitForObject()
local TIME = COMPONENT_ROOT:GetCustomProperty("Time"):WaitForObject()

-- Constants
local CRAFTING_TAG = "CFT_"
local EVENT_RECIPE_SELECTED = CRAFTING_TAG .. "recipeSelected"
local SELECTION_SET = "CraftingScreen"
local LOCAL_PLAYER = Game.GetLocalPlayer()

-- Private Variables
local craftingStationId
local craftingStationDataId
local iconCameraId
local validRecipeIds
local currentPage
local currentRecipeId
local currentAmount = 1
local recipeObjects = {}
local ingredientObjects = {}
local listeners = {}

function Initialize(id, dataId, cameraId)
    COMPONENT_ROOT.visibility = Visibility.FORCE_ON

    craftingStationId = id
    craftingStationDataId = dataId
    iconCameraId = cameraId

    -- Read the current page for this specific station or the window without a station
    if craftingStationId then
        currentPage = LOCAL_PLAYER.clientUserData[CRAFTING_TAG .. craftingStationId .. "CurrentPage"] or 1
    else
        currentPage = LOCAL_PLAYER.clientUserData[CRAFTING_TAG .. "CurrentPage"] or 1
    end

    SetupRecipes()

    if #validRecipeIds > 0 then
        currentRecipeId = validRecipeIds[math.min(#validRecipeIds, (currentPage - 1) * RECIPES_PER_PAGE + 1)]

        SetupItems()
        SelectRecipe()

        if #validRecipeIds < RECIPES_PER_PAGE then
            PAGINATION.visibility = Visibility.FORCE_OFF
        else
            PREVIOUS_PAGE_BUTTON.clickedEvent:Connect(HandlePreviousClicked)
            NEXT_PAGE_BUTTON.clickedEvent:Connect(HandleNextClicked)
        end

        listeners = {
            Events.Connect(EVENT_RECIPE_SELECTED, HandleRecipeSelected),
            DECREMENT_AMOUNT_BUTTON.clickedEvent:Connect(HandleDecrementAmountButtonClicked),
            INCREMENT_AMOUNT_BUTTON.clickedEvent:Connect(HandleIncrementAmountButtonClicked),
            CRAFT_BUTTON.clickedEvent:Connect(HandleCraftButtonClicked)
        }

        RECIPES_PANEL.visibility = Visibility.INHERIT
        SELECTED_RECIPE_PANEL.visibility = Visibility.INHERIT
        ERROR_TEXT.visibility = Visibility.FORCE_OFF
    else
        RECIPES_PANEL.visibility = Visibility.FORCE_OFF
        SELECTED_RECIPE_PANEL.visibility = Visibility.FORCE_OFF
        ERROR_TEXT.visibility = Visibility.INHERIT
        ERROR_TEXT.text = "No Available Recipes!"
    end
end

function Cleanup()
    for _, listener in ipairs(listeners) do
        listener:Disconnect()
    end
    listeners = {}

    if Object.IsValid(COMPONENT_ROOT) then
        COMPONENT_ROOT.visibility = Visibility.FORCE_OFF
    end
end

function SetupRecipes()
    validRecipeIds = CRAFTING.GetValidRecipeIds(craftingStationDataId)
end

function SetupItems()
    for _, recipeObject in pairs(recipeObjects) do
        if Object.IsValid(recipeObject) then
            recipeObject:Destroy()
        end
    end

    recipeObjects = {}

    local startIndex = (currentPage - 1) * RECIPES_PER_PAGE
    local recipeNum = 0
    for i = startIndex + 1, math.min(startIndex + RECIPES_PER_PAGE, #validRecipeIds), 1 do
        local recipeObject = World.SpawnAsset(RECIPE_TEMPLATE, { parent = RECIPES_CONTAINER })
        recipeObject.y = recipeNum * (recipeObject.height + PADDING)
        recipeNum = recipeNum + 1

        local recipeControllerRef = recipeObject:GetCustomProperty("Controller")
        if recipeControllerRef then
            local recipeController = recipeControllerRef:WaitForObject().context
            if recipeController and recipeController.Initialize then
                recipeController.Initialize(validRecipeIds[i], iconCameraId)
            else
                warn("No Controller found for Recipe UI. The \"Controller\" custom property may not be set, or the referenced controller script does not have an \"Initialize(recipeId, cameraId)\" method")
            end
        end

        recipeObjects[validRecipeIds[i]] = recipeObject
    end

    CURRENT_PAGE.text = string.format("Page %d / %d", currentPage, math.ceil(#validRecipeIds / RECIPES_PER_PAGE))

    -- Save the current page for this specific station or the window without a station
    if craftingStationId then
        LOCAL_PLAYER.clientUserData[CRAFTING_TAG .. craftingStationId .. "CurrentPage"] = currentPage
    else
        LOCAL_PLAYER.clientUserData[CRAFTING_TAG .. "CurrentPage"] = currentPage
    end
end

function HandleRecipeSelected(recipeId)
    currentRecipeId = recipeId

    SelectRecipe()
end

function HandlePreviousClicked(button)
    if currentPage > 1 then
        currentPage = currentPage - 1
    else
        currentPage = math.ceil(#validRecipeIds / RECIPES_PER_PAGE)
    end

    currentRecipeId = validRecipeIds[math.min(#validRecipeIds, (currentPage - 1) * RECIPES_PER_PAGE + 1)]

    SetupItems()
    SelectRecipe()
end

function HandleNextClicked(button)
    if currentPage < math.ceil(#validRecipeIds / RECIPES_PER_PAGE) then
        currentPage = currentPage + 1
    else
        currentPage = 1
    end

    currentRecipeId = validRecipeIds[math.min(#validRecipeIds, (currentPage - 1) * RECIPES_PER_PAGE + 1)]

    SetupItems()
    SelectRecipe()
end

function HandleDecrementAmountButtonClicked(button)
    if currentAmount > 1 then
        currentAmount = currentAmount - 1
        SetAmountText()
        UpdateAmountButtons()
    end
end

function HandleIncrementAmountButtonClicked(button)
    if CRAFTING.CanCraft(LOCAL_PLAYER, craftingStationId, currentRecipeId, currentAmount + 1) then
        currentAmount = currentAmount + 1
        SetAmountText()
        UpdateAmountButtons()
    end
end

function HandleCraftButtonClicked(button)
    CRAFTING.StartCrafting(LOCAL_PLAYER, craftingStationId, currentRecipeId, currentAmount)
end

function SelectRecipe()
    local recipeData = DATABASE.Recipes[currentRecipeId]

    -- Set the selection on the Input Manager
    INTERACTION_MANAGER.DeselectAll(INTERACTION_MODULE.Module, SELECTION_SET, LOCAL_PLAYER)
    INTERACTION_MANAGER.Select(INTERACTION_MODULE.Module, recipeObjects[currentRecipeId], SELECTION_SET, LOCAL_PLAYER)

    -- Setup icon
    OUTPUT_ICON.visibility = Visibility.INHERIT
    if recipeData.IsKitbashed2DIcon then
        OUTPUT_ICON:SetImage(nil)
        OUTPUT_ICON:SetColor(Color.New(0, 0, 0, 0))
        World.SpawnAsset(recipeData.IconAsset, { parent = OUTPUT_ICON })
    elseif recipeData.Is3DIcon then
        ICON_MANAGER.SetIcon(OUTPUT_ICON, iconCameraId, recipeData.IconAsset, CameraCaptureResolution.MEDIUM)
    elseif recipeData.IsImageIcon then
        OUTPUT_ICON:SetImage(recipeData.IconAsset)
    else
        OUTPUT_ICON.visibility = Visibility.FORCE_OFF
    end

    SetAmountText()

    -- Clear old ingredients
    for _, ingredientObject in ipairs(ingredientObjects) do
        if Object.IsValid(ingredientObject.Object) then
            ingredientObject.Object:Destroy()
        end
    end

    ingredientObjects = {}

    -- Create the ingredient list
    local row = 0
    local column = 0
    for _, inputData in pairs(recipeData.Inputs) do
        local ingredientObject = World.SpawnAsset(INGREDIENT_TEMPLATE, { parent = INGREDIENTS_CONTAINER })
        if (column + 1) * (ingredientObject.width + PADDING) <= INGREDIENTS_CONTAINER.width then
            ingredientObject.x = column * (ingredientObject.width + PADDING)
            ingredientObject.y = row * (ingredientObject.height + PADDING)
        else
            row = row + 1
            column = 0

            ingredientObject.x = column * (ingredientObject.width + PADDING)
            ingredientObject.y = row * (ingredientObject.height + PADDING)
        end

        column = column + 1

        local ingredientControllerRef = ingredientObject:GetCustomProperty("Controller")
        local ingredientController
        if ingredientControllerRef then
            ingredientController = ingredientControllerRef:WaitForObject().context
            if ingredientController and ingredientController.Initialize then
                ingredientController.Initialize(inputData, iconCameraId, currentAmount)
            else
                warn("No Controller found for Ingredient UI. The \"Controller\" custom property may not be set, or the referenced controller script does not have an \"Initialize(inputData, cameraId)\" method")
            end
        end

        table.insert(ingredientObjects, {
            Object = ingredientObject,
            Controller = ingredientController
        })
    end

    UpdateAmountButtons()
    CRAFT_BUTTON.isInteractable = CRAFTING.CanCraft(LOCAL_PLAYER, craftingStationId, currentRecipeId, currentAmount)
end

function UpdateAmountButtons()
    DECREMENT_AMOUNT_BUTTON.isInteractable = (currentAmount > 1)
    INCREMENT_AMOUNT_BUTTON.isInteractable = CRAFTING.CanCraft(LOCAL_PLAYER, craftingStationId, currentRecipeId, currentAmount + 1)
end

function SetAmountText()
    local recipeData = DATABASE.Recipes[currentRecipeId]

    AMOUNT.text = string.format("x%d", currentAmount)
    OUTPUT_NAME.text = CRAFTING.GetOutputText(currentRecipeId, currentAmount)
    TIME.text = UI.FormatTime((recipeData.CraftSeconds * currentAmount) / CRAFTING.GetCraftRate(craftingStationId), UI.TimeFormatStyle.Character)

    for _, ingredientData in ipairs(ingredientObjects) do
        if ingredientData.Controller then
            ingredientData.Controller.UpdateAmount(currentAmount)
        end
    end
end

COMPONENT_ROOT.visibility = Visibility.FORCE_OFF