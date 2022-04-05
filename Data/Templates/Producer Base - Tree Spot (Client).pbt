Assets {
  Id: 817612642702294774
  Name: "Producer Base - Tree Spot (Client)"
  PlatformAssetType: 5
  TemplateAsset {
    ObjectBlock {
      RootId: 4875789387806808346
      Objects {
        Id: 4875789387806808346
        Name: "Producer Base - Tree Spot (Client)"
        Transform {
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 4781671109827199097
        ChildIds: 4386315994575716053
        ChildIds: 9344374525451566360
        ChildIds: 6041110059677186451
        ChildIds: 11353495384951847801
        ChildIds: 15489184411741269227
        UnregisteredParameters {
          Overrides {
            Name: "cs:ProducerGroup"
            ObjectReference {
              SubObjectId: 15489184411741269227
            }
          }
          Overrides {
            Name: "cs:ProducerGroup:tooltip"
            String: "This sets the location that the producer spawns within the producer base."
          }
          Overrides {
            Name: "cs:ProducerGroup:isrep"
            Bool: false
          }
          Overrides {
            Name: "cs:ProducerGroup:ml"
            Bool: false
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
        Id: 4386315994575716053
        Name: "ChangeColorWithActiveBuff"
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
        ParentId: 4875789387806808346
        UnregisteredParameters {
          Overrides {
            Name: "cs:BuffId"
            String: "Watered"
          }
          Overrides {
            Name: "cs:InactiveColor"
            Color {
              R: 0.423529446
              G: 0.313725501
              B: 0.227451
              A: 1
            }
          }
          Overrides {
            Name: "cs:ActiveColor"
            Color {
              R: 0.247058839
              G: 0.0980392247
              A: 1
            }
          }
          Overrides {
            Name: "cs:ObjectToColor"
            ObjectReference {
              SubObjectId: 16577395263049526692
            }
          }
          Overrides {
            Name: "cs:UpdateOverTime"
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
            Id: 10296350106069483895
          }
        }
        NetworkRelevanceDistance {
          Value: "mc:eproxyrelevance:critical"
        }
      }
      Objects {
        Id: 9344374525451566360
        Name: "ToggleVisibilityWithActiveBuffClient"
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
        ParentId: 4875789387806808346
        UnregisteredParameters {
          Overrides {
            Name: "cs:ObjectToToggle"
            ObjectReference {
              SubObjectId: 11353495384951847801
            }
          }
          Overrides {
            Name: "cs:BuffId"
            String: "Fertilized"
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
            Id: 9246436151059596399
          }
        }
        NetworkRelevanceDistance {
          Value: "mc:eproxyrelevance:critical"
        }
      }
      Objects {
        Id: 6041110059677186451
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
        ParentId: 4875789387806808346
        ChildIds: 16577395263049526692
        ChildIds: 7985385990081687691
        ChildIds: 13619212791144344021
        ChildIds: 3478729570779899900
        ChildIds: 12738119848559638976
        ChildIds: 17355380560857626003
        ChildIds: 16821468623865944157
        ChildIds: 6646324306717011136
        ChildIds: 13961909200143118129
        ChildIds: 3935746397034915390
        ChildIds: 12340267812877747986
        ChildIds: 6192639345022508289
        ChildIds: 5005541931364745882
        ChildIds: 1477002675304685718
        ChildIds: 13116615491612576398
        ChildIds: 3534217533055216008
        ChildIds: 11363981020822920305
        ChildIds: 5179330729875189303
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
        Id: 16577395263049526692
        Name: "Lens - Half (Soil)"
        Transform {
          Location {
            Z: 11.0985413
          }
          Rotation {
          }
          Scale {
            X: 1.6
            Y: 1.6
            Z: 0.2
          }
        }
        ParentId: 6041110059677186451
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 5062471689526080153
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:color"
            Color {
              R: 0.423529446
              G: 0.313725501
              B: 0.227451
              A: 1
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:smart"
            Bool: false
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:utile"
            Float: 1.66460538
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:vtile"
            Float: 1.93266356
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
            Id: 5944808385533113246
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
        Id: 7985385990081687691
        Name: "Rock 03"
        Transform {
          Location {
            X: 51.3813171
            Y: 59.0995865
            Z: 12.0860825
          }
          Rotation {
            Yaw: 174.275757
          }
          Scale {
            X: 0.124845967
            Y: 0.124845967
            Z: 0.124845967
          }
        }
        ParentId: 6041110059677186451
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
            Id: 13710161915374590549
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
        Id: 13619212791144344021
        Name: "Rock 03"
        Transform {
          Location {
            X: 24.0008831
            Y: 72.035965
            Z: 12.0860825
          }
          Rotation {
            Yaw: 118.76622
            Roll: -96.6409302
          }
          Scale {
            X: 0.124845967
            Y: 0.124845967
            Z: 0.124845967
          }
        }
        ParentId: 6041110059677186451
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
            Id: 13710161915374590549
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
        Id: 3478729570779899900
        Name: "Rock 03"
        Transform {
          Location {
            X: -76.4690704
            Y: 29.893261
            Z: 12.0860825
          }
          Rotation {
            Pitch: 59.7458954
            Yaw: 118.025276
            Roll: 29.9920292
          }
          Scale {
            X: 0.124845967
            Y: 0.124845967
            Z: 0.124845967
          }
        }
        ParentId: 6041110059677186451
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
            Id: 13710161915374590549
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
        Id: 12738119848559638976
        Name: "Rock 03"
        Transform {
          Location {
            X: -33.9783897
            Y: 68.4062195
            Z: 12.0860977
          }
          Rotation {
            Yaw: -119.858246
          }
          Scale {
            X: 0.124845967
            Y: 0.124845967
            Z: 0.124845967
          }
        }
        ParentId: 6041110059677186451
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
            Id: 13710161915374590549
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
        Id: 17355380560857626003
        Name: "Rock 03"
        Transform {
          Location {
            X: -75.8313293
            Y: -16.5180511
            Z: 12.0860825
          }
          Rotation {
            Yaw: -41.0248718
          }
          Scale {
            X: 0.124845967
            Y: 0.124845967
            Z: 0.124845967
          }
        }
        ParentId: 6041110059677186451
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
            Id: 13710161915374590549
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
        Id: 16821468623865944157
        Name: "Rock 03"
        Transform {
          Location {
            X: -18.550127
            Y: -76.3514481
            Z: 12.0860825
          }
          Rotation {
            Yaw: -55.5095825
            Roll: -96.6409302
          }
          Scale {
            X: 0.124845967
            Y: 0.124845967
            Z: 0.124845967
          }
        }
        ParentId: 6041110059677186451
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
            Id: 13710161915374590549
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
        Id: 6646324306717011136
        Name: "Rock 03"
        Transform {
          Location {
            X: 78.2766
            Y: 7.60311699
            Z: 12.0860825
          }
          Rotation {
            Pitch: 59.745575
            Yaw: -56.2502136
            Roll: 29.9922199
          }
          Scale {
            X: 0.124845967
            Y: 0.124845967
            Z: 0.124845967
          }
        }
        ParentId: 6041110059677186451
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
            Id: 13710161915374590549
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
        Id: 13961909200143118129
        Name: "Rock 03"
        Transform {
          Location {
            X: 38.3115845
            Y: -64.5381851
            Z: 12.0860977
          }
          Rotation {
            Yaw: 65.8662872
          }
          Scale {
            X: 0.124845967
            Y: 0.124845967
            Z: 0.124845967
          }
        }
        ParentId: 6041110059677186451
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
            Id: 13710161915374590549
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
        Id: 3935746397034915390
        Name: "Rock 03"
        Transform {
          Location {
            X: -7.11307526
            Y: 78.7494888
            Z: 12.0860672
          }
          Rotation {
            Pitch: 59.7456818
            Yaw: 31.1918049
            Roll: 29.9922543
          }
          Scale {
            X: 0.124845967
            Y: 0.124845967
            Z: 0.124845967
          }
        }
        ParentId: 6041110059677186451
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
            Id: 13710161915374590549
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
        Id: 12340267812877747986
        Name: "Rock 03"
        Transform {
          Location {
            X: -57.6620483
            Y: 53.4735832
            Z: 12.0860672
          }
          Rotation {
            Yaw: -86.8345
          }
          Scale {
            X: 0.124845967
            Y: 0.124845967
            Z: 0.124845967
          }
        }
        ParentId: 6041110059677186451
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
            Id: 13710161915374590549
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
        Id: 6192639345022508289
        Name: "Rock 03"
        Transform {
          Location {
            X: -78.4539261
            Y: 10.1317291
            Z: 12.0860672
          }
          Rotation {
            Yaw: -142.343903
            Roll: -96.6408691
          }
          Scale {
            X: 0.124845967
            Y: 0.124845967
            Z: 0.124845967
          }
        }
        ParentId: 6041110059677186451
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
            Id: 13710161915374590549
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
        Id: 5005541931364745882
        Name: "Rock 03"
        Transform {
          Location {
            X: 69.8407669
            Y: 35.1333694
            Z: 12.0860825
          }
          Rotation {
            Yaw: 153.307602
          }
          Scale {
            X: 0.124845967
            Y: 0.124845967
            Z: 0.124845967
          }
        }
        ParentId: 6041110059677186451
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
            Id: 13710161915374590549
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
        Id: 1477002675304685718
        Name: "Rock 03"
        Transform {
          Location {
            X: 71.8519287
            Y: -25.0601978
            Z: 12.0860672
          }
          Rotation {
            Yaw: 31.9322758
            Roll: -96.6409302
          }
          Scale {
            X: 0.124845967
            Y: 0.124845967
            Z: 0.124845967
          }
        }
        ParentId: 6041110059677186451
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
            Id: 13710161915374590549
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
        Id: 13116615491612576398
        Name: "Rock 03"
        Transform {
          Location {
            X: 57.9307022
            Y: -49.1388626
            Z: 12.0860672
          }
          Rotation {
            Yaw: 87.4414673
          }
          Scale {
            X: 0.124845967
            Y: 0.124845967
            Z: 0.124845967
          }
        }
        ParentId: 6041110059677186451
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
            Id: 13710161915374590549
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
        Id: 3534217533055216008
        Name: "Rock 03"
        Transform {
          Location {
            X: 14.7062683
            Y: -76.6233139
            Z: 12.0860672
          }
          Rotation {
            Pitch: 59.7454491
            Yaw: -143.084763
            Roll: 29.9923725
          }
          Scale {
            X: 0.124845967
            Y: 0.124845967
            Z: 0.124845967
          }
        }
        ParentId: 6041110059677186451
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
            Id: 13710161915374590549
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
        Id: 11363981020822920305
        Name: "Rock 03"
        Transform {
          Location {
            X: -42.7832489
            Y: -64.2935562
            Z: 12.0860672
          }
          Rotation {
            Yaw: -20.9679565
          }
          Scale {
            X: 0.124845967
            Y: 0.124845967
            Z: 0.124845967
          }
        }
        ParentId: 6041110059677186451
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
            Id: 13710161915374590549
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
        Id: 5179330729875189303
        Name: "Rock 03"
        Transform {
          Location {
            X: -66.0265884
            Y: -43.9624252
            Z: 12.0860672
          }
          Rotation {
            Yaw: -20.9679871
          }
          Scale {
            X: 0.124845967
            Y: 0.124845967
            Z: 0.124845967
          }
        }
        ParentId: 6041110059677186451
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
            Id: 13710161915374590549
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
        Id: 11353495384951847801
        Name: "Fertilizer"
        Transform {
          Location {
            Z: 8.16935
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 4875789387806808346
        ChildIds: 17978158869713756044
        ChildIds: 2090025485505196373
        ChildIds: 7724104209598779964
        ChildIds: 6187391013426343501
        ChildIds: 14423135426547751132
        ChildIds: 17449698920168838884
        ChildIds: 3903329501385562651
        ChildIds: 12056249190063677696
        ChildIds: 10075622177545606674
        ChildIds: 1563923532587302787
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
        Id: 17978158869713756044
        Name: "Plane Pentagon - One Sided"
        Transform {
          Location {
            X: 28.8922119
            Y: 42.5107422
            Z: 5.51735115
          }
          Rotation {
          }
          Scale {
            X: 0.0869337097
            Y: 0.0869337097
            Z: 0.0921657607
          }
        }
        ParentId: 11353495384951847801
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 5400954658140844837
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:smart"
            Bool: false
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:utile"
            Float: 0.165947258
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:vtile"
            Float: 0.179238558
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:color"
            Color {
              R: 0.0539072715
              G: 0.110000014
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
            Id: 3335558851192617952
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
        Id: 2090025485505196373
        Name: "Plane Pentagon - One Sided"
        Transform {
          Location {
            X: 16.0040283
            Y: 38.6303711
            Z: 6.21146393
          }
          Rotation {
            Yaw: -60.2969971
          }
          Scale {
            X: 0.0869337097
            Y: 0.0869337097
            Z: 0.0921657607
          }
        }
        ParentId: 11353495384951847801
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 5400954658140844837
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:smart"
            Bool: false
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:utile"
            Float: 0.165947258
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:vtile"
            Float: 0.179238558
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:color"
            Color {
              R: 0.0539072715
              G: 0.110000014
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
            Id: 3335558851192617952
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
        Id: 7724104209598779964
        Name: "Plane Pentagon - One Sided"
        Transform {
          Location {
            X: 40.5314941
            Y: 29.3618164
            Z: 5.68795967
          }
          Rotation {
            Yaw: 31.7864246
          }
          Scale {
            X: 0.0869337097
            Y: 0.0869337097
            Z: 0.0921657607
          }
        }
        ParentId: 11353495384951847801
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 5400954658140844837
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:smart"
            Bool: false
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:utile"
            Float: 0.165947258
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:vtile"
            Float: 0.179238558
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:color"
            Color {
              R: 0.0539072715
              G: 0.110000014
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
            Id: 3335558851192617952
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
        Id: 6187391013426343501
        Name: "Plane Pentagon - One Sided"
        Transform {
          Location {
            X: -46.154541
            Y: 6.69921875
            Z: 6.11039543
          }
          Rotation {
            Yaw: 79.370285
          }
          Scale {
            X: 0.0869337097
            Y: 0.0869337097
            Z: 0.0921657607
          }
        }
        ParentId: 11353495384951847801
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 5400954658140844837
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:smart"
            Bool: false
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:utile"
            Float: 0.165947258
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:vtile"
            Float: 0.179238558
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:color"
            Color {
              R: 0.0539072715
              G: 0.110000014
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
            Id: 3335558851192617952
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
        Id: 14423135426547751132
        Name: "Plane Pentagon - One Sided"
        Transform {
          Location {
            X: -22.3770752
            Y: -26.0239258
            Z: 6.45652199
          }
          Rotation {
            Yaw: 19.0735149
          }
          Scale {
            X: 0.0869337097
            Y: 0.0869337097
            Z: 0.0921657607
          }
        }
        ParentId: 11353495384951847801
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 5400954658140844837
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:smart"
            Bool: false
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:utile"
            Float: 0.165947258
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:vtile"
            Float: 0.179238558
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:color"
            Color {
              R: 0.0539072715
              G: 0.110000014
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
            Id: 3335558851192617952
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
        Id: 17449698920168838884
        Name: "Plane Pentagon - One Sided"
        Transform {
          Location {
            X: -30.1513672
            Y: 15.6538086
            Z: 6.71174049
          }
          Rotation {
            Yaw: 111.156715
          }
          Scale {
            X: 0.0869337097
            Y: 0.0869337097
            Z: 0.0921657607
          }
        }
        ParentId: 11353495384951847801
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 5400954658140844837
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:smart"
            Bool: false
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:utile"
            Float: 0.165947258
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:vtile"
            Float: 0.179238558
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:color"
            Color {
              R: 0.0539072715
              G: 0.110000014
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
            Id: 3335558851192617952
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
        Id: 3903329501385562651
        Name: "Plane Pentagon - One Sided"
        Transform {
          Location {
            X: 33.0296631
            Y: -17.9438477
            Z: 6.29507828
          }
          Rotation {
            Yaw: 8.86346149
          }
          Scale {
            X: 0.0869337097
            Y: 0.0869337097
            Z: 0.0921657607
          }
        }
        ParentId: 11353495384951847801
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 5400954658140844837
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:smart"
            Bool: false
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:utile"
            Float: 0.165947258
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:vtile"
            Float: 0.179238558
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:color"
            Color {
              R: 0.0539072715
              G: 0.110000014
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
            Id: 3335558851192617952
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
        Id: 12056249190063677696
        Name: "Plane Pentagon - One Sided"
        Transform {
          Location {
            X: 13.7485352
            Y: -42.3081055
            Z: 6.00124168
          }
          Rotation {
            Yaw: -51.4333801
          }
          Scale {
            X: 0.0869337097
            Y: 0.0869337097
            Z: 0.0921657607
          }
        }
        ParentId: 11353495384951847801
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 5400954658140844837
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:smart"
            Bool: false
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:utile"
            Float: 0.165947258
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:vtile"
            Float: 0.179238558
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:color"
            Color {
              R: 0.0539072715
              G: 0.110000014
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
            Id: 3335558851192617952
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
        Id: 10075622177545606674
        Name: "Plane Pentagon - One Sided"
        Transform {
          Location {
            X: 30.036499
            Y: -36.9887695
            Z: 5.97112656
          }
          Rotation {
            Yaw: 40.6499405
          }
          Scale {
            X: 0.0869337097
            Y: 0.0869337097
            Z: 0.0921657607
          }
        }
        ParentId: 11353495384951847801
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 5400954658140844837
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:smart"
            Bool: false
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:utile"
            Float: 0.165947258
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:vtile"
            Float: 0.179238558
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:color"
            Color {
              R: 0.0539072715
              G: 0.110000014
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
            Id: 3335558851192617952
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
        Id: 1563923532587302787
        Name: "Plane Pentagon - One Sided"
        Transform {
          Location {
            X: -46.1868896
            Y: 27.03125
            Z: 5.85227394
          }
          Rotation {
            Yaw: -51.4334106
          }
          Scale {
            X: 0.0869337097
            Y: 0.0869337097
            Z: 0.0921657607
          }
        }
        ParentId: 11353495384951847801
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 5400954658140844837
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:smart"
            Bool: false
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:utile"
            Float: 0.165947258
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:vtile"
            Float: 0.179238558
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:color"
            Color {
              R: 0.0539072715
              G: 0.110000014
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
            Id: 3335558851192617952
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
        Id: 15489184411741269227
        Name: "ProducerGroup (Plant grows in this spot)"
        Transform {
          Location {
            Z: 15.5522156
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 4875789387806808346
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
    }
    Assets {
      Id: 5944808385533113246
      Name: "Lens - Half"
      PlatformAssetType: 1
      PrimaryAsset {
        AssetType: "StaticMeshAssetRef"
        AssetId: "sm_half_lense_001"
      }
    }
    Assets {
      Id: 5062471689526080153
      Name: "Gravel Raked 01"
      PlatformAssetType: 2
      PrimaryAsset {
        AssetType: "MaterialAssetRef"
        AssetId: "mi_gravel_001_uv"
      }
    }
    Assets {
      Id: 13710161915374590549
      Name: "Rock 03"
      PlatformAssetType: 1
      PrimaryAsset {
        AssetType: "StaticMeshAssetRef"
        AssetId: "sm_rock_generic_003"
      }
    }
    Assets {
      Id: 3335558851192617952
      Name: "Plane Pentagon - One Sided"
      PlatformAssetType: 1
      PrimaryAsset {
        AssetType: "StaticMeshAssetRef"
        AssetId: "sm_plane_pentagon_001"
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
    PrimaryAssetId {
      AssetType: "None"
      AssetId: "None"
    }
  }
  SerializationVersion: 108
  VirtualFolderPath: "Art and Collision - Farm"
  VirtualFolderPath: "Items - Placeable"
}
