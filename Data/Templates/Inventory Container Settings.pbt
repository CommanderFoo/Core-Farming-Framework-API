Assets {
  Id: 4435759033849432046
  Name: "Inventory Container Settings"
  PlatformAssetType: 5
  TemplateAsset {
    ObjectBlock {
      RootId: 4513950664792054274
      Objects {
        Id: 4513950664792054274
        Name: "Inventory Container Settings"
        Transform {
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 4781671109827199097
        ChildIds: 14751228215979897718
        ChildIds: 2958868104667398575
        UnregisteredParameters {
          Overrides {
            Name: "cs:InventoryId"
            String: "defaultChest"
          }
          Overrides {
            Name: "cs:InventoryName"
            String: "Chest"
          }
          Overrides {
            Name: "cs:StorageKey"
            NetReference {
              Type {
                Value: "mc:enetreferencetype:unknown"
              }
            }
          }
          Overrides {
            Name: "cs:TotalSlots"
            Int: 12
          }
          Overrides {
            Name: "cs:SlotCapacity"
            Int: 99
          }
          Overrides {
            Name: "cs:AllowNonEmptyContainers"
            Bool: false
          }
          Overrides {
            Name: "cs:UseStacks"
            Bool: true
          }
          Overrides {
            Name: "cs:CanEquip"
            Bool: false
          }
          Overrides {
            Name: "cs:CanDrop"
            Bool: true
          }
          Overrides {
            Name: "cs:DropForAllPlayers"
            Bool: true
          }
          Overrides {
            Name: "cs:DropTimeoutSeconds"
            Float: 60
          }
          Overrides {
            Name: "cs:ItemPickupTemplate"
            AssetReference {
              Id: 15375784612613316623
            }
          }
          Overrides {
            Name: "cs:ScreenTemplate"
            AssetReference {
              Id: 12495394132823353132
            }
          }
          Overrides {
            Name: "cs:VerboseLogs"
            Bool: false
          }
        }
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        EditorIndicatorVisibility {
          Value: "mc:eindicatorvisibility:visiblewhenselected"
        }
        Folder {
          IsGroup: true
        }
        NetworkRelevanceDistance {
          Value: "mc:eproxyrelevance:critical"
        }
      }
      Objects {
        Id: 14751228215979897718
        Name: "InventoryContainerSettings"
        Transform {
          Location {
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 4513950664792054274
        UnregisteredParameters {
          Overrides {
            Name: "cs:ComponentRoot"
            ObjectReference {
              SubObjectId: 4513950664792054274
            }
          }
        }
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        EditorIndicatorVisibility {
          Value: "mc:eindicatorvisibility:visiblewhenselected"
        }
        Script {
          ScriptAsset {
            Id: 13060681764769371628
          }
        }
        NetworkRelevanceDistance {
          Value: "mc:eproxyrelevance:critical"
        }
      }
      Objects {
        Id: 2958868104667398575
        Name: "ClientContext"
        Transform {
          Location {
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 4513950664792054274
        ChildIds: 6197717340373325534
        Collidable_v2 {
          Value: "mc:ecollisionsetting:forceoff"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        EditorIndicatorVisibility {
          Value: "mc:eindicatorvisibility:visiblewhenselected"
        }
        NetworkContext {
        }
        NetworkRelevanceDistance {
          Value: "mc:eproxyrelevance:critical"
        }
      }
      Objects {
        Id: 6197717340373325534
        Name: "ContainerInventorySettings"
        Transform {
          Location {
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 2958868104667398575
        UnregisteredParameters {
          Overrides {
            Name: "cs:ComponentRoot"
            ObjectReference {
              SubObjectId: 4513950664792054274
            }
          }
        }
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        EditorIndicatorVisibility {
          Value: "mc:eindicatorvisibility:visiblewhenselected"
        }
        Script {
          ScriptAsset {
            Id: 13060681764769371628
          }
        }
        NetworkRelevanceDistance {
          Value: "mc:eproxyrelevance:critical"
        }
      }
    }
    PrimaryAssetId {
      AssetType: "None"
      AssetId: "None"
    }
  }
  SerializationVersion: 108
  VirtualFolderPath: "Functional"
  VirtualFolderPath: "Inventory"
}
