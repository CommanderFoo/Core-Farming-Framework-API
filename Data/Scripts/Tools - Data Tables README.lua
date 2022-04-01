--[[
     _______          _
    |__   __|        | |
       | | ___   ___ | |___
       | |/ _ \ / _ \| / __|
       | | (_) | (_) | \__ \
       |_|\___/ \___/|_|___/

    ------------------------------
    ---        OVERVIEW        ---
    ------------------------------

    Tools are Equipment that can be used to interact with Gatherable Objects and other future systems. Each Tool
    identifies itself with a ToolType. This is chacked against lists of valid ToolTypes on interactable objects to see
    if the Tool can interact with the object.

    Tools make use of the Interaction System to allow for easy to swap interaction styles. They support Look Direction, 
    Camera Direction and Mouse Pointer based interactions.

    The Inventory Module is integrated and optionally supports equipping / unequipping Tools from inside Inventories.

    Failed interactions can have custom errors that will be displayed to the Player. These can be helpful in letting the
    Player know which Tool to use on a specific object.

    If you have any questions or feedback please feel free to let us know!

        - Creators Discord: https://discord.gg/core-creators
        - Forums: https://forums.coregames.com/

    ------------------------------
    ---         SETUP          ---
    ------------------------------

    It is recommended to use the Tools in the Farming Frmaework as a starting point since they need to be built in a
    specific way. You can duplicate a Tool and modify it using the steps below.

    Tools can work with or without Inventory. You can drop a Tool directly into a scene or you can use the Inventory
    Module to let Players manage and equip Tools.

    Drop a Tool into the scene. Selecting it will show a Custom Property called "EquipmentId". This is what associates
    the Tool with an entry in the Data Table.

    Find the Equipment Data Table in the Project Content -> My Tables section. Add a new row for your Tool and fill in
    the details.

    1. Id (String, Key Column)

        - This should match the "EquipmentId" you set on the Tool Template. It must be unique across all Tools in the
        table.

    2. ToolType (String)

        - This is checked against various lists of valid tool types depending on what the tool interacts with. To get
        this tool to work with Gatherable or other interactive objects you will need to add this ToolType to those lists.

    3. ActionSeconds (Float)

        - The number of seconds this tool takes to complete an action.

    4. DoesToggle (Boolean)

        - If true, equipping this tool from an Inventory while it is already equipped will unequip it.

    5. AutoRepeat (Boolean)

        - If true, the tool will continue trying to interact as long as the player holds down the ability binding.

    6. EquipmentStance (String)

        - The player will change into this stance while this tool is equipped.

    7. RotateCWBinding (String)

        - The Binding to use when rotating Placeables clockwise. This Binding should exist in the Bindings Manager.

    8. RotateCCWBinding (String)

        - The Binding to use when rotating Placeables counter-clockwise. This Binding should exist in the Bindings
        Manager.

    9. RotationSpeed (Float)

        - This determines how fast the Tool will rotate a Placeable object when it is placing it.

    10. APIInteractionModule (Asset Reference)

        - This needs to be set to a valid Interaction System Module. Valid modules are "APILookInteractionModule",
        "APICameraDirectionInteractionModule" and "APIPointerInteractionModule". These modules change how the player
        interacts with the world while using this equipment.

    11. InteractionDistance (Float)

        - This is the minimum distance the Player needs to be from the object they are interacting with.

    12. HologramMaterial (Asset Reference)

        - (Optional) If set, this Material will be applied to the Placement Preview when placing a Placeable object.

    13. CanPlaceColor (Color)

        - If a Placement Preview is being used, this color will be applied to it when it is allowed to be placed.

    14. CannotPlaceColor (Color)

        - If a Placement Preview is being used, this color will be applied to it when it is not allowed to be placed.

    15. PlaceableId (String)

        - (Optional) If set, the Tool will always try to Place this Placeable when used. In the Farming Framework the
        Shovel uses this to place Soil.

    Some additional networked properties can also be seen. These should not be modified since they relay state to the
    Tool.

    Each Tool has a "Tool" Ability in it. The values on this Ability can be modified to get the specific behaviour,
    timing and animations you are looking for.

    --- Tools without Inventory ---

    Tools can be used like other Equipment in Core. You can just put Tools into a scene and Players will be able to pick
    them up by walking close to them and pressing "F".

    When a Player equips a new Tool while they are using one, the old Tool will be spawned back into the world in front
    of the Player.

    --- Tools with Inventory ---

    Using Tools with Inventory offers organization, hotbar, equipment toggling, dropping and more. Since Tools have Item
    data they can be more advanced. For example, you could build a single Tool that spawns in a display that changes
    based on the Item you have equipped from an Inventory.

    All you need to do to get a set of default Tools is drop an Inventory and Hotbar, or Hotbar template into your
    scene. These come with a set of Tools that you can use right out of the box. Pressing the hotbar number for a Tool
    will equip / unequip it. You can also open your Inventory and drag a Tool out of it to drop it into the world for
    other Players to pick up.

    To add or edit Tools you will need to make changes in potentially two areas.

    1. If you only need to edit the look or feel of the Tool itself, drag it into the scene and make changes to the
    template. Make sure you update the template with your changes when you are done.

    2. If you want to change or add new Tools at the Inventory level you will need to do the following:

        2.a. Open the Items Data Table.

        2.b. Find the Item you want to edit, or create a new row for one.

        2.c. Look at the fields on the Item you want to edit. Make any
        changes you want.

            CanEquip

                - If true, this item can be equipped from inventories that allow equipping.

            IsConsumableEquipment

                - If true, this item will be removed each time a successful equipment interaction is made while it is
                equipped.

            EquipmentTemplate

                - The Equipment to spawn and attach to the Player when this item is equipped from an Inventory.

            EquipmentVisualTemplate

                - An optional visual asset to spawn into invisible Equipment that supports this feature. This is useful
                for sharing a single Equipment across many items.

    3. If this is a new Tool and you want it to appear in a new Players Inventory by default, you will need to add
    a new Starting Item.

        3.a. Open the Starting Items Data Table.

        3.b. Add a new row.

        3.c. Set the ItemId field to match the Id of the Item Data for your Tool.

        3.d. Set the SlotIndex to be the slot number this Tool should appear in. If it happens to overlap with an item
        already in that slot, it will find the next available slot.

        3.e. Set the Amount to the number of this Item the Player should start with.

        3.f. If you have existing saved data you will need to delete it to test the new Starting Item.

    4. Run the game and see your changes in action.

    ------------------------------
    ---        EVENTS          ---
    ------------------------------

    There are a couple of Events specific to Tools that can be listened for in other scripts.

    APIEquipment.Events.EquippedItemFromWorld = "EQ_equippedFromWorld"

        - Handler = function(player, equipment) - Server Only

        - Sent when a Tool is Equipped by using the Pickup Trigger and not via an Inventory action.

    APIEquipment.Events.UnequippedItemIntoWorld = "EQ_unequippedIntoWorld"

        - Handler = function(player, equipment) - Server Only

        - Sent when a Tool is Equipped by using the Pickup Trigger and not via an Inventory action. The "equipment"
        referenced here is the previously equipped Tool and may already be destroyed.

    See the Inventory README file for additional Events related to using Tools from inside Inventories.

    ------------------------------
    ---   CHANGING THE ART     ---
    ------------------------------

    Tools usually have their art built into the template. However, if you use Tools with Inventory you can use an
    invisible Tool that spawns visual objects into itself based on the Item equipped by the Player.

    --- Art in the Template ---

    Add the Tool to the scene and expand its hierarchy. If you dig down you will see a ClientContext and in most cases a
    "Geo" folder inside that. Art for the Tool can exist anywhere inside the ClientContext. The "Geo" grou is purely for
    organization.

        Axe Tool
        |__ Tool                    <-- Adjust settings on this to change the Tool timings and animation
        |__ Client Context
        |   |__ Selection Outline   <-- Change the settings on this to change how the Tool outlines interactable objects
        |   |__ Geo                 <-- Add or update art here
        |__ Pickup Trigger

    --- Inventory Driven Art ---

    1. Make a template that looks the way you want. Use the standard tools to make sure the template will spawn on a
    Player where you want it to.

    2. Navigate to the Inventory in your hierarchy that contains the Item data for the Tool and expand it.

    3. Expand the "Database" child, then expand the "Items" child.

    4. Click on the Item you want to edit.

    5. Look at the Custom Properties, specifically under "Equipment" on the Item Data you want to edit. Reference your
    art template under "EquipmentVisualTemplate".

    Now when you equip your Tool from an Inventory it will spawn your art into itself. Using this approach you can set
    up a single Tool to use for a variety of Items. For example, you could have Seed Packets equip a Plant Tool and have
    the art for the Plant Tool represent the Seed Packet that you have equipped.

    ------------------------------
    ---  OBJECT INTERACTIONS   ---
    ------------------------------

    The following section requires some knowledge of Lua in Core.

    Tools can interact with objects in the world in a generic way. An object needs to register itself as an Equipment
    Target to become interactable. For an example of this you can look at the code in GatherableGroup.lua to see how it
    registers the Gatherable Objects as targets when they spawn.

    To create your own Equipment Target you need to have a script that will register it. You will also need to make sure
    that the object has a collider for the Interaction System to hit. As long as the collider hit is a child of the
    registered target the interaction methods will be called.

    This script should be in a ClientContext.

        local COMPONENT_ROOT = script:GetCustomProperty("ComponentRoot"):WaitForObject()
        local EQUIPMENT = require(script:GetCustomProperty("APIEquipment"))

        function CanEquipmentInteract(player, target, toolType, equipmentSettings)
            -- This should return (boolean success, string interactionError)
            -- equipmentSettings is only set if the Tool was equipped via Inventory and contains the values on the networked properties on the Tool
        end

        function EquipmentInteract(player, target, toolType, equipmentSettings)
            -- This should return (boolean success, string interactionError)
            -- equipmentSettings is only set if the Tool was equipped via Inventory and contains the values on the networked properties on the Tool
        end

        EQUIPMENT.RegisterEquipmentTarget(COMPONENT_ROOT, {
            CanEquipmentInteract = CanEquipmentInteract,
            EquipmentInteract = EquipmentInteract
        })

    CanEquipmentInteract will be called each frame that a Tool is hovering over this registered target.
    EquipmentInteract will be called if the Player activates the Tool while CanEquipmentInteract is returning true.

    This system lets any object be a part of the Tool interaction system without the Equipment API needing to know
    anything about it.
--]]