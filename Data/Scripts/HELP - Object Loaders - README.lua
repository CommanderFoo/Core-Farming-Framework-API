--[[

    ------------------------------
    ---  Object Loaders FAQ    ---
    ------------------------------

    What is an object loader?

    	An object loader is a template that will load up another specified template or templates when the player enters
    	the area/lot with that loader in it. You may desinstance the template if you need to, it will still function fine.

    Why are there differeent object loaders?

    	Area Object Loaders are for use inside areas, and Player Lot Object Loaders are for use in player lots.

    How do I use the object loader?

    	Click on the object loader, and then look at its custom properties. It has slots on it where you can add
    	a reference to the template you want to spawn.

    Why does the loader have a Static, Local, Client, and Server Asset reference?

    	In core, we use different contexts depending on the functionality of the thing being spawned. If you want to
    	make an object that is just for looks (that the player can walk through), like small fancy details or a ghost,
    	then use a template spawned in the client context. For things you can stand on, like a big rock, you would
    	want to use the static template slot. The server slot would be used for things like kill zones.

    	If you are adding scripts to the templates being loaded, those will also need particular contexts depending on
    	their functionality.

    Why do some object loaders have visible items in them and others are invisible?

    	To make things easier on new players, we have placed some of the templates that the loaders will spawn into
    	their proper context folders. This means you can directly edit the town map without having to add the
    	template to the scene yourself. Make sure you update the template when you are done editing.

    	As long as the template is the same as the one specified in the loader, the loader can despawn that object
    	when you are not in the area with it and bring it back when you travel to that area again.

    	*Note: even if you put the template itself into the loader, you also need to add a reference to it on the
    	object loader!

--]]