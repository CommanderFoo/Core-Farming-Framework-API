// Manual job right now. Headers from the readme files need to provide an easier way to extract.

let Headers = {}

Headers.Areas = `
The Areas system is meant to be used to chunk your environment into discrete pieces that can be loaded on demand.
This provides a much more performant experience for Players and lets creators include much more content in their
games.

As Players move through Areas they can be moved to specific spawn points, be placed into pools of Areas, have
templates loaded into client, server or static contexts and more.
`;

Headers.Crafting = `
The Crafting system can be used to turn one thing into another over a period of time. This can be done at individual Crafting Stations or through a screen not associated to a station.
`;

Headers.Currency = `
Currency is a drop in system that provides ready to go Player Currency management without any code required. It also provides a full API for creators with scripting knowledge to allow them to expand on or change how the Currency works.

Any amount of Currencies can be added to a game and you can use them for more than just visible currency amounts.
For example, a Currency could be used to track the scores in a game.
`;

Headers["Data Migration"] = `
Data Migration is something that you need to do if you change a game setting (like an Item ID) that is referenced in Player's saved datas. Changing something like that will break Player saves because they now refer to an old ID that doesn't exist in the game any more.

To deal with this potential problem, we have a basic Data Migration system that will let you fix Player save data if you do make changes to things it references.
`;

Headers.Database = `
These Databases can be added anywhere in the hierarchy (In Default Context) and they will automatically parse any folders, groups, scripts and their children into a set of nested data. This data can then be accessed though the APIDatabase.

You can have as many of these in your scene as you want. They will all merge their data together where you can access it easily in scripts.
`;

Headers.Gatherables = `
Gatherables are a quick way to get large amounts of destroyable objects with multiple states into a scene with zero code and no additional networked objects.

Gatherables are groups of interactable objects that players can destroy to receive resources. Each gatherable object can have multiple states, drop resources, respawn over time and more.

All you need to do is drop a Gatherables template into your scene, swap out and create art and configure some values to make them look and act the way you want.
`;

Headers["Icon Generator"] = `
The Icon Generator is a drop in component that will render 3D icons for use in UIImage objects. You can have several Icon Generators in the scene to allow for rendering icons in different styles. The Icon Generator will automatically clear unused icons to make sure only the relevant texture space is being used.

The Icon Generator can currently only be used via lua. You will need the following to successfully render a 3D icon:

* A template of your object sized and oriented correctly to fit in the Icon Generators camera bounds.
* A UIImage to display the rendered icon with.
* A client script that calls the Icon Manager API to render the icon to the image.

The Icon Generator is only meant for use with static "single shot" icons. There is currently no support for live captures.

The Icon Generator template can be dropped into a scene and configured. A CameraId is the only required Custom property. It must be unique across all Icon Generators.

The "Icon Generator Example (Single Icon)" template and "Icon Generator Example (Multiple Icons)" templates can be dropped into the scene with an "Icon Generator" template (Sharing the same CameraId) for simple examples of the Icon Generator working.
`;

Headers["Interaction System"] = `
The Interaction System provides creators with a way to quickly create interactive objects without any code. It is made up of a group of "Interaction Modules" and a set of "Interaction Components" that work together to manage Player input and provide interactivity.

As a creator you just need to add Interaction Components to your objects and configure them. Each Interaction Component has a field for an Interaction Module. Using this field you can quickly switch out the type of input that the object will react to. Objects can have any number of Interaction Components under them to allow for more complex interactions.
`;

Headers.Inventory = `
Inventory is a drop in system that provides ready to go Player Inventory management without any code required. It also provides a full API for creators with scripting knowledge to allow them to expand on or change how the Inventory works.

The Inventory comes with a few potential setups. You can use a combined Inventory and Hotbar, Hotbar or individual Inventory Settings templates to create the Inventory you want for your game.

Inventory items can be dragged and dropped across Inventories. Items can also be dropped into the world or destroyed by being dropped on the trash icon in the provided UI.

Clicking Items that have been configured to be Equipment will optionally equip the item. Other custom actions could be created by listening for the Events that the Inventory broadcasts.
`;

Headers["Player Lots"] = `
Player Lots offer a way for creators to define sections in their game that belong to individual Players. Lots can be mixed with several other systems and the main benefits they provide are ownership, permissions and persistence.

A Player can "own" any number of Player Lots, and Lots can exist only while the owner is online, or stay even after they leave the game.

Lots can even be combined with Areas to let you create pools of Area/Lots that dynamically load and unload as Players enter and exit them. This is used to create things like the interior of a Players house that only loads when a Player enters it.
`;

Headers["Producers _ Buffs"] = `
The Producers system allows you to build objects that take an input, change over time and generate an output. They were designed with farming / crops in mind, but can be used for a multitude of other cases. Some ideas:

1. A corn plant that grows over time and produces some corn. If not harvested in time it withers and dies.
2. A gas engine that can be filled, runs until it's empty and then stops.
3. A building that takes time to become fully constructed. Once constructed it generates currency periodically.

When mixed with the Buffs system these examples can become even more interesting:

1. A corn plant that needs a "watered" buff to grow.
2. A gas engine that, when running, emits a "power" buff that allows other Producers to progress.
3. A building that requires the "power" buff to generate currency. While generating currency it emits a "happiness" buff that affects other gameplay.

Like Gatherables, Producers make use of the Replicator functionality. This means they use 0 networked objects and run fairly efficiently at scale. Gatherables are more efficient when you wants many objects in your scene, so it becomes a choice between the two systems that depends on how much functionality you need vs. efficiency.

Producers also introduce a new system called Placeables. Placeables are objects that can be placed by the Player during game play. In most cases you will also want to use Player Lots to allow placed Producers to be saved to the Players Storage.
`;

Headers.Stores = `
The Stores system allows users to purchase and sell Items, Currencies & Upgrades.

You can use the Database to define Purchaseables and Sellables, then hook them into Stores.

There are included templates that make it easy to set up an interactive in-world shops and the UI needed to drive these sales.
`;

Headers.Tools = `
Tools are Equipment that can be used to interact with Gatherable Objects and other future systems. Each Tool identifies itself with a ToolType. This is chacked against lists of valid ToolTypes on interactable objects to see if the Tool can interact with the object.

Tools make use of the Interaction System to allow for easy to swap interaction styles. They support Look Direction, Camera Direction and Mouse Pointer based interactions.

The Inventory Module is integrated and optionally supports equipping / unequipping Tools from inside Inventories.

Failed interactions can have custom errors that will be displayed to the Player. These can be helpful in letting the Player know which Tool to use on a specific object.
`;

Headers.Upgrades = `
Upgrades is a drop in system that allows players unlock, save, and progress through collections of unlockable options.

Players can obtain upgrades by purchasing them through Stores, receiving them through Drops, or by directly accessing the ugprades API through code.

Examples uses of upgrades:
- Purchasing extensions to a house.
- Unlocking new playable areas.
- Acquiring a stronger version of equipment.
`;

export default Headers;