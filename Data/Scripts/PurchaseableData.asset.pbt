Assets {
  Id: 3851649058442283417
  Name: "PurchaseableData"
  PlatformAssetType: 3
  TextAsset {
    CustomParameters {
      Overrides {
        Name: "cs:Name"
        String: ""
      }
      Overrides {
        Name: "cs:Description"
        String: ""
      }
      Overrides {
        Name: "cs:Tags"
        String: ""
      }
      Overrides {
        Name: "cs:PerkReference"
        NetReference {
          Type {
            Value: "mc:enetreferencetype:unknown"
          }
        }
      }
      Overrides {
        Name: "cs:IconCameraId"
        String: ""
      }
      Overrides {
        Name: "cs:IconAsset"
        AssetReference {
          Id: 3746753204667991703
        }
      }
      Overrides {
        Name: "cs:Is3DIcon"
        Bool: false
      }
      Overrides {
        Name: "cs:IsKitbashed2DIcon"
        Bool: false
      }
      Overrides {
        Name: "cs:IsImageIcon"
        Bool: true
      }
      Overrides {
        Name: "cs:DropInWorld"
        Bool: false
      }
      Overrides {
        Name: "cs:DropForAllPlayers"
        Bool: false
      }
      Overrides {
        Name: "cs:SinglePlayerDrops"
        Bool: false
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
        Name: "cs:GlobalPurchaseLimit"
        Int: 0
      }
      Overrides {
        Name: "cs:DropInWorld:tooltip"
        String: "If true, harvested crops will drop their contents into the world. Otherwise they will be directly added to the highest priority Inventory."
      }
      Overrides {
        Name: "cs:DropForAllPlayers:tooltip"
        String: "If true, harvested crops will drop on all clients if DropOnHarvest is also true."
      }
      Overrides {
        Name: "cs:SinglePlayerDrops:tooltip"
        String: "If true, harvested crop drops will be destroyed on other clients when the first Player picks them up."
      }
      Overrides {
        Name: "cs:DropMinDistance:tooltip"
        String: "If DropOnHarvest is true, the minimum distance from the plot the drop will appear"
      }
      Overrides {
        Name: "cs:Tags:tooltip"
        String: "Tags allow for categorization of Purchaseables. Separate multiple tags with commas (e.g. seed,pack,food)"
      }
      Overrides {
        Name: "cs:GlobalPurchaseLimit:tooltip"
        String: "Limits the amount of this purchaseable that a player can ever purchase. 0 = unlimited."
      }
      Overrides {
        Name: "cs:IconCameraId:subcategory"
        String: "Icon"
      }
      Overrides {
        Name: "cs:IconAsset:category"
        String: "Custom"
      }
      Overrides {
        Name: "cs:IconAsset:subcategory"
        String: "Icon"
      }
      Overrides {
        Name: "cs:IsImageIcon:category"
        String: "Custom"
      }
      Overrides {
        Name: "cs:IsImageIcon:subcategory"
        String: "Icon"
      }
      Overrides {
        Name: "cs:IsKitbashed2DIcon:category"
        String: "Custom"
      }
      Overrides {
        Name: "cs:IsKitbashed2DIcon:subcategory"
        String: "Icon"
      }
      Overrides {
        Name: "cs:Is3DIcon:category"
        String: "Custom"
      }
      Overrides {
        Name: "cs:Is3DIcon:subcategory"
        String: "Icon"
      }
      Overrides {
        Name: "cs:DropItemPickupTemplate:subcategory"
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
        Name: "cs:DropMaxDistance:category"
        String: "Custom"
      }
      Overrides {
        Name: "cs:DropMaxDistance:subcategory"
        String: "Drops"
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
        Name: "cs:MaxPickupsPerDrop:category"
        String: "Custom"
      }
      Overrides {
        Name: "cs:MaxPickupsPerDrop:subcategory"
        String: "Drops"
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
        Name: "cs:DropForAllPlayers:category"
        String: "Custom"
      }
      Overrides {
        Name: "cs:DropForAllPlayers:subcategory"
        String: "Drops"
      }
      Overrides {
        Name: "cs:DropInWorld:category"
        String: "Custom"
      }
      Overrides {
        Name: "cs:DropInWorld:subcategory"
        String: "Drops"
      }
    }
    Assets {
      Id: 3746753204667991703
      Name: "Icon Core"
      PlatformAssetType: 9
      PrimaryAsset {
        AssetType: "PlatformBrushAssetRef"
        AssetId: "Icon_Core"
      }
    }
  }
  SerializationVersion: 110
  VirtualFolderPath: "Data"
}
