Assets {
  Id: 4036797405546411882
  Name: "SellableData"
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
        Name: "cs:IsKitbashed2DIcon"
        Bool: false
      }
      Overrides {
        Name: "cs:Is3DIcon"
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
        String: "Tags allow for categorization of Sellables. Separate multiple tags with commas (e.g. seed,pack,food)"
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
  SerializationVersion: 108
  VirtualFolderPath: "Data"
}
