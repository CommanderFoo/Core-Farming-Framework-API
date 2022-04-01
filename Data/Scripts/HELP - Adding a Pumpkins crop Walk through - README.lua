--[[

    ------------------------------
    ---   GROWING PUMPKINS     ---
    ------------------------------

    Lets add pumpkins the the farm!

    I suggest trying to figure it out on your own first, and then check the steps below if you get stuck or can't
    figure something out. That will give you a chance to explore all of the tables and templates :)


		1. Art: Look up "Watermelon" in the project content to see what art it used, you will find several templates.
		Pull the ones that start with "Producer", "Product", and "Source Item" out of your project content and
		into your scene. Now deinstance them, and abandon the templates, and rename them to have "Pumpkin" in the
		names instead of "watermelon". Following the general size and position of the art, replace the current art
		inside each template with your pumpkin art. (There is a pumpkin asset in core content that you can use!) 
		When you are done, make them all into new templates.


    	2. Items: Now it is time to start hooking all the art up to data in the tables. The easiest way to add a
    	new data, is to copy the row you have that is most similar to what you want to make in that table and go 
    	from there. So in this case, we will want to copy the data for Watermelon in the various tables. Go to the
    	location below, or alternatively search for "Items - Farm" in your project content.

    			Global Database
					|___ Inventories, Items, Drops
						|___ Items (The custom property on this script has the Items table.)

				Copy the rows for Watermelon, and Watermelon seed, and add them to the bottom of the table. Change
				the data for the Id, Name, and Description to be "Pumpkin" instead of "Watermelon".

				Change the drop template and icon templates to be the ones you created for the pumpkin and seeds.


		3. Drops: We will need the drops table, since we want the pumpkin plant to drop a crop when it is harvested.
		The seed will also need to be a drop since it will be for sale at the seed store. Search for "Drops - Farm"
		in your project content, or look in the location below:

    			Global Database
					|___ Inventories, Items, Drops
						|___ Drops (The custom property on this script has the Items table.)

				Copy the rows for "Watermelon Collect" and "Watermelon Seed Pack". Rename "Watermelon" to "Pumpkin"
				in both the ID and the ItemId. If you want to change the number of watermelons that drop from a plant,
				you can do so in the "MinAmount" and "MaxAmount" columns.


		4. ProducerStates: This table just holds the art that will be used by the producer when we get it set up,
		Find the table for this by looking in the location below, or searching for "Producer States - Farm" in your
		project content.

		   	 	Global Database
					|___ Producers & Buffs
						|___ Producer States (The custom property on this script has the table.)

				Copy the row for "Watermelon Plant" and rename it to "Pumpkin Plant". Now swap out any template
				references to the the old watermelon art, and replace it with your pumpkin versions.


		5. Producer Buffs: This table is what allows your pumpkin harvest to be increased by fertilizer. Search for
		"Producer Buffs - Farm" in your project content, or look in the location below:

				Global Database
					|___ Producers & Buffs
						|___ ProducerBuffs (The custom property on this script has the table.)


				Copy the row for "Fertilized Watermelon" and paste it at the bottom of the table. Now rename the Id to
				be "Fertilized Pumpkin".


		6. Producer: This is the table that ties everything we have done so far together into the item that grows
		in the game. So we will need the Ids that we made in the tables above. This table also sets the growth time,
		the harvest tool, if the plant grows back or expires, etc... Search for "Producers - Farm" in your project
		content, or look in the location below:

				Global Database
					|___ Producers & Buffs
						|___ Producers (The custom property on this script has the table.)


				Copy the row for "Watermelon Plant" and paste it into the bottom of the producers table. Now change
				your new row to "Pumpkin Plant" instead.

				Change the next column, the "UniqueStorageId" to a number that is not used anywhere in the table.
				(I find it best to keep these in the order they are added to avoid mistakes, that number must be
				unique in this table!) Change the "SourceItemId" to the "Pumpkin Seed" Id that you made back in the
				items table.

				Change the "ProducerStatesId" to be "Pumpkin Plant", to match the Id you put into the producer
				states table.

				In the "DropIds" column, replace the "Watermelon Collect" with your "Pumpkin Collect" Id from the 
				drops table. You can leave the plant debris alone if you still want that to drop.

				Finally, scroll over the the "ProducerBuffIds" at the very end of the table and add the the
				"Fertilized Pumpkin" Id that your created in the ProducerBuffIds table.



		7. Sellables: Information on which items can be sold by the player to the npc stores is kept in this table.
		Search your project content to find the table "Sellables - Farm" or check the location below:
		
		
				Global Database
					|___ Stores & Currencies
						|___ Sellables (The custom property on this script has the table.)
						
				
				Copy the row for watermelon. Replace the ID, Name, Description, IconAsset, and InputItemId to be the
				correct names/values for your new pumpkin crop. If you want to change the profit for your pumpkins,
				you can switch the DropId for a new one. (The "produce" tag will make Penny Produce able to buy it!)
				
		
		8. Purchasables: Although the data for your crop now exists, and you could sell your pumpkins, there is
		currently no way to get pumpkin seeds! We can solve that with an entry to the next table. Search your 
		project content for the table "Purchaseables - Farm" or open the location below:


				Global Database
					|___ Stores & Currencies
						|___ Purchaseables (The custom property on this script has the table.)
						
				
				Copy the row for the "Watermelon Seed Pack", in the new row change the ID, Name, Description,
				IconAsset, and DropId to represent your new "Pumpkin" crop. (The "seeds" tag will make them show up
				in the catalog book at sunshine seeds.)



	   	7. Your final task is to play your game and test it your new pumpkin item. Go buy the seeds for sale from
	   	the catalog (book) at the seed store. If they are too expensive, you can adjust the price in the 
	   	Purchasables table. (You can also make art with its own purchase zone so that pumpkin seeds show up in the
	   	booth with the other seeds if you want, but for now we just need to test the new item.) Notice that we didn't
	   	add the seeds to the store ourselves, the Sunshine Seeds store data is set to show all seeds in the game. 
	   	As long as your seeds have the right tag on their purchasable, they will show up for sale.


	   	If some part of your item doesn't work, try checking spelling in the Ids of the related tables. When copying
	   	data like this, those are going to be the mostly frequent types of errors.


	Happy farming!

    If you have any questions or feedback please feel free to let us know!

        - Creators Discord: https://discord.gg/core-creators
        - Forums: https://forums.coregames.com/

--]]