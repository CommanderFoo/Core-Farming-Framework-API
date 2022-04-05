--[[

         /\
        /  \   _ __ ___  __ _ ___
       / /\ \ | '__/ _ \/ _` / __|
      / ____ \| | |  __/ (_| \__ \
     /_/    \_\_|  \___|\__,_|___/

    ----------------------------------
    ---          OVERVIEW          ---
    ----------------------------------

    The Areas system is meant to be used to chunk your environment into discrete pieces that can be loaded on demand.
    This provides a much more performant experience for Players and lets creators include much more content in their
    games.

    As Players move through Areas they can be moved to specific spawn points, be placed into pools of Areas, have
    templates loaded into client, server or static contexts and more.

    There are multiple ways to set up groups of connected Areas outlined below.

    If you have any questions or feedback please feel free to let us know!

        - Creators Discord: https://discord.gg/core-creators
        - Forums: https://forums.coregames.com/

    ----------------------------------
    ---           SETUP            ---
    ----------------------------------

    The first thing you need to make Areas work is an "Area Player Manager" template. Add one of these to the scene and
    select it. In the Properties Panel you will see a couple things you can set.

    1. StartingArea

        - This should be set to reference the Area that you want Players to start in. Since you don't have any Areas set
        up yet, you can leave this blank for now.

    2. SpawnPointKey

        - (Optional) A key that will filter which Area spawn point to use. Should match a key set on an "Area Spawn
        Point" template in the starting Area.

    3. RespawnPlayerInLastArea

        - If true, this will respawn the Player in the Area they died in. It is recommended to use this to avoid
        situations where the Player is in one area physically but being tracked in another Area.

    Now you need to build an actual Area. Follow the steps in the section below and then reference the root object of
    the new Area in your "StartingArea" property.

    ----------------------------------
    ---      BUILDING AN AREA      ---
    ----------------------------------

    Create a new Group in the hierarchy and give it any name you want. The name should probably describe the Area it
    will be. Move this group in your scene to a location that suits you. Since Players will be teleporting between Areas
    and potentially unable to see other Areas while inside one, you could even stack or lay them out in a grid.

    Add an "Area Setup" template as a child of the group you created. This will automatically use the parent as the
    "Area". You can also manually set the "Area" property by dragging a reference into it.

    Add one or more "Area Spawn Point" templates as children of the group. Select them to view their properties. Fill
    these out as required. If you are going to use a network of Portals to move between Areas it is likely that you
    would want an arrival Spawn Point for each Portal.

    1. Area

        - (Optional) This should be assigned to a group of objects that represents an Area. This will automatically find
        the Area it is inside if left blank.

    2. SpawnPointKey

        - (Optional) If set, this will allow portals and other teleport methods to target this spawn point.

    Your hierarchy should look something like this:

        My Area
        |___ Area Setup
        |___ Area Spawn Point   <-- SpawnPointKey = "YourSpawnPointKey"

    That is all you need for a basic Area. The next step is connecting areas together. Some different approaches for
    this are outlined below.

    ----------------------------------
    ---   DIRECT AREA CONNECTION   ---
    ----------------------------------

    Areas can be directly linked to each other. Before you can link to another Area you will need to build it! If you
    haven't already done so, follow the steps above to build a second Area.

    To directly link to another Area you will need to add either a "Area Portal - Server" or an "Area Portal - Client"
    template into your Area. These are very similar with the main difference being that the server version does not use
    any networked Events. The client version was added for cases where you want to spawn a Portal only on specific
    clients or something similar.

    Once added, select the Portal and view its properties. For a direct connection you will use the "DestinationArea"
    property.

    1. DestinationArea

        - (Optional) If set will send Player to a specific Area, otherwise will find an appropriate Area.

    All you need to do it drag the second Area group into this field.

    If you are using the client version of the Portal you can also setup interaction by checking "InteractWithTrigger"
    and setting the "InteractionText". Server versions will need the Trigger set up manually since they are
    non-networked and cannot be changed at runtime.

    1. InteractWithTrigger

        - If true, the portal will require the Player to press the interaction key to teleport. Otherwise they will be
        teleported by entering the Trigger bounds.

    2. InteractionText

        - If "InteractWithTrigger" is checked, this text will appear when the Player gets close enough to the portal.
            {name} can be used and will be replaced with the DestinationArea Name.
            {type} can be used and will be replaced with the DestinationAreaKey.

    You can do the same thing in the second Area and you will now have 2 Areas that you can move between. Your hierarchy
    should look something like this:

        Area 1
        |___ Area Setup
        |___ Area Spawn Point   <-- SpawnPointKey = "YourSpawnPointKey"
        |___ Area Portal        <-- DestinationArea = Area 2, SpawnPointKey = "YourSpawnPointKey"
        Area 2
        |___ Area Setup
        |___ Area Spawn Point   <-- SpawnPointKey = "YourSpawnPointKey"
        |___ Area Portal        <-- DestinationArea = Area 1, SpawnPointKey = "YourSpawnPointKey"

    ----------------------------------
    --- ASSIGNABLE AREA CONNECTION ---
    ----------------------------------

    Assignable Areas act like a pool of Areas that Players get shuffled around in depending on where they are going.
    This is a good way to break Players into smaller groups, or combined with Player Lots, build Areas linked to
    personal Areas for each Player. For example each Player could get a house when they log in, and travel to the inside
    of that house using Assignable Areas.

    When building a set of Assignable Areas you need to ensure that there are enough Areas to contain the max Players
    for your game divided by "MaxPlayersPerArea". If you are combining this with Player Lots for personal Areas you will
    need enough Areas that every Player could be in one.

    First you need to follow the steps above to build enough Areas. For a 16 player game with "MaxPlayersPerArea" = 2
    you will need 8 Areas. Once these are built place them all inside a group. Add an "Assignable Area Group Setup"
    template to this new group. Your hierarchy should now look something like this:

        Assignable Areas
        |___ Assignable Area Group Setup
        |___ Area 1
        |___ Area 2
        |___ Area 3
        |___ Area 4
        |___ Area 5
        |___ etc...

    Click the Assignable Area Group Setup and look at its properties.

        1. AreasGroup

            - (Optional) This should be set to the group that contains all of the Assignable Areas. If left blank the
            parent of the component will be used.

        2. AreasGroupKey

            - The unique key for this set of Assignable Areas. Portals and Teleport buttons can use this key to send a
            Player into this group of Areas.

        3. MaxPlayersPerArea

            - If greater than 0, Players will be added to Areas until this number is hit, then further Players will be
            filtered into the next Area. If 0, any amount of Players can be in an Area.

    Make sure you set the "AreasGroupKey" to something unique from other Assignable Area groups and set
    "MaxPlayersPerArea" to a number greater than 0 unless you are using these for personal Player Areas.

    Now you can add a portal in a different Area that will lead to this Assignable Area group and set
    "DestinationAreaKey" to the same key you used on the "Assignable Area Group Setup".

        1. DestinationAreaKey

            - (Optional) If 'DestinationArea' is empty this will assign the Player to a specific set of Assignable Areas

    Once this is set up you should now get assigned to a random Area in the Assignable Area group when you use the
    portal. This feature is much more useful when combined with Player Lots, so be sure to check out the Player Lots
    README file to see how that works!

    ----------------------------------
    ---     UI AREA CONNECTION     ---
    ----------------------------------

    The "Teleport To Area Button" acts exactly like a portal but it is in the UI. See the above sections for how to set
    up Areas and connect them, but instead of using portals, use this template.

    This button also supports icons in multiple styles. It can show a basic Image, a custom Kitbashed UI icon, or a 3D
    render to texture icon.

        1. IconCameraId

            - If "Is3DIcon" is true, this should match the "CameraId" of an "Icon Generator" in the scene.

        2. IconAsset

            - The image or template to use for an icon. If "IsKitbashed2DIcon" is true, this should be a UI template. If
            "Is3DIcon" is true, this should be a 3D object template. If "IsImageIcon" is true, this should be an
            image/brush asset.

        3. IsKitbashed2DIcon

            - If true, the "IconAsset" should point to a UI template. This template will be spawned as the icon.

        4. Is3DIcon

            - If true, the "IconAsset" should point to a 3D object template. An image of this template will be used as
            the icon.

        5. IsImageIcon

            - If true, the "IconAsset" should point to an image/brush asset. This will be used as the icon.

        6. Binding

            - (Optional) The binding that should be pressed to teleport the Player.

        7. BindingText

            - (Optional) This text will be displayed as the shortcut key for this button.

        8. ButtonText

            - (Optional) This text will appear over the icon.
            {name} can be used and will be replaced with the destination Area Name.
            {type} can be used and will be replaced with the DestinationAreaKey.

    ----------------------------------
    ---    AREA OBJECT LOADING     ---
    ----------------------------------

    The main benefit of Areas is that they can load objects only when needed and help keep your game performing well. To
    do this you can use one or more "Area Object Loader" templates to manage which objects get loaded when the Area
    becomes active.

    Drop an "Area Object Loader" template into your Area and look at its properties.

        1. ServerAsset

            - (Optional) A template to spawn into a Server Context when the Area Loads. This template will be destroyed
            when the Area unloads.

        2. StaticAsset

            - (Optional) A template to spawn into a Static Context when the Area Loads. This template will be destroyed
            when the Area unloads.

        3. ClientAsset

            - (Optional) A template to spawn into a Client Context when the Area Loads. This template will be destroyed
            when the Area unloads.

    Each Area Object Loader can load a template into any of the above contexts. The ClientAsset is only loaded for
    Players who are actually in the Area, while the other templates will load once when a Player enters the Area and
    only be destroyed once all Players have left that Area.

    All you need to do is create templates for things you want to appear in an Area and reference them in the
    appropriate context properties. You can add any number of Area Object Loaders if you want to split up your templates.
    Your hierarchy will look something like this:

        Area
        |___ Area Setup
        |___ Area Spawn Point
        |___ Area Portal
        |___ Area Object Loader

    ----------------------------------
    --- GATHERABLES AND PRODUCERS  ---
    ----------------------------------

    It's also possible to load Gatherables and Producers in Areas. This requires a different kind of Loader called a
    "Area Replicator Loader". Add Gatherable(s) and/or Producer(s) to your area (See Gatherables README or Producers
    README) and then add a "Area Replicator Loader". Select the loader to view its properties.

        1. Replicator

            - Loads and unloads the Replicator when the Area loads and unloads.

    You need to drag the "Replicator" group in the Gatherable or Producer setup into this reference. Your hierarchy
    might look something like this.

        Area
        |___ Area Setup
        |___ Area Spawn Point
        |___ Area Portal
        |___ Area Replicator Loader     <-- Reference the Replicator group below in the "Replicator" property
        |___ Gatherable Trees
            |___ Replicator             <-- This is referenced in the "Replicator" property

    You will need one Area Replicator Loader per Gatherable or Producer setup you have in the Area.

    ----------------------------------
    ---          AREA UI           ---
    ----------------------------------

    You can display the name of the current Area to the Player by using the "Area name UI" template. Just add it to your
    hierarchy and it will automatically start working. You can change what text is displayed if the Player is ever not
    in an Area by setting the "UnknownAreaText" property, but this should never happen if Areas have been set up
    correctly.

        1. UnKnownAreaText

            - This text will appear if the Player is not in an Area.

    ----------------------------------
    ---   AREA CHANGE COMPONENTS   ---
    ----------------------------------

    In some cases you might want things to happen when a Player moves from one Area to another. There are some
    components that help make this easier. They can be found in Project Content under "My Scripts" -> "Areas".

    ToggleEffectsOnAreaChangeClient

        - This is a client only script so it must be placed into a ClientContext. You can use it to stop, play or toggle
        Audio and Vfx when a Player enters or exits a specific Area or Assignable Area Group.

        1. Area

            - (Optional) A specific Area that will activate this component.

        2. AreaGroupKey

            - (Optional) An Assignable Area group key for a set of Areas that will activate this component.

        3. Effects

            - The Audio / Vfx or hierarchy containing multiple Audio and Vfx objects that you want to control.

        4. IncludeChildren

            - If true, the entire hierarchy referenced in "Effects" will be searched for Audio and Vfx, otherwise only
            the top level will be searched.

        5. DelaySeconds

            - If greater than 0, will wait this many seconds before running.

        6. PlayOnEnterArea

            - If true, the effect(s) will play when a Player enters the Area.

        7. PlayOnExitArea

            - If true, the effect(s) will play when a Player exits the Area.

        8. StopOnEnterArea

            - If true, the effect(s) will stop when a Player enters the Area.

        9. StopOnExitArea

            - If true, the effect(s) will stop when a Player exits the Area.

        10. ToggleOnEnterArea

            - If true, the effect(s) will toggle when a Player enters the Area.

        11. ToggleOnExitArea

            - If true, the effect(s) will toggle when a Player exits the Area.

    ToggleVisibilityOnAreaChangeClient

        - This is a client only script so it must be placed into a ClientContext. You can use it to show, hide or toggle
        the visibility on objects when a Player enters or exits a specific Area or Assignable Area Group.

        1. Area

            - (Optional) A specific Area that will activate this component.

        2. AreaGroupKey

            - (Optional) An Assignable Area group key for a set of Areas that will activate this component.

        3. ObjectsToChange

            - The object or hierarchy containing multiple that you want to control.

        4. IncludeChildren

            - If true, the entire hierarchy referenced in "ObjectsToChange" will be searched for objects, otherwise only
            the top level will be searched.

        5. DelaySeconds

            - If greater than 0, will wait this many seconds before running.

        6. ShowOnEnterArea

            - If true, the object(s) will show when a Player enters the Area.

        7. ShowOnExitArea

            - If true, the object(s) will show when a Player exits the Area.

        8. HideOnEnterArea

            - If true, the object(s) will hide when a Player enters the Area.

        9. HideOnExitArea

            - If true, the object(s) will hide when a Player exits the Area.

        10. ToggleOnEnterArea

            - If true, the object(s) will toggle when a Player enters the Area.

        11. ToggleOnExitArea

            - If true, the object(s) will toggle when a Player exits the Area.

    ToggleEnabledOnAreaChangeClient

        - This is a client only script so it must be placed into a ClientContext. You can use it to enable, disable or
        toggle objects when a Player enters or exits a specific Area or Assignable Area Group.

        1. Area

            - (Optional) A specific Area that will activate this component.

        2. AreaGroupKey

            - (Optional) An Assignable Area group key for a set of Areas that will activate this component.

        3. ObjectsToChange

            - The object or hierarchy containing multiple that you want to control.

        4. IncludeChildren

            - If true, the entire hierarchy referenced in "ObjectsToChange" will be searched for objects, otherwise only
            the top level will be searched.

        5. DelaySeconds

            - If greater than 0, will wait this many seconds before running.

        6. EnableOnEnterArea

            - If true, the object(s) will enable when a Player enters the Area.

        7. EnableOnExitArea

            - If true, the object(s) will enable when a Player exits the Area.

        8. DisableOnEnterArea

            - If true, the object(s) will disable when a Player enters the Area.

        9. DisableOnExitArea

            - If true, the object(s) will disable when a Player exits the Area.

        10. ToggleOnEnterArea

            - If true, the object(s) will toggle when a Player enters the Area.

        11. ToggleOnExitArea

            - If true, the object(s) will toggle when a Player exits the Area.

    ----------------------------------
    ---          EVENTS            ---
    ----------------------------------

    Areas send Events as they are assigned Players or as Players move through them.

    1. APIAreas.Events.PlayerAreaChanged = "AR_playerAreaChanged"

        - Handler = function(player, areaId, lastAreaId) - Server / Client

        - This event is sent every time a Player moves to an Area.

    2. APIAreas.Events.AreaFinishedLoading = "AR_areaFinishedLoading"

        - Handler = function(areaId) - Server / Client

        - This event is sent every time an Area finishes loading.

    3. APIAreas.Events.AreaFinishedUnloading = "AR_areaFinishedUnloading"

        - Handler = function(areaId) - Server / Client

        - This event is sent every time an Area finishes unloading.

    4. APIAreas.Events.PlayerFinishedLoadingArea = "AR_playerFinishedLoadingArea"

        - Handler = function(player) - Server

        - This event is sent from the client to the server when a Player finishes loading an Area.

    5. APIAreas.Events.TeleportToArea = "AR_teleportToArea"

        - Handler = function(player, areaId, areaKey, targetPosition, targetRotation, spawnPointKey) - Server

        - This event is sent from the client to the server, or server to server when a Player enters a portal or clicks
        a teleport button.
--]]