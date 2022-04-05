Name: "UI"
RootId: 6792825314166502495
Objects {
  Id: 16679107803770396844
  Name: "Loading Screen Component (hide me)"
  Transform {
    Scale {
      X: 1
      Y: 1
      Z: 1
    }
  }
  ParentId: 6792825314166502495
  Collidable_v2 {
    Value: "mc:ecollisionsetting:inheritfromparent"
  }
  Visible_v2 {
    Value: "mc:evisibilitysetting:inheritfromparent"
  }
  TemplateInstance {
    ParameterOverrideMap {
      key: 4094983134254350369
      value {
        Overrides {
          Name: "Name"
          String: "Loading Screen Component"
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
      Id: 16642238767644634232
    }
  }
  NetworkRelevanceDistance {
    Value: "mc:eproxyrelevance:critical"
  }
}
Objects {
  Id: 2103486985598539124
  Name: "Crafting Icon"
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
  ParentId: 6792825314166502495
  ChildIds: 7187905298974275386
  ChildIds: 6374707723797318478
  UnregisteredParameters {
    Overrides {
      Name: "cs:IconCameraId"
      String: "inventory"
    }
    Overrides {
      Name: "cs:IconAsset"
      AssetReference {
        Id: 16985806080796865695
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
      String: "Open Crafting Screen"
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
      Name: "cs:Binding:tooltip"
      String: "This text will be displayed as the shortcut key for this button. This will not create a shortcut for you, so the button needs to be connected to the binding via other means."
    }
    Overrides {
      Name: "cs:Binding:isrep"
      Bool: false
    }
    Overrides {
      Name: "cs:Binding:ml"
      Bool: false
    }
  }
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
  Id: 6374707723797318478
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
  ParentId: 2103486985598539124
  ChildIds: 13458435794424060927
  Collidable_v2 {
    Value: "mc:ecollisionsetting:inheritfromparent"
  }
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
  Id: 13458435794424060927
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
  ParentId: 6374707723797318478
  ChildIds: 7032917474408072633
  ChildIds: 1395956247561757481
  ChildIds: 7224971849856884759
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
    UIX: -50
    UIY: -50
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
  Id: 7224971849856884759
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
  ParentId: 13458435794424060927
  Collidable_v2 {
    Value: "mc:ecollisionsetting:inheritfromparent"
  }
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
  Id: 1395956247561757481
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
  ParentId: 13458435794424060927
  ChildIds: 7963239299381071800
  Collidable_v2 {
    Value: "mc:ecollisionsetting:inheritfromparent"
  }
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
  Id: 7963239299381071800
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
  ParentId: 1395956247561757481
  Collidable_v2 {
    Value: "mc:ecollisionsetting:inheritfromparent"
  }
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
  Id: 7032917474408072633
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
  ParentId: 13458435794424060927
  Collidable_v2 {
    Value: "mc:ecollisionsetting:inheritfromparent"
  }
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
  Id: 7187905298974275386
  Name: "IconClient"
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
  ParentId: 2103486985598539124
  UnregisteredParameters {
    Overrides {
      Name: "cs:Icon"
      ObjectReference {
        SelfId: 7032917474408072633
      }
    }
    Overrides {
      Name: "cs:BindingText"
      ObjectReference {
        SelfId: 7963239299381071800
      }
    }
    Overrides {
      Name: "cs:ComponentRoot"
      ObjectReference {
        SelfId: 2103486985598539124
      }
    }
    Overrides {
      Name: "cs:BindingBackground"
      ObjectReference {
        SelfId: 1395956247561757481
      }
    }
  }
  Collidable_v2 {
    Value: "mc:ecollisionsetting:inheritfromparent"
  }
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
      Id: 1300522112865575183
    }
  }
  IsAdvanced: true
  NetworkRelevanceDistance {
    Value: "mc:eproxyrelevance:critical"
  }
}
Objects {
  Id: 14081442560219434759
  Name: "Inventory Icon"
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
  ParentId: 6792825314166502495
  ChildIds: 16353690033542174449
  ChildIds: 3842800394050618531
  UnregisteredParameters {
    Overrides {
      Name: "cs:IconCameraId"
      String: "inventory"
    }
    Overrides {
      Name: "cs:IconAsset"
      AssetReference {
        Id: 772026397211321447
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
      String: "Open Inventory Screen"
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
      Name: "cs:Binding:tooltip"
      String: "This text will be displayed as the shortcut key for this button. This will not create a shortcut for you, so the button needs to be connected to the binding via other means."
    }
    Overrides {
      Name: "cs:Binding:isrep"
      Bool: false
    }
    Overrides {
      Name: "cs:Binding:ml"
      Bool: false
    }
  }
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
  Id: 3842800394050618531
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
  ParentId: 14081442560219434759
  ChildIds: 5041014794827851473
  Collidable_v2 {
    Value: "mc:ecollisionsetting:inheritfromparent"
  }
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
  Id: 5041014794827851473
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
  ParentId: 3842800394050618531
  ChildIds: 5364175392368577920
  ChildIds: 7305046176480458620
  ChildIds: 4206195225527865275
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
    UIX: -160
    UIY: -50
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
  Id: 4206195225527865275
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
  ParentId: 5041014794827851473
  Collidable_v2 {
    Value: "mc:ecollisionsetting:inheritfromparent"
  }
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
  Id: 7305046176480458620
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
  ParentId: 5041014794827851473
  ChildIds: 8695849787924453976
  Collidable_v2 {
    Value: "mc:ecollisionsetting:inheritfromparent"
  }
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
  Id: 8695849787924453976
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
  ParentId: 7305046176480458620
  Collidable_v2 {
    Value: "mc:ecollisionsetting:inheritfromparent"
  }
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
  Id: 5364175392368577920
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
  ParentId: 5041014794827851473
  Collidable_v2 {
    Value: "mc:ecollisionsetting:inheritfromparent"
  }
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
  Id: 16353690033542174449
  Name: "IconClient"
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
  ParentId: 14081442560219434759
  UnregisteredParameters {
    Overrides {
      Name: "cs:Icon"
      ObjectReference {
        SelfId: 5364175392368577920
      }
    }
    Overrides {
      Name: "cs:BindingText"
      ObjectReference {
        SelfId: 8695849787924453976
      }
    }
    Overrides {
      Name: "cs:ComponentRoot"
      ObjectReference {
        SelfId: 14081442560219434759
      }
    }
    Overrides {
      Name: "cs:BindingBackground"
      ObjectReference {
        SelfId: 7305046176480458620
      }
    }
  }
  Collidable_v2 {
    Value: "mc:ecollisionsetting:inheritfromparent"
  }
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
      Id: 1300522112865575183
    }
  }
  IsAdvanced: true
  NetworkRelevanceDistance {
    Value: "mc:eproxyrelevance:critical"
  }
}
Objects {
  Id: 4525586099510075630
  Name: "Teleport Home Icon"
  Transform {
    Scale {
      X: 1
      Y: 1
      Z: 1
    }
  }
  ParentId: 6792825314166502495
  ChildIds: 17248938315377122865
  UnregisteredParameters {
    Overrides {
      Name: "cs:LotType"
      String: "Front Yard"
    }
    Overrides {
      Name: "cs:SpawnPointKey"
      String: "Road"
    }
    Overrides {
      Name: "cs:AssignPlayerToLot"
      Bool: false
    }
    Overrides {
      Name: "cs:TakeOverOfflineLots"
      Bool: false
    }
    Overrides {
      Name: "cs:IconCameraId"
      String: ""
    }
    Overrides {
      Name: "cs:IconAsset"
      AssetReference {
        Id: 3057266278999807166
      }
    }
    Overrides {
      Name: "cs:IsKitbashed2DIcon"
      Bool: true
    }
    Overrides {
      Name: "cs:Is3DIcon"
      Bool: false
    }
    Overrides {
      Name: "cs:IsImageIcon"
      Bool: false
    }
    Overrides {
      Name: "cs:Binding"
      String: "Teleport Home"
    }
    Overrides {
      Name: "cs:BindingText"
      String: "H"
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
      Name: "cs:BindingText:tooltip"
      String: "(Optional) This text will be displayed as the shortcut key for this button."
    }
    Overrides {
      Name: "cs:BindingText:isrep"
      Bool: false
    }
    Overrides {
      Name: "cs:BindingText:ml"
      Bool: false
    }
    Overrides {
      Name: "cs:BindingText:subcategory"
      String: "Icon"
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
  Id: 17248938315377122865
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
  ParentId: 4525586099510075630
  ChildIds: 1138177407965519023
  ChildIds: 10996464243401868264
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
  Id: 10996464243401868264
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
  ParentId: 17248938315377122865
  ChildIds: 10412242728661361133
  Collidable_v2 {
    Value: "mc:ecollisionsetting:inheritfromparent"
  }
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
  Id: 10412242728661361133
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
  ParentId: 10996464243401868264
  ChildIds: 5112282637902042580
  ChildIds: 3887712794563935623
  ChildIds: 6491696766635661766
  ChildIds: 9959773259647778913
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
    UIX: 160
    UIY: -50
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
          Value: "mc:euianchor:bottomleft"
        }
      }
      TargetAnchor {
        Anchor {
          Value: "mc:euianchor:bottomleft"
        }
      }
    }
  }
  NetworkRelevanceDistance {
    Value: "mc:eproxyrelevance:critical"
  }
}
Objects {
  Id: 9959773259647778913
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
  ParentId: 10412242728661361133
  Collidable_v2 {
    Value: "mc:ecollisionsetting:inheritfromparent"
  }
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
Objects {
  Id: 6491696766635661766
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
  ParentId: 10412242728661361133
  Collidable_v2 {
    Value: "mc:ecollisionsetting:inheritfromparent"
  }
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
  Id: 3887712794563935623
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
  ParentId: 10412242728661361133
  ChildIds: 16404407115305003782
  Collidable_v2 {
    Value: "mc:ecollisionsetting:inheritfromparent"
  }
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
  Id: 16404407115305003782
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
  ParentId: 3887712794563935623
  Collidable_v2 {
    Value: "mc:ecollisionsetting:inheritfromparent"
  }
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
  Id: 5112282637902042580
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
  ParentId: 10412242728661361133
  Collidable_v2 {
    Value: "mc:ecollisionsetting:inheritfromparent"
  }
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
  Id: 1138177407965519023
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
  ParentId: 17248938315377122865
  UnregisteredParameters {
    Overrides {
      Name: "cs:ComponentRoot"
      ObjectReference {
        SelfId: 4525586099510075630
      }
    }
    Overrides {
      Name: "cs:Icon"
      ObjectReference {
        SelfId: 5112282637902042580
      }
    }
    Overrides {
      Name: "cs:Button"
      ObjectReference {
        SelfId: 6491696766635661766
      }
    }
    Overrides {
      Name: "cs:Text"
      ObjectReference {
        SelfId: 9959773259647778913
      }
    }
    Overrides {
      Name: "cs:BindingBackground"
      ObjectReference {
        SelfId: 3887712794563935623
      }
    }
    Overrides {
      Name: "cs:BindingText"
      ObjectReference {
        SelfId: 16404407115305003782
      }
    }
  }
  Collidable_v2 {
    Value: "mc:ecollisionsetting:inheritfromparent"
  }
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
  Id: 4521851426145205351
  Name: "Teleport To Town Icon"
  Transform {
    Scale {
      X: 1
      Y: 1
      Z: 1
    }
  }
  ParentId: 6792825314166502495
  ChildIds: 17252799224063034040
  UnregisteredParameters {
    Overrides {
      Name: "cs:DestinationArea"
      ObjectReference {
        SelfId: 9627516010740923415
      }
    }
    Overrides {
      Name: "cs:DestinationAreaKey"
      String: ""
    }
    Overrides {
      Name: "cs:DestinationTarget"
      ObjectReference {
      }
    }
    Overrides {
      Name: "cs:SpawnPointKey"
      String: "Center"
    }
    Overrides {
      Name: "cs:IconCameraId"
      String: ""
    }
    Overrides {
      Name: "cs:IconAsset"
      AssetReference {
        Id: 17742693140918919974
      }
    }
    Overrides {
      Name: "cs:IsKitbashed2DIcon"
      Bool: true
    }
    Overrides {
      Name: "cs:Is3DIcon"
      Bool: false
    }
    Overrides {
      Name: "cs:IsImageIcon"
      Bool: false
    }
    Overrides {
      Name: "cs:Binding"
      String: "Teleport To Town"
    }
    Overrides {
      Name: "cs:BindingText"
      String: "T"
    }
    Overrides {
      Name: "cs:ButtonText"
      String: ""
    }
    Overrides {
      Name: "cs:DestinationArea:tooltip"
      String: "(Optional) If set will send Player to a specific Area, otherwise will find an appropriate Area"
    }
    Overrides {
      Name: "cs:DestinationArea:isrep"
      Bool: false
    }
    Overrides {
      Name: "cs:DestinationArea:ml"
      Bool: false
    }
    Overrides {
      Name: "cs:DestinationAreaKey:tooltip"
      String: "(Optional) If \'DestinationArea\' is empty this will assign the Player to a specific set of assignable Areas"
    }
    Overrides {
      Name: "cs:DestinationAreaKey:isrep"
      Bool: false
    }
    Overrides {
      Name: "cs:DestinationAreaKey:ml"
      Bool: false
    }
    Overrides {
      Name: "cs:DestinationTarget:tooltip"
      String: "(Optional) Teleport to the world position of a core object"
    }
    Overrides {
      Name: "cs:DestinationTarget:isrep"
      Bool: false
    }
    Overrides {
      Name: "cs:DestinationTarget:ml"
      Bool: false
    }
    Overrides {
      Name: "cs:SpawnPointKey:tooltip"
      String: "(Optional) If not using a Target, A key will filter which Area spawn point to use"
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
      Name: "cs:BindingText:tooltip"
      String: "(Optional) This text will be displayed as the shortcut key for this button."
    }
    Overrides {
      Name: "cs:BindingText:isrep"
      Bool: false
    }
    Overrides {
      Name: "cs:BindingText:ml"
      Bool: false
    }
    Overrides {
      Name: "cs:BindingText:subcategory"
      String: "Icon"
    }
    Overrides {
      Name: "cs:DestinationArea:subcategory"
      String: "Area"
    }
    Overrides {
      Name: "cs:DestinationAreaKey:category"
      String: "Custom"
    }
    Overrides {
      Name: "cs:DestinationAreaKey:subcategory"
      String: "Area"
    }
    Overrides {
      Name: "cs:DestinationTarget:category"
      String: "Custom"
    }
    Overrides {
      Name: "cs:DestinationTarget:subcategory"
      String: "Area"
    }
    Overrides {
      Name: "cs:SpawnPointKey:category"
      String: "Custom"
    }
    Overrides {
      Name: "cs:SpawnPointKey:subcategory"
      String: "Area"
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
      Name: "cs:Is3DIcon:tooltip"
      String: "If true, the \"IconAsset\" should point to a 3D object template. An image of this template will be used as the icon."
    }
    Overrides {
      Name: "cs:IsImageIcon:tooltip"
      String: "If true, the \"IconAsset\" should point to an image/brush asset. This will be used as the icon."
    }
    Overrides {
      Name: "cs:Binding:tooltip"
      String: "(Optional) The binding that should be pressed to teleport the Player."
    }
    Overrides {
      Name: "cs:ButtonText:tooltip"
      String: "(Optional) This text will appear over the icon. {name} can be used and will be replaced with the destination Area Name. {type} can be used and will be replaced with the DestinationAreaKey."
    }
  }
  Collidable_v2 {
    Value: "mc:ecollisionsetting:inheritfromparent"
  }
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
  Id: 17252799224063034040
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
  ParentId: 4521851426145205351
  ChildIds: 4624835037658084372
  ChildIds: 10994837593681878881
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
  Id: 10994837593681878881
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
  ParentId: 17252799224063034040
  ChildIds: 10408237541630492004
  Collidable_v2 {
    Value: "mc:ecollisionsetting:inheritfromparent"
  }
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
  Id: 10408237541630492004
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
  ParentId: 10994837593681878881
  ChildIds: 5115159571358828893
  ChildIds: 3890306670986617102
  ChildIds: 6492476175864743247
  ChildIds: 9959414243780041960
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
    UIX: 50
    UIY: -50
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
          Value: "mc:euianchor:bottomleft"
        }
      }
      TargetAnchor {
        Anchor {
          Value: "mc:euianchor:bottomleft"
        }
      }
    }
  }
  NetworkRelevanceDistance {
    Value: "mc:eproxyrelevance:critical"
  }
}
Objects {
  Id: 9959414243780041960
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
  ParentId: 10408237541630492004
  Collidable_v2 {
    Value: "mc:ecollisionsetting:inheritfromparent"
  }
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
Objects {
  Id: 6492476175864743247
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
  ParentId: 10408237541630492004
  Collidable_v2 {
    Value: "mc:ecollisionsetting:inheritfromparent"
  }
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
  Id: 3890306670986617102
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
  ParentId: 10408237541630492004
  ChildIds: 16404047341576861583
  Collidable_v2 {
    Value: "mc:ecollisionsetting:inheritfromparent"
  }
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
  Id: 16404047341576861583
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
  ParentId: 3890306670986617102
  Collidable_v2 {
    Value: "mc:ecollisionsetting:inheritfromparent"
  }
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
  Id: 5115159571358828893
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
  ParentId: 10408237541630492004
  Collidable_v2 {
    Value: "mc:ecollisionsetting:inheritfromparent"
  }
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
  Id: 4624835037658084372
  Name: "TeleportToAreaButtonClient"
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
  ParentId: 17252799224063034040
  UnregisteredParameters {
    Overrides {
      Name: "cs:ComponentRoot"
      ObjectReference {
        SelfId: 4521851426145205351
      }
    }
    Overrides {
      Name: "cs:Icon"
      ObjectReference {
        SelfId: 5115159571358828893
      }
    }
    Overrides {
      Name: "cs:BindingBackground"
      ObjectReference {
        SelfId: 3890306670986617102
      }
    }
    Overrides {
      Name: "cs:BindingText"
      ObjectReference {
        SelfId: 16404047341576861583
      }
    }
    Overrides {
      Name: "cs:Text"
      ObjectReference {
        SelfId: 9959414243780041960
      }
    }
    Overrides {
      Name: "cs:Button"
      ObjectReference {
        SelfId: 6492476175864743247
      }
    }
  }
  Collidable_v2 {
    Value: "mc:ecollisionsetting:inheritfromparent"
  }
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
      Id: 18123388147900938580
    }
  }
  NetworkRelevanceDistance {
    Value: "mc:eproxyrelevance:critical"
  }
}
Objects {
  Id: 9796230452571601787
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
  ParentId: 6792825314166502495
  ChildIds: 13874389206038132416
  ChildIds: 6689137583748546688
  ChildIds: 4894853643534698149
  ChildIds: 3319361175785343204
  UnregisteredParameters {
    Overrides {
      Name: "cs:ScreenContainer"
      ObjectReference {
        SelfId: 6689137583748546688
      }
    }
  }
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
  Id: 3319361175785343204
  Name: "Tooltip Container"
  Transform {
    Location {
      X: 2976.57153
      Y: -1461.37097
      Z: 1202.99365
    }
    Rotation {
      Yaw: -26.3175259
    }
    Scale {
      X: 1
      Y: 1
      Z: 1
    }
  }
  ParentId: 9796230452571601787
  ChildIds: 13754896216933148570
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
      TwoSided: true
      TickWhenOffScreen: true
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
  Id: 13754896216933148570
  Name: "UI Tooltip"
  Transform {
    Location {
    }
    Rotation {
      Yaw: -3.41509403e-05
    }
    Scale {
      X: 1
      Y: 1
      Z: 1
    }
  }
  ParentId: 3319361175785343204
  ChildIds: 17688260272177409368
  ChildIds: 10400473901035248518
  ChildIds: 9660372416932989353
  UnregisteredParameters {
    Overrides {
      Name: "cs:CursorOffset"
      Vector2 {
        Y: -30
      }
    }
    Overrides {
      Name: "cs:FitToText"
      Bool: true
    }
    Overrides {
      Name: "cs:KeepOnScreen"
      Bool: true
    }
    Overrides {
      Name: "cs:KeepOnScreenPadding"
      Vector2 {
        X: 20
        Y: 20
      }
    }
    Overrides {
      Name: "cs:CursorOffset:tooltip"
      String: "The distance from the cursor the tool tip should appear."
    }
    Overrides {
      Name: "cs:FitToText:tooltip"
      String: "If true, the tool tip width will be adjusted to fit the text."
    }
    Overrides {
      Name: "cs:KeepOnScreen:tooltip"
      String: "If true, the tool tip will not be able to move off the screen."
    }
    Overrides {
      Name: "cs:KeepOnScreenPadding:tooltip"
      String: "If \"KeepOnScreen\" is true, this padding will be applied to the tool tip when it is near a screen edge."
    }
  }
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
  Control {
    Width: 100
    Height: 30
    UIX: 836.093506
    UIY: 547.945923
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
          Value: "mc:euianchor:bottomcenter"
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
  Id: 9660372416932989353
  Name: "Text"
  Transform {
    Location {
    }
    Rotation {
      Yaw: 1.70754709e-06
    }
    Scale {
      X: 1
      Y: 1
      Z: 1
    }
  }
  ParentId: 13754896216933148570
  Collidable_v2 {
    Value: "mc:ecollisionsetting:inheritfromparent"
  }
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
    Height: 50
    RenderTransformPivot {
      Anchor {
        Value: "mc:euianchor:middlecenter"
      }
    }
    Text {
      Label: "Tooltip"
      Color {
        R: 1
        G: 1
        B: 1
        A: 1
      }
      Size: 14
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
        X: 2
        Y: 2
      }
      OutlineColor {
        A: 1
      }
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
  Id: 10400473901035248518
  Name: "Background"
  Transform {
    Location {
    }
    Rotation {
      Yaw: 1.70754709e-06
    }
    Scale {
      X: 1
      Y: 1
      Z: 1
    }
  }
  ParentId: 13754896216933148570
  Collidable_v2 {
    Value: "mc:ecollisionsetting:inheritfromparent"
  }
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
    Width: 20
    Height: 10
    RenderTransformPivot {
      Anchor {
        Value: "mc:euianchor:middlecenter"
      }
    }
    AddSizeToParentIfUsingParentSize: true
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
  Id: 17688260272177409368
  Name: "UITooltipClient"
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
  ParentId: 13754896216933148570
  UnregisteredParameters {
    Overrides {
      Name: "cs:ComponentRoot"
      ObjectReference {
        SelfId: 13754896216933148570
      }
    }
    Overrides {
      Name: "cs:Text"
      ObjectReference {
        SelfId: 9660372416932989353
      }
    }
  }
  Collidable_v2 {
    Value: "mc:ecollisionsetting:inheritfromparent"
  }
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
      Id: 17256057881071656495
    }
  }
  NetworkRelevanceDistance {
    Value: "mc:eproxyrelevance:critical"
  }
}
Objects {
  Id: 4894853643534698149
  Name: "ContextMenu Container"
  Transform {
    Location {
      X: 2050
      Y: 1950
      Z: 800
    }
    Rotation {
      Yaw: -59.9999924
    }
    Scale {
      X: 1
      Y: 1
      Z: 1
    }
  }
  ParentId: 9796230452571601787
  ChildIds: 10037683393444784478
  Collidable_v2 {
    Value: "mc:ecollisionsetting:inheritfromparent"
  }
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
}
Objects {
  Id: 10037683393444784478
  Name: "Inventory Item Context Menu"
  Transform {
    Scale {
      X: 1
      Y: 1
      Z: 1
    }
  }
  ParentId: 4894853643534698149
  Collidable_v2 {
    Value: "mc:ecollisionsetting:inheritfromparent"
  }
  Visible_v2 {
    Value: "mc:evisibilitysetting:forceoff"
  }
  TemplateInstance {
    ParameterOverrideMap {
      key: 11421390516298953746
      value {
        Overrides {
          Name: "Name"
          String: "Inventory Item Context Menu"
        }
        Overrides {
          Name: "Position"
          Vector {
            X: 651.313965
            Y: 28.1088257
            Z: 50
          }
        }
        Overrides {
          Name: "Rotation"
          Rotator {
            Yaw: -1.02452832e-05
          }
        }
      }
    }
    TemplateAsset {
      Id: 15064468736634411232
    }
  }
}
Objects {
  Id: 6689137583748546688
  Name: "Main Container"
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
  ParentId: 9796230452571601787
  ChildIds: 4915465189185531523
  ChildIds: 18355283018768708907
  Collidable_v2 {
    Value: "mc:ecollisionsetting:inheritfromparent"
  }
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
      TwoSided: true
      TickWhenOffScreen: true
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
  Id: 18355283018768708907
  Name: "Hotbar"
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
  ParentId: 6689137583748546688
  ChildIds: 4239359061177509555
  ChildIds: 5567706839471872006
  UnregisteredParameters {
    Overrides {
      Name: "cs:Controller"
      ObjectReference {
        SelfId: 4239359061177509555
      }
    }
    Overrides {
      Name: "cs:IconCameraId"
      String: "inventory"
    }
    Overrides {
      Name: "cs:Title"
      ObjectReference {
      }
    }
    Overrides {
      Name: "cs:CloseButton"
      ObjectReference {
      }
    }
    Overrides {
      Name: "cs:SlotContainer"
      ObjectReference {
        SelfId: 5370615061841547448
      }
    }
    Overrides {
      Name: "cs:SlotTemplate"
      AssetReference {
        Id: 5599373721529575842
      }
    }
    Overrides {
      Name: "cs:InventoryId"
      String: "hotbar"
    }
    Overrides {
      Name: "cs:Columns"
      Int: 8
    }
    Overrides {
      Name: "cs:Padding"
      Float: 0
    }
    Overrides {
      Name: "cs:UseNumericShortcuts"
      Bool: true
    }
    Overrides {
      Name: "cs:ShortcutActsAsBinding"
      String: "ability_primary"
    }
    Overrides {
      Name: "cs:Controller:tooltip"
      String: "The Inventory Screen script to use."
    }
    Overrides {
      Name: "cs:IconCameraId:tooltip"
      String: "Set this to match the CameraId of an Icon Generator in the scene. 3D Icons rendered in this Inventory Screen will use the camera set here."
    }
    Overrides {
      Name: "cs:Title:tooltip"
      String: "The optional UIText object to use to display this Inventory name."
    }
    Overrides {
      Name: "cs:CloseButton:tooltip"
      String: "The optional UIButton to use to close this Inventory."
    }
    Overrides {
      Name: "cs:SlotContainer:tooltip"
      String: "The UIControl to spawn Inventory Slot items into."
    }
    Overrides {
      Name: "cs:SlotTemplate:tooltip"
      String: "The template to use for Inventory Slots."
    }
    Overrides {
      Name: "cs:InventoryId:tooltip"
      String: "Optional Inventory id if this screen should open a specific Inventory. Leave this blank if the screen is being used to open an Inventory via an Inventory Settings object"
    }
    Overrides {
      Name: "cs:Columns:tooltip"
      String: "The number of Slots to add before moving down a row"
    }
    Overrides {
      Name: "cs:Padding:tooltip"
      String: "The padding between Inventory Slots."
    }
    Overrides {
      Name: "cs:UseNumericShortcuts:tooltip"
      String: "If true, numbers 1-9 will be used to \"click\" the first 9 slots. This is meant for on screen Hotbar like Inventories."
    }
    Overrides {
      Name: "cs:ShortcutActsAsBinding:tooltip"
      String: "If \"UseNumericShortcuts\" is true, this is the binding that will be mimicked when a number 1-9 is pressed."
    }
  }
  Collidable_v2 {
    Value: "mc:ecollisionsetting:inheritfromparent"
  }
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
    Width: 800
    Height: 100
    UIX: 6.10351562e-05
    UIY: -50
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
          Value: "mc:euianchor:bottomcenter"
        }
      }
      TargetAnchor {
        Anchor {
          Value: "mc:euianchor:bottomcenter"
        }
      }
    }
  }
  NetworkRelevanceDistance {
    Value: "mc:eproxyrelevance:critical"
  }
}
Objects {
  Id: 5567706839471872006
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
  ParentId: 18355283018768708907
  ChildIds: 5370615061841547448
  Collidable_v2 {
    Value: "mc:ecollisionsetting:inheritfromparent"
  }
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
    Width: 313
    Height: 200
    RenderTransformPivot {
      Anchor {
        Value: "mc:euianchor:middlecenter"
      }
    }
    UseParentWidth: true
    UseParentHeight: true
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
  Id: 5370615061841547448
  Name: "Content"
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
  ParentId: 5567706839471872006
  Collidable_v2 {
    Value: "mc:ecollisionsetting:inheritfromparent"
  }
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
    UseParentWidth: true
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
  Id: 4239359061177509555
  Name: "InventoryScreen"
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
  ParentId: 18355283018768708907
  UnregisteredParameters {
    Overrides {
      Name: "cs:ComponentRoot"
      ObjectReference {
        SelfId: 18355283018768708907
      }
    }
    Overrides {
      Name: "cs:APIInventory"
      AssetReference {
        Id: 16904144847002750700
      }
    }
  }
  Collidable_v2 {
    Value: "mc:ecollisionsetting:inheritfromparent"
  }
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
      Id: 8891346482049016143
    }
  }
  IsAdvanced: true
  NetworkRelevanceDistance {
    Value: "mc:eproxyrelevance:critical"
  }
}
Objects {
  Id: 4915465189185531523
  Name: "Crosshair"
  Transform {
    Location {
      X: 3601.43652
      Y: -780.735
      Z: -150
    }
    Rotation {
      Yaw: -36.8314896
    }
    Scale {
      X: 1
      Y: 1
      Z: 1
    }
  }
  ParentId: 6689137583748546688
  Collidable_v2 {
    Value: "mc:ecollisionsetting:inheritfromparent"
  }
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
    Width: 24
    Height: 24
    RenderTransformPivot {
      Anchor {
        Value: "mc:euianchor:middlecenter"
      }
    }
    Image {
      Brush {
        Id: 13047948654445922593
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
  Id: 13874389206038132416
  Name: "UIControllerClient"
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
  ParentId: 9796230452571601787
  UnregisteredParameters {
    Overrides {
      Name: "cs:ComponentRoot"
      ObjectReference {
        SelfId: 9796230452571601787
      }
    }
  }
  Collidable_v2 {
    Value: "mc:ecollisionsetting:inheritfromparent"
  }
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
      Id: 14495003582878709767
    }
  }
  IsAdvanced: true
  NetworkRelevanceDistance {
    Value: "mc:eproxyrelevance:critical"
  }
}
Objects {
  Id: 3996063226159226604
  Name: "Interaction Display"
  Transform {
    Scale {
      X: 1
      Y: 1
      Z: 1
    }
  }
  ParentId: 6792825314166502495
  Collidable_v2 {
    Value: "mc:ecollisionsetting:inheritfromparent"
  }
  Visible_v2 {
    Value: "mc:evisibilitysetting:inheritfromparent"
  }
  TemplateInstance {
    ParameterOverrideMap {
      key: 6606713102730584260
      value {
        Overrides {
          Name: "Name"
          String: "Interaction Display"
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
      }
    }
    TemplateAsset {
      Id: 4348145339898802302
    }
  }
}
Objects {
  Id: 6457238848884109614
  Name: "Nameplates"
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
  ParentId: 6792825314166502495
  Collidable_v2 {
    Value: "mc:ecollisionsetting:inheritfromparent"
  }
  Visible_v2 {
    Value: "mc:evisibilitysetting:inheritfromparent"
  }
  TemplateInstance {
    ParameterOverrideMap {
      key: 15979967455835987047
      value {
        Overrides {
          Name: "Name"
          String: "Nameplates"
        }
        Overrides {
          Name: "cs:ShowNumbers"
          Bool: false
        }
        Overrides {
          Name: "cs:AnimateChanges"
          Bool: false
        }
        Overrides {
          Name: "cs:ShowOnSelf"
          Bool: false
        }
        Overrides {
          Name: "cs:ShowHealthbars"
          Bool: false
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
      Id: 5465781095454586960
    }
  }
  NetworkRelevanceDistance {
    Value: "mc:eproxyrelevance:critical"
  }
}
Objects {
  Id: 13021602275199526630
  Name: "UI Placeable Limits Display"
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
  ParentId: 6792825314166502495
  TemplateInstance {
    ParameterOverrideMap {
      key: 8987379989984338730
      value {
        Overrides {
          Name: "Name"
          String: "Placeable Limits Display (Back Yard)"
        }
        Overrides {
          Name: "cs:ReplicatorIdentifiers"
          String: "BackYardPlaceables"
        }
        Overrides {
          Name: "cs:DistanceFromPlayer"
          Float: 5000
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
    ParameterOverrideMap {
      key: 10130370407765170283
      value {
        Overrides {
          Name: "cs:Panel"
          ObjectReference {
            SelfId: 9266931953346388403
            SubObjectId: 11760419688932943860
            InstanceId: 13021602275199526630
            TemplateId: 8927235836720174497
          }
        }
      }
    }
    TemplateAsset {
      Id: 8927235836720174497
    }
  }
}
Objects {
  Id: 18167543844209213184
  Name: "UI Placeable Limits Display"
  Transform {
    Scale {
      X: 1
      Y: 1
      Z: 1
    }
  }
  ParentId: 6792825314166502495
  TemplateInstance {
    ParameterOverrideMap {
      key: 8987379989984338730
      value {
        Overrides {
          Name: "Name"
          String: "Placeable Limits Display (Front Yard)"
        }
        Overrides {
          Name: "cs:ReplicatorIdentifiers"
          String: "FrontYardPlaceables"
        }
        Overrides {
          Name: "cs:DistanceFromPlayer"
          Float: 2500
        }
      }
    }
    ParameterOverrideMap {
      key: 10130370407765170283
      value {
        Overrides {
          Name: "cs:Panel"
          ObjectReference {
            SelfId: 8672200486528201514
            SubObjectId: 11760419688932943860
            InstanceId: 18167543844209213184
            TemplateId: 8927235836720174497
          }
        }
      }
    }
    TemplateAsset {
      Id: 8927235836720174497
    }
  }
}
Objects {
  Id: 6839106985960955696
  Name: "UI Currency Display"
  Transform {
    Scale {
      X: 1
      Y: 1
      Z: 1
    }
  }
  ParentId: 6792825314166502495
  Collidable_v2 {
    Value: "mc:ecollisionsetting:inheritfromparent"
  }
  Visible_v2 {
    Value: "mc:evisibilitysetting:inheritfromparent"
  }
  TemplateInstance {
    ParameterOverrideMap {
      key: 844907766145291975
      value {
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
        Overrides {
          Name: "cs:CurrencyId"
          String: "coins"
        }
      }
    }
    ParameterOverrideMap {
      key: 15291205337633051161
      value {
        Overrides {
          Name: "Name"
          String: "UI Currency Display"
        }
      }
    }
    TemplateAsset {
      Id: 991751424114352672
    }
  }
  NetworkRelevanceDistance {
    Value: "mc:eproxyrelevance:critical"
  }
}
Objects {
  Id: 26708819792874851
  Name: "Player Lot Name UI"
  Transform {
    Scale {
      X: 1
      Y: 1
      Z: 1
    }
  }
  ParentId: 6792825314166502495
  TemplateInstance {
    ParameterOverrideMap {
      key: 12156268173387373977
      value {
        Overrides {
          Name: "Name"
          String: "Player Lot Name UI"
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
          Name: "cs:TextForNoOwner"
          String: "Unowned Lot"
        }
        Overrides {
          Name: "cs:DistanceFromPlayer"
          Float: 2500
        }
      }
    }
    TemplateAsset {
      Id: 10194068519757380742
    }
  }
  NetworkRelevanceDistance {
    Value: "mc:eproxyrelevance:critical"
  }
}
Objects {
  Id: 10082179338263729842
  Name: "Area Name UI"
  Transform {
    Scale {
      X: 1
      Y: 1
      Z: 1
    }
  }
  ParentId: 6792825314166502495
  TemplateInstance {
    ParameterOverrideMap {
      key: 12156268173387373977
      value {
        Overrides {
          Name: "Name"
          String: "Area Name UI"
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
      Id: 2711387417258838373
    }
  }
  NetworkRelevanceDistance {
    Value: "mc:eproxyrelevance:critical"
  }
}
Objects {
  Id: 3357765105661692383
  Name: "Reset Data Tool"
  Transform {
    Scale {
      X: 1
      Y: 1
      Z: 1
    }
  }
  ParentId: 6792825314166502495
  TemplateInstance {
    ParameterOverrideMap {
      key: 6419674239483412809
      value {
        Overrides {
          Name: "Name"
          String: "Reset Data Tool"
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
      Id: 4796924068056768119
    }
  }
  NetworkRelevanceDistance {
    Value: "mc:eproxyrelevance:critical"
  }
}
Objects {
  Id: 16991078530628994399
  Name: "Icon Generator"
  Transform {
    Location {
      X: -3400
      Y: -24700
    }
    Rotation {
      Yaw: -90
    }
    Scale {
      X: 1
      Y: 1
      Z: 1
    }
  }
  ParentId: 6792825314166502495
  ChildIds: 10410436601094383597
  ChildIds: 11784078425042404225
  UnregisteredParameters {
    Overrides {
      Name: "cs:CameraId"
      String: "inventory"
    }
    Overrides {
      Name: "cs:Camera"
      ObjectReference {
        SelfId: 12240382408088891159
      }
    }
    Overrides {
      Name: "cs:IconContainer"
      ObjectReference {
        SelfId: 14643878662697289392
      }
    }
  }
  Collidable_v2 {
    Value: "mc:ecollisionsetting:inheritfromparent"
  }
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
  InstanceHistory {
    SelfId: 16991078530628994399
    SubobjectId: 3023396390788584615
    InstanceId: 1787526599709109529
    TemplateId: 2038226924033640544
    WasRoot: true
  }
  NetworkRelevanceDistance {
    Value: "mc:eproxyrelevance:critical"
  }
}
Objects {
  Id: 11784078425042404225
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
  ParentId: 16991078530628994399
  ChildIds: 10840227269161039418
  ChildIds: 12240382408088891159
  ChildIds: 9808924392708668418
  ChildIds: 14643878662697289392
  ChildIds: 8095131892663895749
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
  InstanceHistory {
    SelfId: 11784078425042404225
    SubobjectId: 7039225163043426937
    InstanceId: 1787526599709109529
    TemplateId: 2038226924033640544
  }
  NetworkRelevanceDistance {
    Value: "mc:eproxyrelevance:critical"
  }
}
Objects {
  Id: 8095131892663895749
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
  ParentId: 11784078425042404225
  ChildIds: 17891626398916192856
  ChildIds: 6740139062385931115
  ChildIds: 11924235651129876665
  Collidable_v2 {
    Value: "mc:ecollisionsetting:inheritfromparent"
  }
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
  InstanceHistory {
    SelfId: 8095131892663895749
    SubobjectId: 12857357507099907901
    InstanceId: 1787526599709109529
    TemplateId: 2038226924033640544
  }
  NetworkRelevanceDistance {
    Value: "mc:eproxyrelevance:critical"
  }
}
Objects {
  Id: 11924235651129876665
  Name: "Frame"
  Transform {
    Location {
      X: -167.988281
      Z: 606.073
    }
    Rotation {
      Pitch: 90
      Yaw: 3.18742132e-05
      Roll: -3.05175781e-05
    }
    Scale {
      X: 1
      Y: -1
      Z: 1
    }
  }
  ParentId: 8095131892663895749
  ChildIds: 12467641937010696335
  Collidable_v2 {
    Value: "mc:ecollisionsetting:inheritfromparent"
  }
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
  InstanceHistory {
    SelfId: 11924235651129876665
    SubobjectId: 7440588959646462273
    InstanceId: 1787526599709109529
    TemplateId: 2038226924033640544
  }
  NetworkRelevanceDistance {
    Value: "mc:eproxyrelevance:critical"
  }
}
Objects {
  Id: 12467641937010696335
  Name: "Pipe - 4-Sided Thin"
  Transform {
    Location {
      X: 6.10351562e-05
      Z: 0.00048828125
    }
    Rotation {
      Pitch: 2.04905664e-05
    }
    Scale {
      X: 2.65962744
      Y: -2.65962744
      Z: 0.00659941
    }
  }
  ParentId: 11924235651129876665
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
        R: 0.113000005
        G: 0.113000005
        B: 0.113000005
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
    DisableDistanceFieldLighting: true
    DisableCastShadows: true
    StaticMesh {
      Physics {
        Mass: 100
        LinearDamping: 0.01
      }
      BoundsScale: 1
    }
  }
  InstanceHistory {
    SelfId: 12467641937010696335
    SubobjectId: 8015522573767389559
    InstanceId: 1787526599709109529
    TemplateId: 2038226924033640544
  }
  NetworkRelevanceDistance {
    Value: "mc:eproxyrelevance:critical"
  }
}
Objects {
  Id: 6740139062385931115
  Name: "Plane 1m - One Sided"
  Transform {
    Location {
      X: -85.1196289
      Z: 606.073
    }
    Rotation {
      Pitch: 90
      Yaw: -9.15527344e-05
      Roll: -0.000122070312
    }
    Scale {
      X: 12.1808872
      Y: 12.1808863
      Z: 0.001
    }
  }
  ParentId: 8095131892663895749
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
        R: 0.04
        G: 0.04
        B: 0.04
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
    DisableDistanceFieldLighting: true
    StaticMesh {
      Physics {
        Mass: 100
        LinearDamping: 0.01
      }
      BoundsScale: 1
    }
  }
  InstanceHistory {
    SelfId: 6740139062385931115
    SubobjectId: 11506949786069754515
    InstanceId: 1787526599709109529
    TemplateId: 2038226924033640544
  }
  NetworkRelevanceDistance {
    Value: "mc:eproxyrelevance:critical"
  }
}
Objects {
  Id: 17891626398916192856
  Name: "Point Light"
  Transform {
    Location {
      X: -677.485
      Y: 46.25
      Z: 756.205078
    }
    Rotation {
      Yaw: 4.78113179e-05
    }
    Scale {
      X: 1
      Y: 1
      Z: 1
    }
  }
  ParentId: 8095131892663895749
  Collidable_v2 {
    Value: "mc:ecollisionsetting:inheritfromparent"
  }
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
    Intensity: 7.23300219
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
        AttenuationRadius: 1820.50305
        PointLight {
          SourceRadius: 20
          SoftSourceRadius: 20
          FallOffExponent: 8
          UseFallOffExponent: true
        }
      }
      MaxDrawDistance: 5000
      MaxDistanceFadeRange: 1000
    }
  }
  InstanceHistory {
    SelfId: 17891626398916192856
    SubobjectId: 4211708373057944480
    InstanceId: 1787526599709109529
    TemplateId: 2038226924033640544
  }
  NetworkRelevanceDistance {
    Value: "mc:eproxyrelevance:critical"
  }
}
Objects {
  Id: 14643878662697289392
  Name: "Icon Container"
  Transform {
    Location {
      X: -250
      Z: 606.073
    }
    Rotation {
      Yaw: -89.999939
    }
    Scale {
      X: 1
      Y: 1
      Z: 1
    }
  }
  ParentId: 11784078425042404225
  ChildIds: 7060043391678307206
  Collidable_v2 {
    Value: "mc:ecollisionsetting:inheritfromparent"
  }
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
  InstanceHistory {
    SelfId: 14643878662697289392
    SubobjectId: 648710861928535880
    InstanceId: 1787526599709109529
    TemplateId: 2038226924033640544
  }
  NetworkRelevanceDistance {
    Value: "mc:eproxyrelevance:critical"
  }
}
Objects {
  Id: 7060043391678307206
  Name: "Dummy Object"
  Transform {
    Location {
      Y: 41.6489258
      Z: 0.001953125
    }
    Rotation {
    }
    Scale {
      X: 0.0974076614
      Y: 0.0974076614
      Z: -0.504912913
    }
  }
  ParentId: 14643878662697289392
  UnregisteredParameters {
    Overrides {
      Name: "bp:Type"
      Enum {
        Value: "mc:evolumetype:0"
      }
    }
    Overrides {
      Name: "bp:X Scale"
      Float: 0.9
    }
    Overrides {
      Name: "bp:Y Scale"
      Float: 0.9
    }
    Overrides {
      Name: "bp:Z Scale"
      Float: 0.9
    }
  }
  Collidable_v2 {
    Value: "mc:ecollisionsetting:inheritfromparent"
  }
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
      Id: 6442861049751997091
    }
    TeamSettings {
    }
  }
  InstanceHistory {
    SelfId: 7060043391678307206
    SubobjectId: 11800412982135671422
    InstanceId: 1787526599709109529
    TemplateId: 2038226924033640544
  }
  NetworkRelevanceDistance {
    Value: "mc:eproxyrelevance:critical"
  }
}
Objects {
  Id: 9808924392708668418
  Name: "Light Blocker"
  Transform {
    Location {
      X: -403.837769
      Z: 615.647949
    }
    Rotation {
      Yaw: 1.36603767e-05
    }
    Scale {
      X: 9.49825287
      Y: 12.3487492
      Z: 12.3487406
    }
  }
  ParentId: 11784078425042404225
  ChildIds: 5955673103668504710
  UnregisteredParameters {
    Overrides {
      Name: "ma:Shared_BaseMaterial:color"
      Color {
        R: 0.04
        G: 0.04
        B: 0.04
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
      Id: 12095835209017042614
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
  InstanceHistory {
    SelfId: 9808924392708668418
    SubobjectId: 5339406426196340218
    InstanceId: 1787526599709109529
    TemplateId: 2038226924033640544
  }
  NetworkRelevanceDistance {
    Value: "mc:eproxyrelevance:critical"
  }
}
Objects {
  Id: 5955673103668504710
  Name: "Icon Generator Explanation"
  Transform {
    Location {
      X: -50.1599655
      Y: -47.311615
      Z: 32.5481415
    }
    Rotation {
      Yaw: -179.999954
    }
    Scale {
      X: 0.201611176
      Y: 0.155072704
      Z: 0.155072778
    }
  }
  ParentId: 9808924392708668418
  Collidable_v2 {
    Value: "mc:ecollisionsetting:inheritfromparent"
  }
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
    Text: "Icon Generator:\r\nThis is being used to create 2d icons out of 3d objects.\r\nIt is basically a photo booth. Use multiple of these to \r\nhave different looks behind different icon types.\r\nLook inside this box to see the icon capture area. \r\nYou can change this to change the background of your icons.\r\n(Hide this somewhere out of sight in your scene.)"
    FontAsset {
    }
    Color {
      R: 1
      G: 1
      B: 1
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
  }
  InstanceHistory {
    SelfId: 5955673103668504710
    SubobjectId: 10421294606872017278
    InstanceId: 1787526599709109529
    TemplateId: 2038226924033640544
  }
  NetworkRelevanceDistance {
    Value: "mc:eproxyrelevance:critical"
  }
}
Objects {
  Id: 12240382408088891159
  Name: "Camera"
  Transform {
    Location {
      X: -300
      Z: 606.073
    }
    Rotation {
    }
    Scale {
      X: 1
      Y: 1
      Z: 1
    }
  }
  ParentId: 11784078425042404225
  Collidable_v2 {
    Value: "mc:ecollisionsetting:inheritfromparent"
  }
  Visible_v2 {
    Value: "mc:evisibilitysetting:inheritfromparent"
  }
  CameraCollidable {
    Value: "mc:ecollisionsetting:inheritfromparent"
  }
  EditorIndicatorVisibility {
    Value: "mc:eindicatorvisibility:alwaysvisible"
  }
  Camera {
    MinDistance: 300
    MaxDistance: 600
    PositionOffset {
    }
    RotationOffset {
    }
    FieldOfView: 90
    ViewWidth: 1200
    RotationMode {
      Value: "mc:erotationmode:default"
    }
    MinPitch: -89
    MaxPitch: 89
    DoesPositionOffsetSpring: true
    UseAsAudioListener: true
  }
  InstanceHistory {
    SelfId: 12240382408088891159
    SubobjectId: 7775394300901900015
    InstanceId: 1787526599709109529
    TemplateId: 2038226924033640544
  }
  NetworkRelevanceDistance {
    Value: "mc:eproxyrelevance:critical"
  }
}
Objects {
  Id: 10840227269161039418
  Name: "IconGeneratorClient"
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
  ParentId: 11784078425042404225
  UnregisteredParameters {
    Overrides {
      Name: "cs:ComponentRoot"
      ObjectReference {
        SelfId: 16991078530628994399
      }
    }
  }
  Collidable_v2 {
    Value: "mc:ecollisionsetting:inheritfromparent"
  }
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
      Id: 10711757664355232617
    }
  }
  InstanceHistory {
    SelfId: 10840227269161039418
    SubobjectId: 6073407964131502018
    InstanceId: 1787526599709109529
    TemplateId: 2038226924033640544
  }
  NetworkRelevanceDistance {
    Value: "mc:eproxyrelevance:critical"
  }
}
Objects {
  Id: 10410436601094383597
  Name: "Icon Generator README"
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
  ParentId: 16991078530628994399
  Collidable_v2 {
    Value: "mc:ecollisionsetting:inheritfromparent"
  }
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
      Id: 7282390650300058587
    }
  }
  InstanceHistory {
    SelfId: 10410436601094383597
    SubobjectId: 5926844825591232021
    InstanceId: 1787526599709109529
    TemplateId: 2038226924033640544
  }
  NetworkRelevanceDistance {
    Value: "mc:eproxyrelevance:critical"
  }
}
Objects {
  Id: 16770356229179181670
  Name: "Error Feedback UI"
  Transform {
    Scale {
      X: 1
      Y: 1
      Z: 1
    }
  }
  ParentId: 6792825314166502495
  TemplateInstance {
    ParameterOverrideMap {
      key: 18071362505886583064
      value {
        Overrides {
          Name: "Name"
          String: "Error Feedback UI"
        }
      }
    }
    TemplateAsset {
      Id: 18157368640148006503
    }
  }
}
