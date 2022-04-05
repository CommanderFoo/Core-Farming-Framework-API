Assets {
  Id: 11863824867426865559
  Name: "Store - Penny Produce (Static)"
  PlatformAssetType: 5
  TemplateAsset {
    ObjectBlock {
      RootId: 10624624983835586139
      Objects {
        Id: 10624624983835586139
        Name: "Store - Penny Produce (Static)"
        Transform {
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 16884496789635913701
        ChildIds: 15894028351706111354
        ChildIds: 1140583758312313802
        ChildIds: 8963056759769050894
        ChildIds: 8418361665678388213
        ChildIds: 4216436648286139636
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
        Id: 15894028351706111354
        Name: "Store Catalog Zone  - Penny Produce"
        Transform {
          Location {
            X: 219.393311
            Y: -256.086182
            Z: 88.8404236
          }
          Rotation {
            Yaw: 41.1743698
          }
          Scale {
            X: 0.729266524
            Y: 0.729266524
            Z: 0.729266524
          }
        }
        ParentId: 10624624983835586139
        ChildIds: 12535358182896296690
        ChildIds: 13315164803246788589
        UnregisteredParameters {
          Overrides {
            Name: "cs:StoreId"
            String: "Penny Produce"
          }
          Overrides {
            Name: "cs:DisplayObject"
            ObjectReference {
              SubObjectId: 11977670227765484253
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
        Id: 12535358182896296690
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
        ParentId: 15894028351706111354
        ChildIds: 17758706075615006927
        ChildIds: 14191123949446789401
        ChildIds: 2139033213123046234
        ChildIds: 1801552335436477588
        ChildIds: 11977670227765484253
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
        Id: 17758706075615006927
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
        ParentId: 12535358182896296690
        UnregisteredParameters {
          Overrides {
            Name: "cs:ComponentRoot"
            ObjectReference {
              SubObjectId: 15894028351706111354
            }
          }
          Overrides {
            Name: "cs:OutlineObject"
            ObjectReference {
              SubObjectId: 1801552335436477588
            }
          }
          Overrides {
            Name: "cs:BroadcastEventComponent"
            ObjectReference {
              SubObjectId: 14191123949446789401
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
        Id: 14191123949446789401
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
        ParentId: 12535358182896296690
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
              SubObjectId: 15894028351706111354
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
        Id: 2139033213123046234
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
        ParentId: 12535358182896296690
        UnregisteredParameters {
          Overrides {
            Name: "cs:ObjectToToggle"
            ObjectReference {
              SubObjectId: 1801552335436477588
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
              SubObjectId: 15894028351706111354
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
        Id: 1801552335436477588
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
        ParentId: 12535358182896296690
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
        Id: 11977670227765484253
        Name: "Highlight Geo"
        Transform {
          Location {
            X: 262.251373
            Y: 1.16250563
            Z: 456.573151
          }
          Rotation {
            Yaw: -86.1743546
          }
          Scale {
            X: 1.37124085
            Y: 1.37124085
            Z: 1.37124085
          }
        }
        ParentId: 12535358182896296690
        ChildIds: 2329600955768641344
        ChildIds: 5846647066382370751
        ChildIds: 6189866419797993912
        ChildIds: 13697857449780747171
        ChildIds: 11766476868420583954
        ChildIds: 14864852397845555259
        ChildIds: 14840077239583791325
        ChildIds: 8466491635863559735
        ChildIds: 11392587429912179783
        ChildIds: 5982760084382885500
        ChildIds: 15163136788462297254
        ChildIds: 10694036237957274159
        ChildIds: 12925082365274510147
        ChildIds: 12057584150533887153
        ChildIds: 16090377849430763371
        ChildIds: 10026833906741783061
        ChildIds: 4227591477029187902
        ChildIds: 7287147961435409046
        ChildIds: 16680142592059918151
        ChildIds: 5121888891621935697
        ChildIds: 12370057977495642019
        ChildIds: 16182197919113807857
        ChildIds: 10080907176367414981
        ChildIds: 11660497325757929636
        ChildIds: 9156263018191303174
        ChildIds: 9729028085456628636
        ChildIds: 14383440769960399061
        ChildIds: 17700599221810732954
        ChildIds: 4385956631431211248
        ChildIds: 9328370912682924518
        ChildIds: 18435502663935888011
        ChildIds: 18254379069206070405
        ChildIds: 1869814124449724426
        ChildIds: 2911187949231839539
        ChildIds: 10430039165416768710
        ChildIds: 2544753510546801006
        ChildIds: 2718734184193375245
        ChildIds: 2320406408569373073
        ChildIds: 11007504022079441291
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
        Id: 2329600955768641344
        Name: "Fantasy Chest Treasure Pile 01"
        Transform {
          Location {
            X: 226.760742
            Y: 9.34143829
            Z: -357.73056
          }
          Rotation {
            Yaw: -179.999954
          }
          Scale {
            X: 0.639497519
            Y: 1.21914434
            Z: 0.31245622
          }
        }
        ParentId: 11977670227765484253
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 17594431842660323321
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:smart"
            Bool: false
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:color"
            Color {
              R: 0.455312043
              G: 0.571999967
              B: 0.572
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
        Id: 5846647066382370751
        Name: "Basket"
        Transform {
          Location {
            X: -165.127991
            Y: -78.5220718
            Z: -418.831787
          }
          Rotation {
          }
          Scale {
            X: 0.784051061
            Y: 0.784051061
            Z: 0.784051061
          }
        }
        ParentId: 11977670227765484253
        ChildIds: 705035735469551032
        ChildIds: 11623231798258699832
        ChildIds: 7719852110391833921
        ChildIds: 13841369709629388555
        ChildIds: 17326836899591247775
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
        Id: 705035735469551032
        Name: "Sphere - Half Thin"
        Transform {
          Location {
            Z: 24.0063152
          }
          Rotation {
            Yaw: 89.9999466
            Roll: -179.999969
          }
          Scale {
            X: 0.999999881
            Y: 1.00000024
            Z: 0.541813254
          }
        }
        ParentId: 5846647066382370751
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 18337581851612707179
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:smart"
            Bool: false
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:utile"
            Float: 2.69378281
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:vtile"
            Float: 0.791592777
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
            Id: 1641035593226882589
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
        Id: 11623231798258699832
        Name: "Ring - Thick"
        Transform {
          Location {
          }
          Rotation {
            Yaw: -179.999985
            Roll: -179.999985
          }
          Scale {
            X: 0.652907848
            Y: 0.652908146
            Z: 0.279369235
          }
        }
        ParentId: 5846647066382370751
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 18337581851612707179
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:smart"
            Bool: false
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:vtile"
            Float: 0.152242303
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:utile"
            Float: 0.869789481
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
            Id: 7570459242042378971
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
        Id: 7719852110391833921
        Name: "Pipe - Thin"
        Transform {
          Location {
            Z: 34.9962921
          }
          Rotation {
            Yaw: 90
            Roll: 180
          }
          Scale {
            X: 0.999999821
            Y: 1.00000036
            Z: 0.112872943
          }
        }
        ParentId: 5846647066382370751
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 18337581851612707179
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:smart"
            Bool: false
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:utile"
            Float: 0.791592777
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:vtile"
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
            Id: 5836430349218932838
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
        Id: 13841369709629388555
        Name: "Ring - Thin"
        Transform {
          Location {
            Z: 34.9962921
          }
          Rotation {
            Yaw: -179.999969
            Roll: -179.999969
          }
          Scale {
            X: 0.999999881
            Y: 1.00000048
            Z: 1.41318834
          }
        }
        ParentId: 5846647066382370751
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 18337581851612707179
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:smart"
            Bool: false
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:vtile"
            Float: 0.543065548
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
            Id: 15557041849098287198
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
        Id: 17326836899591247775
        Name: "Pipe - Thin"
        Transform {
          Location {
            Z: 34.9962921
          }
          Rotation {
            Yaw: 89.9999619
            Roll: -179.999969
          }
          Scale {
            X: 1.01102853
            Y: 1.01102912
            Z: 0.114117779
          }
        }
        ParentId: 5846647066382370751
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 13980161489662093039
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:smart"
            Bool: false
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:utile"
            Float: 0.791592777
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:vtile"
            Float: 0.125
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:color"
            Color {
              R: 0.0950529501
              G: 0.248000011
              B: 0.0632399842
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
            Id: 5836430349218932838
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
        Id: 6189866419797993912
        Name: "Apple Sack"
        Transform {
          Location {
            X: -145.422913
            Y: 11.5283852
            Z: -340.546936
          }
          Rotation {
            Yaw: -52.7020111
          }
          Scale {
            X: 0.513729393
            Y: 0.513729393
            Z: 0.513729393
          }
        }
        ParentId: 11977670227765484253
        ChildIds: 10333994243404981301
        ChildIds: 12022265318525907784
        ChildIds: 5524848031744754285
        ChildIds: 5894207574452633864
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
        Id: 10333994243404981301
        Name: "Apple"
        Transform {
          Location {
            X: -0.201498345
            Y: -11.0015602
            Z: 38.8633
          }
          Rotation {
            Yaw: -179.999985
            Roll: 143.50708
          }
          Scale {
            X: 0.526016
            Y: 0.526016
            Z: 0.526016
          }
        }
        ParentId: 6189866419797993912
        ChildIds: 4233538864206544251
        ChildIds: 9667551197640668267
        ChildIds: 18024964419566029164
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
        Id: 4233538864206544251
        Name: "Horn"
        Transform {
          Location {
            X: -1.34334584e-06
            Y: 3.75627613
            Z: -22.1483459
          }
          Rotation {
            Yaw: 6.83018243e-06
            Roll: -21.3521423
          }
          Scale {
            X: 0.0780718848
            Y: 0.0780717656
            Z: 0.169832036
          }
        }
        ParentId: 10333994243404981301
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 14000043932012134250
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:smart"
            Bool: true
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:color"
            Color {
              R: 0.828000069
              G: 0.691308796
              B: 0.556416094
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
            Id: 16245950798000650069
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
        Id: 9667551197640668267
        Name: "Sphere - Half"
        Transform {
          Location {
            X: -1.50803931e-19
            Y: -8.5097472e-06
            Z: 23.7949734
          }
          Rotation {
            Yaw: 1.31034767e-18
            Roll: 2.04905591e-05
          }
          Scale {
            X: 1
            Y: 1
            Z: 0.993377447
          }
        }
        ParentId: 10333994243404981301
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 2077577025583816224
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
            Id: 2346653999024665326
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
        Id: 18024964419566029164
        Name: "Sphere - Half"
        Transform {
          Location {
            X: -2.28165519e-19
            Y: -8.50974084e-06
            Z: 23.7949562
          }
          Rotation {
            Pitch: 180
          }
          Scale {
            X: 0.99999994
            Y: 1.00000012
            Z: 0.610076964
          }
        }
        ParentId: 10333994243404981301
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 2077577025583816224
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
            Id: 2346653999024665326
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
        Id: 12022265318525907784
        Name: "Apple"
        Transform {
          Location {
            X: -3.63457394
            Y: 14.3780832
            Z: 38.4548531
          }
          Rotation {
            Pitch: 41.1731949
            Yaw: 51.7418137
            Roll: 175.352753
          }
          Scale {
            X: 0.526016
            Y: 0.526016
            Z: 0.526016
          }
        }
        ParentId: 6189866419797993912
        ChildIds: 5838129203970016187
        ChildIds: 11666349661554404366
        ChildIds: 18201531601257029249
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
        Id: 5838129203970016187
        Name: "Horn"
        Transform {
          Location {
            X: -1.34334584e-06
            Y: 3.75627613
            Z: -22.1483459
          }
          Rotation {
            Yaw: 6.83018243e-06
            Roll: -21.3521423
          }
          Scale {
            X: 0.0780718848
            Y: 0.0780717656
            Z: 0.169832036
          }
        }
        ParentId: 12022265318525907784
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 14000043932012134250
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:smart"
            Bool: true
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:color"
            Color {
              R: 0.828000069
              G: 0.691308796
              B: 0.556416094
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
            Id: 16245950798000650069
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
        Id: 11666349661554404366
        Name: "Sphere - Half"
        Transform {
          Location {
            X: -1.50803931e-19
            Y: -8.5097472e-06
            Z: 23.7949734
          }
          Rotation {
            Yaw: 1.31034767e-18
            Roll: 2.04905591e-05
          }
          Scale {
            X: 1
            Y: 1
            Z: 0.993377447
          }
        }
        ParentId: 12022265318525907784
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 2077577025583816224
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
            Id: 2346653999024665326
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
        Id: 18201531601257029249
        Name: "Sphere - Half"
        Transform {
          Location {
            X: -2.28165519e-19
            Y: -8.50974084e-06
            Z: 23.7949562
          }
          Rotation {
            Pitch: 180
          }
          Scale {
            X: 0.99999994
            Y: 1.00000012
            Z: 0.610076964
          }
        }
        ParentId: 12022265318525907784
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 2077577025583816224
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
            Id: 2346653999024665326
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
        Id: 5524848031744754285
        Name: "Apple"
        Transform {
          Location {
            X: -0.201498345
            Y: -3.5415473
            Z: 66.0414429
          }
          Rotation {
            Yaw: -179.999985
            Roll: 47.7187462
          }
          Scale {
            X: 0.526016
            Y: 0.526016
            Z: 0.526016
          }
        }
        ParentId: 6189866419797993912
        ChildIds: 13467294757217030357
        ChildIds: 8013752680826821162
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
        Id: 13467294757217030357
        Name: "Sphere - Half"
        Transform {
          Location {
            X: -1.50803931e-19
            Y: -8.5097472e-06
            Z: 23.7949734
          }
          Rotation {
            Yaw: 1.31034767e-18
            Roll: 2.04905591e-05
          }
          Scale {
            X: 1
            Y: 1
            Z: 0.993377447
          }
        }
        ParentId: 5524848031744754285
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 2077577025583816224
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
            Id: 2346653999024665326
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
        Id: 8013752680826821162
        Name: "Sphere - Half"
        Transform {
          Location {
            X: -2.28165519e-19
            Y: -8.50974084e-06
            Z: 23.7949562
          }
          Rotation {
            Pitch: 180
          }
          Scale {
            X: 0.99999994
            Y: 1.00000012
            Z: 0.610076964
          }
        }
        ParentId: 5524848031744754285
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 2077577025583816224
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
            Id: 2346653999024665326
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
        Id: 5894207574452633864
        Name: "Apple"
        Transform {
          Location {
            X: -3.63457394
            Y: 10.2534857
            Z: 78.2552643
          }
          Rotation {
            Pitch: 41.1731873
            Yaw: 51.7418327
            Roll: 175.352753
          }
          Scale {
            X: 0.526016
            Y: 0.526016
            Z: 0.526016
          }
        }
        ParentId: 6189866419797993912
        ChildIds: 11015852705026404076
        ChildIds: 7478580041460803175
        ChildIds: 3806099262463221061
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
        Id: 11015852705026404076
        Name: "Horn"
        Transform {
          Location {
            X: -1.34334584e-06
            Y: 3.75627613
            Z: -22.1483459
          }
          Rotation {
            Yaw: 6.83018243e-06
            Roll: -21.3521423
          }
          Scale {
            X: 0.0780718848
            Y: 0.0780717656
            Z: 0.169832036
          }
        }
        ParentId: 5894207574452633864
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 14000043932012134250
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:smart"
            Bool: true
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:color"
            Color {
              R: 0.828000069
              G: 0.691308796
              B: 0.556416094
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
            Id: 16245950798000650069
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
        Id: 7478580041460803175
        Name: "Sphere - Half"
        Transform {
          Location {
            X: -1.50803931e-19
            Y: -8.5097472e-06
            Z: 23.7949734
          }
          Rotation {
            Yaw: 1.31034767e-18
            Roll: 2.04905591e-05
          }
          Scale {
            X: 1
            Y: 1
            Z: 0.993377447
          }
        }
        ParentId: 5894207574452633864
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 2077577025583816224
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
            Id: 2346653999024665326
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
        Id: 3806099262463221061
        Name: "Sphere - Half"
        Transform {
          Location {
            X: -2.28165519e-19
            Y: -8.50974084e-06
            Z: 23.7949562
          }
          Rotation {
            Pitch: 180
          }
          Scale {
            X: 0.99999994
            Y: 1.00000012
            Z: 0.610076964
          }
        }
        ParentId: 5894207574452633864
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 2077577025583816224
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
            Id: 2346653999024665326
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
        Id: 13697857449780747171
        Name: "Apple Sack"
        Transform {
          Location {
            X: -233.518127
            Y: 52.07827
            Z: -376.633759
          }
          Rotation {
            Yaw: -99.859108
          }
          Scale {
            X: 0.513729393
            Y: 0.513729393
            Z: 0.513729393
          }
        }
        ParentId: 11977670227765484253
        ChildIds: 1082590302573823218
        ChildIds: 1349502990920626267
        ChildIds: 17025005669493762014
        ChildIds: 13940015636133852732
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
        Id: 1082590302573823218
        Name: "Apple"
        Transform {
          Location {
            X: -0.201498345
            Y: -11.0015602
            Z: 38.8633
          }
          Rotation {
            Yaw: -179.999985
            Roll: 143.50708
          }
          Scale {
            X: 0.526016
            Y: 0.526016
            Z: 0.526016
          }
        }
        ParentId: 13697857449780747171
        ChildIds: 13383844279527653106
        ChildIds: 8515268678961880724
        ChildIds: 17085526336351280011
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
        Id: 13383844279527653106
        Name: "Horn"
        Transform {
          Location {
            X: -1.34334584e-06
            Y: 3.75627613
            Z: -22.1483459
          }
          Rotation {
            Yaw: 6.83018243e-06
            Roll: -21.3521423
          }
          Scale {
            X: 0.0780718848
            Y: 0.0780717656
            Z: 0.169832036
          }
        }
        ParentId: 1082590302573823218
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 14000043932012134250
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:smart"
            Bool: true
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:color"
            Color {
              R: 0.828000069
              G: 0.691308796
              B: 0.556416094
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
            Id: 16245950798000650069
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
        Id: 8515268678961880724
        Name: "Sphere - Half"
        Transform {
          Location {
            X: -1.50803931e-19
            Y: -8.5097472e-06
            Z: 23.7949734
          }
          Rotation {
            Yaw: 1.31034767e-18
            Roll: 2.04905591e-05
          }
          Scale {
            X: 1
            Y: 1
            Z: 0.993377447
          }
        }
        ParentId: 1082590302573823218
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 2077577025583816224
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
            Id: 2346653999024665326
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
        Id: 17085526336351280011
        Name: "Sphere - Half"
        Transform {
          Location {
            X: -2.28165519e-19
            Y: -8.50974084e-06
            Z: 23.7949562
          }
          Rotation {
            Pitch: 180
          }
          Scale {
            X: 0.99999994
            Y: 1.00000012
            Z: 0.610076964
          }
        }
        ParentId: 1082590302573823218
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 2077577025583816224
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
            Id: 2346653999024665326
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
        Id: 1349502990920626267
        Name: "Apple"
        Transform {
          Location {
            X: -3.63457394
            Y: 14.3780832
            Z: 38.4548531
          }
          Rotation {
            Pitch: 41.1731949
            Yaw: 51.7418137
            Roll: 175.352753
          }
          Scale {
            X: 0.526016
            Y: 0.526016
            Z: 0.526016
          }
        }
        ParentId: 13697857449780747171
        ChildIds: 8578666825360207730
        ChildIds: 11472212604756285806
        ChildIds: 5604219969213796948
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
        Id: 8578666825360207730
        Name: "Horn"
        Transform {
          Location {
            X: -1.34334584e-06
            Y: 3.75627613
            Z: -22.1483459
          }
          Rotation {
            Yaw: 6.83018243e-06
            Roll: -21.3521423
          }
          Scale {
            X: 0.0780718848
            Y: 0.0780717656
            Z: 0.169832036
          }
        }
        ParentId: 1349502990920626267
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 14000043932012134250
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:smart"
            Bool: true
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:color"
            Color {
              R: 0.828000069
              G: 0.691308796
              B: 0.556416094
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
            Id: 16245950798000650069
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
        Id: 11472212604756285806
        Name: "Sphere - Half"
        Transform {
          Location {
            X: -1.50803931e-19
            Y: -8.5097472e-06
            Z: 23.7949734
          }
          Rotation {
            Yaw: 1.31034767e-18
            Roll: 2.04905591e-05
          }
          Scale {
            X: 1
            Y: 1
            Z: 0.993377447
          }
        }
        ParentId: 1349502990920626267
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 2077577025583816224
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
            Id: 2346653999024665326
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
        Id: 5604219969213796948
        Name: "Sphere - Half"
        Transform {
          Location {
            X: -2.28165519e-19
            Y: -8.50974084e-06
            Z: 23.7949562
          }
          Rotation {
            Pitch: 180
          }
          Scale {
            X: 0.99999994
            Y: 1.00000012
            Z: 0.610076964
          }
        }
        ParentId: 1349502990920626267
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 2077577025583816224
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
            Id: 2346653999024665326
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
        Id: 17025005669493762014
        Name: "Apple"
        Transform {
          Location {
            X: -0.201498345
            Y: -3.5415473
            Z: 66.0414429
          }
          Rotation {
            Yaw: -179.999985
            Roll: 47.7187462
          }
          Scale {
            X: 0.526016
            Y: 0.526016
            Z: 0.526016
          }
        }
        ParentId: 13697857449780747171
        ChildIds: 8425812847863135210
        ChildIds: 4123161624551892333
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
        Id: 8425812847863135210
        Name: "Sphere - Half"
        Transform {
          Location {
            X: -1.50803931e-19
            Y: -8.5097472e-06
            Z: 23.7949734
          }
          Rotation {
            Yaw: 1.31034767e-18
            Roll: 2.04905591e-05
          }
          Scale {
            X: 1
            Y: 1
            Z: 0.993377447
          }
        }
        ParentId: 17025005669493762014
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 2077577025583816224
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
            Id: 2346653999024665326
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
        Id: 4123161624551892333
        Name: "Sphere - Half"
        Transform {
          Location {
            X: -2.28165519e-19
            Y: -8.50974084e-06
            Z: 23.7949562
          }
          Rotation {
            Pitch: 180
          }
          Scale {
            X: 0.99999994
            Y: 1.00000012
            Z: 0.610076964
          }
        }
        ParentId: 17025005669493762014
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 2077577025583816224
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
            Id: 2346653999024665326
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
        Id: 13940015636133852732
        Name: "Apple"
        Transform {
          Location {
            X: -3.63457394
            Y: 10.2534857
            Z: 78.2552643
          }
          Rotation {
            Pitch: 41.1731873
            Yaw: 51.7418327
            Roll: 175.352753
          }
          Scale {
            X: 0.526016
            Y: 0.526016
            Z: 0.526016
          }
        }
        ParentId: 13697857449780747171
        ChildIds: 9404988131347138763
        ChildIds: 15189844383535236553
        ChildIds: 39640747170635525
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
        Id: 9404988131347138763
        Name: "Horn"
        Transform {
          Location {
            X: -1.34334584e-06
            Y: 3.75627613
            Z: -22.1483459
          }
          Rotation {
            Yaw: 6.83018243e-06
            Roll: -21.3521423
          }
          Scale {
            X: 0.0780718848
            Y: 0.0780717656
            Z: 0.169832036
          }
        }
        ParentId: 13940015636133852732
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 14000043932012134250
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:smart"
            Bool: true
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:color"
            Color {
              R: 0.828000069
              G: 0.691308796
              B: 0.556416094
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
            Id: 16245950798000650069
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
        Id: 15189844383535236553
        Name: "Sphere - Half"
        Transform {
          Location {
            X: -1.50803931e-19
            Y: -8.5097472e-06
            Z: 23.7949734
          }
          Rotation {
            Yaw: 1.31034767e-18
            Roll: 2.04905591e-05
          }
          Scale {
            X: 1
            Y: 1
            Z: 0.993377447
          }
        }
        ParentId: 13940015636133852732
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 2077577025583816224
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
            Id: 2346653999024665326
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
        Id: 39640747170635525
        Name: "Sphere - Half"
        Transform {
          Location {
            X: -2.28165519e-19
            Y: -8.50974084e-06
            Z: 23.7949562
          }
          Rotation {
            Pitch: 180
          }
          Scale {
            X: 0.99999994
            Y: 1.00000012
            Z: 0.610076964
          }
        }
        ParentId: 13940015636133852732
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 2077577025583816224
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
            Id: 2346653999024665326
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
        Id: 11766476868420583954
        Name: "Apple Sack"
        Transform {
          Location {
            X: -234.964371
            Y: 15.0212021
            Z: -376.633759
          }
          Rotation {
            Yaw: 112.066483
          }
          Scale {
            X: 0.513729393
            Y: 0.513729393
            Z: 0.513729393
          }
        }
        ParentId: 11977670227765484253
        ChildIds: 17406735766166628553
        ChildIds: 4908372994173637508
        ChildIds: 9185126180420872105
        ChildIds: 2686221431762600516
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
        Id: 17406735766166628553
        Name: "Apple"
        Transform {
          Location {
            X: -0.201498345
            Y: -11.0015602
            Z: 38.8633
          }
          Rotation {
            Yaw: -179.999985
            Roll: 143.50708
          }
          Scale {
            X: 0.526016
            Y: 0.526016
            Z: 0.526016
          }
        }
        ParentId: 11766476868420583954
        ChildIds: 8909344954938079274
        ChildIds: 16819031594916208920
        ChildIds: 9221627969259447958
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
        Id: 8909344954938079274
        Name: "Horn"
        Transform {
          Location {
            X: -1.34334584e-06
            Y: 3.75627613
            Z: -22.1483459
          }
          Rotation {
            Yaw: 6.83018243e-06
            Roll: -21.3521423
          }
          Scale {
            X: 0.0780718848
            Y: 0.0780717656
            Z: 0.169832036
          }
        }
        ParentId: 17406735766166628553
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 14000043932012134250
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:smart"
            Bool: true
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:color"
            Color {
              R: 0.828000069
              G: 0.691308796
              B: 0.556416094
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
            Id: 16245950798000650069
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
        Id: 16819031594916208920
        Name: "Sphere - Half"
        Transform {
          Location {
            X: -1.50803931e-19
            Y: -8.5097472e-06
            Z: 23.7949734
          }
          Rotation {
            Yaw: 1.31034767e-18
            Roll: 2.04905591e-05
          }
          Scale {
            X: 1
            Y: 1
            Z: 0.993377447
          }
        }
        ParentId: 17406735766166628553
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 2077577025583816224
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
            Id: 2346653999024665326
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
        Id: 9221627969259447958
        Name: "Sphere - Half"
        Transform {
          Location {
            X: -2.28165519e-19
            Y: -8.50974084e-06
            Z: 23.7949562
          }
          Rotation {
            Pitch: 180
          }
          Scale {
            X: 0.99999994
            Y: 1.00000012
            Z: 0.610076964
          }
        }
        ParentId: 17406735766166628553
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 2077577025583816224
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
            Id: 2346653999024665326
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
        Id: 4908372994173637508
        Name: "Apple"
        Transform {
          Location {
            X: -3.63457394
            Y: 14.3780832
            Z: 38.4548531
          }
          Rotation {
            Pitch: 41.1731949
            Yaw: 51.7418137
            Roll: 175.352753
          }
          Scale {
            X: 0.526016
            Y: 0.526016
            Z: 0.526016
          }
        }
        ParentId: 11766476868420583954
        ChildIds: 12474755916001652280
        ChildIds: 16760998941968477000
        ChildIds: 1436674399404177683
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
        Id: 12474755916001652280
        Name: "Horn"
        Transform {
          Location {
            X: -1.34334584e-06
            Y: 3.75627613
            Z: -22.1483459
          }
          Rotation {
            Yaw: 6.83018243e-06
            Roll: -21.3521423
          }
          Scale {
            X: 0.0780718848
            Y: 0.0780717656
            Z: 0.169832036
          }
        }
        ParentId: 4908372994173637508
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 14000043932012134250
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:smart"
            Bool: true
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:color"
            Color {
              R: 0.828000069
              G: 0.691308796
              B: 0.556416094
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
            Id: 16245950798000650069
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
        Id: 16760998941968477000
        Name: "Sphere - Half"
        Transform {
          Location {
            X: -1.50803931e-19
            Y: -8.5097472e-06
            Z: 23.7949734
          }
          Rotation {
            Yaw: 1.31034767e-18
            Roll: 2.04905591e-05
          }
          Scale {
            X: 1
            Y: 1
            Z: 0.993377447
          }
        }
        ParentId: 4908372994173637508
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 2077577025583816224
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
            Id: 2346653999024665326
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
        Id: 1436674399404177683
        Name: "Sphere - Half"
        Transform {
          Location {
            X: -2.28165519e-19
            Y: -8.50974084e-06
            Z: 23.7949562
          }
          Rotation {
            Pitch: 180
          }
          Scale {
            X: 0.99999994
            Y: 1.00000012
            Z: 0.610076964
          }
        }
        ParentId: 4908372994173637508
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 2077577025583816224
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
            Id: 2346653999024665326
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
        Id: 9185126180420872105
        Name: "Apple"
        Transform {
          Location {
            X: -0.201498345
            Y: -3.5415473
            Z: 66.0414429
          }
          Rotation {
            Yaw: -179.999985
            Roll: 47.7187462
          }
          Scale {
            X: 0.526016
            Y: 0.526016
            Z: 0.526016
          }
        }
        ParentId: 11766476868420583954
        ChildIds: 6091005880150164751
        ChildIds: 15315149884032222713
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
        Id: 6091005880150164751
        Name: "Sphere - Half"
        Transform {
          Location {
            X: -1.50803931e-19
            Y: -8.5097472e-06
            Z: 23.7949734
          }
          Rotation {
            Yaw: 1.31034767e-18
            Roll: 2.04905591e-05
          }
          Scale {
            X: 1
            Y: 1
            Z: 0.993377447
          }
        }
        ParentId: 9185126180420872105
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 2077577025583816224
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
            Id: 2346653999024665326
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
        Id: 15315149884032222713
        Name: "Sphere - Half"
        Transform {
          Location {
            X: -2.28165519e-19
            Y: -8.50974084e-06
            Z: 23.7949562
          }
          Rotation {
            Pitch: 180
          }
          Scale {
            X: 0.99999994
            Y: 1.00000012
            Z: 0.610076964
          }
        }
        ParentId: 9185126180420872105
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 2077577025583816224
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
            Id: 2346653999024665326
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
        Id: 2686221431762600516
        Name: "Apple"
        Transform {
          Location {
            X: -3.63457394
            Y: 10.2534857
            Z: 78.2552643
          }
          Rotation {
            Pitch: 41.1731873
            Yaw: 51.7418327
            Roll: 175.352753
          }
          Scale {
            X: 0.526016
            Y: 0.526016
            Z: 0.526016
          }
        }
        ParentId: 11766476868420583954
        ChildIds: 10330899183241210167
        ChildIds: 4914937470897093914
        ChildIds: 3767586215990211531
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
        Id: 10330899183241210167
        Name: "Horn"
        Transform {
          Location {
            X: -1.34334584e-06
            Y: 3.75627613
            Z: -22.1483459
          }
          Rotation {
            Yaw: 6.83018243e-06
            Roll: -21.3521423
          }
          Scale {
            X: 0.0780718848
            Y: 0.0780717656
            Z: 0.169832036
          }
        }
        ParentId: 2686221431762600516
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 14000043932012134250
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:smart"
            Bool: true
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:color"
            Color {
              R: 0.828000069
              G: 0.691308796
              B: 0.556416094
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
            Id: 16245950798000650069
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
        Id: 4914937470897093914
        Name: "Sphere - Half"
        Transform {
          Location {
            X: -1.50803931e-19
            Y: -8.5097472e-06
            Z: 23.7949734
          }
          Rotation {
            Yaw: 1.31034767e-18
            Roll: 2.04905591e-05
          }
          Scale {
            X: 1
            Y: 1
            Z: 0.993377447
          }
        }
        ParentId: 2686221431762600516
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 2077577025583816224
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
            Id: 2346653999024665326
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
        Id: 3767586215990211531
        Name: "Sphere - Half"
        Transform {
          Location {
            X: -2.28165519e-19
            Y: -8.50974084e-06
            Z: 23.7949562
          }
          Rotation {
            Pitch: 180
          }
          Scale {
            X: 0.99999994
            Y: 1.00000012
            Z: 0.610076964
          }
        }
        ParentId: 2686221431762600516
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 2077577025583816224
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
            Id: 2346653999024665326
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
        Id: 14864852397845555259
        Name: "Apple"
        Transform {
          Location {
            X: -225.672806
            Y: -31.6651878
            Z: -359.437408
          }
          Rotation {
            Pitch: 30.8337746
            Yaw: -67.933876
            Roll: 143.507111
          }
          Scale {
            X: 0.270229876
            Y: 0.270229876
            Z: 0.270229876
          }
        }
        ParentId: 11977670227765484253
        ChildIds: 13652298786320150105
        ChildIds: 1463082509202545386
        ChildIds: 14263758493275957157
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
        Id: 13652298786320150105
        Name: "Horn"
        Transform {
          Location {
            X: -1.34334584e-06
            Y: 3.75627613
            Z: -22.1483459
          }
          Rotation {
            Yaw: 6.83018243e-06
            Roll: -21.3521423
          }
          Scale {
            X: 0.0780718848
            Y: 0.0780717656
            Z: 0.169832036
          }
        }
        ParentId: 14864852397845555259
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 14000043932012134250
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:smart"
            Bool: true
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:color"
            Color {
              R: 0.828000069
              G: 0.691308796
              B: 0.556416094
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
            Id: 16245950798000650069
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
        Id: 1463082509202545386
        Name: "Sphere - Half"
        Transform {
          Location {
            X: -1.50803931e-19
            Y: -8.5097472e-06
            Z: 23.7949734
          }
          Rotation {
            Yaw: 1.31034767e-18
            Roll: 2.04905591e-05
          }
          Scale {
            X: 1
            Y: 1
            Z: 0.993377447
          }
        }
        ParentId: 14864852397845555259
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 2077577025583816224
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
            Id: 2346653999024665326
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
        Id: 14263758493275957157
        Name: "Sphere - Half"
        Transform {
          Location {
            X: -2.28165519e-19
            Y: -8.50974084e-06
            Z: 23.7949562
          }
          Rotation {
            Pitch: 180
          }
          Scale {
            X: 0.99999994
            Y: 1.00000012
            Z: 0.610076964
          }
        }
        ParentId: 14864852397845555259
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 2077577025583816224
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
            Id: 2346653999024665326
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
        Id: 14840077239583791325
        Name: "Apple"
        Transform {
          Location {
            X: -245.011292
            Y: -34.941864
            Z: -358.713623
          }
          Rotation {
            Pitch: 19.049902
            Yaw: 150.77066
            Roll: 150.152252
          }
          Scale {
            X: 0.270229876
            Y: 0.270229876
            Z: 0.270229876
          }
        }
        ParentId: 11977670227765484253
        ChildIds: 5999128225739034613
        ChildIds: 8152083160763518112
        ChildIds: 8329039751732382938
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
        Id: 5999128225739034613
        Name: "Horn"
        Transform {
          Location {
            X: -1.34334584e-06
            Y: 3.75627613
            Z: -22.1483459
          }
          Rotation {
            Yaw: 6.83018243e-06
            Roll: -21.3521423
          }
          Scale {
            X: 0.0780718848
            Y: 0.0780717656
            Z: 0.169832036
          }
        }
        ParentId: 14840077239583791325
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 14000043932012134250
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:smart"
            Bool: true
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:color"
            Color {
              R: 0.828000069
              G: 0.691308796
              B: 0.556416094
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
            Id: 16245950798000650069
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
        Id: 8152083160763518112
        Name: "Sphere - Half"
        Transform {
          Location {
            X: -1.50803931e-19
            Y: -8.5097472e-06
            Z: 23.7949734
          }
          Rotation {
            Yaw: 1.31034767e-18
            Roll: 2.04905591e-05
          }
          Scale {
            X: 1
            Y: 1
            Z: 0.993377447
          }
        }
        ParentId: 14840077239583791325
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 2077577025583816224
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
            Id: 2346653999024665326
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
        Id: 8329039751732382938
        Name: "Sphere - Half"
        Transform {
          Location {
            X: -2.28165519e-19
            Y: -8.50974084e-06
            Z: 23.7949562
          }
          Rotation {
            Pitch: 180
          }
          Scale {
            X: 0.99999994
            Y: 1.00000012
            Z: 0.610076964
          }
        }
        ParentId: 14840077239583791325
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 2077577025583816224
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
            Id: 2346653999024665326
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
        Id: 8466491635863559735
        Name: "Apple"
        Transform {
          Location {
            X: -222.144
            Y: -11.8744926
            Z: -367.562103
          }
          Rotation {
            Pitch: 30.8337879
            Yaw: -67.9338684
            Roll: 47.7186661
          }
          Scale {
            X: 0.270229876
            Y: 0.270229876
            Z: 0.270229876
          }
        }
        ParentId: 11977670227765484253
        ChildIds: 2684618261675027612
        ChildIds: 14701554984142646432
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
        Id: 2684618261675027612
        Name: "Sphere - Half"
        Transform {
          Location {
            X: -1.50803931e-19
            Y: -8.5097472e-06
            Z: 23.7949734
          }
          Rotation {
            Yaw: 1.31034767e-18
            Roll: 2.04905591e-05
          }
          Scale {
            X: 1
            Y: 1
            Z: 0.993377447
          }
        }
        ParentId: 8466491635863559735
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 2077577025583816224
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
            Id: 2346653999024665326
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
        Id: 14701554984142646432
        Name: "Sphere - Half"
        Transform {
          Location {
            X: -2.28165519e-19
            Y: -8.50974084e-06
            Z: 23.7949562
          }
          Rotation {
            Pitch: 180
          }
          Scale {
            X: 0.99999994
            Y: 1.00000012
            Z: 0.610076964
          }
        }
        ParentId: 8466491635863559735
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 2077577025583816224
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
            Id: 2346653999024665326
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
        Id: 11392587429912179783
        Name: "Apple"
        Transform {
          Location {
            X: -236.117218
            Y: -12.5450821
            Z: -356.935089
          }
          Rotation {
            Pitch: 19.0499096
            Yaw: 150.770691
            Roll: 150.152267
          }
          Scale {
            X: 0.270229876
            Y: 0.270229876
            Z: 0.270229876
          }
        }
        ParentId: 11977670227765484253
        ChildIds: 16261492682034258120
        ChildIds: 11929653411643086290
        ChildIds: 1305957590657304592
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
        Id: 16261492682034258120
        Name: "Horn"
        Transform {
          Location {
            X: -1.34334584e-06
            Y: 3.75627613
            Z: -22.1483459
          }
          Rotation {
            Yaw: 6.83018243e-06
            Roll: -21.3521423
          }
          Scale {
            X: 0.0780718848
            Y: 0.0780717656
            Z: 0.169832036
          }
        }
        ParentId: 11392587429912179783
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 14000043932012134250
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:smart"
            Bool: true
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:color"
            Color {
              R: 0.828000069
              G: 0.691308796
              B: 0.556416094
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
            Id: 16245950798000650069
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
        Id: 11929653411643086290
        Name: "Sphere - Half"
        Transform {
          Location {
            X: -1.50803931e-19
            Y: -8.5097472e-06
            Z: 23.7949734
          }
          Rotation {
            Yaw: 1.31034767e-18
            Roll: 2.04905591e-05
          }
          Scale {
            X: 1
            Y: 1
            Z: 0.993377447
          }
        }
        ParentId: 11392587429912179783
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 2077577025583816224
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
            Id: 2346653999024665326
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
        Id: 1305957590657304592
        Name: "Sphere - Half"
        Transform {
          Location {
            X: -2.28165519e-19
            Y: -8.50974084e-06
            Z: 23.7949562
          }
          Rotation {
            Pitch: 180
          }
          Scale {
            X: 0.99999994
            Y: 1.00000012
            Z: 0.610076964
          }
        }
        ParentId: 11392587429912179783
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 2077577025583816224
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
            Id: 2346653999024665326
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
        Id: 5982760084382885500
        Name: "Grapes"
        Transform {
          Location {
            X: 137.370117
            Y: 60.0181389
            Z: -328.855438
          }
          Rotation {
            Pitch: 47.5143089
            Yaw: -106.651527
            Roll: -52.8204689
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 11977670227765484253
        ChildIds: 2935641544021365923
        ChildIds: 10949257936456743519
        ChildIds: 14219991514212264797
        ChildIds: 17377699390251024080
        ChildIds: 1327456573307116440
        ChildIds: 3772282035659951258
        ChildIds: 15916460786854535339
        ChildIds: 84404719578978073
        ChildIds: 17861707748984564011
        ChildIds: 10350936854295949054
        ChildIds: 6377622238750677065
        ChildIds: 10401838300980732668
        ChildIds: 4167060294884468440
        ChildIds: 9103490779519293306
        ChildIds: 1137145035952707542
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
        Id: 2935641544021365923
        Name: "Sphere"
        Transform {
          Location {
            X: 7.37939453
            Y: -4.15606689
            Z: 2.36974335
          }
          Rotation {
          }
          Scale {
            X: 0.105408855
            Y: 0.105408855
            Z: 0.105408855
          }
        }
        ParentId: 5982760084382885500
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 1792590512685276522
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:color"
            Color {
              R: 0.0512583219
              B: 0.0900000334
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
        Id: 10949257936456743519
        Name: "Sphere"
        Transform {
          Location {
            X: -1.06298828
            Y: -8.83911133
            Z: 2.36974335
          }
          Rotation {
          }
          Scale {
            X: 0.105408855
            Y: 0.105408855
            Z: 0.105408855
          }
        }
        ParentId: 5982760084382885500
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 1792590512685276522
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:color"
            Color {
              R: 0.0512583219
              B: 0.0900000334
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
        Id: 14219991514212264797
        Name: "Sphere"
        Transform {
          Location {
            X: -7.93798828
            Y: -2.57556152
            Z: 2.36974335
          }
          Rotation {
          }
          Scale {
            X: 0.105408855
            Y: 0.105408855
            Z: 0.105408855
          }
        }
        ParentId: 5982760084382885500
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 1792590512685276522
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:color"
            Color {
              R: 0.0512583219
              B: 0.0900000334
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
        Id: 17377699390251024080
        Name: "Sphere"
        Transform {
          Location {
          }
          Rotation {
          }
          Scale {
            X: 0.105408855
            Y: 0.105408855
            Z: 0.105408855
          }
        }
        ParentId: 5982760084382885500
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 1792590512685276522
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:color"
            Color {
              R: 0.0512583219
              B: 0.0900000334
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
        Id: 1327456573307116440
        Name: "Sphere"
        Transform {
          Location {
            X: 6.33349609
            Y: 5.47583
            Z: 2.36974335
          }
          Rotation {
          }
          Scale {
            X: 0.105408855
            Y: 0.105408855
            Z: 0.105408855
          }
        }
        ParentId: 5982760084382885500
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 1792590512685276522
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:color"
            Color {
              R: 0.0512583219
              B: 0.0900000334
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
        Id: 3772282035659951258
        Name: "Sphere"
        Transform {
          Location {
            X: -3.72900391
            Y: 6.5880127
            Z: 2.36974335
          }
          Rotation {
          }
          Scale {
            X: 0.105408855
            Y: 0.105408855
            Z: 0.105408855
          }
        }
        ParentId: 5982760084382885500
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 1792590512685276522
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:color"
            Color {
              R: 0.0512583219
              B: 0.0900000334
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
        Id: 15916460786854535339
        Name: "Sphere"
        Transform {
          Location {
            X: -5.76757812
            Y: 0.382202148
            Z: -5.51677704
          }
          Rotation {
            Yaw: 39.4827461
          }
          Scale {
            X: 0.101768106
            Y: 0.101768106
            Z: 0.101768106
          }
        }
        ParentId: 5982760084382885500
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 1792590512685276522
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:color"
            Color {
              R: 0.0512583219
              B: 0.0900000334
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
        Id: 84404719578978073
        Name: "Sphere"
        Transform {
          Location {
            X: 0.196777344
            Y: 6.17272949
            Z: -5.51677704
          }
          Rotation {
            Yaw: 39.4827461
          }
          Scale {
            X: 0.101768106
            Y: 0.101768106
            Z: 0.101768106
          }
        }
        ParentId: 5982760084382885500
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 1792590512685276522
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:color"
            Color {
              R: 0.0512583219
              B: 0.0900000334
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
        Id: 17861707748984564011
        Name: "Sphere"
        Transform {
          Location {
            X: 7.12890625
            Y: -0.596191406
            Z: -5.51677704
          }
          Rotation {
            Yaw: 39.4827461
          }
          Scale {
            X: 0.101768106
            Y: 0.101768106
            Z: 0.101768106
          }
        }
        ParentId: 5982760084382885500
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 1792590512685276522
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:color"
            Color {
              R: 0.0512583219
              B: 0.0900000334
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
        Id: 10350936854295949054
        Name: "Sphere"
        Transform {
          Location {
            X: -0.751464844
            Y: -6.36804199
            Z: -5.51677704
          }
          Rotation {
            Yaw: 39.4827461
          }
          Scale {
            X: 0.101768106
            Y: 0.101768106
            Z: 0.101768106
          }
        }
        ParentId: 5982760084382885500
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 1792590512685276522
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:color"
            Color {
              R: 0.0512583219
              B: 0.0900000334
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
        Id: 6377622238750677065
        Name: "Sphere"
        Transform {
          Location {
            X: 2.06494141
            Y: -4.55682373
            Z: -12.7816544
          }
          Rotation {
            Yaw: 100.290962
          }
          Scale {
            X: 0.0944673568
            Y: 0.0944673568
            Z: 0.0944673568
          }
        }
        ParentId: 5982760084382885500
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 1792590512685276522
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:color"
            Color {
              R: 0.0512583219
              B: 0.0900000334
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
        Id: 10401838300980732668
        Name: "Sphere"
        Transform {
          Location {
            X: -3.69482422
            Y: 1.24450684
            Z: -12.7816544
          }
          Rotation {
            Yaw: 100.290962
          }
          Scale {
            X: 0.0944673568
            Y: 0.0944673568
            Z: 0.0944673568
          }
        }
        ParentId: 5982760084382885500
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 1792590512685276522
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:color"
            Color {
              R: 0.0512583219
              B: 0.0900000334
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
        Id: 4167060294884468440
        Name: "Sphere"
        Transform {
          Location {
            X: 3.82617188
            Y: 2.88873291
            Z: -12.7816544
          }
          Rotation {
            Yaw: 100.290962
          }
          Scale {
            X: 0.0944673568
            Y: 0.0944673568
            Z: 0.0944673568
          }
        }
        ParentId: 5982760084382885500
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 1792590512685276522
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:color"
            Color {
              R: 0.0512583219
              B: 0.0900000334
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
        Id: 9103490779519293306
        Name: "Sphere"
        Transform {
          Location {
            X: 0.416992188
            Y: 0.46661377
            Z: -18.7058182
          }
          Rotation {
            Yaw: 100.290962
          }
          Scale {
            X: 0.0944673568
            Y: 0.0944673568
            Z: 0.0944673568
          }
        }
        ParentId: 5982760084382885500
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 1792590512685276522
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:color"
            Color {
              R: 0.0512583219
              B: 0.0900000334
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
        Id: 1137145035952707542
        Name: "Horn"
        Transform {
          Location {
            X: -0.0288085938
            Y: 0.0589599609
            Z: 2.61605835
          }
          Rotation {
            Yaw: -22.3479614
            Roll: 20.7998829
          }
          Scale {
            X: 0.0471757874
            Y: 0.0471757874
            Z: 0.0797548369
          }
        }
        ParentId: 5982760084382885500
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 14000043932012134250
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:color"
            Color {
              R: 0.682119131
              G: 1
              B: 0.399999976
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
            Id: 16245950798000650069
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
        Id: 15163136788462297254
        Name: "Carrot"
        Transform {
          Location {
            X: -179.078079
            Y: -63.2606659
            Z: -394.211273
          }
          Rotation {
            Pitch: 10.2825756
            Yaw: 20.1087208
            Roll: 41.2398376
          }
          Scale {
            X: 1.09784055
            Y: 1.09784055
            Z: 1.09784055
          }
        }
        ParentId: 11977670227765484253
        ChildIds: 14492110587693552916
        ChildIds: 17076470661063828673
        ChildIds: 5150508065656053029
        ChildIds: 11779456794327731349
        ChildIds: 16085751403822945411
        ChildIds: 2970286293735777081
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
        Id: 14492110587693552916
        Name: "Sphere - Half"
        Transform {
          Location {
          }
          Rotation {
          }
          Scale {
            X: 0.131453618
            Y: 0.131453618
            Z: 0.066579394
          }
        }
        ParentId: 15163136788462297254
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 7719735812193550538
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:smart"
            Bool: false
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:utile"
            Float: 1.93266356
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:vtile"
            Float: 3.02476573
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:color"
            Color {
              R: 0.6
              G: 0.388025254
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
            Id: 2346653999024665326
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
        Id: 17076470661063828673
        Name: "Horn"
        Transform {
          Location {
            X: 0.358398438
            Y: -0.400817871
            Z: 0.471522331
          }
          Rotation {
            Pitch: 2.32979107
            Yaw: -99.1602783
            Roll: 14.1494923
          }
          Scale {
            X: 0.0213706419
            Y: 0.0213706419
            Z: 0.105432883
          }
        }
        ParentId: 15163136788462297254
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
              R: 0.0460926555
              G: 0.24000001
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
            Id: 16245950798000650069
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
        Id: 5150508065656053029
        Name: "Kelp Bush 01"
        Transform {
          Location {
            X: -2.62402344
            Y: -3.65130615
            Z: 10.5582609
          }
          Rotation {
            Pitch: -36.2919617
            Yaw: -138.166855
            Roll: -2.66217041
          }
          Scale {
            X: 0.0871555358
            Y: 0.0871555358
            Z: 0.0871555358
          }
        }
        ParentId: 15163136788462297254
        UnregisteredParameters {
          Overrides {
            Name: "ma:Nature_Leaves:id"
            AssetReference {
              Id: 3033557993563810247
            }
          }
          Overrides {
            Name: "ma:Nature_Leaves:color"
            Color {
              R: 0.0624105781
              G: 0.15200001
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
            Id: 15093605760662794654
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
        Id: 11779456794327731349
        Name: "Horn"
        Transform {
          Location {
            X: 0.358398438
            Y: -0.400817871
            Z: 0.471522331
          }
          Rotation {
            Pitch: 1.33269966
            Yaw: 121.468788
            Roll: 21.5851326
          }
          Scale {
            X: 0.0155229503
            Y: 0.0155229503
            Z: 0.0765830725
          }
        }
        ParentId: 15163136788462297254
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
              R: 0.0460926555
              G: 0.24000001
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
            Id: 16245950798000650069
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
        Id: 16085751403822945411
        Name: "Kelp Bush 01"
        Transform {
          Location {
            X: 4.75244141
            Y: -1.03845215
            Z: 14.8693342
          }
          Rotation {
            Pitch: -29.135498
          }
          Scale {
            X: 0.119988143
            Y: 0.119988143
            Z: 0.119988143
          }
        }
        ParentId: 15163136788462297254
        UnregisteredParameters {
          Overrides {
            Name: "ma:Nature_Leaves:id"
            AssetReference {
              Id: 3033557993563810247
            }
          }
          Overrides {
            Name: "ma:Nature_Leaves:color"
            Color {
              R: 0.0624105781
              G: 0.15200001
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
            Id: 15093605760662794654
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
        Id: 2970286293735777081
        Name: "Sphere - Half"
        Transform {
          Location {
            Y: 4.06901054e-05
          }
          Rotation {
            Pitch: 180
          }
          Scale {
            X: 0.131453753
            Y: 0.131453335
            Z: 0.647164
          }
        }
        ParentId: 15163136788462297254
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 7719735812193550538
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:smart"
            Bool: false
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:vtile"
            Float: 15.7584972
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:color"
            Color {
              R: 0.6
              G: 0.388025254
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
            Id: 2346653999024665326
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
        Id: 10694036237957274159
        Name: "Wheat"
        Transform {
          Location {
            X: 232.800781
            Y: -49.7015877
            Z: -332.626709
          }
          Rotation {
            Yaw: -64.8050385
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 11977670227765484253
        ChildIds: 9552441911912907659
        ChildIds: 11534682051122078130
        ChildIds: 5664362683222963884
        ChildIds: 11491636970896723309
        ChildIds: 13895901695002754638
        ChildIds: 16843462601170873850
        ChildIds: 2199855758735202519
        ChildIds: 14739187792158722670
        ChildIds: 3891052311091092407
        ChildIds: 6574591586650199215
        ChildIds: 11878465361096640843
        ChildIds: 16191847758199379405
        ChildIds: 10037875092211971469
        ChildIds: 16932045088425293985
        ChildIds: 1228046449849125331
        ChildIds: 16655518070940315442
        ChildIds: 17494935368868607543
        ChildIds: 10076450612780648626
        ChildIds: 16624647223155455155
        ChildIds: 11541727669520854921
        ChildIds: 8403396630102992156
        ChildIds: 5779791686438224155
        ChildIds: 1288555646282667108
        ChildIds: 9211067639986829720
        ChildIds: 14078987382940655217
        ChildIds: 12985137753189563365
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
        Id: 9552441911912907659
        Name: "Cylinder"
        Transform {
          Location {
            X: -8.1875
            Y: 6.39343262
            Z: 0.323069572
          }
          Rotation {
            Pitch: 51.0484619
            Yaw: -113.371979
            Roll: 99.5632935
          }
          Scale {
            X: 0.0246116444
            Y: 0.0246114098
            Z: 0.14128238
          }
        }
        ParentId: 10694036237957274159
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:color"
            Color {
              R: 0.460000038
              G: 0.274172217
              A: 1
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 14437066532589146669
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
        Id: 11534682051122078130
        Name: "Horn"
        Transform {
          Location {
            X: -13.3618164
            Y: 9.48419189
            Z: 0.96101
          }
          Rotation {
            Pitch: -71.0809
            Yaw: 77.005928
            Roll: 71.2082596
          }
          Scale {
            X: 0.0246107616
            Y: 0.0246107616
            Z: 0.197706461
          }
        }
        ParentId: 10694036237957274159
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:color"
            Color {
              R: 0.460000038
              G: 0.274172217
              A: 1
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 14437066532589146669
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
            Id: 16245950798000650069
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
        Id: 5664362683222963884
        Name: "Horn"
        Transform {
          Location {
            X: -13.3618164
            Y: 9.48419189
            Z: 0.96101
          }
          Rotation {
            Pitch: -66.4412842
            Yaw: -126.642731
            Roll: -68.0218201
          }
          Scale {
            X: 0.0213293284
            Y: 0.0213293284
            Z: 0.137820274
          }
        }
        ParentId: 10694036237957274159
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:color"
            Color {
              R: 0.460000038
              G: 0.274172217
              A: 1
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 14437066532589146669
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
            Id: 16245950798000650069
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
        Id: 11491636970896723309
        Name: "Horn"
        Transform {
          Location {
            X: -13.3603516
            Y: 9.48699951
            Z: 0.95982933
          }
          Rotation {
            Pitch: 59.719223
            Yaw: -129.667465
            Roll: -75.021637
          }
          Scale {
            X: 0.0213293284
            Y: 0.0213293284
            Z: 0.137820274
          }
        }
        ParentId: 10694036237957274159
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:color"
            Color {
              R: 0.460000038
              G: 0.274172217
              A: 1
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 14437066532589146669
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
            Id: 16245950798000650069
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
        Id: 13895901695002754638
        Name: "Frame End - Bulb"
        Transform {
          Location {
            X: -39.1201172
            Y: 8.59527588
            Z: 4.54362583
          }
          Rotation {
            Pitch: -8.50231934
            Yaw: -23.9264221
            Roll: 174.232727
          }
          Scale {
            X: 0.265796244
            Y: -0.558664322
            Z: 0.265796244
          }
        }
        ParentId: 10694036237957274159
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
              R: 0.460000038
              G: 0.274172217
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
        Id: 16843462601170873850
        Name: "Frame End - Bulb"
        Transform {
          Location {
            X: -41.0195312
            Y: 9.67474365
            Z: 4.89073563
          }
          Rotation {
            Pitch: -7.98407
            Yaw: -19.0446472
            Roll: 173.530411
          }
          Scale {
            X: 0.265796244
            Y: -0.538975716
            Z: 0.265796244
          }
        }
        ParentId: 10694036237957274159
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
              R: 0.460000038
              G: 0.274172217
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
        Id: 2199855758735202519
        Name: "Frame End - Bulb"
        Transform {
          Location {
            X: -42.1469727
            Y: 10.3285522
            Z: 5.09877396
          }
          Rotation {
            Pitch: -7.0385437
            Yaw: -11.2654419
            Roll: 172.512939
          }
          Scale {
            X: 0.265796244
            Y: -0.516005635
            Z: 0.265796244
          }
        }
        ParentId: 10694036237957274159
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
              R: 0.460000038
              G: 0.274172217
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
        Id: 14739187792158722670
        Name: "Frame End - Bulb"
        Transform {
          Location {
            X: -38.9550781
            Y: 14.7752075
            Z: 5.47978401
          }
          Rotation {
            Pitch: -3.13183594
            Yaw: 14.1404161
            Roll: 170.222382
          }
          Scale {
            X: 0.258413017
            Y: -0.474167377
            Z: 0.258413017
          }
        }
        ParentId: 10694036237957274159
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
              R: 0.460000038
              G: 0.274172217
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
        Id: 3891052311091092407
        Name: "Frame End - Bulb"
        Transform {
          Location {
            X: -30.4589844
            Y: 34.6691284
            Z: 7.73503113
          }
          Rotation {
            Pitch: -6.99841309
            Yaw: -10.9608459
            Roll: 172.473724
          }
          Scale {
            X: 0.265796244
            Y: 0.558664322
            Z: 0.265796244
          }
        }
        ParentId: 10694036237957274159
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
              R: 0.460000038
              G: 0.274172217
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
        Id: 6574591586650199215
        Name: "Frame End - Bulb"
        Transform {
          Location {
            X: -32.8012695
            Y: 34.6150513
            Z: 7.9496851
          }
          Rotation {
            Pitch: -7.60897827
            Yaw: -15.8187561
            Roll: 173.090668
          }
          Scale {
            X: 0.265796244
            Y: 0.538975716
            Z: 0.265796244
          }
        }
        ParentId: 10694036237957274159
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
              R: 0.460000038
              G: 0.274172217
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
        Id: 11878465361096640843
        Name: "Frame End - Bulb"
        Transform {
          Location {
            X: -34.2626953
            Y: 34.5647583
            Z: 8.0810833
          }
          Rotation {
            Pitch: -8.4715271
            Yaw: -23.6195679
            Roll: 174.184464
          }
          Scale {
            X: 0.265796244
            Y: 0.516005635
            Z: 0.265796244
          }
        }
        ParentId: 10694036237957274159
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
              R: 0.460000038
              G: 0.274172217
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
        Id: 16191847758199379405
        Name: "Frame End - Bulb"
        Transform {
          Location {
            X: -33.918457
            Y: 30.0699463
            Z: 7.35600471
          }
          Rotation {
            Pitch: -10.0354614
            Yaw: -46.0497742
            Roll: 177.837173
          }
          Scale {
            X: 0.258413017
            Y: 0.474167377
            Z: 0.258413017
          }
        }
        ParentId: 10694036237957274159
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
              R: 0.460000038
              G: 0.274172217
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
        Id: 10037875092211971469
        Name: "Frame End - Bulb"
        Transform {
          Location {
            X: -34.4555664
            Y: 21.1809692
            Z: 6.03804207
          }
          Rotation {
            Pitch: -8.28118896
            Yaw: -94.7825928
            Roll: -173.915543
          }
          Scale {
            X: 0.258413017
            Y: 0.474167377
            Z: 0.258413017
          }
        }
        ParentId: 10694036237957274159
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
              R: 0.460000038
              G: 0.274172217
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
        Id: 16932045088425293985
        Name: "Cylinder"
        Transform {
          Location {
            X: -11.8256836
            Y: 9.03527832
            Z: -1.43516159
          }
          Rotation {
            Pitch: 5.96534348
            Yaw: 49.396286
            Roll: -96.0281677
          }
          Scale {
            X: 0.0246116444
            Y: 0.0246114098
            Z: 0.14128238
          }
        }
        ParentId: 10694036237957274159
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:color"
            Color {
              R: 0.460000038
              G: 0.274172217
              A: 1
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 14437066532589146669
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
        Id: 1228046449849125331
        Name: "Horn"
        Transform {
          Location {
            X: -16.4433594
            Y: 12.9107666
            Z: -0.805875778
          }
          Rotation {
            Pitch: 14.5031958
            Yaw: -128.418121
            Roll: -83.8064575
          }
          Scale {
            X: 0.0246107616
            Y: 0.0246107616
            Z: 0.197706461
          }
        }
        ParentId: 10694036237957274159
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:color"
            Color {
              R: 0.460000038
              G: 0.274172217
              A: 1
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 14437066532589146669
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
            Id: 16245950798000650069
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
        Id: 16655518070940315442
        Name: "Horn"
        Transform {
          Location {
            X: -16.4433594
            Y: 12.9107666
            Z: -0.805875778
          }
          Rotation {
            Pitch: 54.8580818
            Yaw: -115.722351
            Roll: -60.6187744
          }
          Scale {
            X: 0.0213293284
            Y: 0.0213293284
            Z: 0.137820274
          }
        }
        ParentId: 10694036237957274159
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:color"
            Color {
              R: 0.460000038
              G: 0.274172217
              A: 1
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 14437066532589146669
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
            Id: 16245950798000650069
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
        Id: 17494935368868607543
        Name: "Horn"
        Transform {
          Location {
            X: -16.4448242
            Y: 12.9087524
            Z: -0.807977676
          }
          Rotation {
            Pitch: -1.16186523
            Yaw: 59.8283157
            Roll: 103.30426
          }
          Scale {
            X: 0.0213293284
            Y: 0.0213293284
            Z: 0.137820274
          }
        }
        ParentId: 10694036237957274159
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:color"
            Color {
              R: 0.460000038
              G: 0.274172217
              A: 1
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 14437066532589146669
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
            Id: 16245950798000650069
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
        Id: 10076450612780648626
        Name: "Frame End - Bulb"
        Transform {
          Location {
            X: -26.7270508
            Y: 32.7717285
            Z: 12.4938698
          }
          Rotation {
            Pitch: -10.34198
            Yaw: -45.8994446
            Roll: -61.4891357
          }
          Scale {
            X: 0.265796244
            Y: -0.558664322
            Z: 0.265796244
          }
        }
        ParentId: 10694036237957274159
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
              R: 0.460000038
              G: 0.274172217
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
        Id: 16624647223155455155
        Name: "Frame End - Bulb"
        Transform {
          Location {
            X: -28.3325195
            Y: 34.2794189
            Z: 12.7011166
          }
          Rotation {
            Pitch: -14.6018677
            Yaw: -48.2938538
            Roll: -60.9735718
          }
          Scale {
            X: 0.265796244
            Y: -0.538975716
            Z: 0.265796244
          }
        }
        ParentId: 10694036237957274159
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
              R: 0.460000038
              G: 0.274172217
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
        Id: 11541727669520854921
        Name: "Frame End - Bulb"
        Transform {
          Location {
            X: -29.2949219
            Y: 35.1754761
            Z: 12.8146439
          }
          Rotation {
            Pitch: -21.3573608
            Yaw: -52.3329773
            Roll: -59.7231445
          }
          Scale {
            X: 0.265796244
            Y: -0.516005635
            Z: 0.265796244
          }
        }
        ParentId: 10694036237957274159
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
              R: 0.460000038
              G: 0.274172217
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
        Id: 8403396630102992156
        Name: "Frame End - Bulb"
        Transform {
          Location {
            X: -31.0166016
            Y: 33.2580566
            Z: 7.97067833
          }
          Rotation {
            Pitch: -42.5276794
            Yaw: -69.5263062
            Roll: -50.4196472
          }
          Scale {
            X: 0.258413017
            Y: -0.474167377
            Z: 0.258413017
          }
        }
        ParentId: 10694036237957274159
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
              R: 0.460000038
              G: 0.274172217
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
        Id: 5779791686438224155
        Name: "Frame End - Bulb"
        Transform {
          Location {
            X: -41.2875977
            Y: 28.9468384
            Z: -10.7096262
          }
          Rotation {
            Pitch: -21.6208191
            Yaw: -52.4980774
            Roll: -59.6646118
          }
          Scale {
            X: 0.265796244
            Y: 0.558664322
            Z: 0.265796244
          }
        }
        ParentId: 10694036237957274159
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
              R: 0.460000038
              G: 0.274172217
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
        Id: 1288555646282667108
        Name: "Frame End - Bulb"
        Transform {
          Location {
            X: -42.2895508
            Y: 30.6695557
            Z: -9.45942879
          }
          Rotation {
            Pitch: -17.4098206
            Yaw: -49.9294434
            Roll: -60.5244141
          }
          Scale {
            X: 0.265796244
            Y: 0.538975716
            Z: 0.265796244
          }
        }
        ParentId: 10694036237957274159
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
              R: 0.460000038
              G: 0.274172217
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
        Id: 9211067639986829720
        Name: "Frame End - Bulb"
        Transform {
          Location {
            X: -42.902832
            Y: 31.7429199
            Z: -8.66738892
          }
          Rotation {
            Pitch: -10.6099854
            Yaw: -46.0475464
            Roll: -61.46521
          }
          Scale {
            X: 0.265796244
            Y: 0.516005635
            Z: 0.265796244
          }
        }
        ParentId: 10694036237957274159
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
              R: 0.460000038
              G: 0.274172217
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
        Id: 14078987382940655217
        Name: "Frame End - Bulb"
        Transform {
          Location {
            X: -39.5771484
            Y: 31.0467529
            Z: -5.61763048
          }
          Rotation {
            Pitch: 8.95319557
            Yaw: -35.5244141
            Roll: -61.6200256
          }
          Scale {
            X: 0.258413017
            Y: 0.474167377
            Z: 0.258413017
          }
        }
        ParentId: 10694036237957274159
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
              R: 0.460000038
              G: 0.274172217
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
        Id: 12985137753189563365
        Name: "Frame End - Bulb"
        Transform {
          Location {
            X: -33.5405273
            Y: 30.5686035
            Z: 1.04350233
          }
          Rotation {
            Pitch: 48.6620445
            Yaw: -3.13653564
            Roll: -44.6946411
          }
          Scale {
            X: 0.258413017
            Y: 0.474167377
            Z: 0.258413017
          }
        }
        ParentId: 10694036237957274159
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
              R: 0.460000038
              G: 0.274172217
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
        Id: 12925082365274510147
        Name: "Wheat"
        Transform {
          Location {
            X: 228.525864
            Y: -49.7015839
            Z: -340.660034
          }
          Rotation {
            Pitch: -5.28881311
            Yaw: -112.10228
            Roll: -152.407318
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 11977670227765484253
        ChildIds: 1080335949858291748
        ChildIds: 12763928980529573654
        ChildIds: 10517983562419267000
        ChildIds: 5845250789648887931
        ChildIds: 9652433726051730982
        ChildIds: 18112132523435295790
        ChildIds: 11347694824760401498
        ChildIds: 2645891340211002641
        ChildIds: 11127127274902869355
        ChildIds: 6866720857053150846
        ChildIds: 11082502422312304143
        ChildIds: 3825511568112017354
        ChildIds: 7136821519841498040
        ChildIds: 11667657360041724896
        ChildIds: 6195227446315711759
        ChildIds: 15366562224381160176
        ChildIds: 8174486221651825067
        ChildIds: 840187360446729899
        ChildIds: 4250587498439822770
        ChildIds: 3086008275856341644
        ChildIds: 12937612343807226632
        ChildIds: 1668657370474515503
        ChildIds: 9793515700733444828
        ChildIds: 5976621062056455144
        ChildIds: 8911581947581453158
        ChildIds: 11742137756688677946
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
        Id: 1080335949858291748
        Name: "Cylinder"
        Transform {
          Location {
            X: -8.1875
            Y: 6.39343262
            Z: 0.323069572
          }
          Rotation {
            Pitch: 51.0484619
            Yaw: -113.371979
            Roll: 99.5632935
          }
          Scale {
            X: 0.0246116444
            Y: 0.0246114098
            Z: 0.14128238
          }
        }
        ParentId: 12925082365274510147
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:color"
            Color {
              R: 0.460000038
              G: 0.274172217
              A: 1
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 14437066532589146669
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
        Id: 12763928980529573654
        Name: "Horn"
        Transform {
          Location {
            X: -13.3618164
            Y: 9.48419189
            Z: 0.96101
          }
          Rotation {
            Pitch: -71.0809
            Yaw: 77.005928
            Roll: 71.2082596
          }
          Scale {
            X: 0.0246107616
            Y: 0.0246107616
            Z: 0.197706461
          }
        }
        ParentId: 12925082365274510147
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:color"
            Color {
              R: 0.460000038
              G: 0.274172217
              A: 1
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 14437066532589146669
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
            Id: 16245950798000650069
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
        Id: 10517983562419267000
        Name: "Horn"
        Transform {
          Location {
            X: -13.3618164
            Y: 9.48419189
            Z: 0.96101
          }
          Rotation {
            Pitch: -66.4412842
            Yaw: -126.642731
            Roll: -68.0218201
          }
          Scale {
            X: 0.0213293284
            Y: 0.0213293284
            Z: 0.137820274
          }
        }
        ParentId: 12925082365274510147
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:color"
            Color {
              R: 0.460000038
              G: 0.274172217
              A: 1
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 14437066532589146669
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
            Id: 16245950798000650069
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
        Id: 5845250789648887931
        Name: "Horn"
        Transform {
          Location {
            X: -13.3603516
            Y: 9.48699951
            Z: 0.95982933
          }
          Rotation {
            Pitch: 59.719223
            Yaw: -129.667465
            Roll: -75.021637
          }
          Scale {
            X: 0.0213293284
            Y: 0.0213293284
            Z: 0.137820274
          }
        }
        ParentId: 12925082365274510147
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:color"
            Color {
              R: 0.460000038
              G: 0.274172217
              A: 1
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 14437066532589146669
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
            Id: 16245950798000650069
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
        Id: 9652433726051730982
        Name: "Frame End - Bulb"
        Transform {
          Location {
            X: -39.1201172
            Y: 8.59527588
            Z: 4.54362583
          }
          Rotation {
            Pitch: -8.50231934
            Yaw: -23.9264221
            Roll: 174.232727
          }
          Scale {
            X: 0.265796244
            Y: -0.558664322
            Z: 0.265796244
          }
        }
        ParentId: 12925082365274510147
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
              R: 0.460000038
              G: 0.274172217
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
        Id: 18112132523435295790
        Name: "Frame End - Bulb"
        Transform {
          Location {
            X: -41.0195312
            Y: 9.67474365
            Z: 4.89073563
          }
          Rotation {
            Pitch: -7.98407
            Yaw: -19.0446472
            Roll: 173.530411
          }
          Scale {
            X: 0.265796244
            Y: -0.538975716
            Z: 0.265796244
          }
        }
        ParentId: 12925082365274510147
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
              R: 0.460000038
              G: 0.274172217
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
        Id: 11347694824760401498
        Name: "Frame End - Bulb"
        Transform {
          Location {
            X: -42.1469727
            Y: 10.3285522
            Z: 5.09877396
          }
          Rotation {
            Pitch: -7.0385437
            Yaw: -11.2654419
            Roll: 172.512939
          }
          Scale {
            X: 0.265796244
            Y: -0.516005635
            Z: 0.265796244
          }
        }
        ParentId: 12925082365274510147
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
              R: 0.460000038
              G: 0.274172217
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
        Id: 2645891340211002641
        Name: "Frame End - Bulb"
        Transform {
          Location {
            X: -38.9550781
            Y: 14.7752075
            Z: 5.47978401
          }
          Rotation {
            Pitch: -3.13183594
            Yaw: 14.1404161
            Roll: 170.222382
          }
          Scale {
            X: 0.258413017
            Y: -0.474167377
            Z: 0.258413017
          }
        }
        ParentId: 12925082365274510147
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
              R: 0.460000038
              G: 0.274172217
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
        Id: 11127127274902869355
        Name: "Frame End - Bulb"
        Transform {
          Location {
            X: -30.4589844
            Y: 34.6691284
            Z: 7.73503113
          }
          Rotation {
            Pitch: -6.99841309
            Yaw: -10.9608459
            Roll: 172.473724
          }
          Scale {
            X: 0.265796244
            Y: 0.558664322
            Z: 0.265796244
          }
        }
        ParentId: 12925082365274510147
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
              R: 0.460000038
              G: 0.274172217
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
        Id: 6866720857053150846
        Name: "Frame End - Bulb"
        Transform {
          Location {
            X: -32.8012695
            Y: 34.6150513
            Z: 7.9496851
          }
          Rotation {
            Pitch: -7.60897827
            Yaw: -15.8187561
            Roll: 173.090668
          }
          Scale {
            X: 0.265796244
            Y: 0.538975716
            Z: 0.265796244
          }
        }
        ParentId: 12925082365274510147
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
              R: 0.460000038
              G: 0.274172217
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
        Id: 11082502422312304143
        Name: "Frame End - Bulb"
        Transform {
          Location {
            X: -34.2626953
            Y: 34.5647583
            Z: 8.0810833
          }
          Rotation {
            Pitch: -8.4715271
            Yaw: -23.6195679
            Roll: 174.184464
          }
          Scale {
            X: 0.265796244
            Y: 0.516005635
            Z: 0.265796244
          }
        }
        ParentId: 12925082365274510147
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
              R: 0.460000038
              G: 0.274172217
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
        Id: 3825511568112017354
        Name: "Frame End - Bulb"
        Transform {
          Location {
            X: -33.918457
            Y: 30.0699463
            Z: 7.35600471
          }
          Rotation {
            Pitch: -10.0354614
            Yaw: -46.0497742
            Roll: 177.837173
          }
          Scale {
            X: 0.258413017
            Y: 0.474167377
            Z: 0.258413017
          }
        }
        ParentId: 12925082365274510147
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
              R: 0.460000038
              G: 0.274172217
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
        Id: 7136821519841498040
        Name: "Frame End - Bulb"
        Transform {
          Location {
            X: -34.4555664
            Y: 21.1809692
            Z: 6.03804207
          }
          Rotation {
            Pitch: -8.28118896
            Yaw: -94.7825928
            Roll: -173.915543
          }
          Scale {
            X: 0.258413017
            Y: 0.474167377
            Z: 0.258413017
          }
        }
        ParentId: 12925082365274510147
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
              R: 0.460000038
              G: 0.274172217
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
        Id: 11667657360041724896
        Name: "Cylinder"
        Transform {
          Location {
            X: -11.8256836
            Y: 9.03527832
            Z: -1.43516159
          }
          Rotation {
            Pitch: 5.96534348
            Yaw: 49.396286
            Roll: -96.0281677
          }
          Scale {
            X: 0.0246116444
            Y: 0.0246114098
            Z: 0.14128238
          }
        }
        ParentId: 12925082365274510147
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:color"
            Color {
              R: 0.460000038
              G: 0.274172217
              A: 1
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 14437066532589146669
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
        Id: 6195227446315711759
        Name: "Horn"
        Transform {
          Location {
            X: -16.4433594
            Y: 12.9107666
            Z: -0.805875778
          }
          Rotation {
            Pitch: 14.5031958
            Yaw: -128.418121
            Roll: -83.8064575
          }
          Scale {
            X: 0.0246107616
            Y: 0.0246107616
            Z: 0.197706461
          }
        }
        ParentId: 12925082365274510147
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:color"
            Color {
              R: 0.460000038
              G: 0.274172217
              A: 1
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 14437066532589146669
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
            Id: 16245950798000650069
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
        Id: 15366562224381160176
        Name: "Horn"
        Transform {
          Location {
            X: -16.4433594
            Y: 12.9107666
            Z: -0.805875778
          }
          Rotation {
            Pitch: 54.8580818
            Yaw: -115.722351
            Roll: -60.6187744
          }
          Scale {
            X: 0.0213293284
            Y: 0.0213293284
            Z: 0.137820274
          }
        }
        ParentId: 12925082365274510147
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:color"
            Color {
              R: 0.460000038
              G: 0.274172217
              A: 1
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 14437066532589146669
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
            Id: 16245950798000650069
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
        Id: 8174486221651825067
        Name: "Horn"
        Transform {
          Location {
            X: -16.4448242
            Y: 12.9087524
            Z: -0.807977676
          }
          Rotation {
            Pitch: -1.16186523
            Yaw: 59.8283157
            Roll: 103.30426
          }
          Scale {
            X: 0.0213293284
            Y: 0.0213293284
            Z: 0.137820274
          }
        }
        ParentId: 12925082365274510147
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:color"
            Color {
              R: 0.460000038
              G: 0.274172217
              A: 1
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 14437066532589146669
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
            Id: 16245950798000650069
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
        Id: 840187360446729899
        Name: "Frame End - Bulb"
        Transform {
          Location {
            X: -26.7270508
            Y: 32.7717285
            Z: 12.4938698
          }
          Rotation {
            Pitch: -10.34198
            Yaw: -45.8994446
            Roll: -61.4891357
          }
          Scale {
            X: 0.265796244
            Y: -0.558664322
            Z: 0.265796244
          }
        }
        ParentId: 12925082365274510147
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
              R: 0.460000038
              G: 0.274172217
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
        Id: 4250587498439822770
        Name: "Frame End - Bulb"
        Transform {
          Location {
            X: -28.3325195
            Y: 34.2794189
            Z: 12.7011166
          }
          Rotation {
            Pitch: -14.6018677
            Yaw: -48.2938538
            Roll: -60.9735718
          }
          Scale {
            X: 0.265796244
            Y: -0.538975716
            Z: 0.265796244
          }
        }
        ParentId: 12925082365274510147
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
              R: 0.460000038
              G: 0.274172217
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
        Id: 3086008275856341644
        Name: "Frame End - Bulb"
        Transform {
          Location {
            X: -29.2949219
            Y: 35.1754761
            Z: 12.8146439
          }
          Rotation {
            Pitch: -21.3573608
            Yaw: -52.3329773
            Roll: -59.7231445
          }
          Scale {
            X: 0.265796244
            Y: -0.516005635
            Z: 0.265796244
          }
        }
        ParentId: 12925082365274510147
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
              R: 0.460000038
              G: 0.274172217
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
        Id: 12937612343807226632
        Name: "Frame End - Bulb"
        Transform {
          Location {
            X: -31.0166016
            Y: 33.2580566
            Z: 7.97067833
          }
          Rotation {
            Pitch: -42.5276794
            Yaw: -69.5263062
            Roll: -50.4196472
          }
          Scale {
            X: 0.258413017
            Y: -0.474167377
            Z: 0.258413017
          }
        }
        ParentId: 12925082365274510147
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
              R: 0.460000038
              G: 0.274172217
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
        Id: 1668657370474515503
        Name: "Frame End - Bulb"
        Transform {
          Location {
            X: -41.2875977
            Y: 28.9468384
            Z: -10.7096262
          }
          Rotation {
            Pitch: -21.6208191
            Yaw: -52.4980774
            Roll: -59.6646118
          }
          Scale {
            X: 0.265796244
            Y: 0.558664322
            Z: 0.265796244
          }
        }
        ParentId: 12925082365274510147
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
              R: 0.460000038
              G: 0.274172217
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
        Id: 9793515700733444828
        Name: "Frame End - Bulb"
        Transform {
          Location {
            X: -42.2895508
            Y: 30.6695557
            Z: -9.45942879
          }
          Rotation {
            Pitch: -17.4098206
            Yaw: -49.9294434
            Roll: -60.5244141
          }
          Scale {
            X: 0.265796244
            Y: 0.538975716
            Z: 0.265796244
          }
        }
        ParentId: 12925082365274510147
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
              R: 0.460000038
              G: 0.274172217
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
        Id: 5976621062056455144
        Name: "Frame End - Bulb"
        Transform {
          Location {
            X: -42.902832
            Y: 31.7429199
            Z: -8.66738892
          }
          Rotation {
            Pitch: -10.6099854
            Yaw: -46.0475464
            Roll: -61.46521
          }
          Scale {
            X: 0.265796244
            Y: 0.516005635
            Z: 0.265796244
          }
        }
        ParentId: 12925082365274510147
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
              R: 0.460000038
              G: 0.274172217
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
        Id: 8911581947581453158
        Name: "Frame End - Bulb"
        Transform {
          Location {
            X: -39.5771484
            Y: 31.0467529
            Z: -5.61763048
          }
          Rotation {
            Pitch: 8.95319557
            Yaw: -35.5244141
            Roll: -61.6200256
          }
          Scale {
            X: 0.258413017
            Y: 0.474167377
            Z: 0.258413017
          }
        }
        ParentId: 12925082365274510147
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
              R: 0.460000038
              G: 0.274172217
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
        Id: 11742137756688677946
        Name: "Frame End - Bulb"
        Transform {
          Location {
            X: -33.5405273
            Y: 30.5686035
            Z: 1.04350233
          }
          Rotation {
            Pitch: 48.6620445
            Yaw: -3.13653564
            Roll: -44.6946411
          }
          Scale {
            X: 0.258413017
            Y: 0.474167377
            Z: 0.258413017
          }
        }
        ParentId: 12925082365274510147
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
              R: 0.460000038
              G: 0.274172217
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
        Id: 12057584150533887153
        Name: "Wheat"
        Transform {
          Location {
            X: 236.382278
            Y: -9.8940773
            Z: -334.257782
          }
          Rotation {
            Pitch: 1.42802858
            Yaw: -112.010178
            Roll: -155.128525
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 11977670227765484253
        ChildIds: 7269692554218171491
        ChildIds: 11342408947848076344
        ChildIds: 5838645230825961538
        ChildIds: 4362793120070652457
        ChildIds: 12853209507085845997
        ChildIds: 15328188007258037520
        ChildIds: 9465752665027078270
        ChildIds: 9779040303961487331
        ChildIds: 1554240817564654988
        ChildIds: 11521533050745524129
        ChildIds: 5259827857823530968
        ChildIds: 7455400064300330253
        ChildIds: 2512462384557213897
        ChildIds: 1058128757229178029
        ChildIds: 10870373514787992603
        ChildIds: 8756353736829117088
        ChildIds: 8646509949459856480
        ChildIds: 1948587212064914695
        ChildIds: 15132888423491550765
        ChildIds: 2031911486426481120
        ChildIds: 7711314192735311507
        ChildIds: 16725356678936918435
        ChildIds: 7657975128329743185
        ChildIds: 17038005081649381610
        ChildIds: 11161294585000851807
        ChildIds: 6735632791452236483
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
        Id: 7269692554218171491
        Name: "Cylinder"
        Transform {
          Location {
            X: -8.1875
            Y: 6.39343262
            Z: 0.323069572
          }
          Rotation {
            Pitch: 51.0484619
            Yaw: -113.371979
            Roll: 99.5632935
          }
          Scale {
            X: 0.0246116444
            Y: 0.0246114098
            Z: 0.14128238
          }
        }
        ParentId: 12057584150533887153
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:color"
            Color {
              R: 0.460000038
              G: 0.274172217
              A: 1
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 14437066532589146669
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
        Id: 11342408947848076344
        Name: "Horn"
        Transform {
          Location {
            X: -13.3618164
            Y: 9.48419189
            Z: 0.96101
          }
          Rotation {
            Pitch: -71.0809
            Yaw: 77.005928
            Roll: 71.2082596
          }
          Scale {
            X: 0.0246107616
            Y: 0.0246107616
            Z: 0.197706461
          }
        }
        ParentId: 12057584150533887153
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:color"
            Color {
              R: 0.460000038
              G: 0.274172217
              A: 1
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 14437066532589146669
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
            Id: 16245950798000650069
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
        Id: 5838645230825961538
        Name: "Horn"
        Transform {
          Location {
            X: -13.3618164
            Y: 9.48419189
            Z: 0.96101
          }
          Rotation {
            Pitch: -66.4412842
            Yaw: -126.642731
            Roll: -68.0218201
          }
          Scale {
            X: 0.0213293284
            Y: 0.0213293284
            Z: 0.137820274
          }
        }
        ParentId: 12057584150533887153
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:color"
            Color {
              R: 0.460000038
              G: 0.274172217
              A: 1
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 14437066532589146669
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
            Id: 16245950798000650069
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
        Id: 4362793120070652457
        Name: "Horn"
        Transform {
          Location {
            X: -13.3603516
            Y: 9.48699951
            Z: 0.95982933
          }
          Rotation {
            Pitch: 59.719223
            Yaw: -129.667465
            Roll: -75.021637
          }
          Scale {
            X: 0.0213293284
            Y: 0.0213293284
            Z: 0.137820274
          }
        }
        ParentId: 12057584150533887153
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:color"
            Color {
              R: 0.460000038
              G: 0.274172217
              A: 1
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 14437066532589146669
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
            Id: 16245950798000650069
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
        Id: 12853209507085845997
        Name: "Frame End - Bulb"
        Transform {
          Location {
            X: -39.1201172
            Y: 8.59527588
            Z: 4.54362583
          }
          Rotation {
            Pitch: -8.50231934
            Yaw: -23.9264221
            Roll: 174.232727
          }
          Scale {
            X: 0.265796244
            Y: -0.558664322
            Z: 0.265796244
          }
        }
        ParentId: 12057584150533887153
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
              R: 0.460000038
              G: 0.274172217
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
        Id: 15328188007258037520
        Name: "Frame End - Bulb"
        Transform {
          Location {
            X: -41.0195312
            Y: 9.67474365
            Z: 4.89073563
          }
          Rotation {
            Pitch: -7.98407
            Yaw: -19.0446472
            Roll: 173.530411
          }
          Scale {
            X: 0.265796244
            Y: -0.538975716
            Z: 0.265796244
          }
        }
        ParentId: 12057584150533887153
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
              R: 0.460000038
              G: 0.274172217
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
        Id: 9465752665027078270
        Name: "Frame End - Bulb"
        Transform {
          Location {
            X: -42.1469727
            Y: 10.3285522
            Z: 5.09877396
          }
          Rotation {
            Pitch: -7.0385437
            Yaw: -11.2654419
            Roll: 172.512939
          }
          Scale {
            X: 0.265796244
            Y: -0.516005635
            Z: 0.265796244
          }
        }
        ParentId: 12057584150533887153
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
              R: 0.460000038
              G: 0.274172217
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
        Id: 9779040303961487331
        Name: "Frame End - Bulb"
        Transform {
          Location {
            X: -38.9550781
            Y: 14.7752075
            Z: 5.47978401
          }
          Rotation {
            Pitch: -3.13183594
            Yaw: 14.1404161
            Roll: 170.222382
          }
          Scale {
            X: 0.258413017
            Y: -0.474167377
            Z: 0.258413017
          }
        }
        ParentId: 12057584150533887153
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
              R: 0.460000038
              G: 0.274172217
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
        Id: 1554240817564654988
        Name: "Frame End - Bulb"
        Transform {
          Location {
            X: -30.4589844
            Y: 34.6691284
            Z: 7.73503113
          }
          Rotation {
            Pitch: -6.99841309
            Yaw: -10.9608459
            Roll: 172.473724
          }
          Scale {
            X: 0.265796244
            Y: 0.558664322
            Z: 0.265796244
          }
        }
        ParentId: 12057584150533887153
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
              R: 0.460000038
              G: 0.274172217
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
        Id: 11521533050745524129
        Name: "Frame End - Bulb"
        Transform {
          Location {
            X: -32.8012695
            Y: 34.6150513
            Z: 7.9496851
          }
          Rotation {
            Pitch: -7.60897827
            Yaw: -15.8187561
            Roll: 173.090668
          }
          Scale {
            X: 0.265796244
            Y: 0.538975716
            Z: 0.265796244
          }
        }
        ParentId: 12057584150533887153
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
              R: 0.460000038
              G: 0.274172217
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
        Id: 5259827857823530968
        Name: "Frame End - Bulb"
        Transform {
          Location {
            X: -34.2626953
            Y: 34.5647583
            Z: 8.0810833
          }
          Rotation {
            Pitch: -8.4715271
            Yaw: -23.6195679
            Roll: 174.184464
          }
          Scale {
            X: 0.265796244
            Y: 0.516005635
            Z: 0.265796244
          }
        }
        ParentId: 12057584150533887153
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
              R: 0.460000038
              G: 0.274172217
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
        Id: 7455400064300330253
        Name: "Frame End - Bulb"
        Transform {
          Location {
            X: -33.918457
            Y: 30.0699463
            Z: 7.35600471
          }
          Rotation {
            Pitch: -10.0354614
            Yaw: -46.0497742
            Roll: 177.837173
          }
          Scale {
            X: 0.258413017
            Y: 0.474167377
            Z: 0.258413017
          }
        }
        ParentId: 12057584150533887153
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
              R: 0.460000038
              G: 0.274172217
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
        Id: 2512462384557213897
        Name: "Frame End - Bulb"
        Transform {
          Location {
            X: -34.4555664
            Y: 21.1809692
            Z: 6.03804207
          }
          Rotation {
            Pitch: -8.28118896
            Yaw: -94.7825928
            Roll: -173.915543
          }
          Scale {
            X: 0.258413017
            Y: 0.474167377
            Z: 0.258413017
          }
        }
        ParentId: 12057584150533887153
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
              R: 0.460000038
              G: 0.274172217
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
        Id: 1058128757229178029
        Name: "Cylinder"
        Transform {
          Location {
            X: -11.8256836
            Y: 9.03527832
            Z: -1.43516159
          }
          Rotation {
            Pitch: 5.96534348
            Yaw: 49.396286
            Roll: -96.0281677
          }
          Scale {
            X: 0.0246116444
            Y: 0.0246114098
            Z: 0.14128238
          }
        }
        ParentId: 12057584150533887153
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:color"
            Color {
              R: 0.460000038
              G: 0.274172217
              A: 1
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 14437066532589146669
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
        Id: 10870373514787992603
        Name: "Horn"
        Transform {
          Location {
            X: -16.4433594
            Y: 12.9107666
            Z: -0.805875778
          }
          Rotation {
            Pitch: 14.5031958
            Yaw: -128.418121
            Roll: -83.8064575
          }
          Scale {
            X: 0.0246107616
            Y: 0.0246107616
            Z: 0.197706461
          }
        }
        ParentId: 12057584150533887153
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:color"
            Color {
              R: 0.460000038
              G: 0.274172217
              A: 1
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 14437066532589146669
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
            Id: 16245950798000650069
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
        Id: 8756353736829117088
        Name: "Horn"
        Transform {
          Location {
            X: -16.4433594
            Y: 12.9107666
            Z: -0.805875778
          }
          Rotation {
            Pitch: 54.8580818
            Yaw: -115.722351
            Roll: -60.6187744
          }
          Scale {
            X: 0.0213293284
            Y: 0.0213293284
            Z: 0.137820274
          }
        }
        ParentId: 12057584150533887153
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:color"
            Color {
              R: 0.460000038
              G: 0.274172217
              A: 1
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 14437066532589146669
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
            Id: 16245950798000650069
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
        Id: 8646509949459856480
        Name: "Horn"
        Transform {
          Location {
            X: -16.4448242
            Y: 12.9087524
            Z: -0.807977676
          }
          Rotation {
            Pitch: -1.16186523
            Yaw: 59.8283157
            Roll: 103.30426
          }
          Scale {
            X: 0.0213293284
            Y: 0.0213293284
            Z: 0.137820274
          }
        }
        ParentId: 12057584150533887153
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:color"
            Color {
              R: 0.460000038
              G: 0.274172217
              A: 1
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 14437066532589146669
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
            Id: 16245950798000650069
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
        Id: 1948587212064914695
        Name: "Frame End - Bulb"
        Transform {
          Location {
            X: -26.7270508
            Y: 32.7717285
            Z: 12.4938698
          }
          Rotation {
            Pitch: -10.34198
            Yaw: -45.8994446
            Roll: -61.4891357
          }
          Scale {
            X: 0.265796244
            Y: -0.558664322
            Z: 0.265796244
          }
        }
        ParentId: 12057584150533887153
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
              R: 0.460000038
              G: 0.274172217
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
        Id: 15132888423491550765
        Name: "Frame End - Bulb"
        Transform {
          Location {
            X: -28.3325195
            Y: 34.2794189
            Z: 12.7011166
          }
          Rotation {
            Pitch: -14.6018677
            Yaw: -48.2938538
            Roll: -60.9735718
          }
          Scale {
            X: 0.265796244
            Y: -0.538975716
            Z: 0.265796244
          }
        }
        ParentId: 12057584150533887153
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
              R: 0.460000038
              G: 0.274172217
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
        Id: 2031911486426481120
        Name: "Frame End - Bulb"
        Transform {
          Location {
            X: -29.2949219
            Y: 35.1754761
            Z: 12.8146439
          }
          Rotation {
            Pitch: -21.3573608
            Yaw: -52.3329773
            Roll: -59.7231445
          }
          Scale {
            X: 0.265796244
            Y: -0.516005635
            Z: 0.265796244
          }
        }
        ParentId: 12057584150533887153
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
              R: 0.460000038
              G: 0.274172217
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
        Id: 7711314192735311507
        Name: "Frame End - Bulb"
        Transform {
          Location {
            X: -31.0166016
            Y: 33.2580566
            Z: 7.97067833
          }
          Rotation {
            Pitch: -42.5276794
            Yaw: -69.5263062
            Roll: -50.4196472
          }
          Scale {
            X: 0.258413017
            Y: -0.474167377
            Z: 0.258413017
          }
        }
        ParentId: 12057584150533887153
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
              R: 0.460000038
              G: 0.274172217
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
        Id: 16725356678936918435
        Name: "Frame End - Bulb"
        Transform {
          Location {
            X: -41.2875977
            Y: 28.9468384
            Z: -10.7096262
          }
          Rotation {
            Pitch: -21.6208191
            Yaw: -52.4980774
            Roll: -59.6646118
          }
          Scale {
            X: 0.265796244
            Y: 0.558664322
            Z: 0.265796244
          }
        }
        ParentId: 12057584150533887153
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
              R: 0.460000038
              G: 0.274172217
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
        Id: 7657975128329743185
        Name: "Frame End - Bulb"
        Transform {
          Location {
            X: -42.2895508
            Y: 30.6695557
            Z: -9.45942879
          }
          Rotation {
            Pitch: -17.4098206
            Yaw: -49.9294434
            Roll: -60.5244141
          }
          Scale {
            X: 0.265796244
            Y: 0.538975716
            Z: 0.265796244
          }
        }
        ParentId: 12057584150533887153
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
              R: 0.460000038
              G: 0.274172217
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
        Id: 17038005081649381610
        Name: "Frame End - Bulb"
        Transform {
          Location {
            X: -42.902832
            Y: 31.7429199
            Z: -8.66738892
          }
          Rotation {
            Pitch: -10.6099854
            Yaw: -46.0475464
            Roll: -61.46521
          }
          Scale {
            X: 0.265796244
            Y: 0.516005635
            Z: 0.265796244
          }
        }
        ParentId: 12057584150533887153
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
              R: 0.460000038
              G: 0.274172217
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
        Id: 11161294585000851807
        Name: "Frame End - Bulb"
        Transform {
          Location {
            X: -39.5771484
            Y: 31.0467529
            Z: -5.61763048
          }
          Rotation {
            Pitch: 8.95319557
            Yaw: -35.5244141
            Roll: -61.6200256
          }
          Scale {
            X: 0.258413017
            Y: 0.474167377
            Z: 0.258413017
          }
        }
        ParentId: 12057584150533887153
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
              R: 0.460000038
              G: 0.274172217
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
        Id: 6735632791452236483
        Name: "Frame End - Bulb"
        Transform {
          Location {
            X: -33.5405273
            Y: 30.5686035
            Z: 1.04350233
          }
          Rotation {
            Pitch: 48.6620445
            Yaw: -3.13653564
            Roll: -44.6946411
          }
          Scale {
            X: 0.258413017
            Y: 0.474167377
            Z: 0.258413017
          }
        }
        ParentId: 12057584150533887153
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
              R: 0.460000038
              G: 0.274172217
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
        Id: 16090377849430763371
        Name: "Carrot"
        Transform {
          Location {
            X: -154.711899
            Y: -63.2606735
            Z: -394.211273
          }
          Rotation {
            Pitch: -21.9863033
            Yaw: 132.120071
            Roll: -37.068222
          }
          Scale {
            X: 1.09784055
            Y: 1.09784055
            Z: 1.09784055
          }
        }
        ParentId: 11977670227765484253
        ChildIds: 11913368160717040462
        ChildIds: 12903162891486129639
        ChildIds: 18299365847210014980
        ChildIds: 17752849146916344939
        ChildIds: 10616755415256533944
        ChildIds: 9098008847816231749
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
        Id: 11913368160717040462
        Name: "Sphere - Half"
        Transform {
          Location {
          }
          Rotation {
          }
          Scale {
            X: 0.131453618
            Y: 0.131453618
            Z: 0.066579394
          }
        }
        ParentId: 16090377849430763371
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 7719735812193550538
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:smart"
            Bool: false
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:utile"
            Float: 1.93266356
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:vtile"
            Float: 3.02476573
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:color"
            Color {
              R: 0.6
              G: 0.388025254
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
            Id: 2346653999024665326
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
        Id: 12903162891486129639
        Name: "Horn"
        Transform {
          Location {
            X: 0.358398438
            Y: -0.400817871
            Z: 0.471522331
          }
          Rotation {
            Pitch: 2.32979107
            Yaw: -99.1602783
            Roll: 14.1494923
          }
          Scale {
            X: 0.0213706419
            Y: 0.0213706419
            Z: 0.105432883
          }
        }
        ParentId: 16090377849430763371
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
              R: 0.0460926555
              G: 0.24000001
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
            Id: 16245950798000650069
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
        Id: 18299365847210014980
        Name: "Kelp Bush 01"
        Transform {
          Location {
            X: -2.62402344
            Y: -3.65130615
            Z: 10.5582609
          }
          Rotation {
            Pitch: -36.2919617
            Yaw: -138.166855
            Roll: -2.66217041
          }
          Scale {
            X: 0.0871555358
            Y: 0.0871555358
            Z: 0.0871555358
          }
        }
        ParentId: 16090377849430763371
        UnregisteredParameters {
          Overrides {
            Name: "ma:Nature_Leaves:id"
            AssetReference {
              Id: 3033557993563810247
            }
          }
          Overrides {
            Name: "ma:Nature_Leaves:color"
            Color {
              R: 0.0624105781
              G: 0.15200001
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
            Id: 15093605760662794654
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
        Id: 17752849146916344939
        Name: "Horn"
        Transform {
          Location {
            X: 0.358398438
            Y: -0.400817871
            Z: 0.471522331
          }
          Rotation {
            Pitch: 1.33269966
            Yaw: 121.468788
            Roll: 21.5851326
          }
          Scale {
            X: 0.0155229503
            Y: 0.0155229503
            Z: 0.0765830725
          }
        }
        ParentId: 16090377849430763371
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
              R: 0.0460926555
              G: 0.24000001
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
            Id: 16245950798000650069
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
        Id: 10616755415256533944
        Name: "Kelp Bush 01"
        Transform {
          Location {
            X: 4.75244141
            Y: -1.03845215
            Z: 14.8693342
          }
          Rotation {
            Pitch: -29.135498
          }
          Scale {
            X: 0.119988143
            Y: 0.119988143
            Z: 0.119988143
          }
        }
        ParentId: 16090377849430763371
        UnregisteredParameters {
          Overrides {
            Name: "ma:Nature_Leaves:id"
            AssetReference {
              Id: 3033557993563810247
            }
          }
          Overrides {
            Name: "ma:Nature_Leaves:color"
            Color {
              R: 0.0624105781
              G: 0.15200001
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
            Id: 15093605760662794654
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
        Id: 9098008847816231749
        Name: "Sphere - Half"
        Transform {
          Location {
            Y: 4.06901054e-05
          }
          Rotation {
            Pitch: 180
          }
          Scale {
            X: 0.131453753
            Y: 0.131453335
            Z: 0.647164
          }
        }
        ParentId: 16090377849430763371
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 7719735812193550538
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:smart"
            Bool: false
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:vtile"
            Float: 15.7584972
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:color"
            Color {
              R: 0.6
              G: 0.388025254
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
            Id: 2346653999024665326
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
        Id: 10026833906741783061
        Name: "Carrot Short Greens"
        Transform {
          Location {
            X: -135.827606
            Y: -80.8251801
            Z: -399.376709
          }
          Rotation {
            Pitch: 33.638073
            Yaw: -99.5773621
            Roll: 48.320591
          }
          Scale {
            X: 1.09784055
            Y: 1.09784055
            Z: 1.09784055
          }
        }
        ParentId: 11977670227765484253
        ChildIds: 17896336632929024231
        ChildIds: 4695551558197268905
        ChildIds: 10151037765404120999
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
        Id: 17896336632929024231
        Name: "Sphere - Half"
        Transform {
          Location {
          }
          Rotation {
          }
          Scale {
            X: 0.131453618
            Y: 0.131453618
            Z: 0.066579394
          }
        }
        ParentId: 10026833906741783061
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 7719735812193550538
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:smart"
            Bool: false
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:utile"
            Float: 1.93266356
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:vtile"
            Float: 3.02476573
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:color"
            Color {
              R: 0.6
              G: 0.388025254
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
            Id: 2346653999024665326
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
        Id: 4695551558197268905
        Name: "Horn"
        Transform {
          Location {
            X: 0.386686832
            Y: -0.244910225
            Z: 4.35970306
          }
          Rotation {
            Pitch: 2.32985258
            Yaw: -99.1604614
            Roll: -179.953629
          }
          Scale {
            X: 0.0484204553
            Y: 0.0484247915
            Z: 0.0363982245
          }
        }
        ParentId: 10026833906741783061
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
              R: 0.0460926555
              G: 0.24000001
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
            Id: 16245950798000650069
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
        Id: 10151037765404120999
        Name: "Sphere - Half"
        Transform {
          Location {
            Y: 4.06901054e-05
          }
          Rotation {
            Pitch: 180
          }
          Scale {
            X: 0.131453753
            Y: 0.131453335
            Z: 0.647164
          }
        }
        ParentId: 10026833906741783061
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 7719735812193550538
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:smart"
            Bool: false
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:vtile"
            Float: 15.7584972
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:color"
            Color {
              R: 0.6
              G: 0.388025254
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
            Id: 2346653999024665326
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
        Id: 4227591477029187902
        Name: "Carrot"
        Transform {
          Location {
            X: -165.151901
            Y: -72.3983307
            Z: -391.702301
          }
          Rotation {
            Pitch: 33.6382027
            Yaw: -99.5772
            Roll: -8.58228874
          }
          Scale {
            X: 1.09784055
            Y: 1.09784055
            Z: 1.09784055
          }
        }
        ParentId: 11977670227765484253
        ChildIds: 6543341325219789668
        ChildIds: 3882897571917034846
        ChildIds: 16036770734875319807
        ChildIds: 4372324752806227220
        ChildIds: 8575695701764044541
        ChildIds: 18342934596811604292
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
        Id: 6543341325219789668
        Name: "Sphere - Half"
        Transform {
          Location {
          }
          Rotation {
          }
          Scale {
            X: 0.131453618
            Y: 0.131453618
            Z: 0.066579394
          }
        }
        ParentId: 4227591477029187902
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 7719735812193550538
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:smart"
            Bool: false
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:utile"
            Float: 1.93266356
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:vtile"
            Float: 3.02476573
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:color"
            Color {
              R: 0.6
              G: 0.388025254
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
            Id: 2346653999024665326
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
        Id: 3882897571917034846
        Name: "Horn"
        Transform {
          Location {
            X: 0.358398438
            Y: -0.400817871
            Z: 0.471522331
          }
          Rotation {
            Pitch: 2.32979107
            Yaw: -99.1602783
            Roll: 14.1494923
          }
          Scale {
            X: 0.0213706419
            Y: 0.0213706419
            Z: 0.105432883
          }
        }
        ParentId: 4227591477029187902
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
              R: 0.0460926555
              G: 0.24000001
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
            Id: 16245950798000650069
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
        Id: 16036770734875319807
        Name: "Kelp Bush 01"
        Transform {
          Location {
            X: -2.62402344
            Y: -3.65130615
            Z: 10.5582609
          }
          Rotation {
            Pitch: -36.2919617
            Yaw: -138.166855
            Roll: -2.66217041
          }
          Scale {
            X: 0.0871555358
            Y: 0.0871555358
            Z: 0.0871555358
          }
        }
        ParentId: 4227591477029187902
        UnregisteredParameters {
          Overrides {
            Name: "ma:Nature_Leaves:id"
            AssetReference {
              Id: 3033557993563810247
            }
          }
          Overrides {
            Name: "ma:Nature_Leaves:color"
            Color {
              R: 0.0624105781
              G: 0.15200001
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
            Id: 15093605760662794654
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
        Id: 4372324752806227220
        Name: "Horn"
        Transform {
          Location {
            X: 0.358398438
            Y: -0.400817871
            Z: 0.471522331
          }
          Rotation {
            Pitch: 1.33269966
            Yaw: 121.468788
            Roll: 21.5851326
          }
          Scale {
            X: 0.0155229503
            Y: 0.0155229503
            Z: 0.0765830725
          }
        }
        ParentId: 4227591477029187902
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
              R: 0.0460926555
              G: 0.24000001
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
            Id: 16245950798000650069
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
        Id: 8575695701764044541
        Name: "Kelp Bush 01"
        Transform {
          Location {
            X: 4.75244141
            Y: -1.03845215
            Z: 14.8693342
          }
          Rotation {
            Pitch: -29.135498
          }
          Scale {
            X: 0.119988143
            Y: 0.119988143
            Z: 0.119988143
          }
        }
        ParentId: 4227591477029187902
        UnregisteredParameters {
          Overrides {
            Name: "ma:Nature_Leaves:id"
            AssetReference {
              Id: 3033557993563810247
            }
          }
          Overrides {
            Name: "ma:Nature_Leaves:color"
            Color {
              R: 0.0624105781
              G: 0.15200001
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
            Id: 15093605760662794654
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
        Id: 18342934596811604292
        Name: "Sphere - Half"
        Transform {
          Location {
            Y: 4.06901054e-05
          }
          Rotation {
            Pitch: 180
          }
          Scale {
            X: 0.131453753
            Y: 0.131453335
            Z: 0.647164
          }
        }
        ParentId: 4227591477029187902
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 7719735812193550538
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:smart"
            Bool: false
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:vtile"
            Float: 15.7584972
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:color"
            Color {
              R: 0.6
              G: 0.388025254
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
            Id: 2346653999024665326
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
        Id: 7287147961435409046
        Name: "Carrot Short Greens"
        Transform {
          Location {
            X: -169.692856
            Y: -99.5188828
            Z: -411.694122
          }
          Rotation {
            Pitch: -18.8715324
            Yaw: -147.213379
            Roll: 93.9591599
          }
          Scale {
            X: 1.09784055
            Y: 1.09784055
            Z: 1.09784055
          }
        }
        ParentId: 11977670227765484253
        ChildIds: 6341316144715473842
        ChildIds: 12312956012060307738
        ChildIds: 6391537790344729987
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
        Id: 6341316144715473842
        Name: "Sphere - Half"
        Transform {
          Location {
          }
          Rotation {
          }
          Scale {
            X: 0.131453618
            Y: 0.131453618
            Z: 0.066579394
          }
        }
        ParentId: 7287147961435409046
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 7719735812193550538
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:smart"
            Bool: false
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:utile"
            Float: 1.93266356
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:vtile"
            Float: 3.02476573
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:color"
            Color {
              R: 0.6
              G: 0.388025254
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
            Id: 2346653999024665326
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
        Id: 12312956012060307738
        Name: "Horn"
        Transform {
          Location {
            X: 0.386686832
            Y: -0.244910225
            Z: 4.35970306
          }
          Rotation {
            Pitch: 2.32985258
            Yaw: -99.1604614
            Roll: -179.953629
          }
          Scale {
            X: 0.0484204553
            Y: 0.0484247915
            Z: 0.0363982245
          }
        }
        ParentId: 7287147961435409046
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
              R: 0.0460926555
              G: 0.24000001
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
            Id: 16245950798000650069
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
        Id: 6391537790344729987
        Name: "Sphere - Half"
        Transform {
          Location {
            Y: 4.06901054e-05
          }
          Rotation {
            Pitch: 180
          }
          Scale {
            X: 0.131453753
            Y: 0.131453335
            Z: 0.647164
          }
        }
        ParentId: 7287147961435409046
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 7719735812193550538
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:smart"
            Bool: false
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:vtile"
            Float: 15.7584972
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:color"
            Color {
              R: 0.6
              G: 0.388025254
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
            Id: 2346653999024665326
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
        Id: 16680142592059918151
        Name: "Carrot Short Greens"
        Transform {
          Location {
            X: -169.692856
            Y: -104.576012
            Z: -401.645203
          }
          Rotation {
            Pitch: 9.96244526
            Yaw: 104.699417
            Roll: 84.0699768
          }
          Scale {
            X: 1.09784055
            Y: 1.09784055
            Z: 1.09784055
          }
        }
        ParentId: 11977670227765484253
        ChildIds: 11429455124055690221
        ChildIds: 6318714628097584114
        ChildIds: 9916436843332758821
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
        Id: 11429455124055690221
        Name: "Sphere - Half"
        Transform {
          Location {
          }
          Rotation {
          }
          Scale {
            X: 0.131453618
            Y: 0.131453618
            Z: 0.066579394
          }
        }
        ParentId: 16680142592059918151
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 7719735812193550538
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:smart"
            Bool: false
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:utile"
            Float: 1.93266356
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:vtile"
            Float: 3.02476573
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:color"
            Color {
              R: 0.6
              G: 0.388025254
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
            Id: 2346653999024665326
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
        Id: 6318714628097584114
        Name: "Horn"
        Transform {
          Location {
            X: 0.386686832
            Y: -0.244910225
            Z: 4.35970306
          }
          Rotation {
            Pitch: 2.32985258
            Yaw: -99.1604614
            Roll: -179.953629
          }
          Scale {
            X: 0.0484204553
            Y: 0.0484247915
            Z: 0.0363982245
          }
        }
        ParentId: 16680142592059918151
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
              R: 0.0460926555
              G: 0.24000001
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
            Id: 16245950798000650069
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
        Id: 9916436843332758821
        Name: "Sphere - Half"
        Transform {
          Location {
            Y: 4.06901054e-05
          }
          Rotation {
            Pitch: 180
          }
          Scale {
            X: 0.131453753
            Y: 0.131453335
            Z: 0.647164
          }
        }
        ParentId: 16680142592059918151
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 7719735812193550538
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:smart"
            Bool: false
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:vtile"
            Float: 15.7584972
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:color"
            Color {
              R: 0.6
              G: 0.388025254
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
            Id: 2346653999024665326
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
        Id: 5121888891621935697
        Name: "Grapes"
        Transform {
          Location {
            X: 162.887695
            Y: 57.0047302
            Z: -328.855438
          }
          Rotation {
            Pitch: 47.5141487
            Yaw: -106.651764
            Roll: -15.7250652
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 11977670227765484253
        ChildIds: 7586844561286528796
        ChildIds: 628357918008615808
        ChildIds: 13673598161822550464
        ChildIds: 14989620812646604922
        ChildIds: 7807064229695036440
        ChildIds: 6972105343434117409
        ChildIds: 4302889236453241695
        ChildIds: 6161296852870452458
        ChildIds: 8446367094646617399
        ChildIds: 2839773387348577739
        ChildIds: 701240399791093264
        ChildIds: 2661477145551455946
        ChildIds: 2656382610191446052
        ChildIds: 12898675116075235000
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
        Id: 7586844561286528796
        Name: "Sphere"
        Transform {
          Location {
            X: 7.37939453
            Y: -4.15606689
            Z: 2.36974335
          }
          Rotation {
          }
          Scale {
            X: 0.105408855
            Y: 0.105408855
            Z: 0.105408855
          }
        }
        ParentId: 5121888891621935697
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 1792590512685276522
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:color"
            Color {
              R: 0.0512583219
              B: 0.0900000334
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
        Id: 628357918008615808
        Name: "Sphere"
        Transform {
          Location {
            X: -1.06298828
            Y: -8.83911133
            Z: 2.36974335
          }
          Rotation {
          }
          Scale {
            X: 0.105408855
            Y: 0.105408855
            Z: 0.105408855
          }
        }
        ParentId: 5121888891621935697
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 1792590512685276522
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:color"
            Color {
              R: 0.0512583219
              B: 0.0900000334
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
        Id: 13673598161822550464
        Name: "Sphere"
        Transform {
          Location {
            X: -7.93798828
            Y: -2.57556152
            Z: 2.36974335
          }
          Rotation {
          }
          Scale {
            X: 0.105408855
            Y: 0.105408855
            Z: 0.105408855
          }
        }
        ParentId: 5121888891621935697
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 1792590512685276522
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:color"
            Color {
              R: 0.0512583219
              B: 0.0900000334
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
        Id: 14989620812646604922
        Name: "Sphere"
        Transform {
          Location {
          }
          Rotation {
          }
          Scale {
            X: 0.105408855
            Y: 0.105408855
            Z: 0.105408855
          }
        }
        ParentId: 5121888891621935697
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 1792590512685276522
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:color"
            Color {
              R: 0.0512583219
              B: 0.0900000334
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
        Id: 7807064229695036440
        Name: "Sphere"
        Transform {
          Location {
            X: -3.72900391
            Y: 6.5880127
            Z: 2.36974335
          }
          Rotation {
          }
          Scale {
            X: 0.105408855
            Y: 0.105408855
            Z: 0.105408855
          }
        }
        ParentId: 5121888891621935697
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 1792590512685276522
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:color"
            Color {
              R: 0.0512583219
              B: 0.0900000334
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
        Id: 6972105343434117409
        Name: "Sphere"
        Transform {
          Location {
            X: -5.76757812
            Y: 0.382202148
            Z: -5.51677704
          }
          Rotation {
            Yaw: 39.4827461
          }
          Scale {
            X: 0.101768106
            Y: 0.101768106
            Z: 0.101768106
          }
        }
        ParentId: 5121888891621935697
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 1792590512685276522
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:color"
            Color {
              R: 0.0512583219
              B: 0.0900000334
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
        Id: 4302889236453241695
        Name: "Sphere"
        Transform {
          Location {
            X: 0.196777344
            Y: 6.17272949
            Z: -5.51677704
          }
          Rotation {
            Yaw: 39.4827461
          }
          Scale {
            X: 0.101768106
            Y: 0.101768106
            Z: 0.101768106
          }
        }
        ParentId: 5121888891621935697
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 1792590512685276522
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:color"
            Color {
              R: 0.0512583219
              B: 0.0900000334
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
        Id: 6161296852870452458
        Name: "Sphere"
        Transform {
          Location {
            X: 7.12890625
            Y: -0.596191406
            Z: -5.51677704
          }
          Rotation {
            Yaw: 39.4827461
          }
          Scale {
            X: 0.101768106
            Y: 0.101768106
            Z: 0.101768106
          }
        }
        ParentId: 5121888891621935697
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 1792590512685276522
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:color"
            Color {
              R: 0.0512583219
              B: 0.0900000334
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
        Id: 8446367094646617399
        Name: "Sphere"
        Transform {
          Location {
            X: -0.751464844
            Y: -6.36804199
            Z: -5.51677704
          }
          Rotation {
            Yaw: 39.4827461
          }
          Scale {
            X: 0.101768106
            Y: 0.101768106
            Z: 0.101768106
          }
        }
        ParentId: 5121888891621935697
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 1792590512685276522
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:color"
            Color {
              R: 0.0512583219
              B: 0.0900000334
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
        Id: 2839773387348577739
        Name: "Sphere"
        Transform {
          Location {
            X: 2.06494141
            Y: -4.55682373
            Z: -12.7816544
          }
          Rotation {
            Yaw: 100.290962
          }
          Scale {
            X: 0.0944673568
            Y: 0.0944673568
            Z: 0.0944673568
          }
        }
        ParentId: 5121888891621935697
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 1792590512685276522
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:color"
            Color {
              R: 0.0512583219
              B: 0.0900000334
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
        Id: 701240399791093264
        Name: "Sphere"
        Transform {
          Location {
            X: -3.69482422
            Y: 1.24450684
            Z: -12.7816544
          }
          Rotation {
            Yaw: 100.290962
          }
          Scale {
            X: 0.0944673568
            Y: 0.0944673568
            Z: 0.0944673568
          }
        }
        ParentId: 5121888891621935697
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 1792590512685276522
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:color"
            Color {
              R: 0.0512583219
              B: 0.0900000334
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
        Id: 2661477145551455946
        Name: "Sphere"
        Transform {
          Location {
            X: 3.82617188
            Y: 2.88873291
            Z: -12.7816544
          }
          Rotation {
            Yaw: 100.290962
          }
          Scale {
            X: 0.0944673568
            Y: 0.0944673568
            Z: 0.0944673568
          }
        }
        ParentId: 5121888891621935697
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 1792590512685276522
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:color"
            Color {
              R: 0.0512583219
              B: 0.0900000334
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
        Id: 2656382610191446052
        Name: "Sphere"
        Transform {
          Location {
            X: 0.416992188
            Y: 0.46661377
            Z: -18.7058182
          }
          Rotation {
            Yaw: 100.290962
          }
          Scale {
            X: 0.0944673568
            Y: 0.0944673568
            Z: 0.0944673568
          }
        }
        ParentId: 5121888891621935697
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 1792590512685276522
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:color"
            Color {
              R: 0.0512583219
              B: 0.0900000334
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
        Id: 12898675116075235000
        Name: "Horn"
        Transform {
          Location {
            X: -0.0288085938
            Y: 0.0589599609
            Z: 2.61605835
          }
          Rotation {
            Yaw: -22.3479614
            Roll: 20.7998829
          }
          Scale {
            X: 0.0471757874
            Y: 0.0471757874
            Z: 0.0797548369
          }
        }
        ParentId: 5121888891621935697
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 14000043932012134250
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:color"
            Color {
              R: 0.682119131
              G: 1
              B: 0.399999976
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
            Id: 16245950798000650069
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
        Id: 12370057977495642019
        Name: "Grapes"
        Transform {
          Location {
            X: 137.750946
            Y: 32.8527031
            Z: -332.864471
          }
          Rotation {
            Pitch: 45.6904411
            Yaw: -70.2934
            Roll: -55.2203331
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 11977670227765484253
        ChildIds: 13187634355666586222
        ChildIds: 13798320862451393897
        ChildIds: 14651177847255858471
        ChildIds: 16449135475935328081
        ChildIds: 4325804102333121395
        ChildIds: 14284538915724507930
        ChildIds: 7185965065983645245
        ChildIds: 6964235838377755723
        ChildIds: 34033414098645260
        ChildIds: 14912132309030296079
        ChildIds: 12323232140134636623
        ChildIds: 847742244992581233
        ChildIds: 13432749843973785444
        ChildIds: 4924050520651964238
        ChildIds: 3401641313621202619
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
        Id: 13187634355666586222
        Name: "Sphere"
        Transform {
          Location {
            X: 7.37939453
            Y: -4.15606689
            Z: 2.36974335
          }
          Rotation {
          }
          Scale {
            X: 0.105408855
            Y: 0.105408855
            Z: 0.105408855
          }
        }
        ParentId: 12370057977495642019
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 1792590512685276522
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:color"
            Color {
              R: 0.0512583219
              B: 0.0900000334
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
        Id: 13798320862451393897
        Name: "Sphere"
        Transform {
          Location {
            X: -1.06298828
            Y: -8.83911133
            Z: 2.36974335
          }
          Rotation {
          }
          Scale {
            X: 0.105408855
            Y: 0.105408855
            Z: 0.105408855
          }
        }
        ParentId: 12370057977495642019
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 1792590512685276522
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:color"
            Color {
              R: 0.0512583219
              B: 0.0900000334
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
        Id: 14651177847255858471
        Name: "Sphere"
        Transform {
          Location {
            X: -7.93798828
            Y: -2.57556152
            Z: 2.36974335
          }
          Rotation {
          }
          Scale {
            X: 0.105408855
            Y: 0.105408855
            Z: 0.105408855
          }
        }
        ParentId: 12370057977495642019
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 1792590512685276522
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:color"
            Color {
              R: 0.0512583219
              B: 0.0900000334
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
        Id: 16449135475935328081
        Name: "Sphere"
        Transform {
          Location {
          }
          Rotation {
          }
          Scale {
            X: 0.105408855
            Y: 0.105408855
            Z: 0.105408855
          }
        }
        ParentId: 12370057977495642019
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 1792590512685276522
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:color"
            Color {
              R: 0.0512583219
              B: 0.0900000334
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
        Id: 4325804102333121395
        Name: "Sphere"
        Transform {
          Location {
            X: 6.33349609
            Y: 5.47583
            Z: 2.36974335
          }
          Rotation {
          }
          Scale {
            X: 0.105408855
            Y: 0.105408855
            Z: 0.105408855
          }
        }
        ParentId: 12370057977495642019
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 1792590512685276522
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:color"
            Color {
              R: 0.0512583219
              B: 0.0900000334
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
        Id: 14284538915724507930
        Name: "Sphere"
        Transform {
          Location {
            X: -3.72900391
            Y: 6.5880127
            Z: 2.36974335
          }
          Rotation {
          }
          Scale {
            X: 0.105408855
            Y: 0.105408855
            Z: 0.105408855
          }
        }
        ParentId: 12370057977495642019
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 1792590512685276522
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:color"
            Color {
              R: 0.0512583219
              B: 0.0900000334
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
        Id: 7185965065983645245
        Name: "Sphere"
        Transform {
          Location {
            X: -5.76757812
            Y: 0.382202148
            Z: -5.51677704
          }
          Rotation {
            Yaw: 39.4827461
          }
          Scale {
            X: 0.101768106
            Y: 0.101768106
            Z: 0.101768106
          }
        }
        ParentId: 12370057977495642019
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 1792590512685276522
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:color"
            Color {
              R: 0.0512583219
              B: 0.0900000334
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
        Id: 6964235838377755723
        Name: "Sphere"
        Transform {
          Location {
            X: 0.196777344
            Y: 6.17272949
            Z: -5.51677704
          }
          Rotation {
            Yaw: 39.4827461
          }
          Scale {
            X: 0.101768106
            Y: 0.101768106
            Z: 0.101768106
          }
        }
        ParentId: 12370057977495642019
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 1792590512685276522
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:color"
            Color {
              R: 0.0512583219
              B: 0.0900000334
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
        Id: 34033414098645260
        Name: "Sphere"
        Transform {
          Location {
            X: 7.12890625
            Y: -0.596191406
            Z: -5.51677704
          }
          Rotation {
            Yaw: 39.4827461
          }
          Scale {
            X: 0.101768106
            Y: 0.101768106
            Z: 0.101768106
          }
        }
        ParentId: 12370057977495642019
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 1792590512685276522
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:color"
            Color {
              R: 0.0512583219
              B: 0.0900000334
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
        Id: 14912132309030296079
        Name: "Sphere"
        Transform {
          Location {
            X: -0.751464844
            Y: -6.36804199
            Z: -5.51677704
          }
          Rotation {
            Yaw: 39.4827461
          }
          Scale {
            X: 0.101768106
            Y: 0.101768106
            Z: 0.101768106
          }
        }
        ParentId: 12370057977495642019
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 1792590512685276522
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:color"
            Color {
              R: 0.0512583219
              B: 0.0900000334
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
        Id: 12323232140134636623
        Name: "Sphere"
        Transform {
          Location {
            X: 2.06494141
            Y: -4.55682373
            Z: -12.7816544
          }
          Rotation {
            Yaw: 100.290962
          }
          Scale {
            X: 0.0944673568
            Y: 0.0944673568
            Z: 0.0944673568
          }
        }
        ParentId: 12370057977495642019
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 1792590512685276522
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:color"
            Color {
              R: 0.0512583219
              B: 0.0900000334
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
        Id: 847742244992581233
        Name: "Sphere"
        Transform {
          Location {
            X: -3.69482422
            Y: 1.24450684
            Z: -12.7816544
          }
          Rotation {
            Yaw: 100.290962
          }
          Scale {
            X: 0.0944673568
            Y: 0.0944673568
            Z: 0.0944673568
          }
        }
        ParentId: 12370057977495642019
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 1792590512685276522
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:color"
            Color {
              R: 0.0512583219
              B: 0.0900000334
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
        Id: 13432749843973785444
        Name: "Sphere"
        Transform {
          Location {
            X: 3.82617188
            Y: 2.88873291
            Z: -12.7816544
          }
          Rotation {
            Yaw: 100.290962
          }
          Scale {
            X: 0.0944673568
            Y: 0.0944673568
            Z: 0.0944673568
          }
        }
        ParentId: 12370057977495642019
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 1792590512685276522
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:color"
            Color {
              R: 0.0512583219
              B: 0.0900000334
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
        Id: 4924050520651964238
        Name: "Sphere"
        Transform {
          Location {
            X: 0.416992188
            Y: 0.46661377
            Z: -18.7058182
          }
          Rotation {
            Yaw: 100.290962
          }
          Scale {
            X: 0.0944673568
            Y: 0.0944673568
            Z: 0.0944673568
          }
        }
        ParentId: 12370057977495642019
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 1792590512685276522
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:color"
            Color {
              R: 0.0512583219
              B: 0.0900000334
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
        Id: 3401641313621202619
        Name: "Horn"
        Transform {
          Location {
            X: -0.0288085938
            Y: 0.0589599609
            Z: 2.61605835
          }
          Rotation {
            Yaw: -22.3479614
            Roll: 20.7998829
          }
          Scale {
            X: 0.0471757874
            Y: 0.0471757874
            Z: 0.0797548369
          }
        }
        ParentId: 12370057977495642019
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 14000043932012134250
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:color"
            Color {
              R: 0.682119131
              G: 1
              B: 0.399999976
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
            Id: 16245950798000650069
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
        Id: 16182197919113807857
        Name: "Watermellon"
        Transform {
          Location {
            X: 91.6120605
            Y: -58.2699814
            Z: -404.264587
          }
          Rotation {
            Pitch: 90
            Yaw: 68.1986
            Roll: 23.1987457
          }
          Scale {
            X: 0.428851
            Y: 0.428851
            Z: 0.490026742
          }
        }
        ParentId: 11977670227765484253
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 4358367657038052325
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:smart"
            Bool: false
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:utile"
            Float: 1.53069413
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:vtile"
            Float: 2.45160317
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
        Id: 10080907176367414981
        Name: "Watermellon"
        Transform {
          Location {
            X: 113.911476
            Y: -92.9385834
            Z: -404.264587
          }
          Rotation {
            Pitch: 54.2754211
            Yaw: -44.9999657
            Roll: -168.94252
          }
          Scale {
            X: 0.428851
            Y: 0.428851
            Z: 0.490026742
          }
        }
        ParentId: 11977670227765484253
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 4358367657038052325
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:smart"
            Bool: false
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:utile"
            Float: 1.53069413
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:vtile"
            Float: 2.45160317
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
        Id: 11660497325757929636
        Name: "Watermellon"
        Transform {
          Location {
            X: 195.592926
            Y: -78.0730286
            Z: -404.264587
          }
          Rotation {
            Pitch: 90
            Yaw: -18.4349556
            Roll: 65.1859131
          }
          Scale {
            X: 0.379386634
            Y: 0.379386634
            Z: 0.43350625
          }
        }
        ParentId: 11977670227765484253
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 4358367657038052325
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:smart"
            Bool: false
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:utile"
            Float: 1.53069413
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:vtile"
            Float: 2.45160317
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
        Id: 9156263018191303174
        Name: "Sphere"
        Transform {
          Location {
            X: 166.892044
            Y: 54.2402267
            Z: -321.641846
          }
          Rotation {
            Pitch: 47.5141487
            Yaw: -106.651764
            Roll: -15.7250786
          }
          Scale {
            X: 0.105408855
            Y: 0.105408855
            Z: 0.105408855
          }
        }
        ParentId: 11977670227765484253
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 1792590512685276522
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:color"
            Color {
              R: 0.0512583219
              B: 0.0900000334
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
        Id: 9729028085456628636
        Name: "Simple Crate 150cm"
        Transform {
          Location {
            X: -141.293518
            Y: 2.72252464
            Z: -420.804413
          }
          Rotation {
          }
          Scale {
            X: 0.6
            Y: 0.6
            Z: 0.6
          }
        }
        ParentId: 11977670227765484253
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
            Id: 12208201667061053773
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
        Id: 14383440769960399061
        Name: "Small Open Crate"
        Transform {
          Location {
            X: -233.062027
            Y: 10.5673447
            Z: -374.606567
          }
          Rotation {
          }
          Scale {
            X: 0.884599566
            Y: 0.800000072
            Z: 0.714766145
          }
        }
        ParentId: 11977670227765484253
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
            Id: 5464418781972597556
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
        Id: 17700599221810732954
        Name: "Small Open Crate"
        Transform {
          Location {
            X: -233.062027
            Y: 10.5673447
            Z: -420.733673
          }
          Rotation {
          }
          Scale {
            X: 0.884599566
            Y: 0.800000072
            Z: 0.714766145
          }
        }
        ParentId: 11977670227765484253
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
            Id: 5464418781972597556
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
        Id: 4385956631431211248
        Name: "Small Crate Lid"
        Transform {
          Location {
            X: -39.293972
            Y: 1.47843647
            Z: -329.733673
          }
          Rotation {
            Yaw: -90
          }
          Scale {
            X: 1.11712289
            Y: 0.99999994
            Z: 1
          }
        }
        ParentId: 11977670227765484253
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
            Id: 13329650285144519952
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
        Id: 9328370912682924518
        Name: "Simple Crate 150cm"
        Transform {
          Location {
            X: 62.4003601
            Y: 2.72251129
            Z: -421.878357
          }
          Rotation {
          }
          Scale {
            X: 0.6
            Y: 0.6
            Z: 0.6
          }
        }
        ParentId: 11977670227765484253
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
            Id: 12208201667061053773
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
        Id: 18435502663935888011
        Name: "Urban Cardboard Box 01 - Base"
        Transform {
          Location {
            X: 63.9380112
            Y: 2.53399849
            Z: -335.733673
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 1
            Z: 0.364906907
          }
        }
        ParentId: 11977670227765484253
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 4014322821159656914
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:smart"
            Bool: false
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:utile"
            Float: 10.0724707
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:vtile"
            Float: 5.46016121
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
            Id: 13649085988947597953
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
        Id: 18254379069206070405
        Name: "Urban Cardboard Box 01 - Base"
        Transform {
          Location {
            X: 149.315842
            Y: 50.2840271
            Z: -339.864929
          }
          Rotation {
            Pitch: -19.906456
            Yaw: -89.9999847
            Roll: -9.08028539e-07
          }
          Scale {
            X: 1
            Y: 1
            Z: 0.364906907
          }
        }
        ParentId: 11977670227765484253
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 4014322821159656914
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:smart"
            Bool: false
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:utile"
            Float: 10.0724707
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:vtile"
            Float: 5.46016121
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
            Id: 13649085988947597953
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
        Id: 1869814124449724426
        Name: "Small Open Crate"
        Transform {
          Location {
            X: 148.732864
            Y: 73.8604126
            Z: -374.606567
          }
          Rotation {
          }
          Scale {
            X: 0.884599566
            Y: 0.800000072
            Z: 0.714766145
          }
        }
        ParentId: 11977670227765484253
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
            Id: 5464418781972597556
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
        Id: 2911187949231839539
        Name: "Urban Cardboard Box 01 - Base"
        Transform {
          Location {
            X: 140.964828
            Y: 105.329124
            Z: -353.326233
          }
          Rotation {
            Pitch: -32.0910072
          }
          Scale {
            X: 1
            Y: 1
            Z: 0.364906907
          }
        }
        ParentId: 11977670227765484253
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 4014322821159656914
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:smart"
            Bool: false
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:utile"
            Float: 10.0724707
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:vtile"
            Float: 5.46016121
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
            Id: 13649085988947597953
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
        Id: 10430039165416768710
        Name: "Fantasy Chest Treasure Pile 01"
        Transform {
          Location {
            X: 226.760742
            Y: 9.34143829
            Z: -341.599243
          }
          Rotation {
            Yaw: -179.999954
          }
          Scale {
            X: 0.756207228
            Y: 2.03808689
            Z: 0.773241639
          }
        }
        ParentId: 11977670227765484253
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 17594431842660323321
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:smart"
            Bool: false
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:color"
            Color {
              R: 0.455312043
              G: 0.571999967
              B: 0.572
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
            Id: 3533190463953898497
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
        Id: 2544753510546801006
        Name: "Small Open Crate"
        Transform {
          Location {
            X: 226.912491
            Y: 10.5673141
            Z: -374.606567
          }
          Rotation {
          }
          Scale {
            X: 0.884599566
            Y: 0.800000072
            Z: 0.714766145
          }
        }
        ParentId: 11977670227765484253
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
            Id: 5464418781972597556
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
        Id: 2718734184193375245
        Name: "Small Open Crate"
        Transform {
          Location {
            X: 226.912491
            Y: 10.5673141
            Z: -420.733673
          }
          Rotation {
          }
          Scale {
            X: 0.884599566
            Y: 0.800000072
            Z: 0.714766145
          }
        }
        ParentId: 11977670227765484253
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
            Id: 5464418781972597556
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
        Id: 2320406408569373073
        Name: "Fantasy Sack Open"
        Transform {
          Location {
            X: 146.921799
            Y: -54.4335938
            Z: -427.530396
          }
          Rotation {
            Yaw: 98.6038818
          }
          Scale {
            X: 0.773302495
            Y: 0.773302495
            Z: 0.773302495
          }
        }
        ParentId: 11977670227765484253
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_Detail1:id"
            AssetReference {
              Id: 16263501854538201902
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
        NetworkRelevanceDistance {
          Value: "mc:eproxyrelevance:critical"
        }
      }
      Objects {
        Id: 11007504022079441291
        Name: "Small Open Crate"
        Transform {
          Location {
            X: 148.732864
            Y: 73.8604126
            Z: -420.733673
          }
          Rotation {
          }
          Scale {
            X: 0.884599566
            Y: 0.800000072
            Z: 0.714766145
          }
        }
        ParentId: 11977670227765484253
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
            Id: 5464418781972597556
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
        Id: 13315164803246788589
        Name: "StaticContext (Catalog Collider)"
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
        ParentId: 15894028351706111354
        ChildIds: 13886643936076504412
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
        Id: 13886643936076504412
        Name: "Collider"
        Transform {
          Location {
            X: 251.45903
            Y: 4.32996941
            Z: -167.819351
          }
          Rotation {
            Yaw: 3.65868402
          }
          Scale {
            X: 1.33131444
            Y: 7.59114075
            Z: 1.83723569
          }
        }
        ParentId: 13315164803246788589
        ChildIds: 7297083736302363912
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
        NetworkRelevanceDistance {
          Value: "mc:eproxyrelevance:critical"
        }
      }
      Objects {
        Id: 7297083736302363912
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
        ParentId: 13886643936076504412
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
        Id: 1140583758312313802
        Name: "NPC Tip Bubble"
        Transform {
          Location {
            X: 442.98584
            Y: -34.8902588
            Z: 110.058296
          }
          Rotation {
            Yaw: -133.21788
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 10624624983835586139
        ChildIds: 12322936398604600145
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
        Id: 12322936398604600145
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
        ParentId: 1140583758312313802
        ChildIds: 15823477805109712273
        ChildIds: 1336675565216640865
        ChildIds: 10112810441758285420
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
        Id: 15823477805109712273
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
        ParentId: 12322936398604600145
        UnregisteredParameters {
          Overrides {
            Name: "cs:ComponentRoot"
            ObjectReference {
              SubObjectId: 1140583758312313802
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
              SubObjectId: 1336675565216640865
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
        Id: 1336675565216640865
        Name: "Bubble"
        Transform {
          Location {
            Z: 112.687599
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 12322936398604600145
        ChildIds: 10920415615565057619
        ChildIds: 8263714001711173689
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
        Id: 10920415615565057619
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
        ParentId: 1336675565216640865
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
        Id: 8263714001711173689
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
        ParentId: 1336675565216640865
        ChildIds: 10092325625456445821
        ChildIds: 11275548643501646855
        ChildIds: 15458418529938210657
        ChildIds: 6192510473489824105
        ChildIds: 15268339838174950764
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
        Id: 10092325625456445821
        Name: "World Text"
        Transform {
          Location {
            X: 1.60929871
            Y: -0.7137146
            Z: 76.433075
          }
          Rotation {
          }
          Scale {
            X: 0.524491131
            Y: 0.524491131
            Z: 0.524491131
          }
        }
        ParentId: 8263714001711173689
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
          Text: "Hey there! If you follow\r\na friend around while they\r\nfarm/gather, the goodies\r\ndrop for both of you!"
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
        Id: 11275548643501646855
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
        ParentId: 8263714001711173689
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
        NetworkRelevanceDistance {
          Value: "mc:eproxyrelevance:critical"
        }
      }
      Objects {
        Id: 15458418529938210657
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
        ParentId: 8263714001711173689
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
        NetworkRelevanceDistance {
          Value: "mc:eproxyrelevance:critical"
        }
      }
      Objects {
        Id: 6192510473489824105
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
        ParentId: 8263714001711173689
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
        NetworkRelevanceDistance {
          Value: "mc:eproxyrelevance:critical"
        }
      }
      Objects {
        Id: 15268339838174950764
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
        ParentId: 8263714001711173689
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
        NetworkRelevanceDistance {
          Value: "mc:eproxyrelevance:critical"
        }
      }
      Objects {
        Id: 10112810441758285420
        Name: "Trigger"
        Transform {
          Location {
            X: 233.975067
            Y: -0.00152587891
          }
          Rotation {
          }
          Scale {
            X: 5.61878538
            Y: 4.83117628
            Z: 2.14196157
          }
        }
        ParentId: 12322936398604600145
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
        Id: 8963056759769050894
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
        ParentId: 10624624983835586139
        ChildIds: 12604622220777274084
        ChildIds: 14373966522438561496
        ChildIds: 9767570740182714786
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
        Id: 12604622220777274084
        Name: "NPC Face Lights"
        Transform {
          Location {
            X: 324.93103
            Y: -149.11792
            Z: 201.234329
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 8963056759769050894
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
        }
        NetworkRelevanceDistance {
          Value: "mc:eproxyrelevance:critical"
        }
      }
      Objects {
        Id: 14373966522438561496
        Name: "Humanoid 1 Rig"
        Transform {
          Location {
            X: 441.524414
            Y: -33.4547119
            Z: 110.287445
          }
          Rotation {
            Yaw: -135
          }
          Scale {
            X: 1.05
            Y: 1.05
            Z: 1.05
          }
        }
        ParentId: 8963056759769050894
        UnregisteredParameters {
          Overrides {
            Name: "ma:1:Shared_Detail1:color"
            Color {
              R: 0.190000057
              G: 0.147593543
              B: 0.11191003
              A: 1
            }
          }
          Overrides {
            Name: "ma:1:Shared_Detail2:color"
            Color {
              R: 0.211359441
              G: 0.226125166
              B: 0.243000016
              A: 1
            }
          }
          Overrides {
            Name: "ma:1:Shared_Detail3:color"
            Color {
              R: 0.116000004
              G: 0.0868079513
              B: 0.07192
              A: 1
            }
          }
          Overrides {
            Name: "ma:2:Shared_BaseMaterial:id"
            AssetReference {
              Id: 9470341590748241119
            }
          }
          Overrides {
            Name: "ma:2:Shared_BaseMaterial:color"
            Color {
              G: 0.410596
              B: 0.5
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
            Id: 9826102451360797391
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
              Id: 15613289766559957493
            }
            SkinnedMeshes {
              Id: 2850729701322865624
            }
            SkinnedMeshes {
              Id: 2604811632602180860
            }
            SkinnedMeshes {
              Id: 841534158063459245
            }
          }
        }
        NetworkRelevanceDistance {
          Value: "mc:eproxyrelevance:critical"
        }
      }
      Objects {
        Id: 9767570740182714786
        Name: "Stand Details"
        Transform {
          Location {
            X: -1190.02075
            Y: -1160.20337
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 8963056759769050894
        ChildIds: 18286147660631068316
        ChildIds: 6420150357372114628
        ChildIds: 14270054296936338051
        ChildIds: 11193316342923088573
        ChildIds: 864252082928129877
        ChildIds: 15912574336939640490
        ChildIds: 4947484967755403489
        ChildIds: 18216706980768598197
        ChildIds: 3415983024917757429
        ChildIds: 10900865553826156206
        ChildIds: 13091543245811369321
        ChildIds: 10161712678468506633
        ChildIds: 5989554742452139783
        ChildIds: 15207512917697428305
        ChildIds: 17182570002385006742
        ChildIds: 2933141926174212346
        ChildIds: 12994556423228155083
        ChildIds: 6044522481265215883
        ChildIds: 5162719973054644320
        ChildIds: 9887539252944369082
        ChildIds: 5123086284939570744
        ChildIds: 5270545957885186562
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
        Id: 18286147660631068316
        Name: "Craftsman Roof 01 Beam"
        Transform {
          Location {
            X: 1781.7959
            Y: 779.723755
            Z: 438.079376
          }
          Rotation {
            Yaw: 135.000015
            Roll: -179.999954
          }
          Scale {
            X: 0.85
            Y: 0.998589
            Z: 0.604424775
          }
        }
        ParentId: 9767570740182714786
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 14231809728886464860
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:utile"
            Float: 1.84804785
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:vtile"
            Float: 1.46026683
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
            Id: 16931855142661323466
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
        Id: 6420150357372114628
        Name: "Craftsman Roof 01 Beam"
        Transform {
          Location {
            X: 1351.78894
            Y: 1236.65027
            Z: 327.26828
          }
          Rotation {
            Pitch: 90
            Yaw: -16.6992588
            Roll: 28.3006763
          }
          Scale {
            X: 0.14
            Y: 0.998588
            Z: 0.604424953
          }
        }
        ParentId: 9767570740182714786
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 14231809728886464860
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:utile"
            Float: 1.84804785
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:vtile"
            Float: 0.323470205
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
            Id: 16931855142661323466
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
        Id: 14270054296936338051
        Name: "Craftsman Roof 01 Beam"
        Transform {
          Location {
            X: 1758.75
            Y: 829.689331
            Z: 327.26828
          }
          Rotation {
            Pitch: 90
            Yaw: -16.6992588
            Roll: 28.3006763
          }
          Scale {
            X: 0.14
            Y: 0.998588
            Z: 0.604424953
          }
        }
        ParentId: 9767570740182714786
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 14231809728886464860
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:utile"
            Float: 1.84804785
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:vtile"
            Float: 0.323470205
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
            Id: 16931855142661323466
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
        Id: 11193316342923088573
        Name: "Cylinder - Bottom-Aligned"
        Transform {
          Location {
            X: 1850.79407
            Y: 922.977844
            Z: 324.525604
          }
          Rotation {
            Yaw: -44.9999924
          }
          Scale {
            X: 0.0882194415
            Y: 0.0882194415
            Z: 0.467366278
          }
        }
        ParentId: 9767570740182714786
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 14231809728886464860
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:smart"
            Bool: false
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:utile"
            Float: 0.192670956
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:vtile"
            Float: 1.10076594
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
        Id: 864252082928129877
        Name: "Cylinder - Bottom-Aligned"
        Transform {
          Location {
            X: 1829.99084
            Y: 902.1745
            Z: 324.525604
          }
          Rotation {
            Yaw: -44.9999924
          }
          Scale {
            X: 0.0882194415
            Y: 0.0882194415
            Z: 0.591689408
          }
        }
        ParentId: 9767570740182714786
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 14231809728886464860
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:smart"
            Bool: false
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:utile"
            Float: 0.192670956
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:vtile"
            Float: 1.10076594
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
        Id: 15912574336939640490
        Name: "Cylinder - Bottom-Aligned"
        Transform {
          Location {
            X: 1807.68311
            Y: 879.866821
            Z: 324.525604
          }
          Rotation {
            Yaw: -44.9999924
          }
          Scale {
            X: 0.0882194415
            Y: 0.0882194415
            Z: 0.829969525
          }
        }
        ParentId: 9767570740182714786
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 14231809728886464860
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:smart"
            Bool: false
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:utile"
            Float: 0.192670956
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:vtile"
            Float: 1.10076594
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
        Id: 4947484967755403489
        Name: "Cylinder - Bottom-Aligned"
        Transform {
          Location {
            X: 1784.61951
            Y: 856.803223
            Z: 324.525604
          }
          Rotation {
            Yaw: -44.9999924
          }
          Scale {
            X: 0.0882194415
            Y: 0.0882194415
            Z: 0.997743547
          }
        }
        ParentId: 9767570740182714786
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 14231809728886464860
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:smart"
            Bool: false
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:utile"
            Float: 0.192670956
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:vtile"
            Float: 1.10076594
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
        Id: 18216706980768598197
        Name: "Cylinder - Bottom-Aligned"
        Transform {
          Location {
            X: 1443.83301
            Y: 1329.93884
            Z: 324.525604
          }
          Rotation {
            Yaw: -44.9999924
          }
          Scale {
            X: 0.0882194415
            Y: 0.0882194415
            Z: 0.467366278
          }
        }
        ParentId: 9767570740182714786
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 14231809728886464860
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:smart"
            Bool: false
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:utile"
            Float: 0.192670956
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:vtile"
            Float: 1.10076594
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
        Id: 3415983024917757429
        Name: "Cylinder - Bottom-Aligned"
        Transform {
          Location {
            X: 1423.02966
            Y: 1309.1355
            Z: 324.525604
          }
          Rotation {
            Yaw: -44.9999924
          }
          Scale {
            X: 0.0882194415
            Y: 0.0882194415
            Z: 0.591689408
          }
        }
        ParentId: 9767570740182714786
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 14231809728886464860
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:smart"
            Bool: false
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:utile"
            Float: 0.192670956
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:vtile"
            Float: 1.10076594
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
        Id: 10900865553826156206
        Name: "Cylinder - Bottom-Aligned"
        Transform {
          Location {
            X: 1400.72205
            Y: 1286.82776
            Z: 324.525604
          }
          Rotation {
            Yaw: -44.9999924
          }
          Scale {
            X: 0.0882194415
            Y: 0.0882194415
            Z: 0.829969525
          }
        }
        ParentId: 9767570740182714786
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 14231809728886464860
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:smart"
            Bool: false
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:utile"
            Float: 0.192670956
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:vtile"
            Float: 1.10076594
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
        Id: 13091543245811369321
        Name: "Cylinder - Bottom-Aligned"
        Transform {
          Location {
            X: 1377.65845
            Y: 1263.76416
            Z: 324.525604
          }
          Rotation {
            Yaw: -44.9999924
          }
          Scale {
            X: 0.0882194415
            Y: 0.0882194415
            Z: 0.997743547
          }
        }
        ParentId: 9767570740182714786
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 14231809728886464860
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:smart"
            Bool: false
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:utile"
            Float: 0.192670956
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:vtile"
            Float: 1.10076594
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
        Id: 10161712678468506633
        Name: "Street Sign - Rectangle"
        Transform {
          Location {
            X: 1551.31152
            Y: 1019.77057
            Z: 370.36
          }
          Rotation {
            Pitch: -1.02099717
            Yaw: 135.000046
            Roll: -2.66846616e-08
          }
          Scale {
            X: 2.05330634
            Y: 1.00000024
            Z: 1.26247108
          }
        }
        ParentId: 9767570740182714786
        UnregisteredParameters {
          Overrides {
            Name: "ma:Sign_Face:id"
            AssetReference {
              Id: 13850988888007816936
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 14231809728886464860
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:smart"
            Bool: false
          }
          Overrides {
            Name: "ma:Sign_Face:smart"
            Bool: false
          }
          Overrides {
            Name: "ma:Sign_Stripe:id"
            AssetReference {
              Id: 2360206302109331130
            }
          }
          Overrides {
            Name: "ma:Sign_Stripe:smart"
            Bool: false
          }
          Overrides {
            Name: "ma:Sign_Stripe:color"
            Color {
              R: 1
              G: 0.950993478
              B: 0.26
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
            Id: 3433416882178080463
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
        Id: 5989554742452139783
        Name: "World Text"
        Transform {
          Location {
            X: 1633.46008
            Y: 930.59137
            Z: 372.590118
          }
          Rotation {
            Yaw: -134.999985
            Roll: -1.02099597
          }
          Scale {
            X: 2.13392496
            Y: 2.1339314
            Z: 2.58057642
          }
        }
        ParentId: 9767570740182714786
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
          Text: "Penny Produce"
          FontAsset {
            Id: 8007566706463950337
          }
          Color {
            R: 0.0435761437
            G: 0.139999986
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
        Id: 15207512917697428305
        Name: "Star - Beveled"
        Transform {
          Location {
            X: 1452.58899
            Y: 1113.05518
            Z: 368.553833
          }
          Rotation {
            Pitch: 16.5482426
            Yaw: -44.9999847
            Roll: -90.0000076
          }
          Scale {
            X: 0.235500798
            Y: 0.235500798
            Z: 0.235500798
          }
        }
        ParentId: 9767570740182714786
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
              R: 0.107072785
              G: 0.344
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
            Id: 11391182621441030495
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
        Id: 17182570002385006742
        Name: "Star - Beveled"
        Transform {
          Location {
            X: 1644.09741
            Y: 921.326233
            Z: 374.638855
          }
          Rotation {
            Pitch: -14.4465733
            Yaw: -44.9999771
            Roll: -90
          }
          Scale {
            X: 0.235500798
            Y: 0.235500798
            Z: 0.235500798
          }
        }
        ParentId: 9767570740182714786
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
              R: 0.107072785
              G: 0.344
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
            Id: 11391182621441030495
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
        Id: 2933141926174212346
        Name: "Cube"
        Transform {
          Location {
            X: 1605.73499
            Y: 960.188232
            Z: 354.886749
          }
          Rotation {
            Pitch: -1.02098346
            Yaw: 135.000046
          }
          Scale {
            X: 0.770215809
            Y: 0.00799929
            Z: 0.072302781
          }
        }
        ParentId: 9767570740182714786
        UnregisteredParameters {
          Overrides {
            Name: "ma:Sign_Face:id"
            AssetReference {
              Id: 13850988888007816936
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 14231809728886464860
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:smart"
            Bool: false
          }
          Overrides {
            Name: "ma:Sign_Face:smart"
            Bool: false
          }
          Overrides {
            Name: "ma:Sign_Stripe:id"
            AssetReference {
              Id: 9311015945614487722
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:color"
            Color {
              R: 0.107072785
              G: 0.344
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
        NetworkRelevanceDistance {
          Value: "mc:eproxyrelevance:critical"
        }
      }
      Objects {
        Id: 12994556423228155083
        Name: "Cube"
        Transform {
          Location {
            X: 1514.87549
            Y: 1051.04761
            Z: 352.596771
          }
          Rotation {
            Pitch: -1.02098346
            Yaw: 135.000046
          }
          Scale {
            X: 1.4182471
            Y: 0.00799867231
            Z: 0.0723043
          }
        }
        ParentId: 9767570740182714786
        UnregisteredParameters {
          Overrides {
            Name: "ma:Sign_Face:id"
            AssetReference {
              Id: 13850988888007816936
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 14231809728886464860
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:smart"
            Bool: false
          }
          Overrides {
            Name: "ma:Sign_Face:smart"
            Bool: false
          }
          Overrides {
            Name: "ma:Sign_Stripe:id"
            AssetReference {
              Id: 9311015945614487722
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:color"
            Color {
              R: 0.107072785
              G: 0.344
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
        NetworkRelevanceDistance {
          Value: "mc:eproxyrelevance:critical"
        }
      }
      Objects {
        Id: 6044522481265215883
        Name: "Cylinder - Bottom-Aligned"
        Transform {
          Location {
            X: 1642.1217
            Y: 925.555542
            Z: 405.99
          }
          Rotation {
            Yaw: -44.9999924
          }
          Scale {
            X: 0.0315942466
            Y: 0.0315942466
            Z: 0.258173525
          }
        }
        ParentId: 9767570740182714786
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 566110382760358849
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:smart"
            Bool: false
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:vtile"
            Float: 1.46026683
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:utile"
            Float: 0.449808419
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
        Id: 5162719973054644320
        Name: "Cylinder - Bottom-Aligned"
        Transform {
          Location {
            X: 1454.12622
            Y: 1113.55103
            Z: 405.99
          }
          Rotation {
            Yaw: -44.9999924
          }
          Scale {
            X: 0.0315942466
            Y: 0.0315942466
            Z: 0.258173525
          }
        }
        ParentId: 9767570740182714786
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 566110382760358849
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:smart"
            Bool: false
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:vtile"
            Float: 1.46026683
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:utile"
            Float: 0.449808419
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
        Id: 9887539252944369082
        Name: "Craftsman Roof 01 Beam"
        Transform {
          Location {
            X: 1879.50073
            Y: 950.087952
            Z: 213.480118
          }
          Rotation {
            Pitch: 44.999958
            Yaw: 134.999985
            Roll: 1.69038449e-05
          }
          Scale {
            X: 0.178488567
            Y: 0.43634969
            Z: 0.604423225
          }
        }
        ParentId: 9767570740182714786
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 14231809728886464860
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:utile"
            Float: 1.84804785
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:vtile"
            Float: 1.46026683
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
            Id: 16931855142661323466
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
        Id: 5123086284939570744
        Name: "Craftsman Roof 01 Beam"
        Transform {
          Location {
            X: 1474.14404
            Y: 1355.44434
            Z: 213.476
          }
          Rotation {
            Pitch: -44.999939
            Yaw: 134.999908
            Roll: 2.41483394e-05
          }
          Scale {
            X: -0.178488567
            Y: 0.43634969
            Z: 0.604423225
          }
        }
        ParentId: 9767570740182714786
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 14231809728886464860
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:utile"
            Float: 1.84804785
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:vtile"
            Float: 1.46026683
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
            Id: 16931855142661323466
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
        Id: 5270545957885186562
        Name: "Cube - Polished"
        Transform {
          Location {
            X: 1675.66772
            Y: 1156.43274
            Z: 136.157593
          }
          Rotation {
            Yaw: -44.9999924
          }
          Scale {
            X: 5.71470213
            Y: 0.114171125
            Z: 0.244304493
          }
        }
        ParentId: 9767570740182714786
        UnregisteredParameters {
          Overrides {
            Name: "ma:Building_Roof:id"
            AssetReference {
              Id: 7741902784071852752
            }
          }
          Overrides {
            Name: "ma:Building_Roof:vtile"
            Float: 2.69378281
          }
          Overrides {
            Name: "ma:Building_Roof:utile"
            Float: 2.23119664
          }
          Overrides {
            Name: "ma:Shared_Detail1:id"
            AssetReference {
              Id: 13850988888007816936
            }
          }
          Overrides {
            Name: "ma:Shared_Detail1:utile"
            Float: 3.10263872
          }
          Overrides {
            Name: "ma:Shared_Detail1:vtile"
            Float: 4.11593246
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 13850988888007816936
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:smart"
            Bool: false
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:utile"
            Float: 1.68190253
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:vtile"
            Float: 0.221914053
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
        Id: 8418361665678388213
        Name: "Geo (with Collision)"
        Transform {
          Location {
            X: 362.791748
            Y: -129.537231
            Z: 421.803925
          }
          Rotation {
            Yaw: -45
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 10624624983835586139
        ChildIds: 9704922186128665943
        ChildIds: 1705812650230460797
        ChildIds: 10961952233561179379
        ChildIds: 3539080335532461760
        ChildIds: 943829850364758458
        ChildIds: 16329912325981630929
        ChildIds: 3812008336983724480
        ChildIds: 3640719074502695490
        ChildIds: 4676282048954129742
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
        Id: 9704922186128665943
        Name: "Japanese Temple Awning 01"
        Transform {
          Location {
          }
          Rotation {
          }
          Scale {
            X: 1.55542874
            Y: 1.19072187
            Z: 1.19072187
          }
        }
        ParentId: 8418361665678388213
        UnregisteredParameters {
          Overrides {
            Name: "ma:Building_Roof:id"
            AssetReference {
              Id: 7741902784071852752
            }
          }
          Overrides {
            Name: "ma:Building_Roof:vtile"
            Float: 2.69378281
          }
          Overrides {
            Name: "ma:Building_Roof:utile"
            Float: 2.23119664
          }
          Overrides {
            Name: "ma:Shared_Detail1:id"
            AssetReference {
              Id: 13850988888007816936
            }
          }
          Overrides {
            Name: "ma:Shared_Detail1:utile"
            Float: 3.10263872
          }
          Overrides {
            Name: "ma:Shared_Detail1:vtile"
            Float: 4.11593246
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
            Id: 16959882767404772165
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
        Id: 1705812650230460797
        Name: "Craftsman Roof 01 Beam"
        Transform {
          Location {
            X: 287.980927
            Y: 179.490356
            Z: -420.804352
          }
          Rotation {
            Pitch: 90
            Yaw: 169.974976
            Roll: -10.0249634
          }
          Scale {
            X: 0.371000022
            Y: 0.998588
            Z: 0.604424894
          }
        }
        ParentId: 8418361665678388213
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 14231809728886464860
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:utile"
            Float: 1.84804785
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:vtile"
            Float: 1.46026683
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
            Id: 16931855142661323466
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
        Id: 10961952233561179379
        Name: "Craftsman Roof 01 Beam"
        Transform {
          Location {
            X: -287.548889
            Y: 179.490356
            Z: -420.804352
          }
          Rotation {
            Pitch: 90
            Roll: -179.999969
          }
          Scale {
            X: 0.371000022
            Y: 0.998588
            Z: 0.604424894
          }
        }
        ParentId: 8418361665678388213
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 14231809728886464860
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:utile"
            Float: 1.84804785
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:vtile"
            Float: 1.46026683
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
            Id: 16931855142661323466
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
        Id: 3539080335532461760
        Name: "Craftsman Roof 01 Beam"
        Transform {
          Location {
            X: 287.731964
            Y: 3.50779724
            Z: -420.804352
          }
          Rotation {
            Pitch: 90
            Yaw: 19.47122
            Roll: 19.47122
          }
          Scale {
            X: 0.371000022
            Y: 0.998588
            Z: 0.604424894
          }
        }
        ParentId: 8418361665678388213
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 14231809728886464860
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:utile"
            Float: 1.84804785
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:vtile"
            Float: 1.46026683
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
            Id: 16931855142661323466
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
        Id: 943829850364758458
        Name: "Craftsman Roof 01 Beam"
        Transform {
          Location {
            X: -287.797821
            Y: 3.50776672
            Z: -420.804352
          }
          Rotation {
            Pitch: 90
            Yaw: 19.47122
            Roll: 19.47122
          }
          Scale {
            X: 0.371000022
            Y: 0.998588
            Z: 0.604424894
          }
        }
        ParentId: 8418361665678388213
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 14231809728886464860
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:utile"
            Float: 1.84804785
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:vtile"
            Float: 1.46026683
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
            Id: 16931855142661323466
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
        Id: 16329912325981630929
        Name: "Cube - Polished"
        Transform {
          Location {
            X: -2.0585556
            Y: 175.802261
            Z: -351.056641
          }
          Rotation {
          }
          Scale {
            X: 5.71470213
            Y: 0.0644817
            Z: 1.53563082
          }
        }
        ParentId: 8418361665678388213
        UnregisteredParameters {
          Overrides {
            Name: "ma:Building_Roof:id"
            AssetReference {
              Id: 7741902784071852752
            }
          }
          Overrides {
            Name: "ma:Building_Roof:vtile"
            Float: 2.69378281
          }
          Overrides {
            Name: "ma:Building_Roof:utile"
            Float: 2.23119664
          }
          Overrides {
            Name: "ma:Shared_Detail1:id"
            AssetReference {
              Id: 13850988888007816936
            }
          }
          Overrides {
            Name: "ma:Shared_Detail1:utile"
            Float: 3.10263872
          }
          Overrides {
            Name: "ma:Shared_Detail1:vtile"
            Float: 4.11593246
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 10051999787639476342
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:smart"
            Bool: false
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:utile"
            Float: 1.68190253
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:vtile"
            Float: 0.494242311
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
        Id: 3812008336983724480
        Name: "Fantasy Sack Tied"
        Transform {
          Location {
            X: -145.422836
            Y: 11.5284691
            Z: -340.546936
          }
          Rotation {
            Yaw: -52.7020111
          }
          Scale {
            X: 0.513729334
            Y: 0.513729334
            Z: 0.513729334
          }
        }
        ParentId: 8418361665678388213
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 7625382804772008570
            }
          }
          Overrides {
            Name: "ma:Shared_Detail1:id"
            AssetReference {
              Id: 7625382804772008570
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:color"
            Color {
              R: 0.5
              G: 0.5
              B: 0.5
              A: 0.794
            }
          }
          Overrides {
            Name: "ma:Shared_Detail1:color"
            Color {
              R: 0.5
              G: 0.5
              B: 0.5
              A: 0.877000034
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
            Id: 5323648263347910865
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
        Id: 3640719074502695490
        Name: "Fantasy Sack Tied"
        Transform {
          Location {
            X: -233.518036
            Y: 52.0783539
            Z: -376.633759
          }
          Rotation {
            Yaw: -99.859108
          }
          Scale {
            X: 0.513729334
            Y: 0.513729334
            Z: 0.513729334
          }
        }
        ParentId: 8418361665678388213
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 7625382804772008570
            }
          }
          Overrides {
            Name: "ma:Shared_Detail1:id"
            AssetReference {
              Id: 7625382804772008570
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:color"
            Color {
              R: 0.5
              G: 0.5
              B: 0.5
              A: 0.794
            }
          }
          Overrides {
            Name: "ma:Shared_Detail1:color"
            Color {
              R: 0.5
              G: 0.5
              B: 0.5
              A: 0.877000034
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
            Id: 5323648263347910865
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
        Id: 4676282048954129742
        Name: "Fantasy Sack Tied"
        Transform {
          Location {
            X: -234.964371
            Y: 15.0212021
            Z: -376.633759
          }
          Rotation {
            Yaw: 112.066483
          }
          Scale {
            X: 0.513729334
            Y: 0.513729334
            Z: 0.513729334
          }
        }
        ParentId: 8418361665678388213
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 7625382804772008570
            }
          }
          Overrides {
            Name: "ma:Shared_Detail1:id"
            AssetReference {
              Id: 7625382804772008570
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:color"
            Color {
              R: 0.5
              G: 0.5
              B: 0.5
              A: 0.794
            }
          }
          Overrides {
            Name: "ma:Shared_Detail1:color"
            Color {
              R: 0.5
              G: 0.5
              B: 0.5
              A: 0.877000034
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
            Id: 5323648263347910865
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
        Id: 4216436648286139636
        Name: "Collision (Invisible)"
        Transform {
          Location {
            X: 362.791748
            Y: -129.537231
            Z: 421.803925
          }
          Rotation {
            Yaw: -45
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 10624624983835586139
        ChildIds: 17950046814740764794
        ChildIds: 10156295853286987998
        ChildIds: 15238393521022987975
        ChildIds: 3184173062744463540
        ChildIds: 2663500062904620337
        ChildIds: 6137564136144803551
        ChildIds: 17328965731459981325
        ChildIds: 8119327851020763056
        ChildIds: 17466989629010929847
        ChildIds: 5849725217639701986
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
        Folder {
          IsGroup: true
        }
        NetworkRelevanceDistance {
          Value: "mc:eproxyrelevance:critical"
        }
      }
      Objects {
        Id: 17950046814740764794
        Name: "Prism - 6-Sided"
        Transform {
          Location {
            X: 92.2554703
            Y: -58.1715736
            Z: -401.864563
          }
          Rotation {
            Yaw: 44.9999962
          }
          Scale {
            X: 0.494577914
            Y: 0.494577914
            Z: 0.356162846
          }
        }
        ParentId: 4216436648286139636
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
              R: 0.559999943
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
            Id: 16409813979413175361
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
        Id: 10156295853286987998
        Name: "Prism - 6-Sided"
        Transform {
          Location {
            X: 113.262283
            Y: -94.0849533
            Z: -401.864563
          }
          Rotation {
            Yaw: 44.9999962
          }
          Scale {
            X: 0.494577914
            Y: 0.494577914
            Z: 0.356162846
          }
        }
        ParentId: 4216436648286139636
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
              R: 0.559999943
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
            Id: 16409813979413175361
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
        Id: 15238393521022987975
        Name: "Prism - 6-Sided"
        Transform {
          Location {
            X: 193.108429
            Y: -77.9159851
            Z: -401.864563
          }
          Rotation {
            Yaw: 44.9999962
          }
          Scale {
            X: 0.494577914
            Y: 0.494577914
            Z: 0.356162846
          }
        }
        ParentId: 4216436648286139636
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
              R: 0.559999943
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
            Id: 16409813979413175361
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
        Id: 3184173062744463540
        Name: "Prism - 6-Sided"
        Transform {
          Location {
            X: -164.807755
            Y: -78.2778
            Z: -405.888428
          }
          Rotation {
            Yaw: 44.9999962
          }
          Scale {
            X: 0.8440274
            Y: 0.8440274
            Z: 0.32945177
          }
        }
        ParentId: 4216436648286139636
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
              R: 0.559999943
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
            Id: 16409813979413175361
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
        Id: 2663500062904620337
        Name: "Cube - Bottom-Aligned"
        Transform {
          Location {
            X: -39.1192665
            Y: 0.102893829
            Z: -421.803925
          }
          Rotation {
            Yaw: 89.5912781
          }
          Scale {
            X: 0.85376358
            Y: 2.89520121
            Z: 0.973533154
          }
        }
        ParentId: 4216436648286139636
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 14000043932012134250
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:color"
            Color {
              R: 2
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
        Id: 6137564136144803551
        Name: "Cube - Bottom-Aligned"
        Transform {
          Location {
            X: 65.0493317
            Y: 1.9198513
            Z: -324.450592
          }
          Rotation {
            Yaw: 89.8089142
          }
          Scale {
            X: 0.576311767
            Y: 0.596413076
            Z: 0.112626642
          }
        }
        ParentId: 4216436648286139636
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 4014322821159656914
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:color"
            Color {
              R: 2
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
        Id: 17328965731459981325
        Name: "Prism - 6-Sided"
        Transform {
          Location {
            X: 147.230072
            Y: -54.183403
            Z: -379.690765
          }
          Rotation {
            Yaw: 54.8180695
          }
          Scale {
            X: 0.788501561
            Y: 0.909686744
            Z: 0.84587729
          }
        }
        ParentId: 4216436648286139636
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 9470341590748241119
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:color"
            Color {
              R: 2
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
            Id: 16409813979413175361
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
        Id: 8119327851020763056
        Name: "Cube - Bottom-Aligned"
        Transform {
          Location {
            X: -232.845016
            Y: 8.96081543
            Z: -421.803925
          }
          Rotation {
            Yaw: 89.5912552
          }
          Scale {
            X: 1.29576707
            Y: 0.707113802
            Z: 0.915653527
          }
        }
        ParentId: 4216436648286139636
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 14000043932012134250
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:color"
            Color {
              R: 2
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
        Id: 17466989629010929847
        Name: "Cube - Bottom-Aligned"
        Transform {
          Location {
            X: 226.166718
            Y: 11.2250404
            Z: -421.803925
          }
          Rotation {
            Yaw: 89.5912247
          }
          Scale {
            X: 1.29576707
            Y: 0.707113802
            Z: 0.915653527
          }
        }
        ParentId: 4216436648286139636
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 14000043932012134250
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:color"
            Color {
              R: 2
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
        Id: 5849725217639701986
        Name: "Cube - Bottom-Aligned"
        Transform {
          Location {
            X: 148.878448
            Y: 73.9667053
            Z: -421.803925
          }
          Rotation {
            Yaw: 89.5912
          }
          Scale {
            X: 1.29576707
            Y: 0.707113802
            Z: 0.915653527
          }
        }
        ParentId: 4216436648286139636
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 4014322821159656914
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:color"
            Color {
              R: 2
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
      Id: 7624284576871502919
      Name: "Cube - Rounded"
      PlatformAssetType: 1
      PrimaryAsset {
        AssetType: "StaticMeshAssetRef"
        AssetId: "sm_cube_rounded_002"
      }
    }
    Assets {
      Id: 17594431842660323321
      Name: "Hay 01"
      PlatformAssetType: 2
      PrimaryAsset {
        AssetType: "MaterialAssetRef"
        AssetId: "mi_fan_hay_001_uv"
      }
    }
    Assets {
      Id: 1641035593226882589
      Name: "Sphere - Half Thin"
      PlatformAssetType: 1
      PrimaryAsset {
        AssetType: "StaticMeshAssetRef"
        AssetId: "sm_hemisphere_002"
      }
    }
    Assets {
      Id: 18337581851612707179
      Name: "Wicker Basket 01"
      PlatformAssetType: 2
      PrimaryAsset {
        AssetType: "MaterialAssetRef"
        AssetId: "mi_fan_wicker_001_uv"
      }
    }
    Assets {
      Id: 7570459242042378971
      Name: "Ring - Thick"
      PlatformAssetType: 1
      PrimaryAsset {
        AssetType: "StaticMeshAssetRef"
        AssetId: "sm_torus_005"
      }
    }
    Assets {
      Id: 5836430349218932838
      Name: "Pipe - Thin"
      PlatformAssetType: 1
      PrimaryAsset {
        AssetType: "StaticMeshAssetRef"
        AssetId: "sm_pipe_003"
      }
    }
    Assets {
      Id: 15557041849098287198
      Name: "Ring - Thin"
      PlatformAssetType: 1
      PrimaryAsset {
        AssetType: "StaticMeshAssetRef"
        AssetId: "sm_torus_003"
      }
    }
    Assets {
      Id: 13980161489662093039
      Name: "Carpet 02"
      PlatformAssetType: 2
      PrimaryAsset {
        AssetType: "MaterialAssetRef"
        AssetId: "mi_carpet_002_uv"
      }
    }
    Assets {
      Id: 16245950798000650069
      Name: "Horn"
      PlatformAssetType: 1
      PrimaryAsset {
        AssetType: "StaticMeshAssetRef"
        AssetId: "sm_horn_001"
      }
    }
    Assets {
      Id: 14000043932012134250
      Name: "Wood Raw"
      PlatformAssetType: 2
      PrimaryAsset {
        AssetType: "MaterialAssetRef"
        AssetId: "mi_wood_raw_001_uv"
      }
    }
    Assets {
      Id: 2346653999024665326
      Name: "Sphere - Half"
      PlatformAssetType: 1
      PrimaryAsset {
        AssetType: "StaticMeshAssetRef"
        AssetId: "sm_hemisphere_001"
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
      Id: 1792590512685276522
      Name: "Food Citrus 01"
      PlatformAssetType: 2
      PrimaryAsset {
        AssetType: "MaterialAssetRef"
        AssetId: "mi_food_generic_citrus_001_uv"
      }
    }
    Assets {
      Id: 7719735812193550538
      Name: "Parchment 01"
      PlatformAssetType: 2
      PrimaryAsset {
        AssetType: "MaterialAssetRef"
        AssetId: "mi_fan_parchment_001_uv"
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
      Id: 15093605760662794654
      Name: "Kelp Bush 01"
      PlatformAssetType: 1
      PrimaryAsset {
        AssetType: "StaticMeshAssetRef"
        AssetId: "sm_kelp_bush_01"
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
      Id: 2887141685872171145
      Name: "Frame End - Bulb"
      PlatformAssetType: 1
      PrimaryAsset {
        AssetType: "StaticMeshAssetRef"
        AssetId: "sm_1bulb_Ender"
      }
    }
    Assets {
      Id: 4358367657038052325
      Name: "Food Watermelon 01"
      PlatformAssetType: 2
      PrimaryAsset {
        AssetType: "MaterialAssetRef"
        AssetId: "mi_food_generic_watermelon_001_uv1"
      }
    }
    Assets {
      Id: 12208201667061053773
      Name: "Simple Crate 150cm"
      PlatformAssetType: 1
      PrimaryAsset {
        AssetType: "StaticMeshAssetRef"
        AssetId: "sm_crate_simple_150cm_001"
      }
    }
    Assets {
      Id: 5464418781972597556
      Name: "Small Open Crate"
      PlatformAssetType: 1
      PrimaryAsset {
        AssetType: "StaticMeshAssetRef"
        AssetId: "sm_crate_narrow_open_simple_160cm_001"
      }
    }
    Assets {
      Id: 13329650285144519952
      Name: "Small Crate Lid"
      PlatformAssetType: 1
      PrimaryAsset {
        AssetType: "StaticMeshAssetRef"
        AssetId: "sm_crate_narrow_lid_simple_160cm_001"
      }
    }
    Assets {
      Id: 13649085988947597953
      Name: "Urban Cardboard Box 01 - Base"
      PlatformAssetType: 1
      PrimaryAsset {
        AssetType: "StaticMeshAssetRef"
        AssetId: "sm_urb_cardboard_box_001_base_01_ref"
      }
    }
    Assets {
      Id: 4014322821159656914
      Name: "Cardboard Basic 01"
      PlatformAssetType: 2
      PrimaryAsset {
        AssetType: "MaterialAssetRef"
        AssetId: "mi_cardboard_001_uv_ref"
      }
    }
    Assets {
      Id: 3533190463953898497
      Name: "Fantasy Chest Treasure Pile 01"
      PlatformAssetType: 1
      PrimaryAsset {
        AssetType: "StaticMeshAssetRef"
        AssetId: "sm_fantasy_chest_treasure_pile_001_ref"
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
      Id: 16263501854538201902
      Name: "Sand 01"
      PlatformAssetType: 2
      PrimaryAsset {
        AssetType: "MaterialAssetRef"
        AssetId: "mi_sand_001_uv"
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
      Id: 9826102451360797391
      Name: "Humanoid 1 Rig"
      PlatformAssetType: 25
      PrimaryAsset {
        AssetType: "SkeletonAssetRef"
        AssetId: "npc_gal_wireframe_001_ref"
      }
    }
    Assets {
      Id: 15613289766559957493
      Name: "Humanoid 1 Eva"
      PlatformAssetType: 26
      PrimaryAsset {
        AssetType: "SkinnedMeshAssetRef"
        AssetId: "npc_human_gal_head_basic_006_ref"
      }
    }
    Assets {
      Id: 2850729701322865624
      Name: "Humanoid 1 Capri Pants"
      PlatformAssetType: 26
      PrimaryAsset {
        AssetType: "SkinnedMeshAssetRef"
        AssetId: "npc_human_gal_lower_clothing_003_ref"
      }
    }
    Assets {
      Id: 2604811632602180860
      Name: "Humanoid 1 T-Shirt"
      PlatformAssetType: 26
      PrimaryAsset {
        AssetType: "SkinnedMeshAssetRef"
        AssetId: "npc_human_gal_upper_clothing_001_ref"
      }
    }
    Assets {
      Id: 9470341590748241119
      Name: "Fabric Burlap New 01"
      PlatformAssetType: 2
      PrimaryAsset {
        AssetType: "MaterialAssetRef"
        AssetId: "mi_fan_fabric_burlap_002_uv"
      }
    }
    Assets {
      Id: 16931855142661323466
      Name: "Craftsman Roof 01 Beam"
      PlatformAssetType: 1
      PrimaryAsset {
        AssetType: "StaticMeshAssetRef"
        AssetId: "sm_urb_sub_craftsman_roof_001_beam"
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
      Id: 6747614045051753376
      Name: "Cylinder - Bottom-Aligned"
      PlatformAssetType: 1
      PrimaryAsset {
        AssetType: "StaticMeshAssetRef"
        AssetId: "sm_cylinder_001"
      }
    }
    Assets {
      Id: 3433416882178080463
      Name: "Street Sign - Rectangle"
      PlatformAssetType: 1
      PrimaryAsset {
        AssetType: "StaticMeshAssetRef"
        AssetId: "sm_street-sign_rectangle_001"
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
      Id: 8007566706463950337
      Name: "Baloo 2 Extra Bold"
      PlatformAssetType: 28
      PrimaryAsset {
        AssetType: "FontAssetRef"
        AssetId: "Baloo2ExtraBold_ref"
      }
    }
    Assets {
      Id: 11391182621441030495
      Name: "Star - Beveled"
      PlatformAssetType: 1
      PrimaryAsset {
        AssetType: "StaticMeshAssetRef"
        AssetId: "sm_star_beveled_001"
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
      Id: 9311015945614487722
      Name: "Invisible"
      PlatformAssetType: 2
      PrimaryAsset {
        AssetType: "MaterialAssetRef"
        AssetId: "mi_invisible_001"
      }
    }
    Assets {
      Id: 566110382760358849
      Name: "Rope"
      PlatformAssetType: 2
      PrimaryAsset {
        AssetType: "MaterialAssetRef"
        AssetId: "mi_rope_001"
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
      Id: 7741902784071852752
      Name: "Roof Square Shingles 01"
      PlatformAssetType: 2
      PrimaryAsset {
        AssetType: "MaterialAssetRef"
        AssetId: "mi_roof_square_shingles_001_uv"
      }
    }
    Assets {
      Id: 16959882767404772165
      Name: "Japanese Temple Awning 01"
      PlatformAssetType: 1
      PrimaryAsset {
        AssetType: "StaticMeshAssetRef"
        AssetId: "sm_ts_jpn_tem_awning_001_ref"
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
    Assets {
      Id: 5323648263347910865
      Name: "Fantasy Sack Tied"
      PlatformAssetType: 1
      PrimaryAsset {
        AssetType: "StaticMeshAssetRef"
        AssetId: "sm_prop_fantasy_sack_002_ref"
      }
    }
    Assets {
      Id: 7625382804772008570
      Name: "Glass 01 (no distortion)"
      PlatformAssetType: 2
      PrimaryAsset {
        AssetType: "MaterialAssetRef"
        AssetId: "mi_basic_glass_001"
      }
    }
    Assets {
      Id: 16409813979413175361
      Name: "Prism - 6-Sided"
      PlatformAssetType: 1
      PrimaryAsset {
        AssetType: "StaticMeshAssetRef"
        AssetId: "sm_prism_hexagon_001"
      }
    }
    PrimaryAssetId {
      AssetType: "None"
      AssetId: "None"
    }
  }
  SerializationVersion: 108
  VirtualFolderPath: "Art and Collision - Farm"
  VirtualFolderPath: "Stores"
}
