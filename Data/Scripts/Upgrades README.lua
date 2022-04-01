--[[
     _    _                           _
    | |  | |                         | |
    | |  | |_ __   __ _ _ __ __ _  __| | ___  ___
    | |  | | '_ \ / _` | '__/ _` |/ _` |/ _ \/ __|
    | |__| | |_) | (_| | | | (_| | (_| |  __/\__ \
     \____/| .__/ \__, |_|  \__,_|\__,_|\___||___/
           | |     __/ |
           |_|    |___/
    ------------------------------
    ---        OVERVIEW        ---
    ------------------------------

    Upgrades is a drop in system that allows players unlock, save, and progress through collections
    of unlockable options.

    Players can obtain upgrades by purchasing them through Stores, receiving them through Drops, or
    by directly accessing the ugprades API through code.

    Examples uses of upgrades:
    - Purchasing extensions to a house.
    - Unlocking new playable areas.
    - Acquiring a stronger version of equipment.

    If you have any questions or feedback please feel free to let us know!

        - Creators Discord: https://discord.gg/core-creators
        - Forums: https://forums.coregames.com/

    ------------------------------
    ---          SETUP         ---
    ------------------------------

    Upgrades and Upgrade Collections are created by adding data to the Database. Like other systems,
    this can be done with either Data Tables or Hierarchy objects.

    Example Data Tables are available for you to fill out, found in the "My Tables" section of Project Content:
        - Upgrade Collections
        - Upgrades
        - Upgrade Template Sets

    If you're creating data with the Hierarchy approach, the object structure for upgrades is as follows:
        UpgradeCollections (the DataGroup)
        |__ Collection1
            |__ Upgrade1
                |__ TemplateSet1
                |__ TemplateSet2
                |__ ...
            |__ Upgrade2
                |__ ...

    ------------------------------
    ---     UPGRADES DATA      ---
    ------------------------------

    Upgrade Collections

        1. Id

            - The id of the Collection. Must be unique within a scene.

        2. IsLinear

            - Collections can be Linear or Non-Linear.

                - Linear collections are for upgrades that the player must unlock in a specific order.
                - Non-Linear collections are for upgrades that can be unlocked in any order.

        3. StorageKey

            - An optional Shared Storage Key to save Currency data into. Default is Local Storage.

        4. UpgradeIds

            - A comma-separated list of ids of the Upgrades in this collection.
            Each upgrade should only be included in one collection.

    Upgrades

        1. Id

            - The id of the Upgrade. Must be unique within a scene.

        2. Name

            - A display friendly name for this Upgrade that may be shown on various interfaces.

        3. PlayerStartsWith

            - If true, the player will be given this upgrade when they first join the game.

        4. UpgradeTemplateSetIds

            - A comma-separated list of sets of templates that may optionally be associated with this id.
            These are useful if you want to change visual elements when the player unlocks things.

    Upgrade Template Sets

        1. Id

            - The id of the Template Set. Must be unique within a scene.

        2. Group

            - Assigns this Template Set a group id.
            This allows one Upgrade Loader to manage loading multiple Upgrades by using a single Group Id.

        3. ClientAsset / ServerAsset / Static Asset

            - A template that can be spawned in a specific context by any systems that utilize this set.

    ------------------------------
    ---     UPGRADE LOADERS    ---
    ------------------------------

    Player Lot Upgrade Loaders are objects that automatically spawn templates on Player Lots
    based on which upgrades that player has unlocked. This is a fast way to get visual feedback
    when an upgrade has been acquired.

    A template named "Player Lot Upgrade Loader" can be dragged into any area containing a Player Lot.

    See the tooltips on its Custom Properties for more details on its usage.

    ------------------------------
    ---     DROPS & STORES     ---
    ------------------------------

    Upgrades can be added to Drops.
    Drops can be added to Purchaseables.
    Purchaseables can be added to Stores.

    In this way, players can easily access purchaseable upgrades through the store system.

    Refer to the Stores README for more information about their configuration.

    ------------------------------
    ---         EVENTS         ---
    ------------------------------

    The Upgrades API will fire out events that you can listen for in other scripts.

        1. APIPlayerUpgrades.Events.UpgradeAdded

            - Handler = function(player, upgradeId)

        2. APIPlayerUpgrades.Events.UpgradeRemoved

            - Handler = function(player, upgradeId)

        3. APIPlayerUpgrades.Events.UpgradeLoaded

            - Handler = function(player, upgradeId)

        4. APIPlayerUpgrades.Events.UpgradeSaved

            - Handler = function(player, upgradeId)

    Upgrades can also be controlled by sending your own events from the client:

        1. Events.BroadcastToServer(APIPlayerUpgrades.Events.AddUpgrade, upgradeId)

            - Gives the specified upgrade to the player.

        2. Events.BroadcastToServer(APIPlayerUpgrades.Events.RemoveUpgrade, upgradeId)

            - Removes the specified upgrade from the player.
]]