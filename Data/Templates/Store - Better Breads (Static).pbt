Assets {
  Id: 15876367832546370197
  Name: "Store - Better Breads (Static)"
  PlatformAssetType: 5
  TemplateAsset {
    ObjectBlock {
      RootId: 9768193896408374662
      Objects {
        Id: 9768193896408374662
        Name: "Store - Better Breads (Static)"
        Transform {
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 5007209984544207371
        ChildIds: 2977324608046888980
        ChildIds: 18184610252859421563
        ChildIds: 3731515722692169462
        ChildIds: 4853927060222214952
        ChildIds: 9479586528530785837
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
        Id: 2977324608046888980
        Name: "Store Catalog Zone  - Better Breads"
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
        ParentId: 9768193896408374662
        ChildIds: 13846193952855401837
        ChildIds: 7958724553171697513
        UnregisteredParameters {
          Overrides {
            Name: "cs:StoreId"
            String: "Better Breads"
          }
          Overrides {
            Name: "cs:DisplayObject"
            ObjectReference {
              SubObjectId: 8328149975967084831
            }
          }
          Overrides {
            Name: "cs:StoreId:tooltip"
            String: "The id for this Store. Must be unique within a scene."
          }
          Overrides {
            Name: "cs:StoreId:isrep"
            Bool: false
          }
          Overrides {
            Name: "cs:StoreId:ml"
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
        Id: 13846193952855401837
        Name: "ClientContext (Outline Highlight Geo)"
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
        ParentId: 2977324608046888980
        ChildIds: 7593380439855869223
        ChildIds: 7696035227976407049
        ChildIds: 17611206995072257717
        ChildIds: 12118716589126360659
        ChildIds: 8328149975967084831
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
        NetworkContext {
        }
        NetworkRelevanceDistance {
          Value: "mc:eproxyrelevance:critical"
        }
      }
      Objects {
        Id: 7593380439855869223
        Name: "StoreCatalogZoneClient"
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
        ParentId: 13846193952855401837
        UnregisteredParameters {
          Overrides {
            Name: "cs:ComponentRoot"
            ObjectReference {
              SubObjectId: 2977324608046888980
            }
          }
          Overrides {
            Name: "cs:OutlineObject"
            ObjectReference {
              SubObjectId: 12118716589126360659
            }
          }
          Overrides {
            Name: "cs:BroadcastEventComponent"
            ObjectReference {
              SubObjectId: 7696035227976407049
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
            Id: 1690922883408709653
          }
        }
        NetworkRelevanceDistance {
          Value: "mc:eproxyrelevance:critical"
        }
      }
      Objects {
        Id: 7696035227976407049
        Name: "BroadcastEventComponentClient"
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
        ParentId: 13846193952855401837
        UnregisteredParameters {
          Overrides {
            Name: "cs:EventName"
            String: "PCH_storeCatalogClicked"
          }
          Overrides {
            Name: "cs:BroadcastOnEndPress"
            Bool: true
          }
          Overrides {
            Name: "cs:APIInputModule"
            AssetReference {
              Id: 10732033861455687124
            }
          }
          Overrides {
            Name: "cs:ComponentRoot"
            ObjectReference {
              SubObjectId: 2977324608046888980
            }
          }
          Overrides {
            Name: "cs:SubTarget"
            ObjectReference {
            }
          }
          Overrides {
            Name: "cs:APIInteractionModule"
            AssetReference {
              Id: 10732033861455687124
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
            Id: 1811470417276014342
          }
        }
        NetworkRelevanceDistance {
          Value: "mc:eproxyrelevance:critical"
        }
      }
      Objects {
        Id: 17611206995072257717
        Name: "ToggleVisibilityComponentClient"
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
        ParentId: 13846193952855401837
        UnregisteredParameters {
          Overrides {
            Name: "cs:ObjectToToggle"
            ObjectReference {
              SubObjectId: 12118716589126360659
            }
          }
          Overrides {
            Name: "cs:APIInputModule"
            AssetReference {
              Id: 10732033861455687124
            }
          }
          Overrides {
            Name: "cs:ComponentRoot"
            ObjectReference {
              SubObjectId: 2977324608046888980
            }
          }
          Overrides {
            Name: "cs:ShowOnBeginHover"
            Bool: true
          }
          Overrides {
            Name: "cs:HideOnEndHover"
            Bool: true
          }
          Overrides {
            Name: "cs:APIInteractionModule"
            AssetReference {
              Id: 10732033861455687124
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
            Id: 16915898860301085516
          }
        }
        NetworkRelevanceDistance {
          Value: "mc:eproxyrelevance:critical"
        }
      }
      Objects {
        Id: 12118716589126360659
        Name: "Outline Object"
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
        ParentId: 13846193952855401837
        UnregisteredParameters {
          Overrides {
            Name: "bp:Color A"
            Color {
              R: 3
              G: 0.62938571
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
            Id: 6960732735939662151
          }
          TeamSettings {
          }
        }
        NetworkRelevanceDistance {
          Value: "mc:eproxyrelevance:critical"
        }
      }
      Objects {
        Id: 8328149975967084831
        Name: "Highlight Geo"
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
        ParentId: 13846193952855401837
        ChildIds: 17801447808427712268
        ChildIds: 7388999841839225977
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
        Id: 17801447808427712268
        Name: "Table Food"
        Transform {
          Location {
            X: -18.0552368
            Y: 198.927368
            Z: 124.829773
          }
          Rotation {
            Yaw: 123.741356
          }
          Scale {
            X: 0.99999994
            Y: 0.99999994
            Z: 0.99999994
          }
        }
        ParentId: 8328149975967084831
        ChildIds: 10859111142832309569
        ChildIds: 2439188309447711637
        ChildIds: 10747123183546053776
        ChildIds: 12606062935707327818
        ChildIds: 13071430288014492066
        ChildIds: 14897635423639372211
        ChildIds: 8881212082415705998
        ChildIds: 7121491701540849230
        ChildIds: 1643188638963425543
        ChildIds: 15165706791878441915
        ChildIds: 15040687813844924148
        ChildIds: 6168055840513025936
        ChildIds: 1209414764409095195
        ChildIds: 14289419785436015699
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
        Id: 10859111142832309569
        Name: "Food - Watermelon Rose (Drop)"
        Transform {
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 17801447808427712268
        TemplateInstance {
          ParameterOverrideMap {
            key: 849183209554644704
            value {
              Overrides {
                Name: "Name"
                String: "Food - Watermelon Rose (Drop)"
              }
              Overrides {
                Name: "Position"
                Vector {
                  X: 33.0725441
                  Y: 64.4043884
                  Z: -11.7736444
                }
              }
              Overrides {
                Name: "Rotation"
                Rotator {
                  Yaw: -123.741364
                }
              }
              Overrides {
                Name: "Scale"
                Vector {
                  X: 1.00000012
                  Y: 1.00000012
                  Z: 1.00000012
                }
              }
            }
          }
          TemplateAsset {
            Id: 12700976144121803052
          }
        }
      }
      Objects {
        Id: 2439188309447711637
        Name: "Food - Watermelon Fruit Salad (Drop)"
        Transform {
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 17801447808427712268
        TemplateInstance {
          ParameterOverrideMap {
            key: 4153133701486907879
            value {
              Overrides {
                Name: "Name"
                String: "Food - Watermelon Fruit Salad (Drop)"
              }
              Overrides {
                Name: "Position"
                Vector {
                  X: -8.41969
                  Y: 46.8859
                  Z: -11.7736292
                }
              }
              Overrides {
                Name: "Rotation"
                Rotator {
                  Yaw: -123.741364
                }
              }
              Overrides {
                Name: "Scale"
                Vector {
                  X: 0.708331943
                  Y: 0.708331943
                  Z: 0.708331943
                }
              }
            }
          }
          TemplateAsset {
            Id: 17418262434590097794
          }
        }
      }
      Objects {
        Id: 10747123183546053776
        Name: "Food - Watermelon Fruit Salad (Drop)"
        Transform {
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 17801447808427712268
        TemplateInstance {
          ParameterOverrideMap {
            key: 4153133701486907879
            value {
              Overrides {
                Name: "Name"
                String: "Food - Watermelon Fruit Salad (Drop)"
              }
              Overrides {
                Name: "Position"
                Vector {
                  X: 63.3349075
                  Y: 26.3963737
                  Z: -11.7736368
                }
              }
              Overrides {
                Name: "Rotation"
                Rotator {
                  Yaw: -123.741364
                }
              }
              Overrides {
                Name: "Scale"
                Vector {
                  X: 0.708331943
                  Y: 0.708331943
                  Z: 0.708331943
                }
              }
            }
          }
          TemplateAsset {
            Id: 17418262434590097794
          }
        }
      }
      Objects {
        Id: 12606062935707327818
        Name: "Food - Veggie Plate (Drop)"
        Transform {
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 17801447808427712268
        TemplateInstance {
          ParameterOverrideMap {
            key: 11448985477379358031
            value {
              Overrides {
                Name: "Name"
                String: "Food - Veggie Plate (Drop)"
              }
              Overrides {
                Name: "Position"
                Vector {
                  X: 12.2833185
                  Y: 3.86686373
                  Z: -11.7736597
                }
              }
              Overrides {
                Name: "Rotation"
                Rotator {
                  Yaw: -123.741364
                }
              }
              Overrides {
                Name: "Scale"
                Vector {
                  X: 1.00000012
                  Y: 1.00000012
                  Z: 1.00000012
                }
              }
            }
          }
          TemplateAsset {
            Id: 5738036306637666230
          }
        }
      }
      Objects {
        Id: 13071430288014492066
        Name: "Food - Spagetti (Drop)"
        Transform {
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 17801447808427712268
        TemplateInstance {
          ParameterOverrideMap {
            key: 1170608786576951318
            value {
              Overrides {
                Name: "Name"
                String: "Food - Spagetti (Drop)"
              }
              Overrides {
                Name: "Position"
                Vector {
                  X: -185.804977
                  Y: 75.5771866
                  Z: -11.7736444
                }
              }
              Overrides {
                Name: "Rotation"
                Rotator {
                  Yaw: -123.741356
                }
              }
              Overrides {
                Name: "Scale"
                Vector {
                  X: 1.00000012
                  Y: 1.00000012
                  Z: 1.00000012
                }
              }
            }
          }
          TemplateAsset {
            Id: 5065030205467996962
          }
        }
      }
      Objects {
        Id: 14897635423639372211
        Name: "Food - Spagetti (Drop)"
        Transform {
          Location {
            X: -730.181885
            Y: -1341.94202
            Z: 113.056252
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 17801447808427712268
        TemplateInstance {
          ParameterOverrideMap {
            key: 1170608786576951318
            value {
              Overrides {
                Name: "Name"
                String: "Food - Spagetti (Drop)"
              }
              Overrides {
                Name: "Position"
                Vector {
                  X: -225.201752
                  Y: 67.9001236
                  Z: -11.7736444
                }
              }
              Overrides {
                Name: "Rotation"
                Rotator {
                  Yaw: -123.741356
                }
              }
              Overrides {
                Name: "Scale"
                Vector {
                  X: 1.00000012
                  Y: 1.00000012
                  Z: 1.00000012
                }
              }
            }
          }
          TemplateAsset {
            Id: 5065030205467996962
          }
        }
      }
      Objects {
        Id: 8881212082415705998
        Name: "Food - Tofu Udon (Drop)"
        Transform {
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 17801447808427712268
        TemplateInstance {
          ParameterOverrideMap {
            key: 6883031984154726749
            value {
              Overrides {
                Name: "Name"
                String: "Food - Tofu Udon (Drop)"
              }
              Overrides {
                Name: "Position"
                Vector {
                  X: -153.325363
                  Y: 49.2912674
                  Z: -11.7736444
                }
              }
              Overrides {
                Name: "Rotation"
                Rotator {
                  Yaw: -123.741356
                }
              }
              Overrides {
                Name: "Scale"
                Vector {
                  X: 1.00000012
                  Y: 1.00000012
                  Z: 1.00000012
                }
              }
            }
          }
          TemplateAsset {
            Id: 15049822578451219957
          }
        }
      }
      Objects {
        Id: 7121491701540849230
        Name: "Food - Tofu Udon (Drop)"
        Transform {
          Location {
            X: -726.36438
            Y: -1300.33313
            Z: 113.056252
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 17801447808427712268
        TemplateInstance {
          ParameterOverrideMap {
            key: 6883031984154726749
            value {
              Overrides {
                Name: "Name"
                String: "Food - Tofu Udon (Drop)"
              }
              Overrides {
                Name: "Position"
                Vector {
                  X: -190.823349
                  Y: 35.3971
                  Z: -11.7736444
                }
              }
              Overrides {
                Name: "Rotation"
                Rotator {
                  Yaw: 128.686661
                }
              }
              Overrides {
                Name: "Scale"
                Vector {
                  X: 1.00000012
                  Y: 1.00000012
                  Z: 1.00000012
                }
              }
            }
          }
          TemplateAsset {
            Id: 15049822578451219957
          }
        }
      }
      Objects {
        Id: 1643188638963425543
        Name: "Food - Tofu Udon (Drop)"
        Transform {
          Location {
            X: -693.982544
            Y: -1323.79724
            Z: 113.056252
          }
          Rotation {
            Yaw: -107.571976
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 17801447808427712268
        TemplateInstance {
          ParameterOverrideMap {
            key: 6883031984154726749
            value {
              Overrides {
                Name: "Name"
                String: "Food - Tofu Udon (Drop)"
              }
              Overrides {
                Name: "Position"
                Vector {
                  X: -229.192871
                  Y: 28.132267
                  Z: -11.7736444
                }
              }
              Overrides {
                Name: "Rotation"
                Rotator {
                  Yaw: 75.3069458
                }
              }
              Overrides {
                Name: "Scale"
                Vector {
                  X: 1.00000012
                  Y: 1.00000012
                  Z: 1.00000012
                }
              }
            }
          }
          TemplateAsset {
            Id: 15049822578451219957
          }
        }
      }
      Objects {
        Id: 15165706791878441915
        Name: "Food - Mushroom Perogies (Drop)"
        Transform {
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 17801447808427712268
        TemplateInstance {
          ParameterOverrideMap {
            key: 9759727946021794796
            value {
              Overrides {
                Name: "Name"
                String: "Food - Mushroom Perogies (Drop)"
              }
              Overrides {
                Name: "Position"
                Vector {
                  X: -171.299469
                  Y: -2.1121676
                  Z: -11.7736292
                }
              }
              Overrides {
                Name: "Rotation"
                Rotator {
                  Yaw: -123.741364
                }
              }
              Overrides {
                Name: "Scale"
                Vector {
                  X: 1.00000012
                  Y: 1.00000012
                  Z: 1.00000012
                }
              }
            }
          }
          TemplateAsset {
            Id: 5022835681268602
          }
        }
      }
      Objects {
        Id: 15040687813844924148
        Name: "Food - Mushroom Perogies (Drop)"
        Transform {
          Location {
            X: -657.858704
            Y: -1304.2334
            Z: 113.056267
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 17801447808427712268
        TemplateInstance {
          ParameterOverrideMap {
            key: 9759727946021794796
            value {
              Overrides {
                Name: "Name"
                String: "Food - Mushroom Perogies (Drop)"
              }
              Overrides {
                Name: "Position"
                Vector {
                  X: -208.725555
                  Y: -2.72305322
                  Z: -11.7736292
                }
              }
              Overrides {
                Name: "Rotation"
                Rotator {
                  Yaw: -34.6500244
                }
              }
              Overrides {
                Name: "Scale"
                Vector {
                  X: 1.00000012
                  Y: 1.00000012
                  Z: 1.00000012
                }
              }
            }
          }
          TemplateAsset {
            Id: 5022835681268602
          }
        }
      }
      Objects {
        Id: 6168055840513025936
        Name: "Food - Wine (Drop)"
        Transform {
          Location {
            X: -809.487183
            Y: -1224.7876
            Z: 113.056252
          }
          Rotation {
            Yaw: 116.955566
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 17801447808427712268
        TemplateInstance {
          ParameterOverrideMap {
            key: 3272743836786489335
            value {
              Overrides {
                Name: "Position"
                Vector {
                  Z: 30.219162
                }
              }
              Overrides {
                Name: "Rotation"
                Rotator {
                  Yaw: 176.239395
                }
              }
            }
          }
          ParameterOverrideMap {
            key: 14373184181610574341
            value {
              Overrides {
                Name: "Name"
                String: "Food - Wine (Drop)"
              }
              Overrides {
                Name: "Position"
                Vector {
                  X: -61.9739075
                  Y: 68.2669525
                  Z: -11.7736444
                }
              }
              Overrides {
                Name: "Rotation"
                Rotator {
                  Yaw: -15.9890747
                }
              }
              Overrides {
                Name: "Scale"
                Vector {
                  X: 1.00000012
                  Y: 1.00000012
                  Z: 1.00000012
                }
              }
            }
          }
          TemplateAsset {
            Id: 14023630770308526360
          }
        }
      }
      Objects {
        Id: 1209414764409095195
        Name: "Food - Wine (Drop)"
        Transform {
          Location {
            X: -792.884338
            Y: -1234.90942
            Z: 113.056252
          }
          Rotation {
            Yaw: 107.752274
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 17801447808427712268
        TemplateInstance {
          ParameterOverrideMap {
            key: 3272743836786489335
            value {
              Overrides {
                Name: "Position"
                Vector {
                  Z: 30.219162
                }
              }
              Overrides {
                Name: "Rotation"
                Rotator {
                  Yaw: 176.239395
                }
              }
            }
          }
          ParameterOverrideMap {
            key: 14373184181610574341
            value {
              Overrides {
                Name: "Name"
                String: "Food - Wine (Drop)"
              }
              Overrides {
                Name: "Position"
                Vector {
                  X: -48.8618
                  Y: 56.3469963
                  Z: -11.7736444
                }
              }
              Overrides {
                Name: "Rotation"
                Rotator {
                  Yaw: 50.0131836
                }
              }
              Overrides {
                Name: "Scale"
                Vector {
                  X: 1.00000012
                  Y: 1.00000012
                  Z: 1.00000012
                }
              }
            }
          }
          TemplateAsset {
            Id: 14023630770308526360
          }
        }
      }
      Objects {
        Id: 14289419785436015699
        Name: "Food - Wine (Drop)"
        Transform {
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 17801447808427712268
        TemplateInstance {
          ParameterOverrideMap {
            key: 3272743836786489335
            value {
              Overrides {
                Name: "Position"
                Vector {
                  Z: 30.219162
                }
              }
              Overrides {
                Name: "Rotation"
                Rotator {
                  Yaw: 176.239395
                }
              }
            }
          }
          ParameterOverrideMap {
            key: 14373184181610574341
            value {
              Overrides {
                Name: "Name"
                String: "Food - Wine (Drop)"
              }
              Overrides {
                Name: "Position"
                Vector {
                  X: -44.3351059
                  Y: 76.4509888
                  Z: -11.7736444
                }
              }
              Overrides {
                Name: "Rotation"
                Rotator {
                  Yaw: -6.7857666
                }
              }
              Overrides {
                Name: "Scale"
                Vector {
                  X: 1.00000012
                  Y: 1.00000012
                  Z: 1.00000012
                }
              }
            }
          }
          TemplateAsset {
            Id: 14023630770308526360
          }
        }
      }
      Objects {
        Id: 7388999841839225977
        Name: "Rack Food"
        Transform {
          Location {
            X: 142.501831
            Y: -98.9191895
            Z: 28.7328491
          }
          Rotation {
            Yaw: 123.741356
          }
          Scale {
            X: 0.99999994
            Y: 0.99999994
            Z: 0.99999994
          }
        }
        ParentId: 8328149975967084831
        ChildIds: 15755765007474341683
        ChildIds: 12079849347345950828
        ChildIds: 17281465133109364018
        ChildIds: 18384041452797679110
        ChildIds: 10155118672964216861
        ChildIds: 12833515703966736911
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
        Id: 15755765007474341683
        Name: "Food - Bread (Drop)"
        Transform {
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 7388999841839225977
        TemplateInstance {
          ParameterOverrideMap {
            key: 5014795977169897250
            value {
              Overrides {
                Name: "Name"
                String: "Food - Bread (Drop)"
              }
              Overrides {
                Name: "Position"
                Vector {
                  X: 30.9797611
                  Y: -1.25867093
                  Z: 103.274368
                }
              }
              Overrides {
                Name: "Rotation"
                Rotator {
                  Yaw: 179.451401
                }
              }
              Overrides {
                Name: "Scale"
                Vector {
                  X: 1.00000012
                  Y: 1.00000012
                  Z: 1.00000012
                }
              }
            }
          }
          TemplateAsset {
            Id: 1340403945222207023
          }
        }
      }
      Objects {
        Id: 12079849347345950828
        Name: "Food - Bread (Drop)"
        Transform {
          Location {
            X: -626.143616
            Y: -1416.84241
            Z: 132.007324
          }
          Rotation {
            Yaw: -56.8072205
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 7388999841839225977
        TemplateInstance {
          ParameterOverrideMap {
            key: 5014795977169897250
            value {
              Overrides {
                Name: "Name"
                String: "Food - Bread (Drop)"
              }
              Overrides {
                Name: "Position"
                Vector {
                  X: -2.11804223
                  Y: -0.941779137
                  Z: 103.274368
                }
              }
              Overrides {
                Name: "Rotation"
                Rotator {
                  Yaw: 179.451416
                }
              }
              Overrides {
                Name: "Scale"
                Vector {
                  X: 1.00000012
                  Y: 1.00000012
                  Z: 1.00000012
                }
              }
            }
          }
          TemplateAsset {
            Id: 1340403945222207023
          }
        }
      }
      Objects {
        Id: 17281465133109364018
        Name: "Food - Apple Pie (Drop)"
        Transform {
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 7388999841839225977
        TemplateInstance {
          ParameterOverrideMap {
            key: 2666442937519499677
            value {
              Overrides {
                Name: "Name"
                String: "Food - Apple Pie (Drop)"
              }
              Overrides {
                Name: "Position"
                Vector {
                  X: 12.9083014
                  Y: 5.90621138
                  Z: -5.662251
                }
              }
              Overrides {
                Name: "Rotation"
                Rotator {
                  Yaw: -123.741356
                }
              }
              Overrides {
                Name: "Scale"
                Vector {
                  X: 1.00000012
                  Y: 1.00000012
                  Z: 1.00000012
                }
              }
            }
          }
          TemplateAsset {
            Id: 8547475913219138070
          }
        }
      }
      Objects {
        Id: 18384041452797679110
        Name: "Food - Bread (Drop)"
        Transform {
          Location {
            X: -608.023132
            Y: -1444.54102
            Z: 132.007324
          }
          Rotation {
            Yaw: -56.8072128
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 7388999841839225977
        TemplateInstance {
          ParameterOverrideMap {
            key: 5014795977169897250
            value {
              Overrides {
                Name: "Name"
                String: "Food - Bread (Drop)"
              }
              Overrides {
                Name: "Position"
                Vector {
                  X: -36.6454811
                  Y: -0.611213744
                  Z: 103.274368
                }
              }
              Overrides {
                Name: "Rotation"
                Rotator {
                  Yaw: 179.451431
                }
              }
              Overrides {
                Name: "Scale"
                Vector {
                  X: 1.00000012
                  Y: 1.00000012
                  Z: 1.00000012
                }
              }
            }
          }
          TemplateAsset {
            Id: 1340403945222207023
          }
        }
      }
      Objects {
        Id: 10155118672964216861
        Name: "Food - Apple Pie (Drop)"
        Transform {
          Location {
            X: -622.063904
            Y: -1435.84949
            Z: 23.0707207
          }
          Rotation {
            Yaw: -1.7075472e-05
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 7388999841839225977
        TemplateInstance {
          ParameterOverrideMap {
            key: 2666442937519499677
            value {
              Overrides {
                Name: "Name"
                String: "Food - Apple Pie (Drop)"
              }
              Overrides {
                Name: "Position"
                Vector {
                  X: 24.9386082
                  Y: -0.672733366
                  Z: 50.4176865
                }
              }
              Overrides {
                Name: "Rotation"
                Rotator {
                  Yaw: 114.109024
                }
              }
              Overrides {
                Name: "Scale"
                Vector {
                  X: 1.00000012
                  Y: 1.00000012
                  Z: 1.00000012
                }
              }
            }
          }
          TemplateAsset {
            Id: 8547475913219138070
          }
        }
      }
      Objects {
        Id: 12833515703966736911
        Name: "Food - Apple Pie (Drop)"
        Transform {
          Location {
            X: -623.27533
            Y: -1422.19141
            Z: 79.15065
          }
          Rotation {
            Yaw: -122.149651
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 7388999841839225977
        TemplateInstance {
          ParameterOverrideMap {
            key: 2666442937519499677
            value {
              Overrides {
                Name: "Name"
                String: "Food - Apple Pie (Drop)"
              }
              Overrides {
                Name: "Position"
                Vector {
                  X: -29.3441048
                  Y: -1.05524075
                  Z: 50.417778
                }
              }
              Overrides {
                Name: "Rotation"
                Rotator {
                  Yaw: -163.555466
                }
              }
              Overrides {
                Name: "Scale"
                Vector {
                  X: 1.00000012
                  Y: 1.00000012
                  Z: 1.00000012
                }
              }
            }
          }
          TemplateAsset {
            Id: 8547475913219138070
          }
        }
      }
      Objects {
        Id: 7958724553171697513
        Name: "StaticContext (Catalog Collider)"
        Transform {
          Location {
          }
          Rotation {
            Yaw: 35
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 2977324608046888980
        ChildIds: 4461258009741296916
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
        NetworkContext {
          Type: RuntimeStatic
        }
        NetworkRelevanceDistance {
          Value: "mc:eproxyrelevance:critical"
        }
      }
      Objects {
        Id: 4461258009741296916
        Name: "Collider"
        Transform {
          Location {
            X: 65.3434296
            Y: 13.3019047
            Z: -11.4783897
          }
          Rotation {
          }
          Scale {
            X: 0.999999285
            Y: 5.12342882
            Z: 1.5623703
          }
        }
        ParentId: 7958724553171697513
        ChildIds: 7481341927438574631
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:color"
            Color {
              R: 1
              A: 1
            }
          }
        }
        Collidable_v2 {
          Value: "mc:ecollisionsetting:forceon"
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
        Relevance {
          Value: "mc:eproxyrelevance:critical"
        }
        NetworkRelevanceDistance {
          Value: "mc:eproxyrelevance:critical"
        }
      }
      Objects {
        Id: 7481341927438574631
        Name: "Dummy Object"
        Transform {
          Location {
            Z: 50.2384186
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 4461258009741296916
        UnregisteredParameters {
          Overrides {
            Name: "bp:Type"
            Enum {
              Value: "mc:evolumetype:0"
            }
          }
          Overrides {
            Name: "bp:Absolute Scale"
            Bool: false
          }
          Overrides {
            Name: "bp:Shape Visibility"
            Enum {
              Value: "mc:evolumevisibility:newenumerator1"
            }
          }
        }
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:forceon"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        EditorIndicatorVisibility {
          Value: "mc:eindicatorvisibility:visiblewhenselected"
        }
        Blueprint {
          BlueprintAsset {
            Id: 6442861049751997091
          }
          TeamSettings {
          }
        }
        NetworkRelevanceDistance {
          Value: "mc:eproxyrelevance:critical"
        }
      }
      Objects {
        Id: 18184610252859421563
        Name: "NPC Tip Bubble"
        Transform {
          Location {
            X: -54.1737061
            Y: 59.401123
            Z: 110.058144
          }
          Rotation {
            Yaw: 33.0962296
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 9768193896408374662
        ChildIds: 12003733402072581585
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
        Id: 12003733402072581585
        Name: "ClientContext"
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
        ParentId: 18184610252859421563
        ChildIds: 11915174166947287634
        ChildIds: 15164056744334686711
        ChildIds: 12547863396430704326
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
        Id: 11915174166947287634
        Name: "ToggleVisibilityComponentClient"
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
        ParentId: 12003733402072581585
        UnregisteredParameters {
          Overrides {
            Name: "cs:ComponentRoot"
            ObjectReference {
              SubObjectId: 18184610252859421563
            }
          }
          Overrides {
            Name: "cs:APIInteractionModule"
            AssetReference {
              Id: 5787245947590458132
            }
          }
          Overrides {
            Name: "cs:ObjectToToggle"
            ObjectReference {
              SubObjectId: 15164056744334686711
            }
          }
          Overrides {
            Name: "cs:ShowOnBeginHover"
            Bool: true
          }
          Overrides {
            Name: "cs:HideOnEndHover"
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
            Id: 16915898860301085516
          }
        }
        NetworkRelevanceDistance {
          Value: "mc:eproxyrelevance:critical"
        }
      }
      Objects {
        Id: 15164056744334686711
        Name: "Bubble"
        Transform {
          Location {
            Z: 116.248894
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 12003733402072581585
        ChildIds: 9317393038950271850
        ChildIds: 124035443679978609
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
        Id: 9317393038950271850
        Name: "BillboardClient"
        Transform {
          Location {
            Z: -163.11084
          }
          Rotation {
          }
          Scale {
            X: 1.04065251
            Y: 1.52078342
            Z: 1.52078342
          }
        }
        ParentId: 15164056744334686711
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
            Id: 16010559800796464966
          }
        }
        NetworkRelevanceDistance {
          Value: "mc:eproxyrelevance:critical"
        }
      }
      Objects {
        Id: 124035443679978609
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
        ParentId: 15164056744334686711
        ChildIds: 16899016851181951958
        ChildIds: 2527839611432209323
        ChildIds: 6328190659681141635
        ChildIds: 6651629302113356273
        ChildIds: 15833887577414445448
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
        Id: 16899016851181951958
        Name: "World Text"
        Transform {
          Location {
            X: 1.60929871
            Y: -0.389556885
            Z: 79.9790039
          }
          Rotation {
          }
          Scale {
            X: 0.508537471
            Y: 0.508537471
            Z: 0.508537471
          }
        }
        ParentId: 124035443679978609
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
        Text {
          Text: "Welcome to town!\r\nI buy foods crafted using\r\nthe Wood Cook Stove. Make\r\none on the Crafting Table."
          FontAsset {
          }
          Color {
            A: 1
          }
          HorizontalAlignment {
            Value: "mc:ecoretexthorizontalalign:center"
          }
          VerticalAlignment {
            Value: "mc:ecoretextverticalalign:center"
          }
        }
        NetworkRelevanceDistance {
          Value: "mc:eproxyrelevance:critical"
        }
      }
      Objects {
        Id: 2527839611432209323
        Name: "Cylinder"
        Transform {
          Location {
            Z: 77.5336914
          }
          Rotation {
            Pitch: -90
          }
          Scale {
            X: 0.890774488
            Y: 1.55430388
            Z: 0.0248951092
          }
        }
        ParentId: 124035443679978609
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 12827530473249900764
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
        Relevance {
          Value: "mc:eproxyrelevance:critical"
        }
        NetworkRelevanceDistance {
          Value: "mc:eproxyrelevance:critical"
        }
      }
      Objects {
        Id: 6328190659681141635
        Name: "Cylinder"
        Transform {
          Location {
            Z: 77.5336914
          }
          Rotation {
            Pitch: -90
          }
          Scale {
            X: 0.927471697
            Y: 1.59930646
            Z: 0.0147335092
          }
        }
        ParentId: 124035443679978609
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 12827530473249900764
            }
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
        Relevance {
          Value: "mc:eproxyrelevance:critical"
        }
        NetworkRelevanceDistance {
          Value: "mc:eproxyrelevance:critical"
        }
      }
      Objects {
        Id: 6651629302113356273
        Name: "Prism - 3-Sided"
        Transform {
          Location {
            X: 1.181427
            Z: 26.010376
          }
          Rotation {
            Pitch: -2.04905664e-05
            Yaw: -89.9999542
            Roll: 89.9999542
          }
          Scale {
            X: 0.304624617
            Y: 0.334700197
            Z: 0.0248945449
          }
        }
        ParentId: 124035443679978609
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 12827530473249900764
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
        Id: 15833887577414445448
        Name: "Prism - 3-Sided"
        Transform {
          Location {
            X: 0.74055481
            Z: 26.010376
          }
          Rotation {
            Yaw: -89.9999695
            Roll: 89.9999542
          }
          Scale {
            X: 0.368649572
            Y: 0.39578259
            Z: 0.0147631178
          }
        }
        ParentId: 124035443679978609
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 12827530473249900764
            }
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
            Id: 11627317353827155956
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
        Id: 12547863396430704326
        Name: "Trigger"
        Transform {
          Location {
            X: 228.014542
            Y: -2.86102295e-05
          }
          Rotation {
          }
          Scale {
            X: 4.89546824
            Y: 4.39262199
            Z: 2.14196157
          }
        }
        ParentId: 12003733402072581585
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
          Value: "mc:eindicatorvisibility:visiblewhenselected"
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
      Objects {
        Id: 3731515722692169462
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
        ParentId: 9768193896408374662
        ChildIds: 3946769913859084450
        ChildIds: 1107723860240299331
        ChildIds: 14824212811512601903
        ChildIds: 9252236959091332064
        ChildIds: 14516863235533904127
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
        Id: 3946769913859084450
        Name: "Humanoid 2 Rig"
        Transform {
          Location {
            X: -56.848877
            Y: 56.7716064
            Z: 110.308685
          }
          Rotation {
            Yaw: 33.7413788
          }
          Scale {
            X: 1.04999983
            Y: 1.04999983
            Z: 1.04999983
          }
        }
        ParentId: 3731515722692169462
        UnregisteredParameters {
          Overrides {
            Name: "ma:0:Shared_Detail2:color"
            Color {
              G: 0.127483398
              B: 0.350000024
              A: 1
            }
          }
          Overrides {
            Name: "ma:2:Shared_BaseMaterial:color"
            Color {
              R: 0.556000054
              G: 0.556000054
              B: 0.556000054
              A: 1
            }
          }
          Overrides {
            Name: "ma:1:Shared_Detail1:id"
            AssetReference {
              Id: 3202444740296431605
            }
          }
          Overrides {
            Name: "ma:1:Shared_Detail2:id"
            AssetReference {
              Id: 3202444740296431605
            }
          }
          Overrides {
            Name: "ma:2:Shared_Detail2:color"
            Color {
              R: 0.0400000028
              G: 0.0400000028
              B: 0.0400000028
              A: 1
            }
          }
          Overrides {
            Name: "ma:2:Shared_Detail1:color"
            Color {
              R: 0.25
              G: 0.242188
              B: 0.249632
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
            Id: 9269274393121603883
          }
          Teams {
            IsTeamCollisionEnabled: true
            IsEnemyCollisionEnabled: true
          }
          AnimatedMesh {
            AnimationStance: "unarmed_idle_relaxed"
            AnimationStancePlaybackRate: 1
            AnimationStanceShouldLoop: true
            AnimationPlaybackRateMultiplier: 1
            PlayOnStartAnimation {
              PlaybackRate: 1
            }
            SkinnedMeshes {
              Id: 10238773178219091350
            }
            SkinnedMeshes {
              Id: 10183599803954570520
            }
            SkinnedMeshes {
              Id: 7103526684147204861
            }
            SkinnedMeshes {
              Id: 4832378061934751573
            }
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
        Id: 1107723860240299331
        Name: "NPC Face Lights"
        Transform {
          Location {
            X: -2.92706299
            Y: 95.6025391
            Z: 201.138184
          }
          Rotation {
            Yaw: 31.2207966
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 3731515722692169462
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
        Light {
          Intensity: 1
          Color {
            R: 1
            G: 1
            B: 1
            A: 1
          }
          VolumetricIntensity: 5
          TeamSettings {
          }
          Light {
            Temperature: 6500
            LocalLight {
              AttenuationRadius: 1000
              PointLight {
                SourceRadius: 20
                SoftSourceRadius: 20
                FallOffExponent: 8
              }
            }
            MaxDrawDistance: 5000
            MaxDistanceFadeRange: 1000
          }
          ShadowBias: 0.4
          ShadowSlopeBias: 0.6
        }
        NetworkRelevanceDistance {
          Value: "mc:eproxyrelevance:critical"
        }
      }
      Objects {
        Id: 14824212811512601903
        Name: "Tent Details"
        Transform {
          Location {
            X: 25.4981689
            Y: 36.7216797
            Z: 343.216766
          }
          Rotation {
            Yaw: -56.2585831
          }
          Scale {
            X: 0.789198875
            Y: 0.789198875
            Z: 0.789198875
          }
        }
        ParentId: 3731515722692169462
        ChildIds: 14700294202094454532
        ChildIds: 17318718485095785783
        ChildIds: 17352758308983085605
        ChildIds: 1278245725268601264
        ChildIds: 1148521986039516692
        ChildIds: 4652661066691235920
        ChildIds: 2213622946483768752
        ChildIds: 603583099366782923
        ChildIds: 17118108067217826757
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
        Id: 14700294202094454532
        Name: "Cylinder - Bottom-Aligned"
        Transform {
          Location {
            X: -340.200317
            Y: 0.646325707
            Z: -435.919525
          }
          Rotation {
            Yaw: 179.999954
          }
          Scale {
            X: 0.55225271
            Y: 0.55225271
            Z: 0.0761983544
          }
        }
        ParentId: 14824212811512601903
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 13558678829997240470
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
            Id: 14591179733043103761
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
        Id: 17318718485095785783
        Name: "Cylinder - Bottom-Aligned"
        Transform {
          Location {
            X: -340.200317
            Y: 0.646325707
            Z: -435.919525
          }
          Rotation {
            Yaw: 179.999954
          }
          Scale {
            X: 0.343860388
            Y: 0.343860388
            Z: 0.56058
          }
        }
        ParentId: 14824212811512601903
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 13558678829997240470
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
            Id: 14591179733043103761
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
        Id: 17352758308983085605
        Name: "Cylinder - Bottom-Aligned"
        Transform {
          Location {
            X: 339.378082
            Y: 0.645839572
            Z: -435.919525
          }
          Rotation {
            Yaw: 179.999954
          }
          Scale {
            X: 0.343860388
            Y: 0.343860388
            Z: 0.56058
          }
        }
        ParentId: 14824212811512601903
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 13558678829997240470
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
            Id: 14591179733043103761
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
        Id: 1278245725268601264
        Name: "Cylinder - Bottom-Aligned"
        Transform {
          Location {
            X: 339.378082
            Y: 0.645839572
            Z: -435.919525
          }
          Rotation {
            Yaw: 179.999954
          }
          Scale {
            X: 0.55225271
            Y: 0.55225271
            Z: 0.0761983544
          }
        }
        ParentId: 14824212811512601903
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 13558678829997240470
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
            Id: 14591179733043103761
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
        Id: 1148521986039516692
        Name: "Cylinder - Bottom-Aligned"
        Transform {
          Location {
            X: 338.106323
            Y: 0.645840526
            Z: 143.007889
          }
          Rotation {
            Pitch: -90
            Yaw: 180
          }
          Scale {
            X: 0.0779877454
            Y: 0.254992098
            Z: 6.77097654
          }
        }
        ParentId: 14824212811512601903
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 13558678829997240470
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
        Relevance {
          Value: "mc:eproxyrelevance:critical"
        }
        NetworkRelevanceDistance {
          Value: "mc:eproxyrelevance:critical"
        }
      }
      Objects {
        Id: 4652661066691235920
        Name: "Text 03: )"
        Transform {
          Location {
            X: -335.06543
            Y: 36.8510742
            Z: -111.249542
          }
          Rotation {
            Pitch: 43.740715
            Yaw: -90.000061
            Roll: 4.72693137e-06
          }
          Scale {
            X: 1.26710761
            Y: -0.473859906
            Z: 2.31355882
          }
        }
        ParentId: 14824212811512601903
        UnregisteredParameters {
          Overrides {
            Name: "ma:Font.Bevel:id"
            AssetReference {
              Id: 13558678829997240470
            }
          }
          Overrides {
            Name: "ma:Font.Faces:id"
            AssetReference {
              Id: 13558678829997240470
            }
          }
          Overrides {
            Name: "ma:Font.Sides:id"
            AssetReference {
              Id: 13558678829997240470
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
            Id: 11059134955047933556
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
        Id: 2213622946483768752
        Name: "Text 03: )"
        Transform {
          Location {
            X: 346.912933
            Y: -32.5758286
            Z: -111.249527
          }
          Rotation {
            Pitch: 43.7407265
            Yaw: 89.9999313
          }
          Scale {
            X: 1.26710761
            Y: 0.473859906
            Z: 2.31355882
          }
        }
        ParentId: 14824212811512601903
        UnregisteredParameters {
          Overrides {
            Name: "ma:Font.Bevel:id"
            AssetReference {
              Id: 13558678829997240470
            }
          }
          Overrides {
            Name: "ma:Font.Faces:id"
            AssetReference {
              Id: 13558678829997240470
            }
          }
          Overrides {
            Name: "ma:Font.Sides:id"
            AssetReference {
              Id: 13558678829997240470
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
            Id: 11059134955047933556
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
        Id: 603583099366782923
        Name: "Text 03: )"
        Transform {
          Location {
            X: 346.913086
            Y: 36.8505859
            Z: -111.249542
          }
          Rotation {
            Pitch: 43.7407265
            Yaw: -90.000061
            Roll: 4.72693273e-06
          }
          Scale {
            X: 1.26710761
            Y: -0.473859906
            Z: 2.31355882
          }
        }
        ParentId: 14824212811512601903
        UnregisteredParameters {
          Overrides {
            Name: "ma:Font.Bevel:id"
            AssetReference {
              Id: 13558678829997240470
            }
          }
          Overrides {
            Name: "ma:Font.Faces:id"
            AssetReference {
              Id: 13558678829997240470
            }
          }
          Overrides {
            Name: "ma:Font.Sides:id"
            AssetReference {
              Id: 13558678829997240470
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
            Id: 11059134955047933556
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
        Id: 17118108067217826757
        Name: "Text 03: )"
        Transform {
          Location {
            X: -334.228638
            Y: -32.5753403
            Z: -111.249527
          }
          Rotation {
            Pitch: 43.740715
            Yaw: 89.9999313
          }
          Scale {
            X: 1.26710761
            Y: 0.473859906
            Z: 2.31355882
          }
        }
        ParentId: 14824212811512601903
        UnregisteredParameters {
          Overrides {
            Name: "ma:Font.Bevel:id"
            AssetReference {
              Id: 13558678829997240470
            }
          }
          Overrides {
            Name: "ma:Font.Faces:id"
            AssetReference {
              Id: 13558678829997240470
            }
          }
          Overrides {
            Name: "ma:Font.Sides:id"
            AssetReference {
              Id: 13558678829997240470
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
            Id: 11059134955047933556
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
        Id: 9252236959091332064
        Name: "Bake Rack"
        Transform {
          Location {
            X: 138.653442
            Y: -103.489136
            Z: 21.8292847
          }
          Rotation {
            Yaw: 123.741356
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 3731515722692169462
        ChildIds: 6408818472565687550
        ChildIds: 10681264512029199647
        ChildIds: 3202706153931172009
        ChildIds: 3787612138010579129
        ChildIds: 12160767358536711687
        ChildIds: 1396791737507717518
        ChildIds: 2467438489559609873
        ChildIds: 13398105585595959842
        ChildIds: 4154380536793723132
        ChildIds: 5274049093360363603
        ChildIds: 16324902395511215734
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
        Id: 6408818472565687550
        Name: "Ring - Quarter Thin"
        Transform {
          Location {
            X: -52.4838867
            Y: -6.09332275
            Z: 117.871971
          }
          Rotation {
            Pitch: 90
          }
          Scale {
            X: 0.772030115
            Y: 0.772030115
            Z: 0.772030115
          }
        }
        ParentId: 9252236959091332064
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 6954370053071083141
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:color"
            Color {
              R: 0.639000058
              G: 0.479376942
              B: 0.345060021
              A: 1
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:smart"
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
        CoreMesh {
          MeshAsset {
            Id: 2726237539053134090
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
        Id: 10681264512029199647
        Name: "Ring - Quarter Thin"
        Transform {
          Location {
            X: -52.4838867
            Y: -6.09332275
            Z: 117.871971
          }
          Rotation {
            Pitch: 90
            Roll: -179.999985
          }
          Scale {
            X: 0.772030115
            Y: 0.772030115
            Z: 0.772030115
          }
        }
        ParentId: 9252236959091332064
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 6954370053071083141
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:color"
            Color {
              R: 0.639000058
              G: 0.479376942
              B: 0.345060021
              A: 1
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:smart"
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
        CoreMesh {
          MeshAsset {
            Id: 2726237539053134090
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
        Id: 3202706153931172009
        Name: "Container - Hex- Rounded"
        Transform {
          Location {
            Z: 108.254723
          }
          Rotation {
          }
          Scale {
            X: 0.107293293
            Y: 0.125439495
            Z: 0.0732492059
          }
        }
        ParentId: 9252236959091332064
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 6954370053071083141
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:smart"
            Bool: false
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:color"
            Color {
              R: 0.639000058
              G: 0.479376942
              B: 0.345060021
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
            Id: 10114584909118641714
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
        Id: 3787612138010579129
        Name: "Container - Hex- Rounded"
        Transform {
          Location {
            Z: 56.1400146
          }
          Rotation {
          }
          Scale {
            X: 0.107293293
            Y: 0.125439495
            Z: 0.0732492059
          }
        }
        ParentId: 9252236959091332064
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 6954370053071083141
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:smart"
            Bool: false
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:color"
            Color {
              R: 0.639000058
              G: 0.479376942
              B: 0.345060021
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
            Id: 10114584909118641714
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
        Id: 12160767358536711687
        Name: "Container - Hex- Rounded"
        Transform {
          Location {
          }
          Rotation {
          }
          Scale {
            X: 0.107293293
            Y: 0.125439495
            Z: 0.0732492059
          }
        }
        ParentId: 9252236959091332064
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 6954370053071083141
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:smart"
            Bool: false
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:color"
            Color {
              R: 0.639000058
              G: 0.479376942
              B: 0.345060021
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
            Id: 10114584909118641714
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
        Id: 1396791737507717518
        Name: "Cylinder"
        Transform {
          Location {
            X: -52.532959
            Y: -40.6752319
            Z: -22.8045273
          }
          Rotation {
          }
          Scale {
            X: 0.0835553408
            Y: 0.0835553408
            Z: 1.41
          }
        }
        ParentId: 9252236959091332064
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 6954370053071083141
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:smart"
            Bool: false
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:color"
            Color {
              R: 0.639000058
              G: 0.479376942
              B: 0.345060021
              A: 1
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:vtile"
            Float: 11.6012354
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
        Relevance {
          Value: "mc:eproxyrelevance:critical"
        }
        NetworkRelevanceDistance {
          Value: "mc:eproxyrelevance:critical"
        }
      }
      Objects {
        Id: 2467438489559609873
        Name: "Cylinder"
        Transform {
          Location {
            X: -52.532959
            Y: 28.5358887
            Z: -22.8045273
          }
          Rotation {
          }
          Scale {
            X: 0.0835553408
            Y: 0.0835553408
            Z: 1.41
          }
        }
        ParentId: 9252236959091332064
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 6954370053071083141
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:smart"
            Bool: false
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:color"
            Color {
              R: 0.639000058
              G: 0.479376942
              B: 0.345060021
              A: 1
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:vtile"
            Float: 11.6012354
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
        Relevance {
          Value: "mc:eproxyrelevance:critical"
        }
        NetworkRelevanceDistance {
          Value: "mc:eproxyrelevance:critical"
        }
      }
      Objects {
        Id: 13398105585595959842
        Name: "Ring - Quarter Thin"
        Transform {
          Location {
            X: 52.3911133
            Y: -6.09332275
            Z: 117.871971
          }
          Rotation {
            Pitch: 90
            Yaw: 4.55345935e-06
            Roll: -179.999969
          }
          Scale {
            X: 0.772030115
            Y: 0.772030115
            Z: 0.772030115
          }
        }
        ParentId: 9252236959091332064
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 6954370053071083141
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:color"
            Color {
              R: 0.639000058
              G: 0.479376942
              B: 0.345060021
              A: 1
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:smart"
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
        CoreMesh {
          MeshAsset {
            Id: 2726237539053134090
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
        Id: 4154380536793723132
        Name: "Cylinder"
        Transform {
          Location {
            X: 52.342041
            Y: 28.5358887
            Z: -22.8045273
          }
          Rotation {
          }
          Scale {
            X: 0.0835553408
            Y: 0.0835553408
            Z: 1.41
          }
        }
        ParentId: 9252236959091332064
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 6954370053071083141
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:smart"
            Bool: false
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:color"
            Color {
              R: 0.639000058
              G: 0.479376942
              B: 0.345060021
              A: 1
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:vtile"
            Float: 11.6012354
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
        Relevance {
          Value: "mc:eproxyrelevance:critical"
        }
        NetworkRelevanceDistance {
          Value: "mc:eproxyrelevance:critical"
        }
      }
      Objects {
        Id: 5274049093360363603
        Name: "Ring - Quarter Thin"
        Transform {
          Location {
            X: 52.3911133
            Y: -6.09332275
            Z: 117.871971
          }
          Rotation {
            Pitch: 90
          }
          Scale {
            X: 0.772030115
            Y: 0.772030115
            Z: 0.772030115
          }
        }
        ParentId: 9252236959091332064
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 6954370053071083141
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:color"
            Color {
              R: 0.639000058
              G: 0.479376942
              B: 0.345060021
              A: 1
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:smart"
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
        CoreMesh {
          MeshAsset {
            Id: 2726237539053134090
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
        Id: 16324902395511215734
        Name: "Cylinder"
        Transform {
          Location {
            X: 52.342041
            Y: -40.6752319
            Z: -22.8045273
          }
          Rotation {
          }
          Scale {
            X: 0.0835553408
            Y: 0.0835553408
            Z: 1.41
          }
        }
        ParentId: 9252236959091332064
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 6954370053071083141
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:smart"
            Bool: false
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:color"
            Color {
              R: 0.639000058
              G: 0.479376942
              B: 0.345060021
              A: 1
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:vtile"
            Float: 11.6012354
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
        Relevance {
          Value: "mc:eproxyrelevance:critical"
        }
        NetworkRelevanceDistance {
          Value: "mc:eproxyrelevance:critical"
        }
      }
      Objects {
        Id: 14516863235533904127
        Name: "Table"
        Transform {
          Location {
            X: 22.5408936
            Y: 53.460083
            Z: 112.13121
          }
          Rotation {
            Yaw: -56.2585793
            Roll: -179.999954
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 3731515722692169462
        ChildIds: 12789964865422467043
        ChildIds: 16673040765201685338
        ChildIds: 12633220883725412784
        ChildIds: 1791169579252625694
        ChildIds: 12907159685904309028
        ChildIds: 3899702414526447947
        ChildIds: 5886652987596500858
        ChildIds: 13804849129775549967
        ChildIds: 16587739284156959580
        ChildIds: 12028550642476060000
        ChildIds: 12085187819845513340
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
        Id: 12789964865422467043
        Name: "Container - Hex- Rounded"
        Transform {
          Location {
            X: -57.791687
            Y: -1.3778621e-05
            Z: -3.28507967e-12
          }
          Rotation {
            Yaw: 1.36603694e-05
          }
          Scale {
            X: 0.309241712
            Y: 0.238324583
            Z: 0.175429076
          }
        }
        ParentId: 14516863235533904127
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 2308394350388940872
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:color"
            Color {
              R: 0.734
              G: 0.568582594
              B: 0.42939
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
            Id: 10114584909118641714
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
        Id: 16673040765201685338
        Name: "Cone - Truncated"
        Transform {
          Location {
            X: -195.992737
            Y: -58.4575653
            Z: 3.94857645
          }
          Rotation {
            Yaw: 1.36603694e-05
          }
          Scale {
            X: 0.151033491
            Y: 0.151031971
            Z: 2.19249153
          }
        }
        ParentId: 14516863235533904127
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 13558678829997240470
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
            Id: 322703092679014335
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
        Id: 12633220883725412784
        Name: "Cone - Truncated"
        Transform {
          Location {
            X: -195.992737
            Y: 35.9472809
            Z: 3.94859886
          }
          Rotation {
            Yaw: 3.2568863e-12
          }
          Scale {
            X: 0.151033491
            Y: 0.151031971
            Z: 2.19249153
          }
        }
        ParentId: 14516863235533904127
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 13558678829997240470
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
            Id: 322703092679014335
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
        Id: 1791169579252625694
        Name: "Cone - Truncated"
        Transform {
          Location {
            X: 79.3297577
            Y: 35.9472847
            Z: 3.94760609
          }
          Rotation {
            Roll: 6.83018379e-06
          }
          Scale {
            X: 0.151033491
            Y: 0.151031971
            Z: 2.19249153
          }
        }
        ParentId: 14516863235533904127
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 13558678829997240470
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
            Id: 322703092679014335
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
        Id: 12907159685904309028
        Name: "Cone - Truncated"
        Transform {
          Location {
            X: 79.3297882
            Y: -58.4575
            Z: 3.94758368
          }
          Rotation {
            Yaw: 3.2568863e-12
          }
          Scale {
            X: 0.151033491
            Y: 0.151031971
            Z: 2.19249153
          }
        }
        ParentId: 14516863235533904127
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 13558678829997240470
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
            Id: 322703092679014335
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
        Id: 3899702414526447947
        Name: "Cube"
        Transform {
          Location {
            X: 1.67706776
            Y: -91.876564
            Z: 58.1420593
          }
          Rotation {
            Yaw: -179.999954
            Roll: 104.13208
          }
          Scale {
            X: 0.82897377
            Y: 1.12178063
            Z: 0.0395157486
          }
        }
        ParentId: 14516863235533904127
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 3202444740296431605
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
        Relevance {
          Value: "mc:eproxyrelevance:critical"
        }
        NetworkRelevanceDistance {
          Value: "mc:eproxyrelevance:critical"
        }
      }
      Objects {
        Id: 5886652987596500858
        Name: "Cube"
        Transform {
          Location {
            X: 1.67706776
            Y: -91.876564
            Z: 58.1420593
          }
          Rotation {
            Yaw: -179.999954
            Roll: 104.131721
          }
          Scale {
            X: 0.854156315
            Y: 1.15585816
            Z: 0.0584143475
          }
        }
        ParentId: 14516863235533904127
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 2360206302109331130
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:smart"
            Bool: false
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:color"
            Color {
              R: 0.671
              G: 0.557463229
              B: 0.436149985
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
            Id: 3455112338380606813
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
        Id: 13804849129775549967
        Name: "World Text"
        Transform {
          Location {
            X: -26.0824547
            Y: -90.835495
            Z: 37.4550247
          }
          Rotation {
            Pitch: -14.1319885
            Yaw: -89.999939
            Roll: 180
          }
          Scale {
            X: 1.41798794
            Y: 1.41798794
            Z: 1.41798794
          }
        }
        ParentId: 14516863235533904127
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
        Text {
          Text: "BETTER"
          FontAsset {
            Id: 14273053594046657449
          }
          Color {
            R: 0.655000031
            G: 0.608777046
            B: 0.466360033
            A: 1
          }
          HorizontalSize: 1
          VerticalSize: 1
          HorizontalAlignment {
            Value: "mc:ecoretexthorizontalalign:left"
          }
          VerticalAlignment {
            Value: "mc:ecoretextverticalalign:center"
          }
          IsLit: true
        }
        NetworkRelevanceDistance {
          Value: "mc:eproxyrelevance:critical"
        }
      }
      Objects {
        Id: 16587739284156959580
        Name: "World Text"
        Transform {
          Location {
            X: -26.0824509
            Y: -95.7358398
            Z: 56.9184456
          }
          Rotation {
            Pitch: -14.1319885
            Yaw: -89.999939
            Roll: 180
          }
          Scale {
            X: 1.343472
            Y: 1.343472
            Z: 1.343472
          }
        }
        ParentId: 14516863235533904127
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
        Text {
          Text: "BREADS"
          FontAsset {
            Id: 14273053594046657449
          }
          Color {
            R: 0.655000031
            G: 0.608777046
            B: 0.466360033
            A: 1
          }
          HorizontalSize: 1
          VerticalSize: 1
          HorizontalAlignment {
            Value: "mc:ecoretexthorizontalalign:left"
          }
          VerticalAlignment {
            Value: "mc:ecoretextverticalalign:center"
          }
          IsLit: true
        }
        NetworkRelevanceDistance {
          Value: "mc:eproxyrelevance:critical"
        }
      }
      Objects {
        Id: 12028550642476060000
        Name: "Cube"
        Transform {
          Location {
            X: 2.29059029
            Y: -87.8716583
            Z: 28.3640289
          }
          Rotation {
            Yaw: -179.999954
            Roll: -165.867889
          }
          Scale {
            X: 0.567987323
            Y: 0.0154545773
            Z: 0.068538934
          }
        }
        ParentId: 14516863235533904127
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 3202444740296431605
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:color"
            Color {
              R: 1.2
              G: 1.13825178
              B: 0.948000073
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
            Id: 17035533092158632125
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
        Id: 12085187819845513340
        Name: "Cube"
        Transform {
          Location {
            X: 2.29059744
            Y: -98.0391693
            Z: 69.0162354
          }
          Rotation {
            Yaw: 2.73207479e-05
            Roll: -14.1321411
          }
          Scale {
            X: 0.567987323
            Y: 0.0154545773
            Z: 0.068538934
          }
        }
        ParentId: 14516863235533904127
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 3202444740296431605
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:color"
            Color {
              R: 1.2
              G: 1.13825178
              B: 0.948000073
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
            Id: 17035533092158632125
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
        Id: 4853927060222214952
        Name: "Geo (with Collision)"
        Transform {
          Location {
            X: 25.4981689
            Y: 36.7216797
            Z: 343.216766
          }
          Rotation {
            Yaw: 123.741356
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 9768193896408374662
        ChildIds: 14756197836999995556
        ChildIds: 17823878174198127092
        ChildIds: 18165031705796533475
        ChildIds: 4944976672693795881
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
        Id: 14756197836999995556
        Name: "Main Street Awning 01"
        Transform {
          Location {
          }
          Rotation {
            Yaw: -179.999954
          }
          Scale {
            X: 0.789198875
            Y: 0.789198875
            Z: 0.789198875
          }
        }
        ParentId: 4853927060222214952
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:color"
            Color {
              R: 0.399999976
              G: 0.0207999703
              B: 0.0207999703
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
            Id: 4747252986335851927
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
        Id: 17823878174198127092
        Name: "Main Street Awning 01"
        Transform {
          Location {
          }
          Rotation {
            Yaw: -3.4150944e-06
          }
          Scale {
            X: 0.789198875
            Y: 0.789198875
            Z: 0.789198875
          }
        }
        ParentId: 4853927060222214952
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:color"
            Color {
              R: 0.399999976
              G: 0.0207999703
              B: 0.0207999703
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
            Id: 4747252986335851927
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
        Id: 18165031705796533475
        Name: "Cylinder - Bottom-Aligned"
        Transform {
          Location {
            X: 268.485687
            Y: -0.509887695
            Z: -342.216705
          }
          Rotation {
            Yaw: -3.4150944e-06
          }
          Scale {
            X: 0.201238543
            Y: 0.201238543
            Z: 4.57509136
          }
        }
        ParentId: 4853927060222214952
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 13558678829997240470
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
        Relevance {
          Value: "mc:eproxyrelevance:critical"
        }
        NetworkRelevanceDistance {
          Value: "mc:eproxyrelevance:critical"
        }
      }
      Objects {
        Id: 4944976672693795881
        Name: "Cylinder - Bottom-Aligned"
        Transform {
          Location {
            X: -267.83667
            Y: -0.509887695
            Z: -342.216705
          }
          Rotation {
            Yaw: 8.69731812e-05
          }
          Scale {
            X: 0.201238543
            Y: -0.201238543
            Z: 4.57509136
          }
        }
        ParentId: 4853927060222214952
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 13558678829997240470
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
        Relevance {
          Value: "mc:eproxyrelevance:critical"
        }
        NetworkRelevanceDistance {
          Value: "mc:eproxyrelevance:critical"
        }
      }
      Objects {
        Id: 9479586528530785837
        Name: "Collision (Invisible)"
        Transform {
          Location {
            X: 25.4981689
            Y: 36.7216797
            Z: 343.216766
          }
          Rotation {
            Yaw: 123.741356
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 9768193896408374662
        ChildIds: 6055397670059605342
        ChildIds: 6800351910319400752
        ChildIds: 13516962413819862889
        ChildIds: 473795167217916457
        ChildIds: 871446026454414865
        ChildIds: 6535024863385147406
        ChildIds: 9421615541364347925
        ChildIds: 7947895623000960525
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
        Id: 6055397670059605342
        Name: "Cube"
        Transform {
          Location {
            X: -178.754227
            Y: -25.0398407
            Z: -260.580811
          }
          Rotation {
            Yaw: -90.1412735
          }
          Scale {
            X: 0.642438471
            Y: 1.13112
            Z: 1.64513421
          }
        }
        ParentId: 9479586528530785837
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
            Id: 12095835209017042614
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
        Id: 6800351910319400752
        Name: "Cube"
        Transform {
          Location {
            X: 74.3065872
            Y: -19.7899094
            Z: -288.941559
          }
          Rotation {
            Yaw: -90.1412735
          }
          Scale {
            X: 1.32102895
            Y: 3.38733363
            Z: 1.17561829
          }
        }
        ParentId: 9479586528530785837
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
            Id: 12095835209017042614
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
        Id: 13516962413819862889
        Name: "Cube"
        Transform {
          Location {
            X: 14.7188797
            Y: -96.0180664
            Z: -290.957672
          }
          Rotation {
            Pitch: 13.9039078
            Yaw: -90.140686
            Roll: 8.79544132e-07
          }
          Scale {
            X: 0.161550194
            Y: 0.865249038
            Z: 1.17561829
          }
        }
        ParentId: 9479586528530785837
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
            Id: 12095835209017042614
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
        Id: 473795167217916457
        Name: "Cube - Bottom-Aligned"
        Transform {
          Location {
            X: -37.39328
            Y: -15.7672653
            Z: -230.160645
          }
          Rotation {
            Yaw: -92.2299957
          }
          Scale {
            X: 1
            Y: 1
            Z: 0.114216328
          }
        }
        ParentId: 9479586528530785837
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
        Relevance {
          Value: "mc:eproxyrelevance:critical"
        }
        NetworkRelevanceDistance {
          Value: "mc:eproxyrelevance:critical"
        }
      }
      Objects {
        Id: 871446026454414865
        Name: "Cube - Bottom-Aligned"
        Transform {
          Location {
            X: 104.107368
            Y: 12.4283371
            Z: -230.160645
          }
          Rotation {
            Yaw: -92.2299805
          }
          Scale {
            X: 0.325485945
            Y: 0.311272919
            Z: 0.2283777
          }
        }
        ParentId: 9479586528530785837
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
        Relevance {
          Value: "mc:eproxyrelevance:critical"
        }
        NetworkRelevanceDistance {
          Value: "mc:eproxyrelevance:critical"
        }
      }
      Objects {
        Id: 6535024863385147406
        Name: "Cube - Bottom-Aligned"
        Transform {
          Location {
            X: 185.375458
            Y: 12.3562927
            Z: -230.160645
          }
          Rotation {
            Yaw: -92.2299652
          }
          Scale {
            X: 0.403909951
            Y: 0.407492131
            Z: 0.2283777
          }
        }
        ParentId: 9479586528530785837
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
        Relevance {
          Value: "mc:eproxyrelevance:critical"
        }
        NetworkRelevanceDistance {
          Value: "mc:eproxyrelevance:critical"
        }
      }
      Objects {
        Id: 9421615541364347925
        Name: "Cube - Bottom-Aligned"
        Transform {
          Location {
            X: 212.859604
            Y: -20.4933167
            Z: -230.160645
          }
          Rotation {
            Yaw: -92.2299347
          }
          Scale {
            X: 0.403909951
            Y: 0.407492131
            Z: 0.2283777
          }
        }
        ParentId: 9479586528530785837
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
        Relevance {
          Value: "mc:eproxyrelevance:critical"
        }
        NetworkRelevanceDistance {
          Value: "mc:eproxyrelevance:critical"
        }
      }
      Objects {
        Id: 7947895623000960525
        Name: "Cube - Bottom-Aligned"
        Transform {
          Location {
            X: 148.479492
            Y: -10.2320099
            Z: -230.160645
          }
          Rotation {
            Yaw: -92.2299271
          }
          Scale {
            X: 0.403909951
            Y: 0.407492131
            Z: 0.2283777
          }
        }
        ParentId: 9479586528530785837
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
        Relevance {
          Value: "mc:eproxyrelevance:critical"
        }
        NetworkRelevanceDistance {
          Value: "mc:eproxyrelevance:critical"
        }
      }
    }
    Assets {
      Id: 6960732735939662151
      Name: "Outline Object"
      PlatformAssetType: 20
      PrimaryAsset {
        AssetType: "BlueprintAssetRef"
        AssetId: "fxbp_local_outline"
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
      Id: 6442861049751997091
      Name: "Dummy Object"
      PlatformAssetType: 6
      PrimaryAsset {
        AssetType: "BlueprintAssetRef"
        AssetId: "fxbp_dummy_pivot"
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
      Id: 12827530473249900764
      Name: "Emissive Glow Opaque"
      PlatformAssetType: 2
      PrimaryAsset {
        AssetType: "MaterialAssetRef"
        AssetId: "fxma_opaque_emissive"
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
      Id: 9269274393121603883
      Name: "Humanoid 2 Rig"
      PlatformAssetType: 25
      PrimaryAsset {
        AssetType: "SkeletonAssetRef"
        AssetId: "npc_guy_wireframe_001_ref"
      }
    }
    Assets {
      Id: 10238773178219091350
      Name: "Humanoid 2 Kenton"
      PlatformAssetType: 26
      PrimaryAsset {
        AssetType: "SkinnedMeshAssetRef"
        AssetId: "npc_human_guy_head_basic_003_ref"
      }
    }
    Assets {
      Id: 10183599803954570520
      Name: "Humanoid 2 Casual Jeans"
      PlatformAssetType: 26
      PrimaryAsset {
        AssetType: "SkinnedMeshAssetRef"
        AssetId: "npc_human_guy_lower_clothing_001_ref"
      }
    }
    Assets {
      Id: 7103526684147204861
      Name: "Humanoid 2 Hoodie"
      PlatformAssetType: 26
      PrimaryAsset {
        AssetType: "SkinnedMeshAssetRef"
        AssetId: "npc_human_guy_upper_casual_001_ref"
      }
    }
    Assets {
      Id: 4832378061934751573
      Name: "Humanoid 2 Kava Hair"
      PlatformAssetType: 26
      PrimaryAsset {
        AssetType: "SkinnedMeshAssetRef"
        AssetId: "npc_human_guy_hair_sport_001_ref"
      }
    }
    Assets {
      Id: 3202444740296431605
      Name: "Rubber Basic 01"
      PlatformAssetType: 2
      PrimaryAsset {
        AssetType: "MaterialAssetRef"
        AssetId: "mi_scf_rubber_panels_004_uv"
      }
    }
    Assets {
      Id: 14591179733043103761
      Name: "Cylinder - Chamfered"
      PlatformAssetType: 1
      PrimaryAsset {
        AssetType: "StaticMeshAssetRef"
        AssetId: "sm_cylinder_chamfer"
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
      Id: 11059134955047933556
      Name: "Text 03: )"
      PlatformAssetType: 1
      PrimaryAsset {
        AssetType: "StaticMeshAssetRef"
        AssetId: "F5_Text_046"
      }
    }
    Assets {
      Id: 2726237539053134090
      Name: "Ring - Quarter"
      PlatformAssetType: 1
      PrimaryAsset {
        AssetType: "StaticMeshAssetRef"
        AssetId: "sm_quarter_torus_002"
      }
    }
    Assets {
      Id: 6954370053071083141
      Name: "Metal Iron 01"
      PlatformAssetType: 2
      PrimaryAsset {
        AssetType: "MaterialAssetRef"
        AssetId: "mi_metal_iron_001"
      }
    }
    Assets {
      Id: 10114584909118641714
      Name: "Container - Hex- Rounded"
      PlatformAssetType: 1
      PrimaryAsset {
        AssetType: "StaticMeshAssetRef"
        AssetId: "sm_container_hex_rnd_001_ref"
      }
    }
    Assets {
      Id: 2308394350388940872
      Name: "Metal Painted Basic 01"
      PlatformAssetType: 2
      PrimaryAsset {
        AssetType: "MaterialAssetRef"
        AssetId: "mi_painted_metal_basic_001"
      }
    }
    Assets {
      Id: 322703092679014335
      Name: "Cone - Truncated"
      PlatformAssetType: 1
      PrimaryAsset {
        AssetType: "StaticMeshAssetRef"
        AssetId: "sm_cone_truncated_001"
      }
    }
    Assets {
      Id: 3455112338380606813
      Name: "Pipe - 4-Sided Thin"
      PlatformAssetType: 1
      PrimaryAsset {
        AssetType: "StaticMeshAssetRef"
        AssetId: "sm_pipe_4_sided_thin_001"
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
      Id: 14273053594046657449
      Name: "Anton"
      PlatformAssetType: 28
      PrimaryAsset {
        AssetType: "FontAssetRef"
        AssetId: "AntonRegular_ref"
      }
    }
    Assets {
      Id: 17035533092158632125
      Name: "Cube - Arched"
      PlatformAssetType: 1
      PrimaryAsset {
        AssetType: "StaticMeshAssetRef"
        AssetId: "sm_cube_arched_001"
      }
    }
    Assets {
      Id: 4747252986335851927
      Name: "Main Street Awning 01"
      PlatformAssetType: 1
      PrimaryAsset {
        AssetType: "StaticMeshAssetRef"
        AssetId: "sm_ts_urb_dtn_mst_awning_001_ref"
      }
    }
    Assets {
      Id: 12095835209017042614
      Name: "Cube"
      PlatformAssetType: 1
      PrimaryAsset {
        AssetType: "StaticMeshAssetRef"
        AssetId: "sm_cube_002"
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
    PrimaryAssetId {
      AssetType: "None"
      AssetId: "None"
    }
  }
  SerializationVersion: 110
  VirtualFolderPath: "Art and Collision - Farm"
  VirtualFolderPath: "Stores"
}
