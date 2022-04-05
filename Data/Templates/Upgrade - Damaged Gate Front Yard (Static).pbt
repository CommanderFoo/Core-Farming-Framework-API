Assets {
  Id: 3741083872830029915
  Name: "Upgrade - Damaged Gate Front Yard (Static)"
  PlatformAssetType: 5
  TemplateAsset {
    ObjectBlock {
      RootId: 8037903383053307099
      Objects {
        Id: 8037903383053307099
        Name: "Upgrade - Damaged Gate Front Yard (Static)"
        Transform {
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 4781671109827199097
        ChildIds: 15665106917327034790
        ChildIds: 11625606934589967809
        ChildIds: 1208711907917864031
        ChildIds: 2305566764250853722
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
        Id: 15665106917327034790
        Name: "Player Lot Object Loader"
        Transform {
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 8037903383053307099
        TemplateInstance {
          ParameterOverrideMap {
            key: 5269134746227665817
            value {
              Overrides {
                Name: "Name"
                String: "Player Lot Object Loader (Unlock Backyard Sign)"
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
                Name: "cs:RequiresOwnerToLoad"
                Bool: true
              }
              Overrides {
                Name: "cs:RequiresOwnerToLoad:tooltip"
                String: "If true, will only load the objects if the Player Lot has an owner. Objects will be unloaded if the owner is cleared."
              }
              Overrides {
                Name: "cs:RequiresOwnerToLoad:isrep"
                Bool: false
              }
              Overrides {
                Name: "cs:RequiresOwnerToLoad:ml"
                Bool: false
              }
              Overrides {
                Name: "cs:RequiresNoOwnerToLoad"
                Bool: false
              }
              Overrides {
                Name: "cs:RequiresNoOwnerToLoad:tooltip"
                String: "If true, will only load the objects if the Player Lot does not have an owner. Objects will be unloaded if the owner is set."
              }
              Overrides {
                Name: "cs:RequiresNoOwnerToLoad:isrep"
                Bool: false
              }
              Overrides {
                Name: "cs:RequiresNoOwnerToLoad:ml"
                Bool: false
              }
              Overrides {
                Name: "cs:VisibleToOwnerOnly"
                Bool: true
              }
              Overrides {
                Name: "cs:VisibleToOwnerOnly:tooltip"
                String: "If true, the loaded client and static assets will only load for the owner of the lot."
              }
              Overrides {
                Name: "cs:VisibleToOwnerOnly:isrep"
                Bool: false
              }
              Overrides {
                Name: "cs:VisibleToOwnerOnly:ml"
                Bool: false
              }
              Overrides {
                Name: "cs:ServerAsset"
                AssetReference {
                  Id: 841534158063459245
                }
              }
              Overrides {
                Name: "cs:ServerAsset:tooltip"
                String: "(Optional) A template to spawn into a Server Context when the Player Lot Loads. This template will be destroyed when the Player Lot unloads."
              }
              Overrides {
                Name: "cs:ServerAsset:isrep"
                Bool: false
              }
              Overrides {
                Name: "cs:ServerAsset:ml"
                Bool: false
              }
              Overrides {
                Name: "cs:StaticAsset"
                AssetReference {
                  Id: 9318687964792238678
                }
              }
              Overrides {
                Name: "cs:StaticAsset:tooltip"
                String: "(Optional) A template to spawn into a Static Context when the Player Lot Loads. This template will be destroyed when the Player Lot unloads."
              }
              Overrides {
                Name: "cs:StaticAsset:isrep"
                Bool: false
              }
              Overrides {
                Name: "cs:StaticAsset:ml"
                Bool: false
              }
              Overrides {
                Name: "cs:ClientAsset"
                AssetReference {
                  Id: 841534158063459245
                }
              }
              Overrides {
                Name: "cs:ClientAsset:tooltip"
                String: "(Optional) A template to spawn into a Client Context when the Player Lot Loads. This template will be destroyed when the Player Lot unloads."
              }
              Overrides {
                Name: "cs:ClientAsset:isrep"
                Bool: false
              }
              Overrides {
                Name: "cs:ClientAsset:ml"
                Bool: false
              }
              Overrides {
                Name: "Position"
                Vector {
                  X: 23.1787109
                  Y: 30.4882812
                  Z: 182.576538
                }
              }
            }
          }
          TemplateAsset {
            Id: 2202103686519227027
          }
        }
      }
      Objects {
        Id: 11625606934589967809
        Name: "ClientContext (Geo with no Collision)"
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
        ParentId: 8037903383053307099
        ChildIds: 17098744258305222395
        ChildIds: 4216884535941337015
        ChildIds: 17856232476717803952
        ChildIds: 12607643011698186028
        ChildIds: 11883109912560026359
        ChildIds: 4154103753920808989
        ChildIds: 8572432260502956813
        ChildIds: 16949968174668603363
        ChildIds: 14688106668049983399
        ChildIds: 10266435363981337698
        ChildIds: 5547714241641730282
        ChildIds: 502946526920097551
        ChildIds: 2240058130780777709
        ChildIds: 4451897502395029538
        ChildIds: 9057618721529991111
        ChildIds: 3987150013005241943
        ChildIds: 4664537515249228934
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
        Id: 17098744258305222395
        Name: "Decal Stains Top 01"
        Transform {
          Location {
            X: -8.46484375
            Y: -2.18554688
            Z: 697.799
          }
          Rotation {
            Pitch: 6.83018879e-06
            Yaw: -3.3807708e-05
            Roll: 89.9999542
          }
          Scale {
            X: 0.852348804
            Y: 0.852349043
            Z: 0.0315303504
          }
        }
        ParentId: 11625606934589967809
        UnregisteredParameters {
          Overrides {
            Name: "bp:Color"
            Color {
              R: 0.026
              G: 0.0235370975
              B: 0.011232
              A: 0.8
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
        Blueprint {
          BlueprintAsset {
            Id: 10549684399192797779
          }
          TeamSettings {
          }
          DecalBP {
          }
        }
        Relevance {
          Value: "mc:eproxyrelevance:medium"
        }
      }
      Objects {
        Id: 4216884535941337015
        Name: "Decal Stains Top 01"
        Transform {
          Location {
            X: 21.8261719
            Y: -2.18554688
            Z: 644.44519
          }
          Rotation {
            Pitch: 1.36603776e-05
            Yaw: -4.82967225e-05
            Roll: 89.9999466
          }
          Scale {
            X: 0.852349937
            Y: 0.163871333
            Z: 0.190709963
          }
        }
        ParentId: 11625606934589967809
        UnregisteredParameters {
          Overrides {
            Name: "bp:Color"
            Color {
              R: 0.026
              G: 0.0235370975
              B: 0.011232
              A: 0.8
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
        Blueprint {
          BlueprintAsset {
            Id: 10549684399192797779
          }
          TeamSettings {
          }
          DecalBP {
          }
        }
        Relevance {
          Value: "mc:eproxyrelevance:medium"
        }
      }
      Objects {
        Id: 17856232476717803952
        Name: "Urban Plank Debris 03"
        Transform {
          Location {
            X: -112.960938
            Y: -13.5117188
            Z: 185.773346
          }
          Rotation {
            Pitch: 89.7814865
            Yaw: 89.9946213
            Roll: 180
          }
          Scale {
            X: 1.49154496
            Y: 1.57679641
            Z: 2.17857194
          }
        }
        ParentId: 11625606934589967809
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 2177181377895567687
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
            Id: 17683248321032095277
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
        Id: 12607643011698186028
        Name: "Urban Plank Debris 01"
        Transform {
          Location {
            X: -56.3671875
            Y: -13.5117188
            Z: 135.284088
          }
          Rotation {
            Pitch: 89.7761765
            Yaw: 89.9930038
            Roll: -179.999557
          }
          Scale {
            X: 1.49157691
            Y: 1.57679641
            Z: 2.60193443
          }
        }
        ParentId: 11625606934589967809
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 2177181377895567687
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
            Id: 15367609604429666440
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
        Id: 11883109912560026359
        Name: "Urban Plank Debris 01"
        Transform {
          Location {
            X: 191.609375
            Y: -13.5117188
            Z: 135.284088
          }
          Rotation {
            Pitch: 89.7709961
            Yaw: 89.9930344
            Roll: -179.999115
          }
          Scale {
            X: 1.49157691
            Y: 1.57679641
            Z: 2.60193443
          }
        }
        ParentId: 11625606934589967809
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 2177181377895567687
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
            Id: 15367609604429666440
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
        Id: 4154103753920808989
        Name: "Urban Plank Debris 01"
        Transform {
          Location {
            X: 141.367188
            Y: -13.5117188
            Z: 135.284088
          }
          Rotation {
            Pitch: -88.380806
            Yaw: 7.92586613
            Roll: 82.0740585
          }
          Scale {
            X: 1.49157691
            Y: 1.57679641
            Z: 2.60193443
          }
        }
        ParentId: 11625606934589967809
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 2177181377895567687
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
            Id: 15367609604429666440
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
        Id: 8572432260502956813
        Name: "Urban Plank Debris 04"
        Transform {
          Location {
            X: -112.960938
            Y: -13.5117188
            Z: 65.9221725
          }
          Rotation {
            Pitch: 89.7761765
            Yaw: 89.9930038
            Roll: -179.999557
          }
          Scale {
            X: 1.49154496
            Y: 1.57679641
            Z: 2.17857194
          }
        }
        ParentId: 11625606934589967809
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 14231809728886464860
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:color"
            Color {
              R: 0.446
              G: 0.396378815
              B: 0.33896
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
            Id: 8135971951596203732
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
        Id: 16949968174668603363
        Name: "Urban Plank Debris 03"
        Transform {
          Location {
            X: 92.7089844
            Y: -13.5117188
            Z: 79.1796417
          }
          Rotation {
            Pitch: -89.7529068
            Yaw: 61.3907471
            Roll: 28.6040497
          }
          Scale {
            X: 1.49154496
            Y: 1.57679641
            Z: 2.17857194
          }
        }
        ParentId: 11625606934589967809
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 2177181377895567687
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
            Id: 17683248321032095277
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
        Id: 14688106668049983399
        Name: "Urban Plank Debris 04"
        Transform {
          Location {
            X: 92.46875
            Y: -13.5117188
            Z: 199.031708
          }
          Rotation {
            Pitch: -89.7458801
            Yaw: 61.9049873
            Roll: 28.0891876
          }
          Scale {
            X: 1.49154496
            Y: 1.57679641
            Z: 2.17857194
          }
        }
        ParentId: 11625606934589967809
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 2177181377895567687
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
            Id: 8135971951596203732
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
        Id: 10266435363981337698
        Name: "Urban Plank Debris 02"
        Transform {
          Location {
            X: -9.54296875
            Y: -13.5117188
            Z: 134.679657
          }
          Rotation {
            Pitch: 89.7761765
            Yaw: 89.9930038
            Roll: -179.999557
          }
          Scale {
            X: 1.49154496
            Y: 1.57679641
            Z: 2.17857194
          }
        }
        ParentId: 11625606934589967809
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 2177181377895567687
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
            Id: 4887853102882462620
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
        Id: 5547714241641730282
        Name: "Urban Plank Debris 02"
        Transform {
          Location {
            X: 44.8808594
            Y: -13.5117188
            Z: 107.889595
          }
          Rotation {
            Pitch: -88.8687439
            Yaw: 11.0833025
            Roll: 78.9185867
          }
          Scale {
            X: 1.49154496
            Y: 1.57679641
            Z: 2.17857194
          }
        }
        ParentId: 11625606934589967809
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 2177181377895567687
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
            Id: 4887853102882462620
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
        Id: 502946526920097551
        Name: "Cube - Polished"
        Transform {
          Location {
            X: 37.703125
            Y: 3.48046875
            Z: 242.325439
          }
          Rotation {
            Yaw: -89.9999847
          }
          Scale {
            X: -0.192995563
            Y: 4.02634716
            Z: 0.295022726
          }
        }
        ParentId: 11625606934589967809
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 4648881920192703239
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:color"
            Color {
              R: 0.321
              G: 0.285286099
              B: 0.243960008
              A: 1
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:smart"
            Bool: false
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:vtile"
            Float: 0.145237625
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:utile"
            Float: 1.84804785
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
            Id: 2357071122945020053
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
        Id: 2240058130780777709
        Name: "Cube - Polished"
        Transform {
          Location {
            X: 37.703125
            Y: 3.48046875
            Z: 64.1843414
          }
          Rotation {
            Yaw: -89.9999847
          }
          Scale {
            X: -0.192995563
            Y: 4.02634716
            Z: 0.295022726
          }
        }
        ParentId: 11625606934589967809
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 4648881920192703239
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:color"
            Color {
              R: 0.321
              G: 0.285286099
              B: 0.243960008
              A: 1
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:smart"
            Bool: false
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:vtile"
            Float: 0.145237625
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:utile"
            Float: 1.84804785
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
            Id: 2357071122945020053
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
        Id: 4451897502395029538
        Name: "Cylinder"
        Transform {
          Location {
            X: 243.738281
            Y: -2.8359375
            Z: 553.743835
          }
          Rotation {
            Pitch: 44.9999695
            Yaw: -1.59999036e-05
            Roll: -2.93090466e-06
          }
          Scale {
            X: 0.256994724
            Y: 0.256982088
            Z: 1.94190359
          }
        }
        ParentId: 11625606934589967809
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 2360206302109331130
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:color"
            Color {
              R: 0.321
              G: 0.285286099
              B: 0.243960008
              A: 1
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:smart"
            Bool: false
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:vtile"
            Float: 1.32898438
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:utile"
            Float: 0.125
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
            Id: 13949441344821433690
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
        Id: 9057618721529991111
        Name: "Cylinder"
        Transform {
          Location {
            X: -169.388672
            Y: -2.8359375
            Z: 553.743835
          }
          Rotation {
            Pitch: 44.999958
            Yaw: 179.999969
            Roll: -3.31368506e-06
          }
          Scale {
            X: 0.256994724
            Y: 0.256982088
            Z: 1.94190359
          }
        }
        ParentId: 11625606934589967809
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 2360206302109331130
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:color"
            Color {
              R: 0.321
              G: 0.285286099
              B: 0.243960008
              A: 1
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:smart"
            Bool: false
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:vtile"
            Float: 1.32898438
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:utile"
            Float: 0.125
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
            Id: 13949441344821433690
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
        Id: 3987150013005241943
        Name: "Cube - Rounded"
        Transform {
          Location {
            X: 37.703125
            Y: 3.48046875
            Z: 244.315186
          }
          Rotation {
            Yaw: -89.9999847
          }
          Scale {
            X: -0.192331493
            Y: 4.02060413
            Z: 0.295022726
          }
        }
        ParentId: 11625606934589967809
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 2177181377895567687
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:smart"
            Bool: false
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:vtile"
            Float: 0.145237625
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:utile"
            Float: 1.84804785
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
            Id: 7624284576871502919
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
        Id: 4664537515249228934
        Name: "Cube - Rounded"
        Transform {
          Location {
            X: 37.703125
            Y: 3.48046875
            Z: 66.1741333
          }
          Rotation {
            Yaw: -89.9999847
          }
          Scale {
            X: -0.192331493
            Y: 4.02060413
            Z: 0.295022726
          }
        }
        ParentId: 11625606934589967809
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 2177181377895567687
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:smart"
            Bool: false
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:vtile"
            Float: 0.145237625
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:utile"
            Float: 1.84804785
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
            Id: 7624284576871502919
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
        Id: 1208711907917864031
        Name: "Geo with Collision"
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
        ParentId: 8037903383053307099
        ChildIds: 12681887958866734211
        ChildIds: 6638215162714897390
        ChildIds: 11018589106984557934
        ChildIds: 12067744265942861569
        ChildIds: 5771848288242918739
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
        Id: 12681887958866734211
        Name: "Cube - Bottom-Aligned"
        Transform {
          Location {
            X: 40.0283203
            Y: -2.84375
            Z: 620.314697
          }
          Rotation {
            Yaw: -90
          }
          Scale {
            X: -0.104211397
            Y: 7.01839828
            Z: 1.33928978
          }
        }
        ParentId: 1208711907917864031
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 2360206302109331130
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:color"
            Color {
              R: 0.640000045
              G: 0.568794727
              B: 0.486400038
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
            Id: 1903440566860194223
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
        Id: 6638215162714897390
        Name: "Cylinder"
        Transform {
          Location {
            X: 40.0283203
            Y: -2.84375
            Z: 741.456787
          }
          Rotation {
            Pitch: 90
            Yaw: -56.309906
            Roll: 33.6900711
          }
          Scale {
            X: 1.9820348
            Y: 4.54665184
            Z: -0.104000464
          }
        }
        ParentId: 1208711907917864031
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 2360206302109331130
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:color"
            Color {
              R: 0.640000045
              G: 0.568794727
              B: 0.486400038
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
            Id: 13949441344821433690
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
        Id: 11018589106984557934
        Name: "Cylinder - Bottom-Aligned"
        Transform {
          Location {
            X: -341.666016
            Y: -2.44140625
            Z: 638.180298
          }
          Rotation {
            Yaw: -90
            Roll: 89.9999695
          }
          Scale {
            X: 0.687689066
            Y: 0.687688589
            Z: 7.58467531
          }
        }
        ParentId: 1208711907917864031
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 2360206302109331130
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:color"
            Color {
              R: 0.321
              G: 0.285286099
              B: 0.243960008
              A: 1
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:smart"
            Bool: false
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:vtile"
            Float: 1.32898438
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:utile"
            Float: 0.183806166
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
            Id: 6747614045051753376
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
        Id: 12067744265942861569
        Name: "Cylinder - Bottom-Aligned"
        Transform {
          Location {
            X: -246.154297
            Y: -2.43945312
            Z: 268.667
          }
          Rotation {
            Yaw: -90
          }
          Scale {
            X: 0.687689066
            Y: 0.687689066
            Z: 3.72158861
          }
        }
        ParentId: 1208711907917864031
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 4648881920192703239
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:color"
            Color {
              R: 0.321
              G: 0.285286099
              B: 0.243960008
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
            Id: 6747614045051753376
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
        Id: 5771848288242918739
        Name: "Cylinder - Bottom-Aligned"
        Transform {
          Location {
            X: 317.441406
            Y: -2.43945312
            Z: 268.667
          }
          Rotation {
            Yaw: -90
          }
          Scale {
            X: 0.687689066
            Y: 0.687689066
            Z: 3.72158861
          }
        }
        ParentId: 1208711907917864031
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 4648881920192703239
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:color"
            Color {
              R: 0.321
              G: 0.285286099
              B: 0.243960008
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
            Id: 6747614045051753376
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
        Id: 2305566764250853722
        Name: "Collision (Invisible)"
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
        ParentId: 8037903383053307099
        ChildIds: 11143717415930086507
        ChildIds: 12744344118629725808
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
        Id: 11143717415930086507
        Name: "Cube - Polished"
        Transform {
          Location {
            X: 38.5068359
            Y: -2.4453125
            Z: 140.816193
          }
          Rotation {
            Yaw: -90
          }
          Scale {
            X: -0.192995563
            Y: 3.58861256
            Z: 2.85275459
          }
        }
        ParentId: 2305566764250853722
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 10051999787639476342
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:color"
            Color {
              R: 1
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
            Id: 2357071122945020053
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
        Id: 12744344118629725808
        Name: "Blocker for future Trigger Zone"
        Transform {
          Location {
            X: 36.1787109
            Y: 12.671875
            Z: -2.56034088
          }
          Rotation {
          }
          Scale {
            X: 4.00238371
            Y: 0.663671851
            Z: 3.08648419
          }
        }
        ParentId: 2305566764250853722
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 13850988888007816936
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:color"
            Color {
              R: 1
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
            Id: 1903440566860194223
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
      Id: 10549684399192797779
      Name: "Decal Stains Top 01"
      PlatformAssetType: 14
      PrimaryAsset {
        AssetType: "DecalBlueprintAssetRef"
        AssetId: "bp_decal_stain_top_001"
      }
    }
    Assets {
      Id: 17683248321032095277
      Name: "Urban Plank Debris 03"
      PlatformAssetType: 1
      PrimaryAsset {
        AssetType: "StaticMeshAssetRef"
        AssetId: "sm_prop_urban_destruction_debris_plank_03_ref"
      }
    }
    Assets {
      Id: 15367609604429666440
      Name: "Urban Plank Debris 01"
      PlatformAssetType: 1
      PrimaryAsset {
        AssetType: "StaticMeshAssetRef"
        AssetId: "sm_prop_urban_destruction_debris_plank_01_ref"
      }
    }
    Assets {
      Id: 8135971951596203732
      Name: "Urban Plank Debris 04"
      PlatformAssetType: 1
      PrimaryAsset {
        AssetType: "StaticMeshAssetRef"
        AssetId: "sm_prop_urban_destruction_debris_plank_04_ref"
      }
    }
    Assets {
      Id: 14231809728886464860
      Name: "Wood Raw White"
      PlatformAssetType: 2
      PrimaryAsset {
        AssetType: "MaterialAssetRef"
        AssetId: "mi_wood_raw_white_001_uv"
      }
    }
    Assets {
      Id: 4887853102882462620
      Name: "Urban Plank Debris 02"
      PlatformAssetType: 1
      PrimaryAsset {
        AssetType: "StaticMeshAssetRef"
        AssetId: "sm_prop_urban_destruction_debris_plank_02_ref"
      }
    }
    Assets {
      Id: 2357071122945020053
      Name: "Cube - Polished"
      PlatformAssetType: 1
      PrimaryAsset {
        AssetType: "StaticMeshAssetRef"
        AssetId: "sm_cube_hq_test_001"
      }
    }
    Assets {
      Id: 13949441344821433690
      Name: "Cylinder"
      PlatformAssetType: 1
      PrimaryAsset {
        AssetType: "StaticMeshAssetRef"
        AssetId: "sm_cylinder_002"
      }
    }
    Assets {
      Id: 2360206302109331130
      Name: "Wood Painted 01"
      PlatformAssetType: 2
      PrimaryAsset {
        AssetType: "MaterialAssetRef"
        AssetId: "mi_wood_painted_white_001_uv"
      }
    }
    Assets {
      Id: 7624284576871502919
      Name: "Cube - Rounded"
      PlatformAssetType: 1
      PrimaryAsset {
        AssetType: "StaticMeshAssetRef"
        AssetId: "sm_cube_rounded_002"
      }
    }
    Assets {
      Id: 1903440566860194223
      Name: "Cube - Bottom-Aligned"
      PlatformAssetType: 1
      PrimaryAsset {
        AssetType: "StaticMeshAssetRef"
        AssetId: "sm_cube_001"
      }
    }
    Assets {
      Id: 6747614045051753376
      Name: "Cylinder - Bottom-Aligned"
      PlatformAssetType: 1
      PrimaryAsset {
        AssetType: "StaticMeshAssetRef"
        AssetId: "sm_cylinder_001"
      }
    }
    Assets {
      Id: 10051999787639476342
      Name: "Wood Planks White"
      PlatformAssetType: 2
      PrimaryAsset {
        AssetType: "MaterialAssetRef"
        AssetId: "mi_wood_planks_white_001_uv"
      }
    }
    PrimaryAssetId {
      AssetType: "None"
      AssetId: "None"
    }
  }
  SerializationVersion: 108
  VirtualFolderPath: "Art and Collision - Farm"
  VirtualFolderPath: "Farm Upgrades"
}
