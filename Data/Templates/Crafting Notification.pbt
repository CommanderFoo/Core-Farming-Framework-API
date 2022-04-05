Assets {
  Id: 2591777276282310399
  Name: "Crafting Notification"
  PlatformAssetType: 5
  TemplateAsset {
    ObjectBlock {
      RootId: 155588822315688437
      Objects {
        Id: 155588822315688437
        Name: "Crafting Notification"
        Transform {
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 8587137221342303492
        ChildIds: 10103861071725185396
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
        Id: 10103861071725185396
        Name: "ClientContext (Bouncing Object)"
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
        ParentId: 155588822315688437
        ChildIds: 14954110318953177477
        ChildIds: 7057152692045240450
        ChildIds: 8956539292938555463
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
        Id: 14954110318953177477
        Name: "ToggleVisibilityOnCraftingChangeClient"
        Transform {
          Location {
            X: 6.02600098
            Y: 14.1964798
            Z: -148.369537
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 10103861071725185396
        UnregisteredParameters {
          Overrides {
            Name: "cs:ObjectToToggle"
            ObjectReference {
              SubObjectId: 7057152692045240450
            }
          }
          Overrides {
            Name: "cs:ChangeOnReady"
            Bool: true
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
            Id: 16798340808877456830
          }
        }
        NetworkRelevanceDistance {
          Value: "mc:eproxyrelevance:critical"
        }
      }
      Objects {
        Id: 7057152692045240450
        Name: "Geo"
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
        ParentId: 10103861071725185396
        ChildIds: 7815462418130570667
        ChildIds: 5509691080469719634
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:forceoff"
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
        Id: 7815462418130570667
        Name: "Text 03: !"
        Transform {
          Location {
            Z: 11.1722107
          }
          Rotation {
          }
          Scale {
            X: 0.773311734
            Y: 0.70446
            Z: 0.773311734
          }
        }
        ParentId: 7057152692045240450
        UnregisteredParameters {
          Overrides {
            Name: "ma:Font.Bevel:id"
            AssetReference {
              Id: 5400954658140844837
            }
          }
          Overrides {
            Name: "ma:Font.Bevel:color"
            Color {
              R: 0.0095363874
              G: 0.179999948
              A: 1
            }
          }
          Overrides {
            Name: "ma:Font.Faces:id"
            AssetReference {
              Id: 5400954658140844837
            }
          }
          Overrides {
            Name: "ma:Font.Faces:color"
            Color {
              R: 0.0095363874
              G: 0.179999948
              A: 1
            }
          }
          Overrides {
            Name: "ma:Font.Sides:id"
            AssetReference {
              Id: 5400954658140844837
            }
          }
          Overrides {
            Name: "ma:Font.Sides:color"
            Color {
              R: 0.0095363874
              G: 0.179999948
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
            Id: 12293602639002323154
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
      Objects {
        Id: 5509691080469719634
        Name: "Callout Sparkle"
        Transform {
          Location {
            X: 9.98815918
            Y: 7.1566391
            Z: -37.2920532
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 0.846824527
            Z: 0.217745692
          }
        }
        ParentId: 7057152692045240450
        UnregisteredParameters {
          Overrides {
            Name: "bp:Color"
            Color {
              R: 0.149999976
              G: 1
              B: 0.256953597
              A: 1
            }
          }
          Overrides {
            Name: "bp:Particle Scale Multiplier"
            Float: 5.13744354
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
            Id: 5919779865382713743
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
      Objects {
        Id: 8956539292938555463
        Name: "Object Curve Mover"
        Transform {
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 10103861071725185396
        TemplateInstance {
          ParameterOverrideMap {
            key: 1072177198051453324
            value {
              Overrides {
                Name: "Name"
                String: "Object Curve Mover"
              }
              Overrides {
                Name: "Position"
                Vector {
                  X: -1724.27075
                  Y: -44.8734207
                  Z: -153.427811
                }
              }
              Overrides {
                Name: "Rotation"
                Rotator {
                }
              }
              Overrides {
                Name: "Scale"
                Vector {
                  X: 1
                  Y: 1
                  Z: 1
                }
              }
              Overrides {
                Name: "cs:Object"
                ObjectReference {
                  SubObjectId: 7815462418130570667
                }
              }
              Overrides {
                Name: "cs:CurveZ"
                SimpleCurve {
                  Keys {
                    Interpolation {
                      Value: "mc:erichcurveinterpmode:rcim_cubic"
                    }
                    TangentMode {
                      Value: "mc:erichcurvetangentmode:rctm_user"
                    }
                  }
                  Keys {
                    Interpolation {
                      Value: "mc:erichcurveinterpmode:rcim_cubic"
                    }
                    TangentMode {
                      Value: "mc:erichcurvetangentmode:rctm_user"
                    }
                    Time: 1
                    Value: 1.78517675
                    ArriveTangent: -0.117957413
                    LeaveTangent: -0.117957413
                  }
                  Keys {
                    Interpolation {
                      Value: "mc:erichcurveinterpmode:rcim_cubic"
                    }
                    TangentMode {
                      Value: "mc:erichcurvetangentmode:rctm_user"
                    }
                    Time: 2
                  }
                  PreExtrapolation {
                    Value: "mc:erichcurveextrapolation:rcce_oscillate"
                  }
                  PostExtrapolation {
                    Value: "mc:erichcurveextrapolation:rcce_oscillate"
                  }
                  DefaultValue: 3.40282347e+38
                }
              }
              Overrides {
                Name: "cs:Multiplier"
                Float: 20
              }
            }
          }
          TemplateAsset {
            Id: 16720922849352253600
          }
        }
      }
    }
    Assets {
      Id: 12293602639002323154
      Name: "Text 03: !"
      PlatformAssetType: 1
      PrimaryAsset {
        AssetType: "StaticMeshAssetRef"
        AssetId: "F5_Text_037"
      }
    }
    Assets {
      Id: 5400954658140844837
      Name: "Emissive Glow Transparent"
      PlatformAssetType: 2
      PrimaryAsset {
        AssetType: "MaterialAssetRef"
        AssetId: "mi_basic_emissive_001"
      }
    }
    Assets {
      Id: 5919779865382713743
      Name: "Callout Sparkle"
      PlatformAssetType: 8
      PrimaryAsset {
        AssetType: "VfxBlueprintAssetRef"
        AssetId: "fxbp_sparkles_volume_vfx"
      }
    }
    PrimaryAssetId {
      AssetType: "None"
      AssetId: "None"
    }
  }
  SerializationVersion: 110
}
