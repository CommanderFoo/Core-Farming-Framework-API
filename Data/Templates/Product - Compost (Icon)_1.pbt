Assets {
  Id: 9538426940520836254
  Name: "Product - Compost (Icon)"
  PlatformAssetType: 5
  TemplateAsset {
    ObjectBlock {
      RootId: 7263256462744742948
      Objects {
        Id: 7263256462744742948
        Name: "Good Compost - Icon"
        Transform {
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 534151233226473360
        ChildIds: 1561780859224429886
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
        Id: 1561780859224429886
        Name: "Geo"
        Transform {
          Location {
            X: -8.86523247
            Y: 28.5922813
            Z: -32.0714722
          }
          Rotation {
            Pitch: 4.69429302
            Yaw: 52.921
            Roll: -22.0553284
          }
          Scale {
            X: 2.08640099
            Y: 2.08640099
            Z: 2.08640099
          }
        }
        ParentId: 7263256462744742948
        ChildIds: 6397634759381075978
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
        Id: 6397634759381075978
        Name: "Fantasy Sack Open"
        Transform {
          Location {
            X: -0.40624994
            Y: 0.892578
            Z: -1.59417725
          }
          Rotation {
            Yaw: 67.434639
          }
          Scale {
            X: 0.331862539
            Y: 0.331862539
            Z: 0.268105835
          }
        }
        ParentId: 1561780859224429886
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:color"
            Color {
              R: 1
              G: 0.482119203
              B: 0.32
              A: 1
            }
          }
          Overrides {
            Name: "ma:Shared_Detail1:id"
            AssetReference {
              Id: 7912174592554016267
            }
          }
          Overrides {
            Name: "ma:Shared_Detail1:utile"
            Float: 2.6757772
          }
          Overrides {
            Name: "ma:Shared_Detail1:vtile"
            Float: 3.06602454
          }
          Overrides {
            Name: "ma:Shared_Detail1:color"
            Color {
              R: 0.415000021
              G: 0.415000021
              B: 0.415000021
              A: 1
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
        CoreMesh {
          MeshAsset {
            Id: 12060951418041249189
          }
          Teams {
            IsTeamCollisionEnabled: true
            IsEnemyCollisionEnabled: true
          }
          StaticMesh {
            Physics {
              Mass: 100
              LinearDamping: 0.01
            }
            BoundsScale: 1
          }
        }
        Relevance {
          Value: "mc:eproxyrelevance:critical"
        }
        NetworkRelevanceDistance {
          Value: "mc:eproxyrelevance:critical"
        }
      }
    }
    Assets {
      Id: 12060951418041249189
      Name: "Fantasy Sack Open"
      PlatformAssetType: 1
      PrimaryAsset {
        AssetType: "StaticMeshAssetRef"
        AssetId: "sm_prop_fantasy_sack_001_ref"
      }
    }
    Assets {
      Id: 7912174592554016267
      Name: "Dirt 01"
      PlatformAssetType: 2
      PrimaryAsset {
        AssetType: "MaterialAssetRef"
        AssetId: "dirt_001"
      }
    }
    PrimaryAssetId {
      AssetType: "None"
      AssetId: "None"
    }
  }
  SerializationVersion: 110
  VirtualFolderPath: "Art and Collision - Farm"
  VirtualFolderPath: "Items - Products & Gathers"
}
