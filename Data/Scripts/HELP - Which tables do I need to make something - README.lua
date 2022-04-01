--[[

    ------------------------------------------------------------
    ---     			   OVERVIEW     				     ---
    ------------------------------------------------------------
    
    
   When adding a new interactive object or item to your game, the data used to define it is broken up into 
   different tables depending on the functions you need the new thing to have. This system is what allows
   the framework to be so flexible, but it does take some getting use to. Here are some examples and where
   to find the data for each. You don't need to read over this whole thing, just jump to the type of item
   want to make!
   
   
    ------------------------------------------------------------
    ---  			CRAFTED FOOD - GRAPE TARTS               ---
    ------------------------------------------------------------
   
   The functionality would potentially be crafting, collecting, and selling the tarts. So the following 
   tables would be needed:
   
   		Items - To allow the tarts to exist in an inventory, and to set it's icon and drop icon.
   		Recipe - To allow the player to craft the tarts.
   		CraftingStations - Too add "Grape Tarts" to the list of recipes for the wood cook stove.
   		Drops - To make the tarts able to drop from the crafting station when it was cooked.
   		
   		Sellables - If you want the player to be able to sell the tarts for money. *Optional*
   		Stores - If you want to sell it by it's name rather than a tag we have provided (foods). *Optional*
   	
   	
	------------------------------------------------------------
    ---  		  	 PRODUCER - PUMPKIN CROP                 ---
    ------------------------------------------------------------
	
	Crops need to grow and produce an output, be collected, react to buffs like fertilizer, and be sold
	to make money. So you would need these tables: 
	
		Items - To allow the Pumpkin & Seed to exist in an inventory, and to set it's icon and drop icon.
		Producer - To allow the pumpkin to be planted and grow.
		ProducerStates - To set all the art for the growing pumpkin.
		ProducerBuffs - If you want pumpkins to respond to fertilizer. *Optional*
		Drops - To make the pumpkin able to be picked up when its harvested.
		
		Sellables - If you want the player to be able to sell the pumpkin for money. *Optional*
	   	Stores - If you want to sell it by it's name rather than a tag we have provided (produce). *Optional*
	   	Purchasables - To set the pumpkin seed for sale to a player can plant them.
	  
	  
	------------------------------------------------------------
    ---  				DECORATION - TROPHY                  ---
    ------------------------------------------------------------   	
	   	
	Decorations are just the most basic form of a placeable, so you will need the tables for that and a way
	of letting the player aquire the item. The following tables are what you would need:
	
		Items - To allow the Trophy to exist in an inventory, and to set it's icon and drop icon.
		Placeable - To allow the Trophy to be placed in their space by the player.
		
		Purchasables - To allow the player to trade in some other item to get their Trophy.
		Stores - To add the Purchasable ID for the trophy to a specific store.
		
	
	------------------------------------------------------------
    ---  			INVENTORY - LARGE CHEST                  ---
    ------------------------------------------------------------   	
	   	
	Chests are a placeable item, but they also have some unique settings that are only used by inventories.
	To make a new chest, you would need:
	
		Items - To allow the Chest to exist in another inventory, and to set it's icon and drop icon.
		Placeable - To allow the Chest to be placed by the player, and set it to be an inventory.
		Inventories - To set the behavior of the open chest and control how many slots it has.
		
		
		*Don't forget, you need to give the chest to the player somehow. In starting items, in a store,
		as a drop from a producer or gatherable, or through custom code.
		
	
	------------------------------------------------------------
    ---  		PRODUCER BASE - STRAWBERRY POT               ---
    ------------------------------------------------------------   	
	   	
	A strawberry pot would need to be a placeable item and a producer base:
	
		Items - To allow the pot to exist in an inventory, and to set it's icon and drop icon.
		Placeable - To allow the Strawberry Pot to be placed by the player, and to set it as a producer base.
		
		
		*Don't forget, you need to give the pot to the player somehow. In starting items, in a store,
		as a drop from a producer or gatherable, or through custom code.
		
		
	------------------------------------------------------------
    ---		   	CRAFTING TABLE - SEWING MACHINE              ---
    ------------------------------------------------------------   	
	   	
	A sewing machine would need to be a placeable item and a crafting table:
	
		Items - To allow the machine to exist in an inventory, and to set it's icon and drop icon.
		Placeable - To allow the Sewing machine to be placed by the player, and to make it a crafting table.
		Crafting Stations - To assign the list of recpies to the machine.
		
		Recipes - If you want your machine to have unique recipes. *Optional*
		
		
		*Don't forget, you need to give the machine to the player somehow. In starting items, in a store,
		as a drop from a producer or gatherable, or through custom code.
		
		
	------------------------------------------------------------
    ---		  	    	EQUIPMENT/TOOL - RAKE          	     ---
    ------------------------------------------------------------   	
	   	
	Equimpment in the game fall into one of two groups. Most, just reuse the "Hand Tool - Look" equipment
	and then change the object you hold based on the Items table. But the ones that are actual tools, have
	their own separate entry in the equipment table as well. This list will help you make one of those:
	
		Items - To allow the rake to exist in an inventory, and to set it's template, icon, and drop icon.
		Equipment - Sets the Id and tooltype for the rake equipment.
		
		
		*The tool templates are using core equipment, but the best way to make your own is to copy one of our 
		existing tool templates, deinstance it, rename it, change the art, and then make it a new template.
		There some settings you can change inside that template too, click on the hand and check out the
		custom properties there.
		
		*Don't forget, you need to give the rake to the player somehow. In starting items, in a store,
		as a drop from a producer or gatherable, or through custom code.
	
	------------------------------------------------------------
    ---  			GATHERABLE - METAL ORE NODE              ---
    ------------------------------------------------------------  
		
	To add a new gatherable "Metal Ore Node", you would need these tables:
	
		Items - To allow the metal ore to exist in an inventory, and to set it's icon and drop icon.
		Drops - To make the metal ore drop when the node is mined.
		
		Gatherables - To define the beahvior of the node in the world, and the tool needed to mine it.
		Gatherable States - To define the look of the node as it is gathered.
	
		
		
		*To actually add your Metal Ore Nodes to the game, you need to add them to a gatherable group
		template. Let's add them to the quarry in this case. 
		
		Find the template "Area - Quarry Gatherable Group - Rocks and Bushes" and add it to your scene.
		You can see all kinds of glowing capsules and boxes. These are just stand in objects that tell
		the game the position it should spawn gatherables at. They can be the actual art if that makes
		it easier for you to work with. The only thing they really need is the GatherableId custom 
		property. 
		
		Duplicate one of the exisiting objects and move it to where you want your metal to spawn.
		Make sure that the GatherableId custom property matches the Id you added to the Gatherables Table!
		Now update the gratherable group template and remove it from the scene again. When you visit the
		Quarry, your metal node should now be there to mine :)
		
		
	------------------------------------------------------------
    ---  				UPGRADE - Pond                       ---
    ------------------------------------------------------------  
    
	Upgrades don't need a lot of tables, but they can be a little confusing. The need a table to specify 
	the art, a table to define parts of art that need to go together (like the front and back of a house),
	and finally putting those pieces into a table that defines the progression of upgrades in a specific 
	collection.
	
		UpgradeTemplateSets - This is where you hook up art templates for the pond to an Id.
		Upgrades - This is where you say which of UpgradeTemplateSetIds go to a single Upgrade.
		Upgrade Collections - This is where you set up the ID for your Pond to put in the Upgrade Loader.
		Purchasables - To set up the material or money cost for the pond upgrade.
		Drops - Needed by the purchasable to give you the pond upgrade.
		
		
		*I really suggest you copy one of the land expansions so that you see what settings are needed.
		There will should be at least 2 art templates (damaged state and final pond) plus the icon for the
		upgrade. To actually implement the upgrade on the lot you will need an upgrade loader positioned in
		the correct position of the player lot and with the UpgradeCollectionId and the DefaultUpgradeId for
		the damaged state in it's custom properties. You can find the "Player Lot Upgrade Loader" template
		in your project content.
		
	
	--]]