--[[
      _____       _   _                    _     _
     /  ___|     | | | |                  | |   | |
    | |  __  __ _| |_| |__   ___ _ __ __ _| |__ | | ___  ___
    | | |_ |/ _` | __| '_ \ / _ \ '__/ _` | '_ \| |/ _ \/ __|
    | |__| | (_| | |_| | | |  __/ | | (_| | |_) | |  __/\__ \
     \_____|\__,_|\__|_| |_|\___|_|  \__,_|_.__/|_|\___||___/

    ------------------------------
    ---        OVERVIEW        ---
    ------------------------------

    Gatherables are a quick way to get large amounts of destroyable objects with multiple states into a scene with
    zero code and no additional networked objects.

    Gatherables are groups of interactable objects that players can destroy to receive resources. Each gatherable object
    can have multiple states, drop resources, respawn over time and more.

    If you have any questions or feedback please feel free to let us know!

        - Creators Discord: https://discord.gg/core-creators
        - Forums: https://forums.coregames.com/

    ------------------------------
    ---          SETUP         ---
    ------------------------------

    Starting from the Farming Framework is recommended because it already has all of the Data Tables set up and ready to
    use, as well as multiple examples of Gatherables.

    Gatherables need 3 Data Tables to function. These tables must be in a Database (See Database README) and be
    referenced under correctly named categories. The "DataGroup" script has a "DataTable" Custom Property that can be
    used in a Database to add a Data Table category.

        1. GatherableGroups

            This is used to spawn entire groups of Gatherable objects into a Replicator.

        2. Gatherables

            This contains the data specific to each Gatherable object.

        3. GatherableStates

            This contains visual data related to each Gatherable Objkect

    ------------------------------
    ---   GATHERABLE GROUPS    ---
    ------------------------------

    A Gatherable Group is a collection of Gatherable objects. It is made up of a couple parts. First they have a row in
    the Gatherable Groups Data Table. Additionally they have a Template that is used to define the positions, rotations
    and scales of the Gatherable objects in the group.

    A row for a Gatherable Group contains the following information:

    1. Id

        - The Id of the group. This must be unique across all Gatherable Groups and is referenced by the Gatherables
        Replicator in the hierarchy.

    2. UniqueStorageId

        - This must be unique across all Gatherable Groups. It is used to save more compact data.

    3. Static

        - This is the Gatherable Group Template. It needs to contain the GatherableGroup.lua script and a childfor every
        Gatherable object in the group. Each child should have a Custom String Property on it called "GatherableId".
        This should be filled with the Id for the Gatherable object you want to spawn there. The hierarchy looks like:

        My Gatherable Group
        |___ GatherableGroup.lua <- Set the "ComponentRoot" Custom Property to the parent "My Gatherable Group"
        |___ Object 1
        |___ Object 2
        |___ Object 3 <- These objects are positioned in the group how you want and have a "GatherableId" property set.

        NOTE: It is much easier to duplicate an example group and modify it vs. creating one from scratch.

    4. Respawn

        - If true, gathered objects will respawn based on the other respawn properties and their RespawnSeconds property.

    5. RespawnPlayerMinDistance

        - A Gatherable object will not respawn if any Player is closer than this distance.

    6. RespawnPlayerMaxDistance

        - A Gatherable object will ignore Players farther than this distance when making visibility checks to determine
        if it can respawn.

    7. RespawnWhenNotVisible

        - If true, Gatherable objects will only respawn when Players are facing away from them.

    8. RandomSpawn

        - If true, Gatherables will randomly spawn based on the "RandomSpawnPercent".

    9. RandomSpawnPercent

        - The percentage (0 - 100) of Gatherables in this group to spawn at any given time.

    ------------------------------
    ---   GATHERABLE OBJECTS   ---
    ------------------------------

    Each Gatherable object inside the "Gatherable Group" also has its own configuration values. This lets you customize
    the drops and other behaviour per object.

    The "Static" Template in the Gatherable Group contains objects that reference these Gatherable objects by Id.

    There can be any amount of Gatherable Objects. Feel free to duplicate them and add additional objects with different
    configurations.

    1. Id

        - This muct be unique across all gatherable objects. This is referenced in the Gatherable Group Template
        mentioned above.

    2. Name

        - This gets displayed in a tooltip when the Player is interacting with the Gatherable object.

    --- INTERACTION CONFIG ---

    These values deal with how the Gatherable Object responds to interactions with tools.

    1. ValidGatheringToolTypes

        - A comma separated list of tools that are allowed to gather this. An empty string means any tool will be able
        to gather this.

    2. ToolsConsumedPerGather

        - The number of Tools that are removed from the Inventory each time this Gatherable is gathered.

    3. InteractionError

        - An error that is broadcast if the Player tries to interact wth this Gatherable with the wrong tool.

    4. GatherEffects

        - This template will be spawned every time this is gathered. It is recommended to have a lifespan on this
        template. A default lifespan of 5 seconds will be used if it is set to 0.

    5. GatherEffectsOffset

        - This will move where the "GatherEffects" template spawns. It can be used to position the effect exactly where
        you need it.

    6. SpawnTemplateOnLoad

        - If true, the first state template will be spawned in place of the existing object. This allows you to use
        simple proxy objects in your template to reduce object count.

    --- RESPAWN CONFIG ---

    These values control the respawn behaviour for this gatherable Object.

    1. RespawnSeconds

        - If "Respawn" is true on the parent Gatherables Group, the gatherable will respawn after this amount of seconds
        has passed and it can be respawned.

    2. DestroyGatheredStateDelaySeconds

        - Waits this amount of seconds before destroying a Gatherable with a "GatheredState" to respawn other
        Gatherables.

    3. RespawnEffects

        - If "Respawn" is true on the parent Gatherables Group, this template will be spawned when the gatherable
        respawns.

    4. RespawnEffectsOffset

        - This will move where the "RespawnEffects" template spawns. It can be used to position the effect exactly where
        you need it.

    --- DROPS CONFIG ---

    These values drive the behaviours around dropping items in world or directly into a Players Inventory. You can
    disable drops by not including any drop data in the Gatherable Object hierarchy. More on that can be found below.
    Drops only work if an Inventory has been added to the scene.

    1. DropIds

        - A comma separated list od Ids that exist in the Drops Data Table. These will drop based on the "DropBehavior"
        and "DropOnGather" settings.

    2. DropOnGather

        - If true, gathered objects will drop their contents into the world. Otherwise they will be directly added to
        the highest priority Inventory.

    3. DropEveryGather

        - If true, drops will be created every time this is gathered from. Otherwise, drops will only be created when
        the gatherable is fully gathered.

    4. DropBehaviorId

        - This should match an Id that exists in the Drop Behaviors Data Table.

    ------------------------------
    ---   GATHERABLE STATES    ---
    ------------------------------

    These values control how the Gatherable Object looks. Each object can have up to 32 states, so if you want
    additional states just add Asset Reference Custom Properties and follow the naming convention "State1_Static",
    "State2_Static", etc...

    1. State1_Static / _Server / _Client

        - One of 32 potential state templates for this Gatherable. States will be displayed in order from 1 - 32 as
        gather interactions happen. You can add additional columns for more states up to 32. The "_Static" state is
        required in each set while the others are optional.

    2. GatheredState_Static / _Server / _Client

        - If set, this state will be used when the Gatherable has been fully gathered. Useful for things that need to
        keep a visual presence even after being gathered from.

    ------------------------------
    ---    CHANGING THE ART    ---
    ------------------------------

    Art for Gatherable Objects can be changed two ways. The first is by adding and/or updating a new State Template,
    found in Custom Properties on the Gatherables Object level. State Templates are the customized art for the
    Gatherable Objects.

    Each state template should look something like this:

        Gatherable Tree - State 1
        |__ Art <-- Art goes here

    Add up to 32 state templates. Each time a gather interaction happens the object will switch to the next state
    template in the list.

    The second method to update the art is by disabling the State Template and adding the art under the Gatherable
    Object folder.

    Remember that this art will be destroyed and replaced with a State template at runtime if you have set any State
    templates in the config. The art you include under the Gatherable Object can be thought of as a proxy. You could use
    something as simple as a cube to show the object and reduce your scene object count. Then at runtime the cube will
    get replaced with the actual state template if you have set "SpawnTemplateOnLoad" to true. If "SpawnTemplateOnLoad"
    is false, this initial art will not be swapped out until a gather interaction happens.

       My Gatherable Group
        |___ GatherableGroup.lua
        |___ Object 1
        |___ Object 2
        |___ Object 3 <- Art goes into these objects

    ------------------------------
    ---        EVENTS          ---
    ------------------------------

    Gatherables send Events as they change. They can also be controlled from external scripts with Events.

    --- OUTGOING EVENTS ---

    1. APIGatherables.EVENT_GATHERABLE_GATHERED = "GTH_gathered"

        - Handler = function(player, entry) - Server / Client

        - This event is sent every time a successful gather interaction takes place. "entry" is a table with all of the
        Gatherable Object data and state. See below for the contents of that table.

    2. APIGatherables.EVENT_GATHERABLE_DESTROYED = "GTH_destroyed"

        - Handler = function(player, entry) - Server / Client

        - This event is sent when a Gatherable exits its last state. "entry" is a table with all of the Gatherable
        Object data and state. See below for the contents of that table.

    3. APIGatherables.EVENT_GATHERABLE_RESPAWNED = "GTH_respawned"

        - Handler = function(entry) - Server / Client

        - This event is sent when a Gatherable object respawns. "entry" is a table with all of the Gatherable Object
        data and state. See below for the contents of that table.

    "entry" Table Contents:
    {
        index - The index of this Gatherable Object
        bitIndex - The index of this object in the BitString used for saving data
        gatherableId - If "GatherableId" is set, the Database will be checked for data rather than the object itself
        states - A table of state template ids
        data - The Database or Custom Property data for this object
        gatheredStateIndex - If a GatheredState has been set, the index of this state
        hasTemplatedStates - True if any States have been added to the data
        transform - The transform of the object
        worldTransform - The world transform of the object
        coreObject - A reference to the object instance
        parent - A reference to the object parent
        state -  The current state index of this object
        numberOfStates - The total number of states this object has
        destroyedTime - The time this object was last destroyed
        bitLength - The length of the BitString to use for saving
    }

    --- INCOMING EVENTS ---

    1. APIGatherables.EVENT_RESET_GATHERABLE_GROUP = "GTH_reset"

        - Use = Events.Broadcast(APIGatherables.EVENT_RESET_GATHERABLE_GROUP, gatherableGroupId) - Server / Client

        - This event can be sent from any other script to reset a Gatherable Group to its initial state. The
        gatherableGroupId should be the CoreObject.id of either a single Gatherable Group, or the CoreObject.id of the
        very top level of a collection of Gatherable Groups. If a top level id is used, every Gatherable Group inside it
        will reset.
--]]