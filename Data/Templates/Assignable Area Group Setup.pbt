Assets {
  Id: 11606353305515324408
  Name: "Assignable Area Group Setup"
  PlatformAssetType: 5
  TemplateAsset {
    ObjectBlock {
      RootId: 260152552877710083
      Objects {
        Id: 260152552877710083
        Name: "Assignable Area Group Setup"
        Transform {
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 4781671109827199097
        ChildIds: 6602491539266429853
        ChildIds: 7336179374567869115
        UnregisteredParameters {
          Overrides {
            Name: "cs:AreasGroup"
            ObjectReference {
              SelfId: 3115750280136511078
            }
          }
          Overrides {
            Name: "cs:AreasGroupKey"
            String: "Back Yard"
          }
          Overrides {
            Name: "cs:MaxPlayersPerArea"
            Int: 0
          }
          Overrides {
            Name: "cs:AreasGroup:tooltip"
            String: "(Optional) This should be set to the group that contains all of the Assignable Areas. If left blank the parent of the component will be used."
          }
          Overrides {
            Name: "cs:AreasGroupKey:tooltip"
            String: "The unique key for this set of Assignable Areas. Portals and Teleport buttons can use this key to send a Player into this group of Areas."
          }
          Overrides {
            Name: "cs:MaxPlayersPerArea:tooltip"
            String: "If greater than 0, Players will be added to Areas until this number is hit, then further Players will be filtered into the next Area. If 0, any amount of Players can be in an Area."
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
        Id: 6602491539266429853
        Name: "AssignableAreaGroupSetup"
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
        ParentId: 260152552877710083
        UnregisteredParameters {
          Overrides {
            Name: "cs:ComponentRoot"
            ObjectReference {
              SubObjectId: 260152552877710083
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
            Id: 11113154408014451858
          }
        }
        IsAdvanced: true
        NetworkRelevanceDistance {
          Value: "mc:eproxyrelevance:critical"
        }
      }
      Objects {
        Id: 7336179374567869115
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
        ParentId: 260152552877710083
        ChildIds: 2922843377784251293
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
        Id: 2922843377784251293
        Name: "AssignableAreaGroupSetup"
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
        ParentId: 7336179374567869115
        UnregisteredParameters {
          Overrides {
            Name: "cs:ComponentRoot"
            ObjectReference {
              SubObjectId: 260152552877710083
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
            Id: 11113154408014451858
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
  VirtualFolderPath: "Areas"
}
