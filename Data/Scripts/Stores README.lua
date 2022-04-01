--[[
      _____ _
     / ____| |
    | (___ | |_ ___  _ __ ___  ___
     \___ \| __/ _ \| '__/ _ \/ __|
     ____) | || (_) | | |  __/\__ \
    |_____/ \__\___/|_|  \___||___/

    ------------------------------
    ---        OVERVIEW        ---
    ------------------------------

    The Stores system allows users to purchase and sell Items, Currencies & Upgrades.

    You can use the Database to define Purchaseables and Sellables, then hook them into Stores.

    There are included templates that make it easy to set up an interactive in-world shops
    and the UI needed to drive these sales.

    If you have any questions or feedback please feel free to let us know!

        - Creators Discord: https://discord.gg/core-creators
        - Forums: https://forums.coregames.com/

    ------------------------------
    ---          SETUP         ---
    ------------------------------

    Stores, Purchaseables & Sellables are created by adding data to the Database. Like other systems,
    this can be done with either Data Tables or Hierarchy objects.

    Example Data Tables are available for you to fill out, found in the "My Tables" section of Project Content:
        - Stores
        - Purchaseables
        - Sellables

    If you're creating data with the Hierarchy approach, the object structure for stores is as follows:
        Stores (the DataGroup)
        |__ Store1
        |__ Store2
        |__ ...

        Purchaseables (the DataGroup)
        |__ Purchaseable1
            |__ Inputs
                |__ Input1
                |__ Input2
                |__ ...
            |__ Drops
                |__ Drop1
                |__ Drop2
                |__ ...

        Sellables (the DataGroup)
        |__ Sellable1
            |__ Inputs
                |__ Input1
                |__ Input2
                |__ ...
            |__ Drops
                |__ Drop1
                |__ Drop2
                |__ ...

    ------------------------------
    ---          DATA          ---
    ------------------------------

    Stores

        1. Id

            - The id of the Store. Must be unique within a scene.

        2. StoreName

            - A display friendly name for this Store that may be shown on various interfaces.

        3. StorageKey

            - An optional Shared Storage Key to save Store data into. Default is Local Storage.

        4. Purchaseables

            - A comma-separated list of Purchaseable Ids & Tags that determines what appears in this Store.

        5. Sellables

            - A comma-separated list of Purchaseable Ids & Tags that determines what appears in this Store.

        6. PurchaseScreenOverrideTemplate

            - By default, the 'Store Screen' template is used for all stores. If you want a particular Store
            to have a different theme for purchasing, you can assign a different template for it here.

        7. SellScreenOverrideTemplate

            - By default, the 'Store Screen' template is used for all stores. If you want a particular Store
            to have a different theme for selling, you can assign a different template for it here.

    Purchaseables

        1. Id

            - The id of the Purchaseable. Must be unique within a scene.

        2. SortOrder

            - A numerical index that determines the order of Purchaseables in Stores.

        3. Name

            - A display friendly name for this Purchasable that may be shown on various interfaces.

        4. Description

            - Additional display text that may be shown on various interfaces.

        5. Tags

            - A comma-separated list of tags that make it easier to deal with groups of Purchaseables.
            Tags allow for simplification of data entry (e.g. a Store could sell anything with the 'tools' tag).

        6. PerkReference

            - A Purchaseable can be tied to a Core Perk by assining the NetReference here.

        7. GlobalPurchaseLimit

            - The sale of a Purchaesable can be limited (per player) across the entire game by setting a limit here.
            The default value of 0 will allow unlimited purchases.

        -- Icon --

        8. IconCameraId

            - If "Is3DIcon" is true, this should match the "CameraId" of an "Icon Generator" in the scene.

        9. IconAsset

            - The image or template to use for an icon. If "IsKitbashed2DIcon" is true, this should be a UI
            template. If "Is3DIcon" is true, this should be a 3D object template. If "IsImageIcon" is true, this
            should be an image/brush asset.

        10. IsKitbashed2DIcon

            - If true, the "IconAsset" should point to a UI template. This template will be spawned as the icon.

        11. Is3DIcon

            - If true, the "IconAsset" should point to a 3D object template. An image of this template will be used
            as the icon.

        12. IsImageIcon

            - If true, the "IconAsset" should point to an image/brush asset. This will be used as the icon.

        -- Inputs & Drops --

        13. InputItemX

            - The id of an Item required to make this purchase.

        14. InputCurrencyX

            - The id of a Currency required to make this purchase.

        15. InputAmountX

            - The amount of whichever input was defined in the corresponding InputItem/InputCurrency.

        16. DropInWorld

            - If true, the Drops from this purchase will drop in the world instead of going into
            the player's inventory.

        17. DropIds

            - A comma-separated list of ids of Drops that will be given when the purchase is made.

        18. DropBehaviourId

            - The id of the DropBehaviour to use for any Drops that drop into the world.

    Sellables

        Data for Sellables is almost identical to Purchaseables.

    ------------------------------
    ---       STORE ZONES      ---
    ------------------------------

    Stores can be added to the world using Store Catalog Zones.
    A basic template is available for this purpose: "Store Catalog Zone - Look (Database)"
    The StoreId custom property on the root of this template will link it to your Store data.

    Individual Purchaseables can also be made available in the world.
    A "Purchaseable Item Zone - Look (Database)" template can be used for this purpose.

    These zones are supported by pre-placing them in the scene or loading them through an Area Object Loader.
]]