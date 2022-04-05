--[[
      _____            __ _   _
     / ____|          / _| | (_)
    | |     _ __ __ _| |_| |_ _ _ __   __ _
    | |    | '__/ _` |  _| __| | '_ \ / _` |
    | |____| | | (_| | | | |_| | | | | (_| |
     \_____|_|  \__,_|_|  \__|_|_| |_|\__, |
                                       __/ |
    ------------------------------    |___/
    ---        OVERVIEW        ---
    ------------------------------

    The Crafting system can be used to turn one thing into another over a period of time. This can be done at individual
    Crafting Stations or through a screen not associated to a station.

    If you have any questions or feedback please feel free to let us know!

        - Creators Discord: https://discord.gg/core-creators
        - Forums: https://forums.coregames.com/

    ------------------------------
    ---         SETUP          ---
    ------------------------------

    There are a couple different ways to approach Crafting, and the method you choose will depend on how you want
    Crafting to work in your game.

    This document is assuming that you are using Data Tables to balance your game data. It is highly recommended that
    you use the Farming Framework as a starting point. Doing this will let you copy or modify an existing Crafting
    Station or Global Crafting settings.

        1. Global Crafting

            - This is Crafting without a Crafting Station. The Player can open a screen and craft directly through it no
              matter where they are. See the "Global Crafting" section below.

        2. Crafting Stations

            - Each station maintains it's own Crafting state, so Players can craft at multiple stations at the same
              time. See the "Crafting Stations" section below.

    ------------------------------
    ---    GLOBAL CRAFTING     ---
    ------------------------------

    You will need to ensure that you have a Database with the following categories pointing at Data Tables:

        * CraftingStations
        * Drops
        * DropBehaviours
        * Recipes

        * CraftingStationBuffs (If using Buffs)
        * DropModifiers (If using Buffs)
        * Other associated tables like Items, Inventories, etc... (See other Readmes for details on those)

    --- Crafting Stations Data Table ---

    Global Crafting requires a row in the Crafting Stations Data Table with the "Id" of "Global". This lets you define
    some behavior for crafting:

        1. ItemId

            - Leave this blank since this row is not associated with a Crafting Station.

        2. OverrideScreenId

            - This can be used if you want to use a different screen for Global Crafting. To do this you should
            duplicate "Crafting Screen", change it to look the way you want and add an entry into the "Screens" table.
            The Screen Id can then be put into this field. Custom screens are an advanced feature as you need to ensure
            that the code on the screen functions correctly.

        3. AllowAllRecipes

            - If true, every Recipe in the Database will show up in the Crafting Screen.

        4. Recipes

            - This can be a mix of Recipe Ids and Recipe Tags. This lets you limit exactly which Recipes show up in the
            Crafting Screen.

        5. DropInWorld

            - If true, crafted items will drop into the world to be picked up, otherwise they will go directly into the
            Players' Inventory. This should be false for Global Crafting.

        6. DropBehaviorId

            - Only needed if "DropInWorld" is true. This should link to an Id in the DropBehaviors Data Table. A Drop
            Behavior lets you fine tune exactly how items dropped in the world can be interacted with. This is not
            needed for Global Crafting.

    --- Recipes Data Table ---

    Each Recipe needs information that defines how it can be crafted, what it consumes, drops and how long it takes. Add
    a row to the Recipe Data Table for each Recipe you want Players to be able to craft.

        1. Id

            - The Recipe Id, this needs to be unique across all Recipes.

        2. Name

            - This shows up in UI when viewing Recipes.

        3. UniqueStorageId

            - This is used to create compact saved data. Each Recipe needs to have a unique number here that no other
            Recipe uses. These should never change or be reused by other Recipes.

        4. Tags

            - (Optional) A comma separated list of tags describing the Recipe. This can be used in the Crafting Station Data Table
            to limit which Recipes or groups of Recipes can be crafted on a station.

        5. CraftSeconds

            - The amount of seconds it takes to craft one copy of this Recipe.

        6. OutputText

            - (Optional) Displayed in the Crafting Screen when viewing a Recipe. This will be auto-generated if left empty.

        7. DropIds

            - A comma separated list of Drop Ids. These Ids should link to rows in the Drops Data Table. This is the
            output of a Recipe.

        8. IconCameraId

            - If "Is3DIcon" is true, this can be used to override which Icon Generator is used to create the icon for
            this Recipe. The value on the Crafting Screen will be used by default.

        9. IconAsset

            - The image or template to use for an icon. If "IsKitbashed2DIcon" is true, this should be a UI template. If
            "Is3DIcon" is true, this should be a 3D object template. If "IsImageIcon" is true, this should be an
            image/brush asset.

        10. IsKitbashed2DIcon

            - If true, the "IconAsset" should point to a UI template. This template will be spawned as the icon.

        11. Is3DIcon

            - If true, the "IconAsset" should point to a 3D object template. An image of this template will be used as
            the icon.

        12. IsImageIcon

            - If true, the "IconAsset" should point to an image/brush asset. This will be used as the icon.

        13. InputItemId[n]

            - (Optional) The Item Id needed to craft this Recipe. You can add additional columns to the table for more
            required inputs by following the naming convention and incrementing the number.

        14. InputCurrencyId[n]

            - (Optional) The Currency Id needed to craft this Recipe. You can add additional columns to the table for
            more required inputs by following the naming convention and incrementing the number.

        15. InputAmount[n]

            - The amount of the Item or Currency needed to craft this Recipe. You can add additional columns to the
            table for more required inputs by following the naming convention and incrementing the number.

    --- Drops Data Table ---

    Each Drop Data has the following properties. Weighted drops are treated differently than percentage based drops. If
    you set a WeightedChance on a Drop Data the PercentChance will be ignored.

    All drops with WeightedChance will be collected and a single drop will be selected based on the weights. This is
    useful for rarity based drops when you want a guaranteed drop.

    All PercentChance drops will be individually rolled. These drops may or may not drop depending on the roll.

        1. Id

            - The Id of this Drop. Must be unique across all drops. This is used in other Data Tables to refer to this
            Drop.

        2. ItemId

            - The id of the item that should be added to a Players Inventory. The item data needs to exist in a Database
            in the scene. If left blank, no item will drop.

        3. CurrencyId

            - The id of the Currency that should be added to a Player. A Currency Settings with the same id needs to
            exist in the scene. If left blank, no Currency will drop.

        4. UpgradeId

            - The id of the Upgrade that should be added to a Player. An Upgrade with the same id needs to exist in the
            Database in the scene. If left blank, no Upgrade will drop.

        5. WeightedChance

            - If greater than 0, this value will be combined with other Drop Data WeightedValues and a single drop will
            be picked from the collection based on the weight of each drop. Useful for rare items.

        6. PercentChance

            - If greater than 0, the percent chance (0 - 100) that this drop will be rewarded to the Player.

        7. MinAmount

            - The minimum amount of the item or Currency to drop.

        8. MaxAmount

            - The maximum amount of the item or Currency to drop.

        The general flow for creating this data would be:

            1. Create a row in the Crafting Stations Data Table with the Id "Global" and fill in the fields.

            2. Create rows in the Recipes Data Table and fill in the fields.

            3. Create rows in the Drops Data Table for all of your Recipe outputs.

    ------------------------------
    ---    CRAFTING STATION    ---
    ------------------------------

    You will need to ensure that you have a Database with the following categories pointing at Data Tables:

        * CraftingStations
        * Drops
        * DropBehaviours
        * Placeables
        * Recipes

        * CraftingStationBuffs (If using Buffs)
        * DropModifiers (If using Buffs)
        * Other associated tables like Items, Inventories, etc... (See other Readmes for details on those)

    --- Crafting Stations Data Table ---

    Each Crafting Station requires a row in the Crafting Stations Data Table with a unique "Id". See the Global Crafting
    information above for more details on this Data Table.

    --- Recipes Data Table ---

    See the Global Crafting information above for more details on this Data Table.

    --- Drops Data Table ---

    See the Global Crafting information above for more details on this Data Table.

    --- Drop Behaviors Data Table ---

    Entries in this data Table define how various dropped items behave and how Players can interact with them. Several
    other tables refer to rows here to manage how their own data drops into the world.

        1. Id

            - The Id of this Drop Behavior. This needs to be unique across all Drop Behaviors and is what you reference
            in "DropBehaviorId" columns in other Data Tables.

        2. Notes

            - (Optional) Some notes to describe the behavior. Useful for understanding how a row works at a glance. This
            is for your own information only and is not used in the game.

        3. DropForAllPlayers

            - If true, a drop will appear on every client. This allows for community based drops where everyone shares.
            It also allows for competitive drops.

        4. SinglePlayerDrops

            - If true and "DropForAllPlayers" is true, a drop will be removed from all clients when the first Player
            picks it up.

        5. MaxPickupsPerDrop

            - This can be used to split a drop into multiple pickup objects. The main use for this is to make your drops
            look more plentiful. A drop of 1000 coins with "MaxPickupsPerDrop" set to 5 would result in 5 pickups each
            containing 200 coins.

        6. DropMinDistance

            - The minimum distance from the origin of the object creating the drop that the drop should appear.

        7. DropMaxDistance

            - The maximum distance from the origin of the object creating the drop that the drop should appear.

        8. DropTimeoutSeconds

            - If greater than 0, the time a drop should remain in the world before being destroyed. It is recommended to
            set this to avoid build up over time, especially is "DropForAllPlayers" is true.

        9. DropItemPickupTemplate

            - This should be set to a Template that is compatible with drops and item pickups. The various example
            frameworks contain a couple versions of these and you can also create your own by following how the included
            ones are built.

    --- Placeables Data Table ---

    Each Crafting Station will need a row in the Placeables Data Table. This will let Players place a Crafting Station
    into a Placeables Replicator on their Lot. This data defines how the Crafting Station looks in world, how it can be
    placed and interacted with and more.

        1. Id

            - The Id of the Placeable. This must be unique across all Placeables and if an entry for it exists in the
            Items Data Table should match the Id of that Item.

        2. Name

            - This shows up in various UI elements and screens.

        3. Tags

            - A comma separated list of tags. These can be used to restrict Placeables in a group to being placed on
            specific objects.

        4. UniqueStorageId

            - This is used to create compact saved data. Each Placeable needs to have a unique number here that no other
            Placeable uses. These should never change or be reused by other Placeables.

        5. Client

            - (Optional) This template will be spawned into a Client Context when this Placeable is placed in world. A
            good spot to put client only scripts, effects and animations. In most cases you will want to use this to
            contain interactions with your Placeable object if they are needed (like clicking on it to open a screen)

        6. Server

            - (Optional) This template will be spawned into a Server Context when this Placeable is placed in world. A
            good spot to put server specific scripts.

        7. Static

            - (Optional) This template will be spawned into a Static Context when this Placeable is placed in world. A
            good spot to put collision.

        8. ValidReplicatorIdentifiers

            - (Optional) A comma separated list of Replicator Identifiers this can be placed into. This identifier is
            defined on the Player Lot Replicator Loader.

        9. ValidPlaceToolTypes

            - (Optional) A comma separated list of Tool Types or Item Ids that can be used to place this item. If left
            blank, any Tool that can place items could potentially place this one.

        10. ValidRemoveToolTypes

            - (Optional) A comma separated list of Tool Types or Item Ids that can be used to remove this item. If left
            blank, any Tool that can remove items could potentially remove this one.

        11. PlaceEffects

            - (Optional) If set, this template will be spawned when this is placed into the world. It is recommended to
            have a lifespan on this template. A default lifespan of 5 seconds will be used if it is set to 0.

        12. PlaceEffectsOffset

            - This will move where the "PlaceEffects" template spawns. It can be used to position the effect exactly
            where you need it.

        13. RemoveEffects

            - (Optional) If set, this template will be spawned when this is removed from the world. It is recommended to
            have a lifespan on this template. A default lifespan of 5 seconds will be used if it is set to 0.

        14. RemoveEffectsOffset

            - This will move where the "RemoveEffects" template spawns. It can be used to position the effect exactly
            where you need it.

        15. RemoveItemWhenPlaced

            - If true, the item will be removed from the Players Inventory when placed.

        16. PlacementPreview

            - (Optional) if set, this template will be spawned to act as a preview of where the item will be placed in
            world.

        17. PlacementOverlapCheckTrigger

            - (Optional) If set, this template will be spawned to act as an overlap checker when placing this object.
            Placement will not be allowed if it overlaps with anything marked as "Can Overlap Triggers". The template
            must include one or more Triggers to work.

        18. PlacementAreaTypes

            - (Optional) If set, this comma separated list of Placement Area Types will restrict this item to only being
            allowed to be placed on matching Placement Areas. If blank, the item can be placed on any surface.

        19. SnapToGrid

            - If true, the item will be constrained to a grid defined by the "GridSize" property.

        20. GridSize

            - The dimensions of the grid that the item will snap to if "SnapToGrid" is true.

        21. CanRotate

            - If true, the item can be rotated with the "Rotate Clockwise", "Rotate Counter-Clockwise" bindings and the
            "RotationSpeed" that are set on the Tool or Equipment Data for the Tool the Player is using.

        22. SnapRotation

            - If true, rotation will be snapped in increments of the angle set by "RotationSnapAngle".

        23. RotationSnapAngle

            - The angle increment to snap rotation of the item to if "SnapRotation" is true.

        24. AlignToSurface

            - If true, the Placeable will align itself to the surface of what it is being placed on.

        25. RotateWithLook

            - If true, the item will maintain its angle relative to the Player while being moved around before it is
            placed.

        26. CostItemId[n]

            - (Optional) The Item Id needed to place this Placeable. You can add additional columns to the table for
            more required costs by following the naming convention and incrementing the number.

        27. CostCurrencyId[n]

            - (Optional) The Currency Id needed to place this Placeable. You can add additional columns to the table for
            more required costs by following the naming convention and incrementing the number.

        28. CostAmount[n]

            - (Optional) The amount of the Item or Currency needed to place this Placeable. You can add additional
            columns to the table for more required costs by following the naming convention and incrementing the number.

        29. DestroyOnRemove

            - If true, the item will be destroyed when removed and no drops will be given to the Player.

        30. DropInWorldOnRemove

            - If true, drops will appear in world as Item Pickups when the item is removed. Otherwise they will go
            into the Players Inventory.

        31. DropPlacementCostsOnRemove

            - If true, any Costs for placing this item will be dropped along with other Drops.

        32. DropBehaviorId

            - Only needed if "DropInWorldOnRemove" is true. This should link to an Id in the DropBehaviors Data Table. A
            Drop Behavior lets you fine tune exactly how items dropped in the world can be interacted with.

        33. PlaceableBuffIds

            - (Optional) A comma separated list of Ids that exist as rows in the Placeable Buffs Data Table. These buffs
            are for basic Placeables that don't have advanced behavior. Crafting Stations should use the
            "CraftingStationBuffIds" column instead.

        34. ProducerBuffIds

            - (Optional) A comma separated list of Ids that exist as rows in the Producer Buffs Data Table. These buffs
            are for Producer Bases. Crafting Stations should use the "CraftingStationBuffIds" column instead.

        35. CraftingStationBuffIds

            - (Optional) A comma separated list of Ids that exist as rows in the Crafting Station Buffs Data Table.
            These buffs are for Crafting Stations.

        36. IsProducerBase

            - Set this to true if you are creating a Producer Base. If this is true then the Placeable can not also be a
            different advanced Placeable (Crafting Station, Inventory)

        37. ProducerBaseType

            - This will be referenced by ProducerData and will create the connection between a Producer and Producer
            Bases. Any Producer with this "ProducerBaseType" in its "ValidProducerBaseTypes" can be placed into this
            Producer Base.

        38. InitialProducerId

            - (Optional) When a Player places a Producer Base, this property will make the producer base come with an
            initial Producer. If left blank, the Producer Base will be empty and the Player must place a Producer on it.

        39. BuildRate

            - The build rate is a multiplier. If a Producer has a BuildDuration of 10 seconds, but the BuildRate is 2,
            then it will only take 5 seconds. Useful if you want special Producer Bases that can build Producers faster
            or slower.

        40. AllowExpiry

            - If true, Producers will expire after building when produced on this base.

        41. AddProducerText

            - (Optional) This will be used in tooltips to display any requirements for adding a Producer to this
            Producer Base to the Player. It is recommended to use a sentence like "Plant seeds in this" or similar.

        42. AllowProducerRemoval

            - If true, a Producer in this Producer Base can be removed without also removing the Producer Base.
            Otherwise both the Producer Base and the Producer will be removed together. This is useful in cases where it
            doesn't make sense to remove things in 2 steps.

        43. IsCraftingStation

            - Set this to true if you are creating a Crafting Station. If this is true then the Placeable can not also
            be a different advanced Placeable (Producer, Inventory)

        44. ValidCraftToolTypes

            - (Optional) A comma separated list of Tool Types or Item Ids that can be used to open the crafting screen.
            If left blank, any Tool or empty hands will open the screen.

        45. OpenCraftingStationInteractionText

            - (Optional) This text will show in a tooltip if a Player can't open the Crafting screen with their equipped
            Tool. It's a good spot to explain how to open the screen.

        46. CraftRate

            - The craft rate is a multiplier. If a Recipe has a CraftSeconds of 10 seconds, but the CraftRate is 2,
            then it will only take 5 seconds. Useful if you want special Crafting Stations that can craft faster or
            slower.

        47. AllowRemovalWhileInUse

            - If true, the Crafting Station can be removed while it is crafting a Recipe.

        48. DestroyCraftOnRemove

            - If true, the Recipe inputs will not be returned to the Player when the Crafting Station is removed.

        49. DropCraftInWorldOnRemove

            - If true and "DestroyCraftOnRemove" is false, the Recipe inputs or the finished Recipe will drop into the
            world when the Crafting Station is removed. Otherwise they will be added directly to the Players Inventory.

        50. IsInventory

            - Set this to true if you are creating a Placeable Inventory. If this is true then the Placeable can not
            also be a different advanced Placeable (Crafting Station, Producer)

        51. ValidOpenToolTypes

            - (Optional) A comma separated list of Tool Types or Item Ids that can be used to open the Inventory screen.
            If left blank, any Tool or empty hands will open the screen.

        52. OpenInventoryInteractionText

            - (Optional) This text will show in a tooltip if a Player can't open the Inventory screen with their
            equipped Tool. It's a good spot to explain how to open the screen.

        53. AllowNonEmptyRemoval

            - If true, the Placeable Inventory can be removed even if it contains items.

        54. DestroyContentsOnRemove

            - If true, the items inside the Placeable Inventory will be destroyed if it is removed.

        55. DropContentsInWorldOnRemove

            - If true and "DestroyContentsOnRemove" is false, the items inside a PlaceableInventory will be dropped into
            the world when it is removed. Otherwise they will be added directly to the Players Inventory.

    ------------------------------
    --- CRAFTING STATION BUFFS ---
    ------------------------------

    Crafting Stations can output Buffs like a normal Placeable. They can also receive Buffs that affect the Station. To
    add a Buff interaction to a Crafting Station you will need to use the following Data Tables.

        * Buffs
        * CraftingStationBuffs
        * DropModifiers (If a Buff is modifying a Recipe output)

    --- Buffs Data Table ---

    An entry for the Buff will need to be added to the Buffs Data Table.

        1. Id

            - The Id of the Buff. This is referenced in other Data Tables. It must be unique across all Buffs.

        2. Name

            - The name of the Buff. Will appear in some tooltips.

        3. UniqueStorageId

            - Used for networking and storage. Must be a unique number for each buff.

        4. Duration

            - How long this Buff will 'last'. Targets may adjust this value so this is the 'base value' of how long
            a Buff would last on a target. A duration of 0 means the Buff will be removed instantly.

        5. Permanent

            - Tick if you want the Buff to last forever (until something removes it)

        6. MaxStacks

            - If a buff lasts for 2 seconds, but has a stack of 2, then it could be added twice and last for 4
            seconds.

    --- Crafting Station Buffs Data Table ---

    Each type of Buff interaction on a Crafting Station will need a row in the Crafting Station Buffs Data Table. If you
    want the station to be able to receive a "Powered" Buff you would add a row for that and check "CanReceive" and fill
    out the other fields as you see fit. If the station should output a Buff you would check "CanOutput" and fill out
    the fields after that.

        1. Id

            - The Id of the Buff Interaction. This is referenced in the Placeables Data Table in the
            "CraftingStationBuffIds" column.

        2. BuffId

            - The Id of the Buff that is causing this interaction.

        3. CanReceive

            - If true, the Crafting Station can receive the Buff associated with the "BuffId".

        4. OverrideBuffDuration

            - If true, the duration of the Buff will be changed to the value in "BuffDuration" when it is applied to the
            Crafting Station.

        5. BuffDuration

            - If "OverrideBuffDuration" is true, this duration will be used instead of the default Buff duration when it
            is applied to the Crafting Station.

        6. DrainWhilePlaced

            - If true, the Buff duration will go down while the Crafting Station is not crafting and does not have a
            crafted item ready for pick up.

        7. DrainWhileCrafting

            - If true, the Buff duration will go down while the Crafting Station is crafting a Recipe.

        8. DrainWhileReady

            - If true, the Buff duration will go down while the Crafting Station has an crafted Recipe ready for pick
            up.

        9. RemoveOnCollect

            - If true, the Buff will be removed when a crafted Recipe is collected.

        10. RequireToStartCrafting

            - If true, the Buff will need to be on the Crafting Station before crafting can be started.

        11. AffectsCraftRate

            - If true, the CraftRate of the Crafting Station will be multiplied by the value in
            "CraftRateMultiplierPercent".

        12. CraftRateMultiplierPercent

            - If "AffectsCraftRate" is true, this value will be multiplied against the Crafting Stations CraftRate.

        13. ValidAddBuffToolTypes

            - (Optional) A comma separated list of Tool Types or Item Ids that can be used to apply this Buff to the
            Crafting Station. If left blank, any Tool or empty hands will be able to apply the Buff.

        14. ToolsConsumedWhenAdded

            - If greater than 0, this number of the currently equipped Tool will be removed from the Players Inventory
            when this Buff is added.

        15. InteractionText

            - (Optional)This text will appear in some tooltips to tell the Player how to add the Buff. Something like
            "Add Coal to the Furnace" is recommended.

        16. MinAllowedBuffConsumption

            - Each time you use the Tool, it will add '1' Buff. Set this to 0 if you want to allow the Player to add a
            Buff even if there is 99% remaining, use 0.5 if the Player can add the Buff when it is 50%, use 0 if you
            want the Buff to only apply when it's gone. Useful to ensure the Player doesn't waste items for little or no
            gain.

        17. AddBuffEffect

            - VFX that is spawned when this Buff is added.

        18. AddBuffEffectOffset

            - (Optional) This will move where the "AddBuffEffect" template spawns. It can be used to position the effect
            exactly where you need it.
        
        19. DropModifierIds

            - (Optional) A comma separated list of Ids that exist in the Drop Modifiers Data Table. These can be used to
            manipulate existing Drop Data associated with the Recipe being crafted.

        20. AdditionalDropIds

            - (Optional) A comma separated list of Ids that exist in the Drops Data Table. These will be added to the
            drop table before the results of the crafted Recipe are dropped or given to the Player.

        21. CanOutput

            - If true, the Crafting Station can output this Buff.

        22. RequiredBuffs

            - (Optional) A comma separated list of any Buff Ids you need the Crafting Station to have for this Buff to
            activate.

        23. Radius

            - When active, this Buff will be added to any Buff targets that are within this radius.

        24. AddAmount

            - The amount of the Buff that will be added to any valid Buff targets in the radius.
        
    Once all of these data connections are set up, your Buff should work when applied. Some common mistakes include:

        1. Forgetting to set up a Tool that can apply the Buff. The "ValidAddBuffToolTypes" needs to include either Tool
        Types defined on the Tools, or ItemIds of equippable Items.

        For example you could have a "Watering Can" Tool with a "watering can" Tool Type on it. "ValidAddBuffToolTypes"
        would be "watering can" in this case. You could also have several watering can Items the Player could use and
        use their Item Ids in "ValidAddBuffToolTypes" like "Common Watering Can, Rare Watering Can, Epic Watering Can".

    ----------------------------------
    ---      CRAFTING EVENTS       ---
    ----------------------------------

    The Crafting system fires events that can be listened to:

        APICrafting.Events.StartedCrafting = "CFT_StartedCrafting"

            - Handler = function(craftingStationId, recipeId, amount) - Client / Server

            - Sent when a Crafting Station or Global crafting starts crafting a Recipe.

        APICrafting.Events.CraftingReadyForCollect = "CFT_ReadyForCollect"

            - Handler = function(craftingStationId, recipeId, amount) - Client / Server

            - Sent when a Crafting Station or Global crafting finishes crafting a Recipe.

        APICrafting.Events.CraftingCollected = "CFT_CraftingCollected"

            - Handler = function(craftingStationId, recipeId, amount) - Client / Server

            - Sent when a crafted Recipe is collected from a Crafting Station or Global crafting.

        APICrafting.Events.CraftingReset = "CFT_CraftingReset"

            - Handler = function(craftingStationId) - Server Only

            - Sent when a Crafting Station is reset. This can happen during load for Crafting Stations being used by
            Players who are offline.
            
--]]