Assets {
  Id: 10776093378121207183
  Name: "Teleport To Player Lot Button"
  PlatformAssetType: 5
  TemplateAsset {
    ObjectBlock {
      RootId: 6776411841338017018
      Objects {
        Id: 6776411841338017018
        Name: "Teleport To Player Lot Button"
        Transform {
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 4781671109827199097
        ChildIds: 10350450880203455013
        UnregisteredParameters {
          Overrides {
            Name: "cs:LotType"
            String: ""
          }
          Overrides {
            Name: "cs:SpawnPointKey"
            String: ""
          }
          Overrides {
            Name: "cs:AssignPlayerToLot"
            Bool: true
          }
          Overrides {
            Name: "cs:TakeOverOfflineLots"
            Bool: true
          }
          Overrides {
            Name: "cs:IconCameraId"
            String: ""
          }
          Overrides {
            Name: "cs:IconAsset"
            AssetReference {
              Id: 3746753204667991703
            }
          }
          Overrides {
            Name: "cs:IsKitbashed2DIcon"
            Bool: false
          }
          Overrides {
            Name: "cs:Is3DIcon"
            Bool: false
          }
          Overrides {
            Name: "cs:IsImageIcon"
            Bool: true
          }
          Overrides {
            Name: "cs:Binding"
            String: ""
          }
          Overrides {
            Name: "cs:ButtonText"
            String: ""
          }
          Overrides {
            Name: "cs:SpawnPointKey:tooltip"
            String: "(Optional) If set when a Player is moved to a Player Lot they will spawn at the Spawn Point that shares this key."
          }
          Overrides {
            Name: "cs:SpawnPointKey:isrep"
            Bool: false
          }
          Overrides {
            Name: "cs:SpawnPointKey:ml"
            Bool: false
          }
          Overrides {
            Name: "cs:ButtonText:ml"
            Bool: true
          }
          Overrides {
            Name: "cs:IconCameraId:tooltip"
            String: "Set this to match the CameraId on an Icon Generator if you are using a 3D IconAsset for your icon and want to use Render to Texture to display it. Leave this blank if you are spawning a UI icon or using an Image."
          }
          Overrides {
            Name: "cs:IconCameraId:isrep"
            Bool: false
          }
          Overrides {
            Name: "cs:IconCameraId:ml"
            Bool: false
          }
          Overrides {
            Name: "cs:IconAsset:tooltip"
            String: "Reference your icon asset here. This can be a 3D object, 2D object created from UIControls or an Image."
          }
          Overrides {
            Name: "cs:IconAsset:isrep"
            Bool: false
          }
          Overrides {
            Name: "cs:IconAsset:ml"
            Bool: false
          }
          Overrides {
            Name: "cs:IsKitbashed2DIcon:tooltip"
            String: "If true, the template referenced in IconAsset will be spawned instead of rendered. This is useful for kitbashed 2D icons."
          }
          Overrides {
            Name: "cs:IsKitbashed2DIcon:isrep"
            Bool: false
          }
          Overrides {
            Name: "cs:IsKitbashed2DIcon:ml"
            Bool: false
          }
          Overrides {
            Name: "cs:Is3DIcon:isrep"
            Bool: false
          }
          Overrides {
            Name: "cs:Is3DIcon:ml"
            Bool: false
          }
          Overrides {
            Name: "cs:IsImageIcon:isrep"
            Bool: false
          }
          Overrides {
            Name: "cs:IsImageIcon:ml"
            Bool: false
          }
          Overrides {
            Name: "cs:SpawnPointKey:category"
            String: "Custom"
          }
          Overrides {
            Name: "cs:SpawnPointKey:subcategory"
            String: "PlayerLot"
          }
          Overrides {
            Name: "cs:ButtonText:category"
            String: "Custom"
          }
          Overrides {
            Name: "cs:ButtonText:subcategory"
            String: "Icon"
          }
          Overrides {
            Name: "cs:IsImageIcon:category"
            String: "Custom"
          }
          Overrides {
            Name: "cs:IsImageIcon:subcategory"
            String: "Icon"
          }
          Overrides {
            Name: "cs:Is3DIcon:category"
            String: "Custom"
          }
          Overrides {
            Name: "cs:Is3DIcon:subcategory"
            String: "Icon"
          }
          Overrides {
            Name: "cs:IsKitbashed2DIcon:category"
            String: "Custom"
          }
          Overrides {
            Name: "cs:IsKitbashed2DIcon:subcategory"
            String: "Icon"
          }
          Overrides {
            Name: "cs:IconAsset:category"
            String: "Custom"
          }
          Overrides {
            Name: "cs:IconAsset:subcategory"
            String: "Icon"
          }
          Overrides {
            Name: "cs:IconCameraId:category"
            String: "Custom"
          }
          Overrides {
            Name: "cs:IconCameraId:subcategory"
            String: "Icon"
          }
          Overrides {
            Name: "cs:Binding:category"
            String: "Custom"
          }
          Overrides {
            Name: "cs:Binding:subcategory"
            String: "Icon"
          }
          Overrides {
            Name: "cs:LotType:tooltip"
            String: "(Optional) If set, this portal will move a Player to an available lot that is flagged as being this Lot Type."
          }
          Overrides {
            Name: "cs:LotType:isrep"
            Bool: false
          }
          Overrides {
            Name: "cs:LotType:ml"
            Bool: false
          }
          Overrides {
            Name: "cs:TakeOverOfflineLots:tooltip"
            String: "If true, if there are no available unowned Player Lots, a lot owned by an offline Player will be used."
          }
          Overrides {
            Name: "cs:TakeOverOfflineLots:isrep"
            Bool: false
          }
          Overrides {
            Name: "cs:TakeOverOfflineLots:ml"
            Bool: false
          }
          Overrides {
            Name: "cs:TakeOverOfflineLots:category"
            String: "Custom"
          }
          Overrides {
            Name: "cs:TakeOverOfflineLots:subcategory"
            String: "PlayerLot"
          }
          Overrides {
            Name: "cs:LotType:category"
            String: "Custom"
          }
          Overrides {
            Name: "cs:LotType:subcategory"
            String: "PlayerLot"
          }
          Overrides {
            Name: "cs:AssignPlayerToLot:tooltip"
            String: "If true, the Player teleporting will be assigned a lot if they don\'t already own one. Otherwise this will teleport them to the lot they own, or to the first lot of the specified Lot Type found."
          }
          Overrides {
            Name: "cs:AssignPlayerToLot:subcategory"
            String: "PlayerLot"
          }
          Overrides {
            Name: "cs:ButtonText:tooltip"
            String: "(Optional) This text will appear over the icon. {type} can be used and will be replaced with the LotType."
          }
          Overrides {
            Name: "cs:Binding:tooltip"
            String: "(Optional) The binding that should be pressed to teleport the Player."
          }
          Overrides {
            Name: "cs:IsImageIcon:tooltip"
            String: "If true, the \"IconAsset\" should point to an image/brush asset. This will be used as the icon."
          }
          Overrides {
            Name: "cs:Is3DIcon:tooltip"
            String: "If true, the \"IconAsset\" should point to a 3D object template. An image of this template will be used as the icon."
          }
        }
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
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
        Id: 10350450880203455013
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
        ParentId: 6776411841338017018
        ChildIds: 8002655111923022011
        ChildIds: 17897291490658002940
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
        Id: 8002655111923022011
        Name: "TeleportToPlayerLotButtonClient"
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
        ParentId: 10350450880203455013
        UnregisteredParameters {
          Overrides {
            Name: "cs:ComponentRoot"
            ObjectReference {
              SubObjectId: 6776411841338017018
            }
          }
          Overrides {
            Name: "cs:Icon"
            ObjectReference {
              SubObjectId: 2753603484946674112
            }
          }
          Overrides {
            Name: "cs:Button"
            ObjectReference {
              SubObjectId: 4238900923106377170
            }
          }
          Overrides {
            Name: "cs:Text"
            ObjectReference {
              SubObjectId: 16932552994534712437
            }
          }
          Overrides {
            Name: "cs:BindingBackground"
            ObjectReference {
              SubObjectId: 6140469038594333075
            }
          }
          Overrides {
            Name: "cs:BindingText"
            ObjectReference {
              SubObjectId: 9470106181435346706
            }
          }
        }
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
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
            Id: 8550490471323045700
          }
        }
        NetworkRelevanceDistance {
          Value: "mc:eproxyrelevance:critical"
        }
      }
      Objects {
        Id: 17897291490658002940
        Name: "UI Container"
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
        ParentId: 10350450880203455013
        ChildIds: 17346473399551739385
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
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
              X: 1024
              Y: 1024
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
        Id: 17346473399551739385
        Name: "Panel"
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
        ParentId: 17897291490658002940
        ChildIds: 2753603484946674112
        ChildIds: 6140469038594333075
        ChildIds: 4238900923106377170
        ChildIds: 16932552994534712437
        UnregisteredParameters {
        }
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
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
          Width: 100
          Height: 100
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
        Id: 2753603484946674112
        Name: "Icon"
        Transform {
          Location {
          }
          Rotation {
            Yaw: 2.39056608e-05
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 17346473399551739385
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
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
          Width: 100
          Height: 100
          RenderTransformPivot {
            Anchor {
              Value: "mc:euianchor:middlecenter"
            }
          }
          Image {
            Brush {
              Id: 3746753204667991703
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
        NetworkRelevanceDistance {
          Value: "mc:eproxyrelevance:critical"
        }
      }
      Objects {
        Id: 6140469038594333075
        Name: "Binding Background"
        Transform {
          Location {
            X: 2604.05347
            Y: -2329.04272
            Z: 777.473267
          }
          Rotation {
            Yaw: -45.7996788
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 17346473399551739385
        ChildIds: 9470106181435346706
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
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
          Width: 35
          Height: 30
          RenderTransformPivot {
            Anchor {
              Value: "mc:euianchor:middlecenter"
            }
          }
          Image {
            Brush {
              Id: 841534158063459245
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
                Value: "mc:euianchor:bottomright"
              }
            }
            TargetAnchor {
              Anchor {
                Value: "mc:euianchor:bottomright"
              }
            }
          }
        }
        NetworkRelevanceDistance {
          Value: "mc:eproxyrelevance:critical"
        }
      }
      Objects {
        Id: 9470106181435346706
        Name: "Binding"
        Transform {
          Location {
          }
          Rotation {
            Yaw: 4.43962272e-05
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 6140469038594333075
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
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
          Width: 28
          Height: 30
          RenderTransformPivot {
            Anchor {
              Value: "mc:euianchor:middlecenter"
            }
          }
          Text {
            Color {
              R: 0.73
              G: 0.319072872
              A: 1
            }
            Size: 16
            Justification {
              Value: "mc:etextjustify:center"
            }
            AutoWrapText: true
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
                Value: "mc:euianchor:middlecenter"
              }
            }
            TargetAnchor {
              Anchor {
                Value: "mc:euianchor:middlecenter"
              }
            }
          }
        }
        NetworkRelevanceDistance {
          Value: "mc:eproxyrelevance:critical"
        }
      }
      Objects {
        Id: 4238900923106377170
        Name: "Button"
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
        ParentId: 17346473399551739385
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
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
          Width: 100
          Height: 100
          RenderTransformPivot {
            Anchor {
              Value: "mc:euianchor:middlecenter"
            }
          }
          Button {
            FontColor {
              A: 1
            }
            FontSize: 20
            ButtonColor {
              R: 1
              G: 1
              B: 1
            }
            HoveredColor {
              R: 1
              G: 1
              B: 1
              A: 1
            }
            PressedColor {
              R: 1
              G: 1
              B: 1
              A: 1
            }
            DisabledColor {
              R: 1
              G: 1
              B: 1
              A: 1
            }
            Brush {
              Id: 841534158063459245
            }
            IsButtonEnabled: true
            OnlyUseMainColor: true
            ClickMode {
              Value: "mc:ebuttonclickmode:default"
            }
            Font {
            }
            Justification {
              Value: "mc:etextjustify:center"
            }
            VerticalJustification {
              Value: "mc:everticaljustification:center"
            }
            ShadowColor {
              A: 1
            }
            ShadowOffset {
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
        Id: 16932552994534712437
        Name: "Text"
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
        ParentId: 17346473399551739385
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
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
          UseParentWidth: true
          UseParentHeight: true
          Text {
            Color {
              A: 1
            }
            Size: 20
            Justification {
              Value: "mc:etextjustify:center"
            }
            AutoWrapText: true
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
    }
    Assets {
      Id: 3746753204667991703
      Name: "Icon Core"
      PlatformAssetType: 9
      PrimaryAsset {
        AssetType: "PlatformBrushAssetRef"
        AssetId: "Icon_Core"
      }
    }
    PrimaryAssetId {
      AssetType: "None"
      AssetId: "None"
    }
  }
  SerializationVersion: 110
  VirtualFolderPath: "Functional"
  VirtualFolderPath: "Player Lots"
}
