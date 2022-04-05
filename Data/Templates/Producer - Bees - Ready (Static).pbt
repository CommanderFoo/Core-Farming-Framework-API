Assets {
  Id: 5856717198889357782
  Name: "Producer - Bees - Ready (Static)"
  PlatformAssetType: 5
  TemplateAsset {
    ObjectBlock {
      RootId: 4430038808750861963
      Objects {
        Id: 4430038808750861963
        Name: "Producer - Bees - Ready (Static)"
        Transform {
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 4781671109827199097
        ChildIds: 3539016031215930928
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
        Id: 3539016031215930928
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
        ParentId: 4430038808750861963
        ChildIds: 14793236828834903324
        ChildIds: 14689631231684417788
        ChildIds: 8745026516966507876
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
        Id: 14793236828834903324
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
        ParentId: 3539016031215930928
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
        Id: 14689631231684417788
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
        ParentId: 3539016031215930928
        ChildIds: 13426427183540891206
        ChildIds: 13374676517330065958
        ChildIds: 13299244297508900074
        ChildIds: 388991519159333325
        ChildIds: 13600221445394557996
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
        Id: 13426427183540891206
        Name: "Object Curve Rotator"
        Transform {
          Scale {
            X: 0.580889583
            Y: 0.580889583
            Z: 0.580889583
          }
        }
        ParentId: 14689631231684417788
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
                  SubObjectId: 13299244297508900074
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
        Id: 13374676517330065958
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
        ParentId: 14689631231684417788
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
                  SubObjectId: 388991519159333325
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
        Id: 13299244297508900074
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
        ParentId: 14689631231684417788
        ChildIds: 2553822225053949749
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
        Relevance {
          Value: "mc:eproxyrelevance:critical"
        }
        NetworkRelevanceDistance {
          Value: "mc:eproxyrelevance:critical"
        }
      }
      Objects {
        Id: 2553822225053949749
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
        ParentId: 13299244297508900074
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
        Relevance {
          Value: "mc:eproxyrelevance:critical"
        }
        NetworkRelevanceDistance {
          Value: "mc:eproxyrelevance:critical"
        }
      }
      Objects {
        Id: 388991519159333325
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
        ParentId: 14689631231684417788
        ChildIds: 12226114364546129418
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
        Relevance {
          Value: "mc:eproxyrelevance:critical"
        }
        NetworkRelevanceDistance {
          Value: "mc:eproxyrelevance:critical"
        }
      }
      Objects {
        Id: 12226114364546129418
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
        ParentId: 388991519159333325
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
        Relevance {
          Value: "mc:eproxyrelevance:critical"
        }
        NetworkRelevanceDistance {
          Value: "mc:eproxyrelevance:critical"
        }
      }
      Objects {
        Id: 13600221445394557996
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
        ParentId: 14689631231684417788
        ChildIds: 8851013445300162698
        ChildIds: 10669135557842166541
        ChildIds: 2839094793856002083
        ChildIds: 7702933098682124348
        ChildIds: 10897590684124738448
        ChildIds: 4878730521487713204
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
        Id: 8851013445300162698
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
        ParentId: 13600221445394557996
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
        Relevance {
          Value: "mc:eproxyrelevance:critical"
        }
        NetworkRelevanceDistance {
          Value: "mc:eproxyrelevance:critical"
        }
      }
      Objects {
        Id: 10669135557842166541
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
        ParentId: 13600221445394557996
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
        Relevance {
          Value: "mc:eproxyrelevance:critical"
        }
        NetworkRelevanceDistance {
          Value: "mc:eproxyrelevance:critical"
        }
      }
      Objects {
        Id: 2839094793856002083
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
        ParentId: 13600221445394557996
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
        Relevance {
          Value: "mc:eproxyrelevance:critical"
        }
        NetworkRelevanceDistance {
          Value: "mc:eproxyrelevance:critical"
        }
      }
      Objects {
        Id: 7702933098682124348
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
        ParentId: 13600221445394557996
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
        Relevance {
          Value: "mc:eproxyrelevance:critical"
        }
        NetworkRelevanceDistance {
          Value: "mc:eproxyrelevance:critical"
        }
      }
      Objects {
        Id: 10897590684124738448
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
        ParentId: 13600221445394557996
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
        Relevance {
          Value: "mc:eproxyrelevance:critical"
        }
        NetworkRelevanceDistance {
          Value: "mc:eproxyrelevance:critical"
        }
      }
      Objects {
        Id: 4878730521487713204
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
        ParentId: 13600221445394557996
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
        Relevance {
          Value: "mc:eproxyrelevance:critical"
        }
        NetworkRelevanceDistance {
          Value: "mc:eproxyrelevance:critical"
        }
      }
      Objects {
        Id: 8745026516966507876
        Name: "Honey"
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
        ParentId: 3539016031215930928
        ChildIds: 2572430350013967663
        ChildIds: 17788498774690588502
        ChildIds: 14494521702170553506
        ChildIds: 15334824252539338848
        ChildIds: 8099184789349645807
        ChildIds: 14302673779954209987
        ChildIds: 17173584414647044288
        ChildIds: 17846668206744925700
        ChildIds: 13959754073960918827
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
        Id: 2572430350013967663
        Name: "Hill 04"
        Transform {
          Location {
            X: -0.0911560059
            Y: -30.5209961
            Z: 61.2823296
          }
          Rotation {
            Pitch: -90
            Yaw: 14.0362635
            Roll: -104.03627
          }
          Scale {
            X: 0.107487939
            Y: 0.0890813693
            Z: 0.0479019023
          }
        }
        ParentId: 8745026516966507876
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 14437066532589146669
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:color"
            Color {
              R: 1
              G: 0.59602654
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
            Id: 8039760726822185815
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
        Id: 17788498774690588502
        Name: "Hill 04"
        Transform {
          Location {
            X: -0.0911560059
            Y: -28.7563477
            Z: 37.9598846
          }
          Rotation {
            Pitch: 90
            Yaw: 14.0362635
            Roll: -75.9637451
          }
          Scale {
            X: 0.0920733884
            Y: 0.0763064548
            Z: 0.0410324261
          }
        }
        ParentId: 8745026516966507876
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 14437066532589146669
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:color"
            Color {
              R: 1
              G: 0.59602654
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
            Id: 8039760726822185815
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
        Id: 14494521702170553506
        Name: "Hill 04"
        Transform {
          Location {
            X: 20.9147949
            Y: 0.475585938
            Z: 37.2959137
          }
          Rotation {
            Pitch: 90
            Roll: -179.999985
          }
          Scale {
            X: 0.092073366
            Y: 0.111347944
            Z: 0.0158966165
          }
        }
        ParentId: 8745026516966507876
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 14437066532589146669
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:color"
            Color {
              R: 1
              G: 0.59602654
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
            Id: 8039760726822185815
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
        Id: 15334824252539338848
        Name: "Hill 04"
        Transform {
          Location {
            X: 22.161438
            Y: -0.350585938
            Z: 61.2823296
          }
          Rotation {
            Pitch: -90
          }
          Scale {
            X: 0.107487939
            Y: 0.117228322
            Z: 0.0220452733
          }
        }
        ParentId: 8745026516966507876
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 14437066532589146669
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:color"
            Color {
              R: 1
              G: 0.59602654
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
            Id: 8039760726822185815
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
        Id: 8099184789349645807
        Name: "Hill 04"
        Transform {
          Location {
            X: -21.7985535
            Y: -0.0715332
            Z: 37.2959137
          }
          Rotation {
            Pitch: 90
          }
          Scale {
            X: 0.092073366
            Y: 0.111347944
            Z: 0.0158966165
          }
        }
        ParentId: 8745026516966507876
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 14437066532589146669
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:color"
            Color {
              R: 1
              G: 0.59602654
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
            Id: 8039760726822185815
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
        Id: 14302673779954209987
        Name: "Hill 04"
        Transform {
          Location {
            X: -23.0453186
            Y: 0.754394531
            Z: 61.2823296
          }
          Rotation {
            Pitch: -90
            Roll: -179.999985
          }
          Scale {
            X: 0.107487939
            Y: 0.117228322
            Z: 0.0220452733
          }
        }
        ParentId: 8745026516966507876
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 14437066532589146669
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:color"
            Color {
              R: 1
              G: 0.59602654
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
            Id: 8039760726822185815
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
        Id: 17173584414647044288
        Name: "Hill 04"
        Transform {
          Location {
            X: -0.792724609
            Y: 30.9250488
            Z: 61.2823296
          }
          Rotation {
            Pitch: -90
            Roll: 90.0000076
          }
          Scale {
            X: 0.107487939
            Y: 0.0890813693
            Z: 0.0479019023
          }
        }
        ParentId: 8745026516966507876
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 14437066532589146669
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:color"
            Color {
              R: 1
              G: 0.59602654
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
            Id: 8039760726822185815
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
        Id: 17846668206744925700
        Name: "Hill 04"
        Transform {
          Location {
            X: -0.792724609
            Y: 29.1606445
            Z: 37.9598846
          }
          Rotation {
            Pitch: 90
            Roll: 90.0000076
          }
          Scale {
            X: 0.0920733884
            Y: 0.0763064548
            Z: 0.0410324261
          }
        }
        ParentId: 8745026516966507876
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 14437066532589146669
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:color"
            Color {
              R: 1
              G: 0.59602654
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
            Id: 8039760726822185815
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
        Id: 13959754073960918827
        Name: "Callout Sparkle"
        Transform {
          Location {
            Z: 53.9404221
          }
          Rotation {
          }
          Scale {
            X: 0.578670382
            Y: 0.642141104
            Z: 1
          }
        }
        ParentId: 8745026516966507876
        UnregisteredParameters {
          Overrides {
            Name: "bp:Particle Scale Multiplier"
            Float: 5.54730225
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
    Assets {
      Id: 8039760726822185815
      Name: "Hill 04"
      PlatformAssetType: 1
      PrimaryAsset {
        AssetType: "StaticMeshAssetRef"
        AssetId: "sm_hill_004"
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
  VirtualFolderPath: "Art and Collision - Farm"
  VirtualFolderPath: "Producers - Other"
}
