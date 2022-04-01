Assets {
  Id: 11602964155984606114
  Name: "Player Lot Manager"
  PlatformAssetType: 5
  TemplateAsset {
    ObjectBlock {
      RootId: 17987152073618499851
      Objects {
        Id: 17987152073618499851
        Name: "Player Lot Manager"
        Transform {
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 4781671109827199097
        ChildIds: 7692718201913103587
        ChildIds: 16739421423122131287
        UnregisteredParameters {
          Overrides {
            Name: "cs:LotType"
            String: ""
          }
          Overrides {
            Name: "cs:MaxOwnedPerPlayer"
            Int: 1
          }
          Overrides {
            Name: "cs:AssignWhenPlayerJoins"
            Bool: true
          }
          Overrides {
            Name: "cs:ResetLotsWhenPlayerLeaves"
            Bool: false
          }
          Overrides {
            Name: "cs:TeleportPlayerOnJoin"
            Bool: true
          }
          Overrides {
            Name: "cs:SpawnPointKey"
            String: ""
          }
          Overrides {
            Name: "cs:LotType:tooltip"
            String: "This Lot Type should match the Lot Type set on one or more Player Lot Setup templates. Any settings on this object will apply to all Lots of this type."
          }
          Overrides {
            Name: "cs:MaxOwnedPerPlayer:tooltip"
            String: "The maximum amount of Lots of this Lot Type that each Player can own at a time. "
          }
          Overrides {
            Name: "cs:AssignWhenPlayerJoins:tooltip"
            String: "If true, the Player will be assigned to a Lot of this Lot Type when they join the game."
          }
          Overrides {
            Name: "cs:ResetLotsWhenPlayerLeaves:tooltip"
            String: "If true, all Lots of this Lot Type will be reset when the owner of those Lots leaves the game."
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
        Id: 7692718201913103587
        Name: "PlayerLotManagerServer"
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
        ParentId: 17987152073618499851
        UnregisteredParameters {
          Overrides {
            Name: "cs:ComponentRoot"
            ObjectReference {
              SubObjectId: 17987152073618499851
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
            Id: 15493535707995306099
          }
        }
        IsAdvanced: true
        NetworkRelevanceDistance {
          Value: "mc:eproxyrelevance:critical"
        }
      }
      Objects {
        Id: 16739421423122131287
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
        ParentId: 17987152073618499851
        ChildIds: 16501494948443135758
        Collidable_v2 {
          Value: "mc:ecollisionsetting:forceoff"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:forceoff"
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
        Id: 16501494948443135758
        Name: "PlayerLotManagerClient"
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
        ParentId: 16739421423122131287
        UnregisteredParameters {
          Overrides {
            Name: "cs:ComponentRoot"
            ObjectReference {
              SubObjectId: 17987152073618499851
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
            Id: 2578056439366678836
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
  SerializationVersion: 110
  VirtualFolderPath: "Functional"
  VirtualFolderPath: "Player Lots"
}
