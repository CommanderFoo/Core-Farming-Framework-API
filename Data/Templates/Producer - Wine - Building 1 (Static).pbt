Assets {
  Id: 2939174467945496794
  Name: "Producer - Wine - Building 1 (Static)"
  PlatformAssetType: 5
  TemplateAsset {
    ObjectBlock {
      RootId: 17753636327338609660
      Objects {
        Id: 17753636327338609660
        Name: "Producer - Wine - Building 1 (Static)"
        Transform {
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 4781671109827199097
        ChildIds: 1426745757573098175
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
        Id: 1426745757573098175
        Name: "ClientContext (FX)"
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
        ParentId: 17753636327338609660
        ChildIds: 56952999952992015
        ChildIds: 4193451348871207619
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
        Id: 56952999952992015
        Name: "Water Bubbling Loop 02 SFX"
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
        ParentId: 1426745757573098175
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
        AudioInstance {
          AudioAsset {
            Id: 5272804302248070924
          }
          AutoPlay: true
          Repeat: true
          Pitch: -2000
          Volume: 0.25
          Falloff: 1000
          Radius: 50
          EnableOcclusion: true
          IsSpatializationEnabled: true
          IsAttenuationEnabled: true
        }
        NetworkRelevanceDistance {
          Value: "mc:eproxyrelevance:critical"
        }
      }
      Objects {
        Id: 4193451348871207619
        Name: "Bubble Stream VFX"
        Transform {
          Location {
            X: 3.81347656
            Y: -72.6855469
            Z: 77.2047501
          }
          Rotation {
          }
          Scale {
            X: 0.339287102
            Y: 0.363398433
            Z: 1
          }
        }
        ParentId: 1426745757573098175
        UnregisteredParameters {
          Overrides {
            Name: "bp:Gravity"
            Float: 0.25
          }
          Overrides {
            Name: "bp:Color"
            Color {
              R: 0.451000035
              G: 0.0351779796
              B: 0.439983845
              A: 0.326
            }
          }
          Overrides {
            Name: "bp:Particle Scale Multiplier"
            Float: 2.53244233
          }
          Overrides {
            Name: "bp:Density"
            Float: 1.2883811
          }
          Overrides {
            Name: "bp:Life"
            Float: 1.5816474
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
            Id: 16704118384563868887
          }
          TeamSettings {
          }
          Vfx {
            AutoPlay: true
          }
        }
        Relevance {
          Value: "mc:eproxyrelevance:medium"
        }
        NetworkRelevanceDistance {
          Value: "mc:eproxyrelevance:critical"
        }
      }
    }
    Assets {
      Id: 5272804302248070924
      Name: "Water Bubbling Loop 02 SFX"
      PlatformAssetType: 7
      PrimaryAsset {
        AssetType: "AudioAssetRef"
        AssetId: "sfx_water_bubbling_02_Cue_ref"
      }
    }
    Assets {
      Id: 16704118384563868887
      Name: "Bubble Stream VFX"
      PlatformAssetType: 8
      PrimaryAsset {
        AssetType: "VfxBlueprintAssetRef"
        AssetId: "fxbp_bubble_stream"
      }
    }
    PrimaryAssetId {
      AssetType: "None"
      AssetId: "None"
    }
  }
  SerializationVersion: 108
  VirtualFolderPath: "Art and Collision - Farm"
  VirtualFolderPath: "Producers - Other"
}
