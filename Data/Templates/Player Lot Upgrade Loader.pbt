Assets {
  Id: 9441528603996975911
  Name: "Player Lot Upgrade Loader"
  PlatformAssetType: 5
  TemplateAsset {
    ObjectBlock {
      RootId: 8995608314112120718
      Objects {
        Id: 8995608314112120718
        Name: "Player Lot Upgrade Loader"
        Transform {
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 4781671109827199097
        ChildIds: 12057223686247017749
        ChildIds: 10660641419386608289
        ChildIds: 16902259041727924328
        ChildIds: 16700948332636095262
        UnregisteredParameters {
          Overrides {
            Name: "cs:RequiresOwnerToLoad"
            Bool: false
          }
          Overrides {
            Name: "cs:UpgradeCollectionId"
            String: ""
          }
          Overrides {
            Name: "cs:DefaultUpgradeId"
            String: ""
          }
          Overrides {
            Name: "cs:UpgradeId"
            String: ""
          }
          Overrides {
            Name: "cs:TemplateSetId"
            String: ""
          }
          Overrides {
            Name: "cs:DefaultUpgradeId:tooltip"
            String: "(Optional) If set, this upgrade will be loaded if the Player Lot does not have an owner."
          }
          Overrides {
            Name: "cs:UpgradeCollectionId:tooltip"
            String: "The Upgrade Collection to load Upgrade related assets for."
          }
          Overrides {
            Name: "cs:UpgradeId:tooltip"
            String: "(Optional) If set, will only check for this specific Upgrade. Useful for non linear Upgrade Collections."
          }
          Overrides {
            Name: "cs:TemplateSetId:tooltip"
            String: "(Optional) If set, this template set will be used to spawn the assets from if it exists. Otherwise the first template set found will be used."
          }
          Overrides {
            Name: "cs:RequiresOwnerToLoad:tooltip"
            String: "If true, this will not load anything unless the owner of the Lot is online."
          }
          Overrides {
            Name: "cs:RequiresOwnerToLoad:isrep"
            Bool: false
          }
          Overrides {
            Name: "cs:RequiresOwnerToLoad:ml"
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
        Id: 12057223686247017749
        Name: "ServerContext"
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
        ParentId: 8995608314112120718
        ChildIds: 2570555267692978424
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
        Id: 2570555267692978424
        Name: "PlayerLotUpgradeLoader"
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
        ParentId: 12057223686247017749
        UnregisteredParameters {
          Overrides {
            Name: "cs:ComponentRoot"
            ObjectReference {
              SubObjectId: 8995608314112120718
            }
          }
          Overrides {
            Name: "cs:StaticRoot"
            ObjectReference {
              SubObjectId: 16902259041727924328
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
            Id: 8344340025319625880
          }
        }
        IsAdvanced: true
        NetworkRelevanceDistance {
          Value: "mc:eproxyrelevance:critical"
        }
      }
      Objects {
        Id: 10660641419386608289
        Name: "ClientContext"
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
        ParentId: 8995608314112120718
        ChildIds: 4426848263605628255
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
        Id: 4426848263605628255
        Name: "PlayerLotUpgradeLoader"
        Transform {
          Location {
            X: -0.00195312442
            Y: -0.000976561336
          }
          Rotation {
            Yaw: 3.25688695e-12
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 10660641419386608289
        UnregisteredParameters {
          Overrides {
            Name: "cs:ComponentRoot"
            ObjectReference {
              SubObjectId: 8995608314112120718
            }
          }
          Overrides {
            Name: "cs:StaticRoot"
            ObjectReference {
              SubObjectId: 16902259041727924328
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
            Id: 8344340025319625880
          }
        }
        IsAdvanced: true
        NetworkRelevanceDistance {
          Value: "mc:eproxyrelevance:critical"
        }
      }
      Objects {
        Id: 16902259041727924328
        Name: "StaticContext"
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
        ParentId: 8995608314112120718
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
        Id: 16700948332636095262
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
        ParentId: 8995608314112120718
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
