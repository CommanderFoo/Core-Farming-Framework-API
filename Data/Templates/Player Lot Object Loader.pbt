Assets {
  Id: 2202103686519227027
  Name: "Player Lot Object Loader"
  PlatformAssetType: 5
  TemplateAsset {
    ObjectBlock {
      RootId: 5269134746227665817
      Objects {
        Id: 5269134746227665817
        Name: "Player Lot Object Loader"
        Transform {
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 4781671109827199097
        ChildIds: 9218926896191482653
        ChildIds: 13109980719727917843
        ChildIds: 4822768937091669576
        ChildIds: 14354510690208984388
        ChildIds: 5838104514988344253
        ChildIds: 16524940300580709148
        UnregisteredParameters {
          Overrides {
            Name: "cs:RequiresOwnerToLoad"
            Bool: false
          }
          Overrides {
            Name: "cs:RequiresNoOwnerToLoad"
            Bool: false
          }
          Overrides {
            Name: "cs:VisibleToOwnerOnly"
            Bool: false
          }
          Overrides {
            Name: "cs:ClientAsset"
            AssetReference {
              Id: 841534158063459245
            }
          }
          Overrides {
            Name: "cs:ServerAsset"
            AssetReference {
              Id: 841534158063459245
            }
          }
          Overrides {
            Name: "cs:StaticAsset"
            AssetReference {
              Id: 841534158063459245
            }
          }
          Overrides {
            Name: "cs:LocalAsset"
            AssetReference {
              Id: 841534158063459245
            }
          }
          Overrides {
            Name: "cs:RequiresOwnerToLoad:tooltip"
            String: "If true, will only load the objects if the Player Lot has an owner. Objects will be unloaded if the owner is cleared."
          }
          Overrides {
            Name: "cs:RequiresNoOwnerToLoad:tooltip"
            String: "If true, will only load the objects if the Player Lot does not have an owner. Objects will be unloaded if the owner is set."
          }
          Overrides {
            Name: "cs:ServerAsset:tooltip"
            String: "(Optional) A template to spawn into a Server Context when the Player Lot Loads. This template will be destroyed when the Player Lot unloads."
          }
          Overrides {
            Name: "cs:StaticAsset:tooltip"
            String: "(Optional) A template to spawn into a Static Context when the Player Lot Loads. This template will be destroyed when the Player Lot unloads."
          }
          Overrides {
            Name: "cs:ClientAsset:tooltip"
            String: "(Optional) A template to spawn into a Client Context when the Player Lot Loads. This template will be destroyed when the Player Lot unloads."
          }
          Overrides {
            Name: "cs:VisibleToOwnerOnly:tooltip"
            String: "If true, the loaded client and static assets will only load for the owner of the lot."
          }
          Overrides {
            Name: "cs:LocalAsset:tooltip"
            String: "(Optional) A template to spawn into a Local Context when the Player Lot Loads. This template will be destroyed when the Player Lot unloads."
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
        Id: 9218926896191482653
        Name: "HELP - Object Loaders - README"
        Transform {
          Location {
            X: 682.980469
            Y: -601.869141
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 5269134746227665817
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
            Id: 15411555378872977602
          }
        }
        NetworkRelevanceDistance {
          Value: "mc:eproxyrelevance:critical"
        }
      }
      Objects {
        Id: 13109980719727917843
        Name: "ServerContext"
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
        ParentId: 5269134746227665817
        ChildIds: 12853915253072195560
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
        NetworkContext {
          Type: Server
        }
        NetworkRelevanceDistance {
          Value: "mc:eproxyrelevance:critical"
        }
      }
      Objects {
        Id: 12853915253072195560
        Name: "PlayerLotObjectLoader"
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
        ParentId: 13109980719727917843
        UnregisteredParameters {
          Overrides {
            Name: "cs:ComponentRoot"
            ObjectReference {
              SubObjectId: 5269134746227665817
            }
          }
          Overrides {
            Name: "cs:StaticRoot"
            ObjectReference {
              SubObjectId: 14354510690208984388
            }
          }
          Overrides {
            Name: "cs:LocalRoot"
            ObjectReference {
              SubObjectId: 5838104514988344253
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
            Id: 1762613676229157158
          }
        }
        IsAdvanced: true
        NetworkRelevanceDistance {
          Value: "mc:eproxyrelevance:critical"
        }
      }
      Objects {
        Id: 4822768937091669576
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
        ParentId: 5269134746227665817
        ChildIds: 7559301325536080009
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
        Id: 7559301325536080009
        Name: "PlayerLotObjectLoader"
        Transform {
          Location {
          }
          Rotation {
            Yaw: 6.83018243e-06
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 4822768937091669576
        UnregisteredParameters {
          Overrides {
            Name: "cs:ComponentRoot"
            ObjectReference {
              SubObjectId: 5269134746227665817
            }
          }
          Overrides {
            Name: "cs:StaticRoot"
            ObjectReference {
              SubObjectId: 14354510690208984388
            }
          }
          Overrides {
            Name: "cs:LocalRoot"
            ObjectReference {
              SubObjectId: 5838104514988344253
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
            Id: 1762613676229157158
          }
        }
        IsAdvanced: true
        NetworkRelevanceDistance {
          Value: "mc:eproxyrelevance:critical"
        }
      }
      Objects {
        Id: 14354510690208984388
        Name: "StaticContext"
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
        ParentId: 5269134746227665817
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
        NetworkContext {
          Type: RuntimeStatic
        }
        NetworkRelevanceDistance {
          Value: "mc:eproxyrelevance:critical"
        }
      }
      Objects {
        Id: 5838104514988344253
        Name: "LocalContext"
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
        ParentId: 5269134746227665817
        NetworkContext {
          Type: Local
        }
      }
      Objects {
        Id: 16524940300580709148
        Name: "Custom Properties on this template control what loads."
        Transform {
          Location {
            Z: 51.2923889
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 5269134746227665817
        UnregisteredParameters {
          Overrides {
            Name: "bp:Color"
            Color {
              R: 0.259
              G: 0.242945448
              B: 0.0725199953
              A: 1
            }
          }
          Overrides {
            Name: "bp:Type"
            Enum {
              Value: "mc:evolumetype:0"
            }
          }
          Overrides {
            Name: "bp:Absolute Scale"
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
        Blueprint {
          BlueprintAsset {
            Id: 6442861049751997091
          }
          TeamSettings {
          }
        }
      }
    }
    Assets {
      Id: 6442861049751997091
      Name: "Dummy Object"
      PlatformAssetType: 6
      PrimaryAsset {
        AssetType: "BlueprintAssetRef"
        AssetId: "fxbp_dummy_pivot"
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
