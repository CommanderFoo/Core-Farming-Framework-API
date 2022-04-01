--[[
    ------------------------------
    ---        OVERVIEW        ---
    ------------------------------

	Some connections between items in your hierarchy are made through custom properties where you drag in a reference,
	others are made through unique IDs of some kind. The rest are generally made through using "Types", which are a 
	kind of tag. Below I will explain the most common ways we use types with Producers and Buffs.

    If you have any questions or feedback please feel free to let us know!

        - Creators Discord: https://discord.gg/core-creators
        - Forums: https://forums.coregames.com/

    ------------------------------
    ---    PRODUCER TYPES      ---
    ------------------------------

    First, lets take a look at the Soil Placeable. Open the Placeables Data Table in the "My Tables" -> "Farming"
    section in Project Content.

    Scroll to the right and you will notice that the box "IsProducerBase" is checked, that is what makes it able to have
    Producers grown in it. The next field is "ProducerBaseType" which is set to "soil". Any Producer you want to grow in
    this soil mound must be looking for the matching type.

    Let's go look at the data on the producer now. Open the Producers Data Table in the "My Tables" -> "Farming"
    section in Project Content.

    Look at the "Red Fruit Bush" Producer. You will see the field "ValidProducerBaseTypes". Notice, that field is set to
    "soil" as well. That is what is making the connection between the two items.

    So to add your own types, just use the same word in both fields. (It's best to keep them short and easy to spell
    and understand.)

    ------------------------------
    ---    PLACEMENT AREAS     ---
    ------------------------------

    Placement Areas use the same system as described above, you will just find the data in slightly different locations.
    Let's take a look at where to find that data:

    Open the Placeables Data Table in the "My Tables" -> "Farming" section in Project Content.

    In the Clay Pot's data, find the "PlacementAreaTypes". In this particular example, this item can be placed on "Dirt",
    "Grass" and "Floor" areas, so there are three words seperated by a comma. For a tilled dirt patch, you might want
    just the world "Dirt" there, for an fancy indoor decorative item, you might want to make up a tag like
    "InteriorFloor".

    Now the Clay Pot is looking for that tag, but how does the Dirt, Grass and Floor areas say what they are? Let's go
    take a look at a Dirt area in the scene. Note that we are loading these areas in dynamically through Object Loaders,
    so we will be locating a Template in the Project Content. Find the "Player Farm - Front Yard (Static)" and drag it
    into the scene.

    Player Farm - Front Yard (Static)
    |___ Dirt (Farmable Area)

    If you select the Dirt (Farmable Area) group, you will see it has a custom property called "AreaType". That lets
    you define the tag that your Placeable item is looking for. Also, inside the Dirt area is a script called
    "PlacementArea". That script has a custom property called "ComponentRoot" that is a reference  to the folder it is
    contained in. Your Placement area must have this to work!

    You can now delete the template from your scene.

    Use this system for all sorts of fun things, make snowmen only placeable outside in the snow, make rice only
    plantable in special feilds that can be flooded, etc... Have fun :)

]]--