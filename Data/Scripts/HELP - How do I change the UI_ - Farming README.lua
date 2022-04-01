--[[
    ------------------------------
    ---        OVERVIEW        ---
    ------------------------------

	These examples come with quite a bit of UI that can be adjusted to your preference.

	Tips: Use the icon in the top right that looks like a rectangle with a pointer to enter UI editing mode. Then if you
    click a piece of UI, it will highlight that UI's location in the heiarchy, that is probably the fastest way to find
    what you need in most cases.

    If you have any questions or feedback please feel free to let us know!

        - Creators Discord: https://discord.gg/core-creators
        - Forums: https://forums.coregames.com/

    ------------------------------
    ---      FINDING UI        ---
    ------------------------------

    You can customize the settings on many of the UI elements through custom properties, you can also change art,
    fonts, and colors of items by looking in the following locations:

    --- In The Hierarchy ---

        UI
        |___ Area Name UI
        |___ ClientContext
        |   |___ ContextMenu Container
        |   |   |___ Inventory Item Context Menu
        |   |___ Main Container
        |   |   |___ Crosshair
        |   |   |___ Hotbar
        |   |___ Tooltip Container
        |       |___ UI Tooltip
     	|___ Error Feedback
        |___ Icon Generator
        |___ Loading Screen Component
        |___ Nameplates
        |___ Placeable Limits Display (Front Yard / Back Yard)
        |___ Player Lot Name UI
        |___ Interaction Display
        |___ Reset Data Tool
        |___ UI Currency Display

    Area Name UI

        This displays the name of the area the Player is currently in. You can safely remove it if you don't want to
        show this information, or you can modify the art inside.

    Inventory Item Context Menu

        This menu shows up if a Player right clicks an Inventory Item. To edit how it looks you can force its visibility
        on and change / add art to it. Just remember to set the visibility back to FORCE OFF when you are done.

    Crosshair

        The Crosshair is just a simple image that shows the center of the screen. It is safe to remove or modify.

    Hotbar

        This contains the hotbar visible on the bottom of the screen. You can change the background here. If you want to
        adjust the way the individual slots look you can adjust the "Inventory Screen Slot" Template.

    UI Tooltip

        This tooltip will appear as you hover over Inventory Items. It is safe to remove if you don't want to use
        tooltips. If you adjust the way it looks, keep in mind that the width can vary, so make use of the "Inherit
        Parent Width" and "Inherit Parent Height" settings on the Ui objects you add.

    Error Feedback

        If you would like to style or relocate this error message, look here. You can also make errors show up in chat
        and control the fade with the custom properties on this item.

    Icon Generator

        This is a photo booth for icons. Look inside and you can see that there is a plane that acts as the backdrop for
        your icons (It's using the render to texture system to make icons out of 3d objects). If you are using UI
        textures as icons, then this will not be used.

    Loading Screen Component

        The Loading screen can safely be removed if you don't want it. Otherwise you can freely adjust art in it, just
        be careful not to remove any elements being referenced by the script.

    Nameplates

        The nameplates object has a variety of settings on it that you can use to customize how they look. If you don't
        want to use them you can safely remove them.

    Placeable Limits Display

        This components shows how many items a Player has placed on a Lot as well as the maximum allowed (if a maximum
        is set). You can remove or adjust this as needed. The object itself has a couple settings on it that control how
        it is displayed.

    Player Lot Name UI

        This item has custom properties to control the text for the Player Lot name display. If you look under its
        ClientContext folder you will find the visuals for it.

    Interaction Display

        This is where the settings and visuals for the interaction display tool tip can be found. This is the tool tip
        that shows up when you are hovering over various things in your scene.

    Reset Data Tool

        This is very useful while testing, but once you are ready to publish you should disable it so it no longer shows
        (and hitting F1 will be disabled). To do so, uncheck the "Enabled" custom property.

    UI Currency Display

        Find the art for your currency here under "ClientContext". You can display more currencies by duplicating this,
        changing the custom properties, and moving the UI art over a bit.

--]]