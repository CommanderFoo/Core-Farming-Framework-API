Assets {
  Id: 555773590268406583
  Name: "Claim Player Lot Zone"
  PlatformAssetType: 5
  TemplateAsset {
    ObjectBlock {
      RootId: 9710576303027203830
      Objects {
        Id: 9710576303027203830
        Name: "Claim Player Lot Zone"
        Transform {
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 4781671109827199097
        ChildIds: 7021059556370565841
        UnregisteredParameters {
          Overrides {
            Name: "cs:PlayerLot"
            ObjectReference {
            }
          }
          Overrides {
            Name: "cs:InteractWithTrigger"
            Bool: true
          }
          Overrides {
            Name: "cs:InteractionText"
            String: "Claim {name}"
          }
          Overrides {
            Name: "cs:CannotClaimText"
            String: "Can\'t claim {name}"
          }
          Overrides {
            Name: "cs:PlayerLot:tooltip"
            String: "(Optional) If set, will claim a specific Lot. Otherwise this will find the Lot this object is inside."
          }
          Overrides {
            Name: "cs:InteractWithTrigger:tooltip"
            String: "If true, Players will need to interact with the Trigger to claim the Lot."
          }
          Overrides {
            Name: "cs:InteractionText:tooltip"
            String: "(Optional) If \"InteractWithTrigger\" is true, this text will be displayed. {name} will be replaced by the name of the Lot. {type} will be replaced by the Lots type."
          }
          Overrides {
            Name: "cs:CannotClaimText:tooltip"
            String: "(Optional) If set, this text will display if the Player cannot claim the Lot. {name} will be replaced by the name of the Lot. {type} will be replaced by the Lots type."
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
        Id: 7021059556370565841
        Name: "ClientContext"
        Transform {
          Location {
            Z: 250
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 9710576303027203830
        ChildIds: 4255168920518112809
        ChildIds: 4472062548941895017
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
        NetworkRelevanceDistance {
          Value: "mc:eproxyrelevance:critical"
        }
      }
      Objects {
        Id: 4255168920518112809
        Name: "ClaimPlayerLotZoneClient"
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
        ParentId: 7021059556370565841
        UnregisteredParameters {
          Overrides {
            Name: "cs:ComponentRoot"
            ObjectReference {
              SubObjectId: 9710576303027203830
            }
          }
          Overrides {
            Name: "cs:Trigger"
            ObjectReference {
              SubObjectId: 4472062548941895017
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
            Id: 1314352610730512646
          }
        }
        NetworkRelevanceDistance {
          Value: "mc:eproxyrelevance:critical"
        }
      }
      Objects {
        Id: 4472062548941895017
        Name: "Trigger"
        Transform {
          Location {
          }
          Rotation {
            Yaw: 89.9999771
          }
          Scale {
            X: 5
            Y: 5
            Z: 5
          }
        }
        ParentId: 7021059556370565841
        Collidable_v2 {
          Value: "mc:ecollisionsetting:forceon"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        EditorIndicatorVisibility {
          Value: "mc:eindicatorvisibility:alwaysvisible"
        }
        Trigger {
          TeamSettings {
            IsTeamCollisionEnabled: true
            IsEnemyCollisionEnabled: true
          }
          TriggerShape_v2 {
            Value: "mc:etriggershape:box"
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
