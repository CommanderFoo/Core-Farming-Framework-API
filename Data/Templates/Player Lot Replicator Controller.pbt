Assets {
  Id: 3503622816059665221
  Name: "Player Lot Replicator Loader"
  PlatformAssetType: 5
  TemplateAsset {
    ObjectBlock {
      RootId: 12836211798677651747
      Objects {
        Id: 12836211798677651747
        Name: "Player Lot Replicator Loader"
        Transform {
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 4781671109827199097
        ChildIds: 14708335709577867174
        ChildIds: 5429964725643108477
        UnregisteredParameters {
          Overrides {
            Name: "cs:RequireOwnerToLoad"
            Bool: false
          }
          Overrides {
            Name: "cs:Replicator"
            ObjectReference {
            }
          }
          Overrides {
            Name: "cs:SharedStorageKey"
            NetReference {
              Type {
                Value: "mc:enetreferencetype:unknown"
              }
            }
          }
          Overrides {
            Name: "cs:StorageKey"
            String: ""
          }
          Overrides {
            Name: "cs:Identifier"
            String: ""
          }
          Overrides {
            Name: "cs:Populate"
            Bool: false
          }
          Overrides {
            Name: "cs:Replicator:tooltip"
            String: "Loads and unloads the Replicator when the Player Lot loads and unloads. This should point to the object with the \"UserFunctions\" and \"Parent\" properties."
          }
          Overrides {
            Name: "cs:StorageKey:tooltip"
            String: "The key to use for storing the data in Player Storage for this Replicator. This should be unique across all Replicators."
          }
          Overrides {
            Name: "cs:Identifier:tooltip"
            String: "A tag that can be used to limit what can be placed in the Replicator or allow other scripts to pick out this specific Replicator."
          }
          Overrides {
            Name: "cs:Populate:tooltip"
            String: "If true, and the Replicator has objects already existing in its Static Context folder, these objects will be added to its internal state and saved."
          }
          Overrides {
            Name: "cs:SharedStorageKey:tooltip"
            String: "An optional Shared Storage Key to save and load the replicator data from."
          }
          Overrides {
            Name: "cs:RequireOwnerToLoad:tooltip"
            String: "If true, the Replicator will not load until the Player Lot has an owner."
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
        Id: 14708335709577867174
        Name: "PlayerLotReplicatorLoaderServer"
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
        ParentId: 12836211798677651747
        UnregisteredParameters {
          Overrides {
            Name: "cs:ComponentRoot"
            ObjectReference {
              SubObjectId: 12836211798677651747
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
            Id: 13139588374210945403
          }
        }
        IsAdvanced: true
        NetworkRelevanceDistance {
          Value: "mc:eproxyrelevance:critical"
        }
      }
      Objects {
        Id: 5429964725643108477
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
        ParentId: 12836211798677651747
        ChildIds: 14479820165260262618
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
        IsAdvanced: true
        NetworkRelevanceDistance {
          Value: "mc:eproxyrelevance:critical"
        }
      }
      Objects {
        Id: 14479820165260262618
        Name: "PlayerLotReplicatorLoaderClient"
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
        ParentId: 5429964725643108477
        UnregisteredParameters {
          Overrides {
            Name: "cs:ComponentRoot"
            ObjectReference {
              SubObjectId: 12836211798677651747
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
            Id: 10089811666579520288
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
  VirtualFolderPath: "Player Lots"
}
