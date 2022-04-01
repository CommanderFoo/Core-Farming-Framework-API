--[[

    ------------------------------
    ---       OVERVIEW         ---
    ------------------------------

    There are limits on these systems that you need to work within. We have tried to optimize everything as much as
    possible, but it is still very easy to start pushing those limits if you aren't careful.

    These recommendations are also not going to work in every game. Your game may have other systems in it taking up
    resources as well, so be mindful that these recommended limits are made on the assumption that our systems are being
    used in isolation.

    If you have any questions or feedback please feel free to let us know!

        - Creators Discord: https://discord.gg/core-creators
        - Forums: https://forums.coregames.com/

    ------------------------------
    ---        LIMITS          ---
    ------------------------------

    1. Producers (loaded at once)

        - About 500 active Producers can exist at once in a scene. They depend on Replicators which use Private
        Networked Data. Since only active Producers impact this limit, you can break your Producers into groups using
        the Areas system to allow for a larger amount across your entire game. For example, in a shared space with
        eight player lots, you would only want to let each player have up to 62 producers each. And less if you had
        some already in the enviroment that are not player owned! But if you are using the area system, to give the
        players back yard lots (so that their lot would be the only thing loaded) then then could have 500 producers
        in that yard. See the Areas README for details.

        - Another note to keep in mind, gatherables are "cheaper" than producers, but will still effect the limit.
        It is a good idea to do some test games that have what ever limitations you put in place fully maxed out to
        make sure that it works!

        - Note that 500 Producers loaded at the same time is likely to have a significant impact on performance due to
        the sheer number of objects, so you will need to balance that as well.

    2. Producers (per storage key)

    	- You can also store around 500 (player owned and placed) producers on a single storage key. But again, if
    	you have other things saving to that storage key then it will fill up faster. By default, our systems are using
    	local storage. So your inventory, your producers, and any gatherables you have placed in the player lot are
    	all on the same key. If you want the player to be able to have a lot of placeables, you will definately want to
    	change the settings on the replicators so that they are using their own keys! Find the feild to set the key on
    	the Player Lot Replicator Loader.

    ------------------------------
    ---     STORAGE KEYS       ---
    ------------------------------

    Several of our systems are saved into Player Storage and support saving into Shared Player Storage. This can be a
    great way to spread the save data out and provide more rom for each system. By default all systems use Local Storage,
    so if you want more space for Inventory, Producers and Gatherables you should create and assign Shared Storage Keys
    to them.

    To create and assign a Shared Storage Key, follow these steps:

        1. Open "Window" -> "Shared Storage".

        2. Click "Create New Shared Key" and choose "Player Storage" from the list that appears.

        3. Give the key a name and click "Create".

        4. Assign the key to the appropriate system as outlined below.

    --- Inventory ---

    Inventory Storage can be set up in the Inventories Data Table.

        1. Open the "Project Content" -> "My Tables" -> "Inventories" Data Table.

        2. Drag the Shared Storage Key you created into the "StorageKey" field on the Inventory you want to store in
        that key.

        Note: Changing this will reset all Inventories that were created on the old key. It will also not wipe the data
        from the old key, so you can clear this setting to go back.

    --- Gatherables ---

    Gatherables Storage is set up in the Hierarchy. This only applies to Gatherables that have been set up in a Player
    Lot since that is the only way they can be saved to Storage.

        1. Find the "Player Lot Replicator Loader" that is loading your Gatherables Replicator in your Player Lot.

        2. Drag the Shared Storage Key you created into the "SharedStorageKey" Custom Property on the Player Lot
        Replicator Loader.

    --- Producers ---

    Producers Storage is set up in the Hierarchy. This only applies to Producers that have been set up in a Player Lot
    since that is the only way they can be saved to Storage.

        1. Find the "Player Lot Replicator Loader" that is loading your Producers Replicator in your Player Lot.

        2. Drag the Shared Storage Key you created into the "SharedStorageKey" Custom Property on the Player Lot
        Replicator Loader.

--]]