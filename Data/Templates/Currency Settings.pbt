Assets {
  Id: 14554080387353028704
  Name: "Currency"
  PlatformAssetType: 5
  TemplateAsset {
    ObjectBlock {
      RootId: 2206528703420994063
      Objects {
        Id: 2206528703420994063
        Name: "Currency"
        Transform {
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 4781671109827199097
        ChildIds: 6776763109977260092
        ChildIds: 2329717726263895082
        ChildIds: 16571784517670153075
        UnregisteredParameters {
          Overrides {
            Name: "cs:CurrencyId"
            String: "coins"
          }
          Overrides {
            Name: "cs:Name"
            String: "Coins"
          }
          Overrides {
            Name: "cs:StorageKey"
            NetReference {
              Type {
                Value: "mc:enetreferencetype:unknown"
              }
            }
          }
          Overrides {
            Name: "cs:StartingAmount"
            Int: 0
          }
          Overrides {
            Name: "cs:MaxAmount"
            Int: 0
          }
          Overrides {
            Name: "cs:VerboseLogs"
            Bool: false
          }
          Overrides {
            Name: "cs:DropTemplate"
            AssetReference {
              Id: 18119685549656626836
            }
          }
          Overrides {
            Name: "cs:DropItemPickupTemplate"
            AssetReference {
              Id: 8040246261067913342
            }
          }
          Overrides {
            Name: "cs:IconCameraId"
            String: ""
          }
          Overrides {
            Name: "cs:IconAsset"
            AssetReference {
              Id: 17707168052484183952
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
            Name: "cs:CurrencyId:tooltip"
            String: "The id of the Currency. Must be unique within a scene."
          }
          Overrides {
            Name: "cs:Name:tooltip"
            String: "The name of the Currency."
          }
          Overrides {
            Name: "cs:StorageKey:tooltip"
            String: "An optional Shared Storage Key to save Currency data into. Default is Local Storage."
          }
          Overrides {
            Name: "cs:StartingAmount:tooltip"
            String: "The amount of this Currency a new Player will start with."
          }
          Overrides {
            Name: "cs:MaxAmount:tooltip"
            String: "The maximum amount of this currency a Player can have. 0 means no maximum."
          }
          Overrides {
            Name: "cs:DropItemPickupTemplate:tooltip"
            String: "The Item Pickup Template to use if this Currency is dropped in world."
          }
          Overrides {
            Name: "cs:VerboseLogs:tooltip"
            String: "If true, more detailed logs will be printed to the Event Log if errors or warnings occur."
          }
          Overrides {
            Name: "cs:IconCameraId:tooltip"
            String: "If \"Is3DIcon\" is true, this should match the \"CameraId\" of an \"Icon Generator\" in the scene."
          }
          Overrides {
            Name: "cs:IconAsset:tooltip"
            String: "The image or template to use for an icon. If \"IsKitbashed2DIcon\" is true, this should be a UI template. If \"Is3DIcon\" is true, this should be a 3D object template. If \"IsImageIcon\" is true, this should be an image/brush asset."
          }
          Overrides {
            Name: "cs:IsKitbashed2DIcon:tooltip"
            String: "If true, the \"IconAsset\" should point to a UI template. This template will be spawned as the icon."
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
            Name: "cs:DropItemPickupTemplate:subcategory"
            String: "Drops"
          }
          Overrides {
            Name: "cs:DropTemplate:category"
            String: "Custom"
          }
          Overrides {
            Name: "cs:DropTemplate:subcategory"
            String: "Drops"
          }
          Overrides {
            Name: "cs:DropTemplate:tooltip"
            String: "The template to use to display the dropped item in world."
          }
        }
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
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
        Id: 6776763109977260092
        Name: "CurrencySettings"
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
        ParentId: 2206528703420994063
        UnregisteredParameters {
          Overrides {
            Name: "cs:ComponentRoot"
            ObjectReference {
              SubObjectId: 2206528703420994063
            }
          }
        }
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
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
            Id: 5795522539682800925
          }
        }
        IsAdvanced: true
        NetworkRelevanceDistance {
          Value: "mc:eproxyrelevance:critical"
        }
      }
      Objects {
        Id: 2329717726263895082
        Name: "Currency README"
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
        ParentId: 2206528703420994063
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
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
            Id: 17295820024805998238
          }
        }
        NetworkRelevanceDistance {
          Value: "mc:eproxyrelevance:critical"
        }
      }
      Objects {
        Id: 16571784517670153075
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
        ParentId: 2206528703420994063
        ChildIds: 11670669285874714634
        ChildIds: 3191137314186790913
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
        Id: 11670669285874714634
        Name: "CurrencySettings"
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
        ParentId: 16571784517670153075
        UnregisteredParameters {
          Overrides {
            Name: "cs:ComponentRoot"
            ObjectReference {
              SubObjectId: 2206528703420994063
            }
          }
        }
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
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
            Id: 5795522539682800925
          }
        }
        IsAdvanced: true
        NetworkRelevanceDistance {
          Value: "mc:eproxyrelevance:critical"
        }
      }
      Objects {
        Id: 3191137314186790913
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
        ParentId: 16571784517670153075
        ChildIds: 9121950730614872783
        ChildIds: 17887994219471653644
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
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
        Id: 9121950730614872783
        Name: "UICurrencyClient"
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
        ParentId: 3191137314186790913
        UnregisteredParameters {
          Overrides {
            Name: "cs:Icon"
            ObjectReference {
              SubObjectId: 722070529794811313
            }
          }
          Overrides {
            Name: "cs:Amount"
            ObjectReference {
              SubObjectId: 5657299245635108167
            }
          }
          Overrides {
            Name: "cs:ComponentRoot"
            ObjectReference {
              SubObjectId: 2206528703420994063
            }
          }
        }
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
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
            Id: 16883847165460771125
          }
        }
        IsAdvanced: true
        NetworkRelevanceDistance {
          Value: "mc:eproxyrelevance:critical"
        }
      }
      Objects {
        Id: 17887994219471653644
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
        ParentId: 3191137314186790913
        ChildIds: 4269966502914972366
        ChildIds: 722070529794811313
        ChildIds: 5657299245635108167
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
          Width: 200
          Height: 60
          UIX: -20
          UIY: 20
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
                Value: "mc:euianchor:topright"
              }
            }
            TargetAnchor {
              Anchor {
                Value: "mc:euianchor:topright"
              }
            }
          }
        }
        NetworkRelevanceDistance {
          Value: "mc:eproxyrelevance:critical"
        }
      }
      Objects {
        Id: 4269966502914972366
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
        ParentId: 17887994219471653644
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
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
        Id: 722070529794811313
        Name: "Icon"
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
        ParentId: 17887994219471653644
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
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
          Width: 50
          Height: 50
          UIX: 5
          UIY: 5
          RenderTransformPivot {
            Anchor {
              Value: "mc:euianchor:middlecenter"
            }
          }
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
        NetworkRelevanceDistance {
          Value: "mc:eproxyrelevance:critical"
        }
      }
      Objects {
        Id: 5657299245635108167
        Name: "Amount"
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
        ParentId: 17887994219471653644
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
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
          Width: -80
          Height: 40
          UIX: 70
          UIY: 10
          RenderTransformPivot {
            Anchor {
              Value: "mc:euianchor:middlecenter"
            }
          }
          AddSizeToParentIfUsingParentSize: true
          UseParentWidth: true
          Text {
            Label: "0"
            Color {
              R: 1
              G: 1
              B: 1
              A: 1
            }
            Size: 16
            Justification {
              Value: "mc:etextjustify:left"
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
      Id: 17707168052484183952
      Name: "Fantasy Coins 004"
      PlatformAssetType: 9
      PrimaryAsset {
        AssetType: "PlatformBrushAssetRef"
        AssetId: "UI_Fantasy_Equip_Coins_004"
      }
    }
    PrimaryAssetId {
      AssetType: "None"
      AssetId: "None"
    }
  }
  SerializationVersion: 108
  VirtualFolderPath: "Functional"
  VirtualFolderPath: "Currency"
}
