Assets {
  Id: 12758864790366336721
  Name: "Upgrade - Damaged House Front Yard (Static)"
  PlatformAssetType: 5
  TemplateAsset {
    ObjectBlock {
      RootId: 9949837581537339669
      Objects {
        Id: 9949837581537339669
        Name: "Upgrade - Damaged House Front Yard (Static)"
        Transform {
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 4781671109827199097
        ChildIds: 13163920251344694057
        ChildIds: 9804409911274787029
        ChildIds: 11632577626447467789
        ChildIds: 11752794560646477130
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
        Id: 13163920251344694057
        Name: "Player Lot Object Loader"
        Transform {
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 9949837581537339669
        TemplateInstance {
          ParameterOverrideMap {
            key: 5269134746227665817
            value {
              Overrides {
                Name: "Name"
                String: "Player Lot Object Loader (Repair Sign)"
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
                  Id: 4811595698601879138
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
                  X: -161.60553
                  Y: 77.4608383
                  Z: 254.292023
                }
              }
              Overrides {
                Name: "Rotation"
                Rotator {
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
        Id: 9804409911274787029
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
        ParentId: 9949837581537339669
        ChildIds: 13100471015033050789
        ChildIds: 13098031205286986681
        ChildIds: 2733933068481500811
        ChildIds: 16639677810325686519
        ChildIds: 1220272549906448936
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
        Id: 13100471015033050789
        Name: "Cube - Bottom-Aligned"
        Transform {
          Location {
            Y: 2.09570312
            Z: 75.3934555
          }
          Rotation {
            Yaw: -89.9999542
          }
          Scale {
            X: 0.658823907
            Y: 7.68627834
            Z: 4.39215899
          }
        }
        ParentId: 9804409911274787029
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 6263372138000189282
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:smart"
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
        CoreMesh {
          MeshAsset {
            Id: 1903440566860194223
          }
          Teams {
            IsTeamCollisionEnabled: true
            IsEnemyCollisionEnabled: true
          }
          DisableDistanceFieldLighting: true
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
        Id: 13098031205286986681
        Name: "Prism - 3-Sided"
        Transform {
          Location {
            Y: 34.7421875
            Z: 612.667908
          }
          Rotation {
            Pitch: 6.83018879e-06
            Yaw: -179.999924
            Roll: -89.9999542
          }
          Scale {
            X: 7.72323275
            Y: 3.45494843
            Z: 0.658823848
          }
        }
        ParentId: 9804409911274787029
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 6263372138000189282
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
            Id: 11627317353827155956
          }
          Teams {
            IsTeamCollisionEnabled: true
            IsEnemyCollisionEnabled: true
          }
          DisableDistanceFieldLighting: true
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
        Id: 2733933068481500811
        Name: "Craftsman Roof 01 Peak"
        Transform {
          Location {
            X: 391.183594
            Y: -41.4804688
            Z: 485.680878
          }
          Rotation {
            Yaw: -179.999954
          }
          Scale {
            X: 0.978349
            Y: 0.101667784
            Z: 1.01649737
          }
        }
        ParentId: 9804409911274787029
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_Detail1:id"
            AssetReference {
              Id: 9311015945614487722
            }
          }
          Overrides {
            Name: "ma:Building_Roof:id"
            AssetReference {
              Id: 7741902784071852752
            }
          }
          Overrides {
            Name: "ma:Building_Roof:smart"
            Bool: false
          }
          Overrides {
            Name: "ma:Building_Roof:utile"
            Float: 0.145237625
          }
          Overrides {
            Name: "ma:Building_Roof:vtile"
            Float: 1.53069413
          }
          Overrides {
            Name: "ma:Shared_Trim:id"
            AssetReference {
              Id: 2360206302109331130
            }
          }
          Overrides {
            Name: "ma:Shared_Trim:color"
            Color {
              R: 0.452000022
              G: 0.401711285
              B: 0.343520015
              A: 1
            }
          }
          Overrides {
            Name: "ma:Building_Roof:color"
            Color {
              R: 0.227000013
              G: 0.271887
              B: 0.366000026
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
            Id: 10123498949289312814
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
        Id: 16639677810325686519
        Name: "Cube - Polished"
        Transform {
          Location {
            Z: 32.4417152
          }
          Rotation {
            Yaw: -89.9999542
          }
          Scale {
            X: 1.09803975
            Y: 7.90588808
            Z: 0.878431797
          }
        }
        ParentId: 9804409911274787029
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
            Float: 0.211703792
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
          DisableDistanceFieldLighting: true
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
        Id: 1220272549906448936
        Name: "Fantasy Castle Stairs 01 - 150cm"
        Transform {
          Location {
            X: -234.526367
            Y: 251.951172
            Z: -101.558266
          }
          Rotation {
            Yaw: 2.3905659e-05
          }
          Scale {
            X: 0.5
            Y: 1
            Z: 1
          }
        }
        ParentId: 9804409911274787029
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 4648881920192703239
            }
          }
          Overrides {
            Name: "ma:Shared_Detail1:id"
            AssetReference {
              Id: 4648881920192703239
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:color"
            Color {
              R: 0.452000022
              G: 0.401711285
              B: 0.343520015
              A: 1
            }
          }
          Overrides {
            Name: "ma:Shared_Detail1:color"
            Color {
              R: 0.206000015
              G: 0.187569156
              B: 0.166242
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
            Id: 9842143421296066252
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
        Id: 11632577626447467789
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
        ParentId: 9949837581537339669
        ChildIds: 16926326735782466965
        ChildIds: 5356924834693691119
        ChildIds: 485442845695391102
        ChildIds: 5349999774842368020
        ChildIds: 8425550006998608426
        ChildIds: 18059513895127391266
        ChildIds: 17402817890823569252
        ChildIds: 2714149891210133717
        ChildIds: 830367271313950432
        ChildIds: 9049084557317081534
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
        Id: 16926326735782466965
        Name: "Curtains Straight"
        Transform {
          Location {
            X: 165.648407
            Y: 43.1250916
            Z: 275.284882
          }
          Rotation {
            Yaw: 6.83018834e-06
          }
          Scale {
            X: 1.13949406
            Y: 0.117230125
            Z: 0.434278131
          }
        }
        ParentId: 11632577626447467789
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 12182349030108010704
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:smart"
            Bool: true
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:color"
            Color {
              R: 0.18018
              G: 0.214930713
              B: 0.585000038
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
            Id: 1960126771288985166
          }
          Teams {
            IsTeamCollisionEnabled: true
            IsEnemyCollisionEnabled: true
          }
          DisableDistanceFieldLighting: true
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
        Id: 5356924834693691119
        Name: "Main Street Window 03"
        Transform {
          Location {
            X: 162.398407
            Y: 41.8750916
            Z: 161.540436
          }
          Rotation {
            Yaw: -179.999939
          }
          Scale {
            X: 0.975664914
            Y: 0.781451881
            Z: 0.781451941
          }
        }
        ParentId: 11632577626447467789
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
              R: 0.452000022
              G: 0.401711285
              B: 0.343520015
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
            Id: 9430017653316231459
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
        Id: 485442845695391102
        Name: "Craftsman Porch Pillar 01"
        Transform {
          Location {
            X: 183.611313
            Y: 5.63096619
            Z: 640.965088
          }
          Rotation {
            Yaw: -89.9999542
          }
          Scale {
            X: 0.385034233
            Y: 1
            Z: 1
          }
        }
        ParentId: 11632577626447467789
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_Trim:id"
            AssetReference {
              Id: 9311015945614487722
            }
          }
          Overrides {
            Name: "ma:Building_Foundation:id"
            AssetReference {
              Id: 17688260722965583834
            }
          }
          Overrides {
            Name: "ma:Building_Foundation:vtile"
            Float: 1.76301873
          }
          Overrides {
            Name: "ma:Building_Foundation:color"
            Color {
              R: 0.389000028
              G: 0.371317238
              B: 0.358658
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
            Id: 4284392322078894749
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
        Id: 5349999774842368020
        Name: "Whitebox Wall 01 Doorway 01 Frame"
        Transform {
          Location {
            X: -248.525406
            Y: 25.9510498
            Z: 50.4417343
          }
          Rotation {
            Yaw: 1.7075472e-05
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 11632577626447467789
        UnregisteredParameters {
          Overrides {
            Name: "ma:Building_WallInner2:id"
            AssetReference {
              Id: 4648881920192703239
            }
          }
          Overrides {
            Name: "ma:Building_WallInner2:color"
            Color {
              R: 0.452000022
              G: 0.401711285
              B: 0.343520015
              A: 1
            }
          }
          Overrides {
            Name: "ma:Building_WallInner:id"
            AssetReference {
              Id: 4648881920192703239
            }
          }
          Overrides {
            Name: "ma:Building_WallInner:color"
            Color {
              R: 0.452000022
              G: 0.401711285
              B: 0.343520015
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
            Id: 1628849511756280386
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
        Id: 8425550006998608426
        Name: "Craftsman Interior Door 01"
        Transform {
          Location {
            X: -228.785172
            Y: 33.1834717
            Z: 78.4417343
          }
          Rotation {
            Yaw: 1.7075472e-05
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 11632577626447467789
        UnregisteredParameters {
          Overrides {
            Name: "ma:Door_Handle:color"
            Color {
              R: 0.248000011
              G: 0.248000011
              B: 0.248000011
              A: 1
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:color"
            Color {
              R: 0.561000049
              G: 0.561000049
              B: 0.561000049
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
            Id: 18033389860248816225
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
        Id: 18059513895127391266
        Name: "Urban Damaged Glass Shard  - 01"
        Transform {
          Location {
            X: 128.49411
            Y: 44.9502563
            Z: 198.923615
          }
          Rotation {
            Yaw: 1.7075472e-05
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 11632577626447467789
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
            Id: 8239062871393626244
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
        Id: 17402817890823569252
        Name: "Urban Damaged Glass Shard  - 01"
        Transform {
          Location {
            X: 201.066376
            Y: 44.9503021
            Z: 263.73175
          }
          Rotation {
            Pitch: -2.09854126
            Yaw: -179.999954
            Roll: -179.999985
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 11632577626447467789
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
            Id: 8239062871393626244
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
        Id: 2714149891210133717
        Name: "Urban Damaged Glass Shard  - 01"
        Transform {
          Location {
            X: 199.863251
            Y: 44.9503021
            Z: 327.601562
          }
          Rotation {
            Pitch: 86.6415787
            Yaw: -7.0332404e-05
            Roll: -9.44910353e-05
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 11632577626447467789
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
            Id: 8239062871393626244
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
        Id: 830367271313950432
        Name: "Large Wood Board 8m"
        Transform {
          Location {
            X: -259.843781
            Y: 58.9666443
            Z: 189.844406
          }
          Rotation {
            Pitch: -10.6495619
            Yaw: 2.43246322e-05
            Roll: -89.9999542
          }
          Scale {
            X: 0.326165438
            Y: 0.654266953
            Z: 0.420497477
          }
        }
        ParentId: 11632577626447467789
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:vtile"
            Float: 0.335808367
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 14231809728886464860
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:color"
            Color {
              R: 0.149
              G: 0.113013044
              B: 0.071371
              A: 1
            }
          }
          Overrides {
            Name: "ma:Shared_Detail1:id"
            AssetReference {
              Id: 14231809728886464860
            }
          }
          Overrides {
            Name: "ma:Shared_Detail1:color"
            Color {
              R: 0.149
              G: 0.113013044
              B: 0.071371
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
            Id: 18052318672521571529
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
        Id: 9049084557317081534
        Name: "Large Wood Board 8m"
        Transform {
          Location {
            X: -259.839844
            Y: 51.6933594
            Z: 354.835205
          }
          Rotation {
            Pitch: -10.6495762
            Yaw: -4.77805315e-06
            Roll: -89.9999542
          }
          Scale {
            X: 0.326165646
            Y: 0.654266357
            Z: -0.3797369
          }
        }
        ParentId: 11632577626447467789
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:vtile"
            Float: 0.335808367
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 14231809728886464860
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:color"
            Color {
              R: 0.149
              G: 0.113013044
              B: 0.071371
              A: 1
            }
          }
          Overrides {
            Name: "ma:Shared_Detail1:id"
            AssetReference {
              Id: 14231809728886464860
            }
          }
          Overrides {
            Name: "ma:Shared_Detail1:color"
            Color {
              R: 0.149
              G: 0.113013044
              B: 0.071371
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
            Id: 18052318672521571529
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
        Id: 11752794560646477130
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
        ParentId: 9949837581537339669
        ChildIds: 10014421649078092396
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
        Id: 10014421649078092396
        Name: "Blocker for future Trigger Zone"
        Transform {
          Location {
            X: -137.189514
            Y: 77.0858459
            Z: 0.000122070312
          }
          Rotation {
            Yaw: -89.9999542
          }
          Scale {
            X: 0.703730583
            Y: 2.04457068
            Z: 3.9205153
          }
        }
        ParentId: 11752794560646477130
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
      Id: 1903440566860194223
      Name: "Cube - Bottom-Aligned"
      PlatformAssetType: 1
      PrimaryAsset {
        AssetType: "StaticMeshAssetRef"
        AssetId: "sm_cube_001"
      }
    }
    Assets {
      Id: 11627317353827155956
      Name: "Prism - 3-Sided"
      PlatformAssetType: 1
      PrimaryAsset {
        AssetType: "StaticMeshAssetRef"
        AssetId: "sm_prism_001"
      }
    }
    Assets {
      Id: 10123498949289312814
      Name: "Craftsman Roof 01 Peak"
      PlatformAssetType: 1
      PrimaryAsset {
        AssetType: "StaticMeshAssetRef"
        AssetId: "sm_urb_sub_craftsman_roof_001_peak"
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
      Id: 7741902784071852752
      Name: "Roof Square Shingles 01"
      PlatformAssetType: 2
      PrimaryAsset {
        AssetType: "MaterialAssetRef"
        AssetId: "mi_roof_square_shingles_001_uv"
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
      Id: 2357071122945020053
      Name: "Cube - Polished"
      PlatformAssetType: 1
      PrimaryAsset {
        AssetType: "StaticMeshAssetRef"
        AssetId: "sm_cube_hq_test_001"
      }
    }
    Assets {
      Id: 9842143421296066252
      Name: "Fantasy Castle Stairs 01 - 150cm"
      PlatformAssetType: 1
      PrimaryAsset {
        AssetType: "StaticMeshAssetRef"
        AssetId: "sm_ts_fan_cas_stairs_001_150cm"
      }
    }
    Assets {
      Id: 1960126771288985166
      Name: "Curtains Straight"
      PlatformAssetType: 1
      PrimaryAsset {
        AssetType: "StaticMeshAssetRef"
        AssetId: "sm_curtain_02"
      }
    }
    Assets {
      Id: 12182349030108010704
      Name: "Fabric Burlap Old 01"
      PlatformAssetType: 2
      PrimaryAsset {
        AssetType: "MaterialAssetRef"
        AssetId: "mi_fan_fabric_burlap_001_uv"
      }
    }
    Assets {
      Id: 9430017653316231459
      Name: "Main Street Window 03"
      PlatformAssetType: 1
      PrimaryAsset {
        AssetType: "StaticMeshAssetRef"
        AssetId: "sm_ts_urb_dtn_mst_part_window_003_ref"
      }
    }
    Assets {
      Id: 4284392322078894749
      Name: "Craftsman Porch Pillar 01"
      PlatformAssetType: 1
      PrimaryAsset {
        AssetType: "StaticMeshAssetRef"
        AssetId: "sm_urb_sub_craftsman_porch_001_pillar"
      }
    }
    Assets {
      Id: 17688260722965583834
      Name: "Bricks Mismatched Stone 01"
      PlatformAssetType: 2
      PrimaryAsset {
        AssetType: "MaterialAssetRef"
        AssetId: "mi_brick_stone_mismatch_001"
      }
    }
    Assets {
      Id: 1628849511756280386
      Name: "Whitebox Wall 01 Doorway 01 Frame"
      PlatformAssetType: 1
      PrimaryAsset {
        AssetType: "StaticMeshAssetRef"
        AssetId: "sm_gen_whitebox_wall_001_doorframe"
      }
    }
    Assets {
      Id: 18033389860248816225
      Name: "Craftsman Interior Door 01"
      PlatformAssetType: 1
      PrimaryAsset {
        AssetType: "StaticMeshAssetRef"
        AssetId: "sm_urb_sub_craftsman_door_002"
      }
    }
    Assets {
      Id: 8239062871393626244
      Name: "Urban Damaged Glass Shard  - 01"
      PlatformAssetType: 1
      PrimaryAsset {
        AssetType: "StaticMeshAssetRef"
        AssetId: "sm_ts_urb_dmg_glass_shard_001_ref"
      }
    }
    Assets {
      Id: 18052318672521571529
      Name: "Large Wood Board 8m"
      PlatformAssetType: 1
      PrimaryAsset {
        AssetType: "StaticMeshAssetRef"
        AssetId: "sm_large_board_6m"
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
    PrimaryAssetId {
      AssetType: "None"
      AssetId: "None"
    }
  }
  SerializationVersion: 108
  VirtualFolderPath: "Art and Collision - Farm"
  VirtualFolderPath: "Farm Upgrades"
}
