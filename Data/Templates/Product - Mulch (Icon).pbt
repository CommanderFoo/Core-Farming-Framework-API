Assets {
  Id: 6530571695527899163
  Name: "Product - Mulch (Icon)"
  PlatformAssetType: 5
  TemplateAsset {
    ObjectBlock {
      RootId: 7617052110873209743
      Objects {
        Id: 7617052110873209743
        Name: "Good Mulch - Icon"
        Transform {
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 534151233226473360
        ChildIds: 16244387564101939859
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
        Id: 16244387564101939859
        Name: "Geo"
        Transform {
          Location {
            X: -7.60839653
            Y: 26.7758751
            Z: -35.0893555
          }
          Rotation {
            Pitch: -12.7381287
            Yaw: 4.78044462
            Roll: -20.7705688
          }
          Scale {
            X: 1.75499415
            Y: 1.75499415
            Z: 1.75499415
          }
        }
        ParentId: 7617052110873209743
        ChildIds: 4892936239167294116
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
        Id: 4892936239167294116
        Name: "Fantasy Sack Open"
        Transform {
          Location {
            X: 0.24999997
            Y: -0.18164064
            Z: -1.59417725
          }
          Rotation {
            Yaw: 137.54747
          }
          Scale {
            X: 0.331862539
            Y: 0.331862539
            Z: 0.331862539
          }
        }
        ParentId: 16244387564101939859
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:color"
            Color {
              R: 0.432582736
              G: 1
              B: 0.279999971
              A: 1
            }
          }
          Overrides {
            Name: "ma:Shared_Detail1:id"
            AssetReference {
              Id: 10298387345557924206
            }
          }
          Overrides {
            Name: "ma:Shared_Detail1:utile"
            Float: 0.397826046
          }
          Overrides {
            Name: "ma:Shared_Detail1:vtile"
            Float: 0.455846548
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
      Id: 10298387345557924206
      Name: "Wood Strand Board 01"
      PlatformAssetType: 2
      PrimaryAsset {
        AssetType: "MaterialAssetRef"
        AssetId: "mi_mil_wood_strand_001_uv_ref"
      }
    }
    PrimaryAssetId {
      AssetType: "None"
      AssetId: "None"
    }
  }
  SerializationVersion: 108
  VirtualFolderPath: "Art and Collision - Farm"
  VirtualFolderPath: "Items - Products & Gathers"
}
