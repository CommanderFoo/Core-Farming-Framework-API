Assets {
  Id: 4348145339898802302
  Name: "Interaction Display"
  PlatformAssetType: 5
  TemplateAsset {
    ObjectBlock {
      RootId: 6606713102730584260
      Objects {
        Id: 6606713102730584260
        Name: "Interaction Display"
        Transform {
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 6792825314166502495
        ChildIds: 12394869506529378452
        UnregisteredParameters {
          Overrides {
            Name: "cs:AlwaysVisible"
            Bool: false
          }
          Overrides {
            Name: "cs:PositionOverInteractable"
            Bool: true
          }
          Overrides {
            Name: "cs:PositionOffset"
            Vector2 {
              X: 50
              Y: -100
            }
          }
          Overrides {
            Name: "cs:StayOnScreen"
            Bool: true
          }
          Overrides {
            Name: "cs:ScreenEdgePadding"
            Vector2 {
              X: 20
              Y: 20
            }
          }
          Overrides {
            Name: "cs:CostItemAsset"
            AssetReference {
              Id: 16431341945890251416
            }
          }
          Overrides {
            Name: "cs:BuffItemAsset"
            AssetReference {
              Id: 6024914680163634969
            }
          }
          Overrides {
            Name: "cs:Padding"
            Float: 7
          }
          Overrides {
            Name: "cs:PositionOverInteractable:subcategory"
            String: "Position"
          }
          Overrides {
            Name: "cs:PositionOffset:category"
            String: "Custom"
          }
          Overrides {
            Name: "cs:PositionOffset:subcategory"
            String: "Position"
          }
          Overrides {
            Name: "cs:StayOnScreen:category"
            String: "Custom"
          }
          Overrides {
            Name: "cs:StayOnScreen:subcategory"
            String: "Position"
          }
          Overrides {
            Name: "cs:AlwaysVisible:subcategory"
            String: "Behaviour"
          }
          Overrides {
            Name: "cs:ScreenEdgePadding:category"
            String: "Custom"
          }
          Overrides {
            Name: "cs:ScreenEdgePadding:subcategory"
            String: "Position"
          }
          Overrides {
            Name: "cs:CostItemAsset:subcategory"
            String: "Appearance"
          }
          Overrides {
            Name: "cs:Padding:subcategory"
            String: "Appearance"
          }
          Overrides {
            Name: "cs:BuffItemAsset:category"
            String: "Custom"
          }
          Overrides {
            Name: "cs:BuffItemAsset:subcategory"
            String: "Appearance"
          }
        }
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
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
        Id: 12394869506529378452
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
        ParentId: 6606713102730584260
        ChildIds: 9581664593083409921
        ChildIds: 14852862262564669091
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
        Id: 9581664593083409921
        Name: "InteractionDisplayClient"
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
        ParentId: 12394869506529378452
        UnregisteredParameters {
          Overrides {
            Name: "cs:ComponentRoot"
            ObjectReference {
              SubObjectId: 6606713102730584260
            }
          }
          Overrides {
            Name: "cs:Panel"
            ObjectReference {
              SubObjectId: 13822970385512125956
            }
          }
          Overrides {
            Name: "cs:ActionText"
            ObjectReference {
              SubObjectId: 14274204689380971030
            }
          }
          Overrides {
            Name: "cs:ProgressBar"
            ObjectReference {
              SubObjectId: 3980458575436779561
            }
          }
          Overrides {
            Name: "cs:BuffsPanel"
            ObjectReference {
              SubObjectId: 11202023862575407560
            }
          }
          Overrides {
            Name: "cs:CostsPanel"
            ObjectReference {
              SubObjectId: 12442634207489284478
            }
          }
          Overrides {
            Name: "cs:ProgressText"
            ObjectReference {
              SubObjectId: 5222382664523047282
            }
          }
        }
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
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
            Id: 8139794016952374806
          }
        }
        NetworkRelevanceDistance {
          Value: "mc:eproxyrelevance:critical"
        }
      }
      Objects {
        Id: 14852862262564669091
        Name: "UI Container"
        Transform {
          Location {
            Z: 297.347595
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 12394869506529378452
        ChildIds: 13822970385512125956
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        EditorIndicatorVisibility {
          Value: "mc:eindicatorvisibility:visiblewhenselected"
        }
        Control {
          RenderTransformPivot {
            Anchor {
              Value: "mc:euianchor:middlecenter"
            }
          }
          Canvas {
            ContentType {
              Value: "mc:ecanvascontenttype:dynamic"
            }
            Opacity: 1
            IsHUD: true
            CanvasWorldSize {
              X: 300
              Y: 200
            }
            RedrawTime: 30
          }
          AnchorLayout {
            SelfAnchor {
              Anchor {
                Value: "mc:euianchor:topleft"
              }
            }
            TargetAnchor {
              Anchor {
                Value: "mc:euianchor:topleft"
              }
            }
          }
        }
        NetworkRelevanceDistance {
          Value: "mc:eproxyrelevance:critical"
        }
      }
      Objects {
        Id: 13822970385512125956
        Name: "Panel"
        Transform {
          Location {
            Z: -297.347595
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 14852862262564669091
        ChildIds: 7797445451346109806
        ChildIds: 14274204689380971030
        ChildIds: 12442634207489284478
        ChildIds: 11202023862575407560
        ChildIds: 3980458575436779561
        ChildIds: 5222382664523047282
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        EditorIndicatorVisibility {
          Value: "mc:eindicatorvisibility:visiblewhenselected"
        }
        Control {
          Width: 300
          Height: 50
          UIX: 50
          UIY: 240
          RenderTransformPivot {
            Anchor {
              Value: "mc:euianchor:middlecenter"
            }
          }
          Panel {
            Opacity: 1
          }
          AnchorLayout {
            SelfAnchor {
              Anchor {
                Value: "mc:euianchor:topleft"
              }
            }
            TargetAnchor {
              Anchor {
                Value: "mc:euianchor:topleft"
              }
            }
          }
        }
        NetworkRelevanceDistance {
          Value: "mc:eproxyrelevance:critical"
        }
      }
      Objects {
        Id: 7797445451346109806
        Name: "Background"
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
        ParentId: 13822970385512125956
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        EditorIndicatorVisibility {
          Value: "mc:eindicatorvisibility:visiblewhenselected"
        }
        Control {
          Height: -81
          RenderTransformPivot {
            Anchor {
              Value: "mc:euianchor:middlecenter"
            }
          }
          UseParentWidth: true
          UseParentHeight: true
          Image {
            Brush {
            }
            Color {
              A: 0.5
            }
            TeamSettings {
            }
            ShadowColor {
              A: 1
            }
            ShadowOffset {
            }
            ScreenshotIndex: 1
          }
          AnchorLayout {
            SelfAnchor {
              Anchor {
                Value: "mc:euianchor:topleft"
              }
            }
            TargetAnchor {
              Anchor {
                Value: "mc:euianchor:topleft"
              }
            }
          }
        }
        NetworkRelevanceDistance {
          Value: "mc:eproxyrelevance:critical"
        }
      }
      Objects {
        Id: 14274204689380971030
        Name: "Action Text"
        Transform {
          Location {
            X: 1301.47021
            Y: 1425.28931
            Z: 393.546753
          }
          Rotation {
            Yaw: 7.69731903
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 13822970385512125956
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        EditorIndicatorVisibility {
          Value: "mc:eindicatorvisibility:visiblewhenselected"
        }
        Control {
          Width: -20
          Height: 40
          UIX: 10
          UIY: 3
          RenderTransformPivot {
            Anchor {
              Value: "mc:euianchor:middlecenter"
            }
          }
          AddSizeToParentIfUsingParentSize: true
          UseParentWidth: true
          Text {
            Label: "Action"
            Color {
              R: 1
              G: 1
              B: 1
              A: 1
            }
            Size: 20
            Justification {
              Value: "mc:etextjustify:left"
            }
            Font {
              Id: 841534158063459245
            }
            VerticalJustification {
              Value: "mc:everticaljustification:top"
            }
            ShadowColor {
              A: 1
            }
            ShadowOffset {
              X: 2
              Y: 2
            }
            ScaleToFit: true
            OutlineColor {
              A: 1
            }
          }
          AnchorLayout {
            SelfAnchor {
              Anchor {
                Value: "mc:euianchor:topleft"
              }
            }
            TargetAnchor {
              Anchor {
                Value: "mc:euianchor:topleft"
              }
            }
          }
        }
        NetworkRelevanceDistance {
          Value: "mc:eproxyrelevance:critical"
        }
      }
      Objects {
        Id: 12442634207489284478
        Name: "Costs Panel"
        Transform {
          Location {
            X: 421.854675
            Y: -4953.99414
            Z: 1.25024414
          }
          Rotation {
            Yaw: -86.7896042
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 13822970385512125956
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        EditorIndicatorVisibility {
          Value: "mc:eindicatorvisibility:visiblewhenselected"
        }
        Control {
          Width: 280
          Height: 50
          UIX: 10
          UIY: 50
          RenderTransformPivot {
            Anchor {
              Value: "mc:euianchor:middlecenter"
            }
          }
          AddSizeToParentIfUsingParentSize: true
          Panel {
            Opacity: 1
          }
          AnchorLayout {
            SelfAnchor {
              Anchor {
                Value: "mc:euianchor:topleft"
              }
            }
            TargetAnchor {
              Anchor {
                Value: "mc:euianchor:topleft"
              }
            }
          }
        }
        NetworkRelevanceDistance {
          Value: "mc:eproxyrelevance:critical"
        }
      }
      Objects {
        Id: 11202023862575407560
        Name: "Buffs Panel"
        Transform {
          Location {
            X: 421.854675
            Y: -4953.99414
            Z: 1.25024414
          }
          Rotation {
            Yaw: -86.7896042
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 13822970385512125956
        ChildIds: 4981342149043291885
        ChildIds: 12437063568971223251
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        EditorIndicatorVisibility {
          Value: "mc:eindicatorvisibility:visiblewhenselected"
        }
        Control {
          Width: 280
          Height: 50
          UIX: 10
          UIY: 98.901123
          RenderTransformPivot {
            Anchor {
              Value: "mc:euianchor:middlecenter"
            }
          }
          AddSizeToParentIfUsingParentSize: true
          Panel {
            Opacity: 1
          }
          AnchorLayout {
            SelfAnchor {
              Anchor {
                Value: "mc:euianchor:topleft"
              }
            }
            TargetAnchor {
              Anchor {
                Value: "mc:euianchor:topleft"
              }
            }
          }
        }
        NetworkRelevanceDistance {
          Value: "mc:eproxyrelevance:critical"
        }
      }
      Objects {
        Id: 4981342149043291885
        Name: "Label"
        Transform {
          Location {
            X: -7244.16064
            Y: -3882.58936
            Z: -1.13090515
          }
          Rotation {
            Yaw: 138.773697
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 11202023862575407560
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        EditorIndicatorVisibility {
          Value: "mc:eindicatorvisibility:visiblewhenselected"
        }
        Control {
          Width: 200
          Height: 60
          UIY: -25
          RenderTransformPivot {
            Anchor {
              Value: "mc:euianchor:middlecenter"
            }
          }
          Text {
            Label: "Buffs"
            Color {
              R: 1
              G: 1
              B: 1
              A: 1
            }
            Size: 12
            Justification {
              Value: "mc:etextjustify:left"
            }
            AutoWrapText: true
            Font {
              Id: 841534158063459245
            }
            VerticalJustification {
              Value: "mc:everticaljustification:top"
            }
            ShadowColor {
              A: 1
            }
            ShadowOffset {
            }
            OutlineColor {
              A: 1
            }
          }
          AnchorLayout {
            SelfAnchor {
              Anchor {
                Value: "mc:euianchor:topleft"
              }
            }
            TargetAnchor {
              Anchor {
                Value: "mc:euianchor:topleft"
              }
            }
          }
        }
      }
      Objects {
        Id: 12437063568971223251
        Name: "Divider"
        Transform {
          Location {
            X: -750.920654
            Y: -2334.49268
            Z: -1.13092804
          }
          Rotation {
            Yaw: -135.32959
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 11202023862575407560
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        EditorIndicatorVisibility {
          Value: "mc:eindicatorvisibility:visiblewhenselected"
        }
        Control {
          Width: 200
          Height: 2
          UIY: -3
          RenderTransformPivot {
            Anchor {
              Value: "mc:euianchor:middlecenter"
            }
          }
          UseParentWidth: true
          Image {
            Brush {
            }
            Color {
              R: 1
              G: 1
              B: 1
              A: 1
            }
            TeamSettings {
            }
            ShadowColor {
              A: 1
            }
            ShadowOffset {
            }
            ScreenshotIndex: 1
          }
          AnchorLayout {
            SelfAnchor {
              Anchor {
                Value: "mc:euianchor:topleft"
              }
            }
            TargetAnchor {
              Anchor {
                Value: "mc:euianchor:topleft"
              }
            }
          }
        }
      }
      Objects {
        Id: 3980458575436779561
        Name: "Progress Bar"
        Transform {
          Location {
            X: 131.183716
            Y: 4438.87
            Z: 1.24951172
          }
          Rotation {
            Yaw: 51.7814407
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 13822970385512125956
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        EditorIndicatorVisibility {
          Value: "mc:eindicatorvisibility:visiblewhenselected"
        }
        Control {
          Width: 280
          Height: 20
          UIX: 10
          UIY: 50
          RenderTransformPivot {
            Anchor {
              Value: "mc:euianchor:middlecenter"
            }
          }
          StatBar {
            Color {
              R: 1
              G: 1
              B: 1
              A: 1
            }
            BackgroundColor {
              A: 1
            }
            Percent: 0.518496037
            FillBrush {
              Id: 841534158063459245
            }
            BackgroundBrush {
              Id: 841534158063459245
            }
            FillType {
              Value: "mc:eprogressbarfilltype:lefttoright"
            }
            FillTileType {
              Value: "mc:eslatebrushtiletype:notile"
            }
            BackgroundTileType {
              Value: "mc:eslatebrushtiletype:notile"
            }
          }
          AnchorLayout {
            SelfAnchor {
              Anchor {
                Value: "mc:euianchor:topleft"
              }
            }
            TargetAnchor {
              Anchor {
                Value: "mc:euianchor:topleft"
              }
            }
          }
        }
        NetworkRelevanceDistance {
          Value: "mc:eproxyrelevance:critical"
        }
      }
      Objects {
        Id: 5222382664523047282
        Name: "Progress Text"
        Transform {
          Location {
            X: 1301.47021
            Y: 1425.28931
            Z: 393.546753
          }
          Rotation {
            Yaw: 7.69733524
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 13822970385512125956
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        EditorIndicatorVisibility {
          Value: "mc:eindicatorvisibility:visiblewhenselected"
        }
        Control {
          Width: -20
          Height: 40
          UIX: 10
          UIY: 39.3264465
          RenderTransformPivot {
            Anchor {
              Value: "mc:euianchor:middlecenter"
            }
          }
          AddSizeToParentIfUsingParentSize: true
          UseParentWidth: true
          Text {
            Label: "1m 23s"
            Color {
              R: 1
              G: 1
              B: 1
              A: 1
            }
            Size: 12
            Justification {
              Value: "mc:etextjustify:center"
            }
            Font {
              Id: 841534158063459245
            }
            VerticalJustification {
              Value: "mc:everticaljustification:center"
            }
            ShadowColor {
              A: 1
            }
            ShadowOffset {
            }
            OutlineColor {
              A: 1
            }
            OutlineSize: 2
          }
          AnchorLayout {
            SelfAnchor {
              Anchor {
                Value: "mc:euianchor:topleft"
              }
            }
            TargetAnchor {
              Anchor {
                Value: "mc:euianchor:topleft"
              }
            }
          }
        }
        NetworkRelevanceDistance {
          Value: "mc:eproxyrelevance:critical"
        }
      }
    }
    PrimaryAssetId {
      AssetType: "None"
      AssetId: "None"
    }
  }
  SerializationVersion: 108
  VirtualFolderPath: "Functional"
  VirtualFolderPath: "UI"
}
