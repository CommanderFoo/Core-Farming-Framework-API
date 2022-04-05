Assets {
  Id: 13893596012113294795
  Name: "Producer - Bees - Building 1 (Static)"
  PlatformAssetType: 5
  TemplateAsset {
    ObjectBlock {
      RootId: 11730541331569897096
      Objects {
        Id: 11730541331569897096
        Name: "Producer - Bees - Building 1 (Static)"
        Transform {
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 4781671109827199097
        ChildIds: 5163034988576180879
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
        Id: 5163034988576180879
        Name: "ClientContext (Geo and FX)"
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
        ParentId: 11730541331569897096
        ChildIds: 1565352716949603887
        ChildIds: 230460060934680832
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
        Id: 1565352716949603887
        Name: "Ambience Nature Insects Buzzing Set 01 SFX"
        Transform {
          Location {
            Z: 53.8010826
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 5163034988576180879
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
            Id: 780912031722870112
          }
          TeamSettings {
          }
          AudioBP {
            AutoPlay: true
            Repeat: true
            Volume: 1
            Falloff: 1000
            Radius: 50
            EnableOcclusion: true
            IsSpatializationEnabled: true
            IsAttenuationEnabled: true
          }
        }
        NetworkRelevanceDistance {
          Value: "mc:eproxyrelevance:critical"
        }
      }
      Objects {
        Id: 230460060934680832
        Name: "Bee"
        Transform {
          Location {
            X: -0.249023438
            Y: -31.7753906
            Z: 114.130173
          }
          Rotation {
          }
          Scale {
            X: 2
            Y: 2
            Z: 2
          }
        }
        ParentId: 5163034988576180879
        ChildIds: 13122117773067505049
        ChildIds: 11093693422230085735
        ChildIds: 17425903470371093682
        ChildIds: 157248443778497834
        ChildIds: 17370722877175051772
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
        Folder {
          IsGroup: true
        }
        NetworkRelevanceDistance {
          Value: "mc:eproxyrelevance:critical"
        }
      }
      Objects {
        Id: 13122117773067505049
        Name: "Object Curve Rotator"
        Transform {
          Scale {
            X: 0.580889583
            Y: 0.580889583
            Z: 0.580889583
          }
        }
        ParentId: 230460060934680832
        TemplateInstance {
          ParameterOverrideMap {
            key: 14554427721244516228
            value {
              Overrides {
                Name: "Name"
                String: "Object Curve Rotator"
              }
              Overrides {
                Name: "cs:Object"
                ObjectReference {
                  SubObjectId: 17425903470371093682
                }
              }
              Overrides {
                Name: "cs:CurveY"
                SimpleCurve {
                  PreExtrapolation {
                    Value: "mc:erichcurveextrapolation:rcce_constant"
                  }
                  PostExtrapolation {
                    Value: "mc:erichcurveextrapolation:rcce_cycle"
                  }
                  DefaultValue: 3.40282347e+38
                }
              }
              Overrides {
                Name: "cs:CurveZ"
                SimpleCurve {
                  Keys {
                    Interpolation {
                      Value: "mc:erichcurveinterpmode:rcim_linear"
                    }
                    TangentMode {
                      Value: "mc:erichcurvetangentmode:rctm_user"
                    }
                  }
                  Keys {
                    Interpolation {
                      Value: "mc:erichcurveinterpmode:rcim_linear"
                    }
                    TangentMode {
                      Value: "mc:erichcurvetangentmode:rctm_user"
                    }
                    Time: 0.005
                    Value: 90
                    ArriveTangent: 0.0862094462
                    LeaveTangent: 0.0862094462
                  }
                  Keys {
                    Interpolation {
                      Value: "mc:erichcurveinterpmode:rcim_cubic"
                    }
                    TangentMode {
                      Value: "mc:erichcurvetangentmode:rctm_user"
                    }
                    Time: 0.01
                  }
                  PreExtrapolation {
                    Value: "mc:erichcurveextrapolation:rcce_constant"
                  }
                  PostExtrapolation {
                    Value: "mc:erichcurveextrapolation:rcce_cycle"
                  }
                  DefaultValue: 3.40282347e+38
                }
              }
              Overrides {
                Name: "cs:LocalSpace"
                Bool: true
              }
              Overrides {
                Name: "cs:Multiplier"
                Float: 1
              }
              Overrides {
                Name: "cs:Additive"
                Bool: true
              }
            }
          }
          TemplateAsset {
            Id: 15381202656130520404
          }
        }
      }
      Objects {
        Id: 11093693422230085735
        Name: "Object Curve Rotator"
        Transform {
          Location {
            X: 203.672363
            Y: 1963.92578
            Z: 114.130173
          }
          Rotation {
          }
          Scale {
            X: 10
            Y: 10
            Z: 10
          }
        }
        ParentId: 230460060934680832
        TemplateInstance {
          ParameterOverrideMap {
            key: 14554427721244516228
            value {
              Overrides {
                Name: "Name"
                String: "Object Curve Rotator"
              }
              Overrides {
                Name: "cs:Object"
                ObjectReference {
                  SubObjectId: 157248443778497834
                }
              }
              Overrides {
                Name: "cs:CurveY"
                SimpleCurve {
                  PreExtrapolation {
                    Value: "mc:erichcurveextrapolation:rcce_constant"
                  }
                  PostExtrapolation {
                    Value: "mc:erichcurveextrapolation:rcce_cycle"
                  }
                  DefaultValue: 3.40282347e+38
                }
              }
              Overrides {
                Name: "cs:CurveZ"
                SimpleCurve {
                  Keys {
                    Interpolation {
                      Value: "mc:erichcurveinterpmode:rcim_linear"
                    }
                    TangentMode {
                      Value: "mc:erichcurvetangentmode:rctm_user"
                    }
                  }
                  Keys {
                    Interpolation {
                      Value: "mc:erichcurveinterpmode:rcim_linear"
                    }
                    TangentMode {
                      Value: "mc:erichcurvetangentmode:rctm_user"
                    }
                    Time: 0.005
                    Value: -90
                    ArriveTangent: 0.0862094462
                    LeaveTangent: 0.0862094462
                  }
                  Keys {
                    Interpolation {
                      Value: "mc:erichcurveinterpmode:rcim_cubic"
                    }
                    TangentMode {
                      Value: "mc:erichcurvetangentmode:rctm_user"
                    }
                    Time: 0.01
                  }
                  PreExtrapolation {
                    Value: "mc:erichcurveextrapolation:rcce_constant"
                  }
                  PostExtrapolation {
                    Value: "mc:erichcurveextrapolation:rcce_cycle"
                  }
                  DefaultValue: 3.40282347e+38
                }
              }
              Overrides {
                Name: "cs:LocalSpace"
                Bool: true
              }
              Overrides {
                Name: "cs:Multiplier"
                Float: 1
              }
              Overrides {
                Name: "cs:Additive"
                Bool: true
              }
              Overrides {
                Name: "Position"
                Vector {
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
            }
          }
          TemplateAsset {
            Id: 15381202656130520404
          }
        }
      }
      Objects {
        Id: 17425903470371093682
        Name: "Wing Left"
        Transform {
          Location {
            X: -1.0187515
            Y: -1.12216794
            Z: 1.04880524
          }
          Rotation {
            Pitch: 40.6023445
            Yaw: -17.5007629
            Roll: -67.9036865
          }
          Scale {
            X: 0.00459906599
            Y: 0.00459906599
            Z: 0.00459906599
          }
        }
        ParentId: 230460060934680832
        ChildIds: 11356336555319129634
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 9311015945614487722
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
            Id: 15666269016453237841
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
      Objects {
        Id: 11356336555319129634
        Name: "Prism - 3-Sided Convex"
        Transform {
          Location {
            Y: 424.789062
          }
          Rotation {
            Pitch: -1.36603776e-05
            Yaw: 2.8757011e-05
            Roll: 7.05328148e-06
          }
          Scale {
            X: -5.83177662
            Y: 9.29114151
            Z: 0.554464221
          }
        }
        ParentId: 17425903470371093682
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 16794810456039376141
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:color"
            Color {
              R: 2
              G: 2
              B: 2
              A: 0.755000055
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
            Id: 4222222486111613100
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
      Objects {
        Id: 157248443778497834
        Name: "Wing Right"
        Transform {
          Location {
            X: 1.01088715
            Y: -1.12210083
            Z: 1.04881096
          }
          Rotation {
            Pitch: -40.6023254
            Yaw: 17.5008
            Roll: -67.9036865
          }
          Scale {
            X: -0.00459906599
            Y: 0.00459906599
            Z: 0.00459906599
          }
        }
        ParentId: 230460060934680832
        ChildIds: 261693492875407255
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 9311015945614487722
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
            Id: 15666269016453237841
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
      Objects {
        Id: 261693492875407255
        Name: "Prism - 3-Sided Convex"
        Transform {
          Location {
            Y: 424.789062
          }
          Rotation {
            Pitch: -1.36603776e-05
            Yaw: 2.8757011e-05
            Roll: 7.05328148e-06
          }
          Scale {
            X: -5.83177662
            Y: 9.29114151
            Z: 0.554464221
          }
        }
        ParentId: 157248443778497834
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 16794810456039376141
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:color"
            Color {
              R: 2
              G: 2
              B: 2
              A: 0.755000055
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
            Id: 4222222486111613100
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
      Objects {
        Id: 17370722877175051772
        Name: "Body"
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
        ParentId: 230460060934680832
        ChildIds: 11521652218615216697
        ChildIds: 17527606010713916085
        ChildIds: 11407096294349739095
        ChildIds: 4380976232274310723
        ChildIds: 16267904555481590390
        ChildIds: 5597731354093030637
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
        Id: 11521652218615216697
        Name: "Sphere"
        Transform {
          Location {
            Y: -0.59564209
            Z: 0.322898865
          }
          Rotation {
            Roll: 89.9999847
          }
          Scale {
            X: 0.0311404951
            Y: 0.0297331605
            Z: 0.0347948484
          }
        }
        ParentId: 17370722877175051772
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 9802724784644488365
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:smart"
            Bool: false
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:utile"
            Float: 0.241490319
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:vtile"
            Float: 0.153396264
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:color"
            Color {
              R: 0.488000035
              G: 0.488000035
              B: 0.488000035
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
            Id: 15666269016453237841
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
      Objects {
        Id: 17527606010713916085
        Name: "Frame End - Bulb"
        Transform {
          Location {
            X: -1.06542969
            Y: -1.49023438
            Z: -0.534713745
          }
          Rotation {
            Pitch: 9.83580685
            Yaw: -152.715073
            Roll: -18.3240108
          }
          Scale {
            X: 0.0863153711
            Y: 0.053073179
            Z: 0.0863153711
          }
        }
        ParentId: 17370722877175051772
        UnregisteredParameters {
          Overrides {
            Name: "ma:Font_Bulbs:id"
            AssetReference {
              Id: 14437066532589146669
            }
          }
          Overrides {
            Name: "ma:Font_Bulbs:color"
            Color {
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
            Id: 2887141685872171145
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
      Objects {
        Id: 11407096294349739095
        Name: "Frame End - Bulb"
        Transform {
          Location {
            X: 1.06542969
            Y: -1.49024963
            Z: -0.534714699
          }
          Rotation {
            Pitch: -9.83580685
            Yaw: 152.715057
            Roll: -18.3240032
          }
          Scale {
            X: -0.0863153711
            Y: 0.053073179
            Z: 0.0863153711
          }
        }
        ParentId: 17370722877175051772
        UnregisteredParameters {
          Overrides {
            Name: "ma:Font_Bulbs:id"
            AssetReference {
              Id: 14437066532589146669
            }
          }
          Overrides {
            Name: "ma:Font_Bulbs:color"
            Color {
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
            Id: 2887141685872171145
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
      Objects {
        Id: 4380976232274310723
        Name: "Sphere"
        Transform {
          Location {
            Y: -0.864526391
            Z: 0.322898865
          }
          Rotation {
            Roll: 89.9999619
          }
          Scale {
            X: 0.030368844
            Y: 0.0289963875
            Z: 0.0271397885
          }
        }
        ParentId: 17370722877175051772
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 9802724784644488365
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:smart"
            Bool: false
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:utile"
            Float: 0.241490319
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:vtile"
            Float: 0.153396264
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:color"
            Color {
              R: 10
              G: 8.74172
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
            Id: 15666269016453237841
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
      Objects {
        Id: 16267904555481590390
        Name: "Sphere"
        Transform {
          Location {
            Y: -0.268884271
            Z: 0.322898865
          }
          Rotation {
            Roll: 89.9999542
          }
          Scale {
            X: 0.030530069
            Y: 0.0291503258
            Z: 0.0245490503
          }
        }
        ParentId: 17370722877175051772
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 9802724784644488365
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:smart"
            Bool: false
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:utile"
            Float: 0.241490319
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:vtile"
            Float: 0.153396264
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:color"
            Color {
              R: 10
              G: 8.74172
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
            Id: 15666269016453237841
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
      Objects {
        Id: 5597731354093030637
        Name: "Sphere"
        Transform {
          Location {
            Y: 0.627404809
            Z: 0.322903454
          }
          Rotation {
            Roll: 89.9999619
          }
          Scale {
            X: 0.0163125098
            Y: 0.0155752972
            Z: 0.018226793
          }
        }
        ParentId: 17370722877175051772
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 14437066532589146669
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:smart"
            Bool: false
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:utile"
            Float: 0.241490319
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:vtile"
            Float: 0.153396264
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:color"
            Color {
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
            Id: 486941041913981343
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
      Id: 780912031722870112
      Name: "Ambience Nature Insects Buzzing Set 01 SFX"
      PlatformAssetType: 10
      PrimaryAsset {
        AssetType: "AudioBlueprintAssetRef"
        AssetId: "sfxabp_insectsbuzz_ref"
      }
    }
    Assets {
      Id: 15666269016453237841
      Name: "Sphere"
      PlatformAssetType: 1
      PrimaryAsset {
        AssetType: "StaticMeshAssetRef"
        AssetId: "sm_sphere_002"
      }
    }
    Assets {
      Id: 9311015945614487722
      Name: "Invisible"
      PlatformAssetType: 2
      PrimaryAsset {
        AssetType: "MaterialAssetRef"
        AssetId: "mi_invisible_001"
      }
    }
    Assets {
      Id: 4222222486111613100
      Name: "Prism - 3-Sided Convex"
      PlatformAssetType: 1
      PrimaryAsset {
        AssetType: "StaticMeshAssetRef"
        AssetId: "sm_prism_triangle_convex_001"
      }
    }
    Assets {
      Id: 16794810456039376141
      Name: "Frosted Glass No Distortion"
      PlatformAssetType: 2
      PrimaryAsset {
        AssetType: "MaterialAssetRef"
        AssetId: "fxma_frosted_glass_nodistortion"
      }
    }
    Assets {
      Id: 9802724784644488365
      Name: "Asphalt 01"
      PlatformAssetType: 2
      PrimaryAsset {
        AssetType: "MaterialAssetRef"
        AssetId: "mi_gen_asphault_001"
      }
    }
    Assets {
      Id: 2887141685872171145
      Name: "Frame End - Bulb"
      PlatformAssetType: 1
      PrimaryAsset {
        AssetType: "StaticMeshAssetRef"
        AssetId: "sm_1bulb_Ender"
      }
    }
    Assets {
      Id: 14437066532589146669
      Name: "Basic Material"
      PlatformAssetType: 2
      PrimaryAsset {
        AssetType: "MaterialAssetRef"
        AssetId: "mi_basic_pbr_material_001"
      }
    }
    Assets {
      Id: 486941041913981343
      Name: "Cone"
      PlatformAssetType: 1
      PrimaryAsset {
        AssetType: "StaticMeshAssetRef"
        AssetId: "sm_cone_001"
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
