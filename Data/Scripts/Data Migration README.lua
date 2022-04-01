--[[
     _____        _          __  __ _                 _   _
    |  __ \      | |        |  \/  (_)               | | (_)
    | |  | | __ _| |_ __ _  | \  / |_  __ _ _ __ __ _| |_ _  ___  _ __
    | |  | |/ _` | __/ _` | | |\/| | |/ _` | '__/ _` | __| |/ _ \| '_ \
    | |__| | (_| | || (_| | | |  | | | (_| | | | (_| | |_| | (_) | | | |
    |_____/ \__,_|\__\__,_| |_|  |_|_|\__, |_|  \__,_|\__|_|\___/|_| |_|
                                       __/ |
    ------------------------------    |___/
    ---        OVERVIEW        ---
    ------------------------------

    Data Migration is something that you need to do if you change a game setting (like an Item ID) that is referenced in
    Player's saved datas. Changing something like that will break Player saves because they now refer to an old ID that
    doesn't exist in the game any more.

    To deal with this potential problem, we have a basic Data Migration system that will let you fix Player save data if
    you do make changes to things it references.

    If you have any questions or feedback please feel free to let us know!

        - Creators Discord: https://discord.gg/core-creators
        - Forums: https://forums.coregames.com/

    ------------------------------
    ---     HOW IT WORKS       ---
    ------------------------------

    Data Migration is handled with a Data Table called "Data Migrations". This Data Table can be found in the
    "My Tables" section in your Project Content. Each row in the table represents a single migration step for a version.

    For example, If a Player is on version 1 and the table has rows for version 2, that Players save data will be
    migrated through all of the steps for version 2. It supports migrating through multiple versions, and will do so
    from lowest to highest. A Player will never be migrated to the same version twice, or migrated to a lower version
    than the one their data is on.

    ------------------------------
    ---  HOW TO ADD A VERSION  ---
    ------------------------------

    Lets say you have changed an Item ID and you need to migrate Players save datas to refer to the new ID.

    1. Open the Data Migrations Data Table.

    2. Add a new row.

    3. Fill in the "Version" field with a number that is greater than 0. I would recommend starting at version 1 and
       growing incrementally from there with each new migration.

    4. Fill in the "OldItemId" and "NewItemId" fields with the appropriate values.

    5. Save the Data Table and Publish your game. As Players with old data join, their data will be migrated.

    Notes: Remember, each version can have multiple rows, so if you have changed multiple things you can add one row per
           change and put them all into the same version number.

           It's also recommended to never delete any older migrations because older players may not log back into your
           game for many months and if their data isn't migrated properly it could break.

    ------------------------------
    ---  SUPPORTED MIGRATIONS  ---
    ------------------------------

    1. Changing an Item ID

        - Use "OldItemId" and "NewItemId" if you ever change the Item ID for an Item in a live game.

    2. Adding (Giving) an Item to Players

        - Use the "AddItem" columns to give players an Item.

    3. Clearing an Inventory

        - Clearing an Inventory will completely empty it.

    4. Resetting an Inventory

        - Resetting an Inventory will clear it and add the starting Items to it.

    5. Changing an Inventory ID

        - Use "OldInventoryId" and "NewInventoryId" if you have changed the Id of an Inventory in a live game.

    6. Changing a Currency ID

        - Use "OldCurrencyId" and "NewCurrencyId" if you have changed the Id of a Currency in a live game.

    7. Adding (Giving) Currency to Players

        - Use the "AddCurrency" columns to give players some Currency.

    8. Changing a Placeable ID

        - Use "OldPlaceableId" and "NewPlaceableId" if you ever change the Placeable ID for a Placeable in a live game.

    9. Removing a Placeable

        - Use "RemovePlaceableId" to remove a specific kind of Placeable from all players' Replicators.

    10. Changing an Upgrade ID

        - Use "OldUpgradeId" and "NewUpgradeId" if you ever change the Upgrade ID for an Upgrade in a live game.

    11. Adding (Giving) an Upgrade to all Players

        - Use the "GiveUpgradeId" column to give players an Upgrade if they don't already have it.

    12. Removing an Upgrade from all Players

        - Use the "RemoveUpgradeId" column to remove an Upgrade from Players who currently have it.
--]]