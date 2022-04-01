Assets {
  Id: 16637554626864398582
  Name: "CraftingStationData"
  PlatformAssetType: 3
  TextAsset {
    CustomParameters {
      Overrides {
        Name: "cs:ItemId"
        String: ""
      }
      Overrides {
        Name: "cs:OverrideScreenId"
        String: ""
      }
      Overrides {
        Name: "cs:AllowAllRecipes"
        Bool: false
      }
      Overrides {
        Name: "cs:Recipes"
        String: ""
      }
      Overrides {
        Name: "cs:DropInWorld"
        Bool: true
      }
      Overrides {
        Name: "cs:DropForAllPlayers"
        Bool: false
      }
      Overrides {
        Name: "cs:SinglePlayerDrops"
        Bool: true
      }
      Overrides {
        Name: "cs:MaxPickupsPerDrop"
        Int: 3
      }
      Overrides {
        Name: "cs:DropMinDistance"
        Float: 50
      }
      Overrides {
        Name: "cs:DropMaxDistance"
        Float: 150
      }
      Overrides {
        Name: "cs:DropTimeoutSeconds"
        Float: 0
      }
      Overrides {
        Name: "cs:DropItemPickupTemplate"
        AssetReference {
          Id: 8040246261067913342
        }
      }
      Overrides {
        Name: "cs:DropInWorld:tooltip"
        String: "If true, harvested crops will drop their contents into the world. Otherwise they will be directly added to the highest priority Inventory."
      }
      Overrides {
        Name: "cs:DropInWorld:category"
        String: "Custom"
      }
      Overrides {
        Name: "cs:DropInWorld:subcategory"
        String: "Drops"
      }
      Overrides {
        Name: "cs:DropForAllPlayers:tooltip"
        String: "If true, harvested crops will drop on all clients if DropOnHarvest is also true."
      }
      Overrides {
        Name: "cs:DropForAllPlayers:category"
        String: "Custom"
      }
      Overrides {
        Name: "cs:DropForAllPlayers:subcategory"
        String: "Drops"
      }
      Overrides {
        Name: "cs:SinglePlayerDrops:tooltip"
        String: "If true, harvested crop drops will be destroyed on other clients when the first Player picks them up."
      }
      Overrides {
        Name: "cs:SinglePlayerDrops:category"
        String: "Custom"
      }
      Overrides {
        Name: "cs:SinglePlayerDrops:subcategory"
        String: "Drops"
      }
      Overrides {
        Name: "cs:MaxPickupsPerDrop:category"
        String: "Custom"
      }
      Overrides {
        Name: "cs:MaxPickupsPerDrop:subcategory"
        String: "Drops"
      }
      Overrides {
        Name: "cs:DropMinDistance:tooltip"
        String: "If DropOnHarvest is true, the minimum distance from the plot the drop will appear"
      }
      Overrides {
        Name: "cs:DropMinDistance:category"
        String: "Custom"
      }
      Overrides {
        Name: "cs:DropMinDistance:subcategory"
        String: "Drops"
      }
      Overrides {
        Name: "cs:DropMaxDistance:category"
        String: "Custom"
      }
      Overrides {
        Name: "cs:DropMaxDistance:subcategory"
        String: "Drops"
      }
      Overrides {
        Name: "cs:DropTimeoutSeconds:category"
        String: "Custom"
      }
      Overrides {
        Name: "cs:DropTimeoutSeconds:subcategory"
        String: "Drops"
      }
      Overrides {
        Name: "cs:DropItemPickupTemplate:subcategory"
        String: "Drops"
      }
      Overrides {
        Name: "cs:OverrideScreenId:tooltip"
        String: "(Optional) Set this to a Screen in \"Screens\" section of the database to use a custom screen for this Crafting Station."
      }
      Overrides {
        Name: "cs:Recipes:tooltip"
        String: "A comma separated list of Recipe Ids or Tags that you want this Crafting Station to be allowed to craft."
      }
    }
  }
  SerializationVersion: 110
  VirtualFolderPath: "Data"
}
