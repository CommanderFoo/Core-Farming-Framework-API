Assets {
  Id: 5653978466544345737
  Name: "Hotbar"
  PlatformAssetType: 5
  TemplateAsset {
    ObjectBlock {
      RootId: 12902181959151187211
      Objects {
        Id: 12902181959151187211
        Name: "Hotbar"
        Transform {
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 4781671109827199097
        ChildIds: 276017910544180883
        ChildIds: 4424211876233476912
        ChildIds: 17554024286546553939
        ChildIds: 693023840910632588
        ChildIds: 14581587296823135529
        UnregisteredParameters {
          Overrides {
            Name: "cs:InventoryId"
            String: "hotbar"
          }
          Overrides {
            Name: "cs:InventoryName"
            String: "Hotbar"
          }
          Overrides {
            Name: "cs:DefaultIcon"
            AssetReference {
              Id: 7634571119250511053
            }
          }
          Overrides {
            Name: "cs:StartingItems"
            ObjectReference {
              SubObjectId: 17554024286546553939
            }
          }
          Overrides {
            Name: "cs:AllowedItems"
            String: ""
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
            Name: "cs:TotalSlots"
            Int: 8
          }
          Overrides {
            Name: "cs:SlotCapacity"
            Int: 99
          }
          Overrides {
            Name: "cs:AllowNonEmptyContainers"
            Bool: false
          }
          Overrides {
            Name: "cs:UseStacks"
            Bool: true
          }
          Overrides {
            Name: "cs:CanEquip"
            Bool: true
          }
          Overrides {
            Name: "cs:Priority"
            Int: 1
          }
          Overrides {
            Name: "cs:OverflowInventoryIds"
            String: ""
          }
          Overrides {
            Name: "cs:VerboseLogs"
            Bool: false
          }
          Overrides {
            Name: "cs:CanDrop"
            Bool: true
          }
          Overrides {
            Name: "cs:DropForAllPlayers"
            Bool: true
          }
          Overrides {
            Name: "cs:DropTimeoutSeconds"
            Float: 60
          }
          Overrides {
            Name: "cs:ItemPickupTemplate"
            AssetReference {
              Id: 15375784612613316623
            }
          }
          Overrides {
            Name: "cs:ScreenTemplate"
            AssetReference {
              Id: 12495394132823353132
            }
          }
          Overrides {
            Name: "cs:ScreenToggleButton"
            ObjectReference {
            }
          }
          Overrides {
            Name: "cs:OpenBinding"
            String: ""
          }
          Overrides {
            Name: "cs:CloseBinding"
            String: ""
          }
          Overrides {
            Name: "cs:ShowCursor"
            Bool: false
          }
          Overrides {
            Name: "cs:InventoryId:tooltip"
            String: "The id for this Inventory. Must be unique within a scene."
          }
          Overrides {
            Name: "cs:InventoryId:isrep"
            Bool: false
          }
          Overrides {
            Name: "cs:InventoryId:ml"
            Bool: false
          }
          Overrides {
            Name: "cs:InventoryName:tooltip"
            String: "The name of this Inventory."
          }
          Overrides {
            Name: "cs:InventoryName:isrep"
            Bool: false
          }
          Overrides {
            Name: "cs:InventoryName:ml"
            Bool: false
          }
          Overrides {
            Name: "cs:DefaultIcon:isrep"
            Bool: false
          }
          Overrides {
            Name: "cs:DefaultIcon:ml"
            Bool: false
          }
          Overrides {
            Name: "cs:StartingItems:isrep"
            Bool: false
          }
          Overrides {
            Name: "cs:StartingItems:ml"
            Bool: false
          }
          Overrides {
            Name: "cs:StorageKey:tooltip"
            String: "An optional Shared Storage Key to use to save Inventory data to. Local Storage will be used if this is not set."
          }
          Overrides {
            Name: "cs:StorageKey:isrep"
            Bool: false
          }
          Overrides {
            Name: "cs:StorageKey:ml"
            Bool: false
          }
          Overrides {
            Name: "cs:TotalSlots:tooltip"
            String: "The total number of slots in this Inventory. Must be greater than 0, defaults to 10."
          }
          Overrides {
            Name: "cs:TotalSlots:isrep"
            Bool: false
          }
          Overrides {
            Name: "cs:TotalSlots:ml"
            Bool: false
          }
          Overrides {
            Name: "cs:SlotCapacity:tooltip"
            String: "The total number of items that can be stacked into a slot. 0 means no maximum."
          }
          Overrides {
            Name: "cs:SlotCapacity:isrep"
            Bool: false
          }
          Overrides {
            Name: "cs:SlotCapacity:ml"
            Bool: false
          }
          Overrides {
            Name: "cs:AllowNonEmptyContainers:tooltip"
            String: "If true, Inventory Containers that contain items can be stored in this Inventory. Note: This could lead to storage issues if not carefully used."
          }
          Overrides {
            Name: "cs:AllowNonEmptyContainers:isrep"
            Bool: false
          }
          Overrides {
            Name: "cs:AllowNonEmptyContainers:ml"
            Bool: false
          }
          Overrides {
            Name: "cs:UseStacks:tooltip"
            String: "If true, items will be able to exist in multiple slots and other stacking logic will be applied when moving items around."
          }
          Overrides {
            Name: "cs:UseStacks:isrep"
            Bool: false
          }
          Overrides {
            Name: "cs:UseStacks:ml"
            Bool: false
          }
          Overrides {
            Name: "cs:CanEquip:tooltip"
            String: "If true, items will be able to be equipped from this Inventory."
          }
          Overrides {
            Name: "cs:CanEquip:isrep"
            Bool: false
          }
          Overrides {
            Name: "cs:CanEquip:ml"
            Bool: false
          }
          Overrides {
            Name: "cs:Priority:tooltip"
            String: "Used when items are added or removed without a target Inventory. The Inventory with the highest priority that can add or remove the item will be used."
          }
          Overrides {
            Name: "cs:Priority:isrep"
            Bool: false
          }
          Overrides {
            Name: "cs:Priority:ml"
            Bool: false
          }
          Overrides {
            Name: "cs:OverflowInventoryIds:tooltip"
            String: "A comma separated list of Inventory Ids that will be used for extra items that won\'t fit into this Inventory."
          }
          Overrides {
            Name: "cs:OverflowInventoryIds:isrep"
            Bool: false
          }
          Overrides {
            Name: "cs:OverflowInventoryIds:ml"
            Bool: false
          }
          Overrides {
            Name: "cs:VerboseLogs:tooltip"
            String: "If true, more detailed logs will be printed to the Event Log for warnings and errors."
          }
          Overrides {
            Name: "cs:VerboseLogs:isrep"
            Bool: false
          }
          Overrides {
            Name: "cs:VerboseLogs:ml"
            Bool: false
          }
          Overrides {
            Name: "cs:CanDrop:tooltip"
            String: "If true, items will be able to be dropped into the world from this Inventory."
          }
          Overrides {
            Name: "cs:CanDrop:isrep"
            Bool: false
          }
          Overrides {
            Name: "cs:CanDrop:ml"
            Bool: false
          }
          Overrides {
            Name: "cs:CanDrop:category"
            String: "Custom"
          }
          Overrides {
            Name: "cs:CanDrop:subcategory"
            String: "Drops"
          }
          Overrides {
            Name: "cs:DropForAllPlayers:tooltip"
            String: "If true, dropped items will appear on all clients."
          }
          Overrides {
            Name: "cs:DropForAllPlayers:isrep"
            Bool: false
          }
          Overrides {
            Name: "cs:DropForAllPlayers:ml"
            Bool: false
          }
          Overrides {
            Name: "cs:DropForAllPlayers:category"
            String: "Custom"
          }
          Overrides {
            Name: "cs:DropForAllPlayers:subcategory"
            String: "Drops"
          }
          Overrides {
            Name: "cs:DropTimeoutSeconds:tooltip"
            String: "The number of seconds a dropped item will remain in world."
          }
          Overrides {
            Name: "cs:DropTimeoutSeconds:isrep"
            Bool: false
          }
          Overrides {
            Name: "cs:DropTimeoutSeconds:ml"
            Bool: false
          }
          Overrides {
            Name: "cs:DropTimeoutSeconds:category"
            String: "Custom"
          }
          Overrides {
            Name: "cs:DropTimeoutSeconds:subcategory"
            String: "Drops"
          }
          Overrides {
            Name: "cs:ItemPickupTemplate:tooltip"
            String: "The Item Pickup Template to use for dropped items."
          }
          Overrides {
            Name: "cs:ItemPickupTemplate:isrep"
            Bool: false
          }
          Overrides {
            Name: "cs:ItemPickupTemplate:ml"
            Bool: false
          }
          Overrides {
            Name: "cs:ItemPickupTemplate:category"
            String: "Custom"
          }
          Overrides {
            Name: "cs:ItemPickupTemplate:subcategory"
            String: "Drops"
          }
          Overrides {
            Name: "cs:ScreenTemplate:tooltip"
            String: "The Inventory Screen to use to display the contents of this Inventory."
          }
          Overrides {
            Name: "cs:ScreenTemplate:isrep"
            Bool: false
          }
          Overrides {
            Name: "cs:ScreenTemplate:ml"
            Bool: false
          }
          Overrides {
            Name: "cs:ScreenTemplate:category"
            String: "Custom"
          }
          Overrides {
            Name: "cs:ScreenTemplate:subcategory"
            String: "Screen"
          }
          Overrides {
            Name: "cs:ScreenToggleButton:tooltip"
            String: "An optional UIButton that can be used to toggle the Inventory Screen open and closed."
          }
          Overrides {
            Name: "cs:ScreenToggleButton:isrep"
            Bool: false
          }
          Overrides {
            Name: "cs:ScreenToggleButton:ml"
            Bool: false
          }
          Overrides {
            Name: "cs:ScreenToggleButton:category"
            String: "Custom"
          }
          Overrides {
            Name: "cs:ScreenToggleButton:subcategory"
            String: "Screen"
          }
          Overrides {
            Name: "cs:OpenBinding:tooltip"
            String: "The binding to use to open the Inventory Screen."
          }
          Overrides {
            Name: "cs:OpenBinding:isrep"
            Bool: false
          }
          Overrides {
            Name: "cs:OpenBinding:ml"
            Bool: false
          }
          Overrides {
            Name: "cs:OpenBinding:category"
            String: "Custom"
          }
          Overrides {
            Name: "cs:OpenBinding:subcategory"
            String: "Screen"
          }
          Overrides {
            Name: "cs:CloseBinding:tooltip"
            String: "The binding to use to close the Inventory Screen."
          }
          Overrides {
            Name: "cs:CloseBinding:isrep"
            Bool: false
          }
          Overrides {
            Name: "cs:CloseBinding:ml"
            Bool: false
          }
          Overrides {
            Name: "cs:CloseBinding:category"
            String: "Custom"
          }
          Overrides {
            Name: "cs:CloseBinding:subcategory"
            String: "Screen"
          }
          Overrides {
            Name: "cs:ShowCursor:tooltip"
            String: "If true, the cursor will be visible when the Inventory Screen is open."
          }
          Overrides {
            Name: "cs:ShowCursor:isrep"
            Bool: false
          }
          Overrides {
            Name: "cs:ShowCursor:ml"
            Bool: false
          }
          Overrides {
            Name: "cs:ShowCursor:category"
            String: "Custom"
          }
          Overrides {
            Name: "cs:ShowCursor:subcategory"
            String: "Screen"
          }
          Overrides {
            Name: "cs:AllowedItems:tooltip"
            String: "A list of item tags and/or ids that are allowed in this inventory. Items matching any single tag or id will be allowed, or leave this property blank to allow any item. Separate multiple values with commas (e.g. \"food,CarrotSeed,recipe\")."
          }
          Overrides {
            Name: "cs:AllowedItems:isrep"
            Bool: false
          }
          Overrides {
            Name: "cs:AllowedItems:ml"
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
        Id: 276017910544180883
        Name: "Inventory README"
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
        ParentId: 12902181959151187211
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
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
            Id: 10412933075175728930
          }
        }
        NetworkRelevanceDistance {
          Value: "mc:eproxyrelevance:critical"
        }
      }
      Objects {
        Id: 4424211876233476912
        Name: "InventorySettings"
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
        ParentId: 12902181959151187211
        UnregisteredParameters {
          Overrides {
            Name: "cs:ComponentRoot"
            ObjectReference {
              SubObjectId: 12902181959151187211
            }
          }
        }
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
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
            Id: 9212524569046054492
          }
        }
        IsAdvanced: true
        NetworkRelevanceDistance {
          Value: "mc:eproxyrelevance:critical"
        }
      }
      Objects {
        Id: 17554024286546553939
        Name: "StartingItems"
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
        ParentId: 12902181959151187211
        ChildIds: 12655306907484806921
        ChildIds: 837980041614314566
        ChildIds: 5119089572602289510
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
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
            Id: 8280669765240006703
          }
        }
        NetworkRelevanceDistance {
          Value: "mc:eproxyrelevance:critical"
        }
      }
      Objects {
        Id: 12655306907484806921
        Name: "Pickaxe"
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
        ParentId: 17554024286546553939
        UnregisteredParameters {
          Overrides {
            Name: "cs:ItemId"
            String: "Pickaxe"
          }
          Overrides {
            Name: "cs:SlotIndex"
            Int: 1
          }
          Overrides {
            Name: "cs:Amount"
            Int: 1
          }
        }
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
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
            Id: 5909065857533770977
          }
        }
        NetworkRelevanceDistance {
          Value: "mc:eproxyrelevance:critical"
        }
      }
      Objects {
        Id: 837980041614314566
        Name: "Axe"
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
        ParentId: 17554024286546553939
        UnregisteredParameters {
          Overrides {
            Name: "cs:ItemId"
            String: "Axe"
          }
          Overrides {
            Name: "cs:SlotIndex"
            Int: 2
          }
          Overrides {
            Name: "cs:Amount"
            Int: 1
          }
        }
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
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
            Id: 5909065857533770977
          }
        }
        NetworkRelevanceDistance {
          Value: "mc:eproxyrelevance:critical"
        }
      }
      Objects {
        Id: 5119089572602289510
        Name: "Flint and Steel"
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
        ParentId: 17554024286546553939
        UnregisteredParameters {
          Overrides {
            Name: "cs:ItemId"
            String: "Flint and Steel"
          }
          Overrides {
            Name: "cs:SlotIndex"
            Int: 3
          }
          Overrides {
            Name: "cs:Amount"
            Int: 1
          }
        }
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
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
            Id: 5909065857533770977
          }
        }
        NetworkRelevanceDistance {
          Value: "mc:eproxyrelevance:critical"
        }
      }
      Objects {
        Id: 693023840910632588
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
        ParentId: 12902181959151187211
        ChildIds: 11561897306527610292
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
        IsAdvanced: true
        NetworkRelevanceDistance {
          Value: "mc:eproxyrelevance:critical"
        }
      }
      Objects {
        Id: 11561897306527610292
        Name: "InventorySettings"
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
        ParentId: 693023840910632588
        UnregisteredParameters {
          Overrides {
            Name: "cs:ComponentRoot"
            ObjectReference {
              SubObjectId: 12902181959151187211
            }
          }
        }
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
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
            Id: 9212524569046054492
          }
        }
        NetworkRelevanceDistance {
          Value: "mc:eproxyrelevance:critical"
        }
      }
      Objects {
        Id: 14581587296823135529
        Name: "UI"
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
        ParentId: 12902181959151187211
        ChildIds: 11279043330362922128
        ChildIds: 6283171581381456151
        UnregisteredParameters {
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
        Id: 11279043330362922128
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
        ParentId: 14581587296823135529
        ChildIds: 999761559615921468
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
        Id: 999761559615921468
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
        ParentId: 11279043330362922128
        ChildIds: 6636960671953744194
        ChildIds: 18386543462960161061
        UnregisteredParameters {
          Overrides {
            Name: "cs:Controller"
            ObjectReference {
              SubObjectId: 6636960671953744194
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
              SubObjectId: 18200607321443270001
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
            String: "The Icon Generator id to use when rendering 3D icons in this Inventory."
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
            String: "The id of this Inventory."
          }
          Overrides {
            Name: "cs:Columns:tooltip"
            String: "The number of columns in this Inventory."
          }
          Overrides {
            Name: "cs:Padding:tooltip"
            String: "The padding between Inventory Slots."
          }
          Overrides {
            Name: "cs:UseNumericShortcuts:tooltip"
            String: "If true, numbers 1-9 will be used to \"click\" the first 9 slots."
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
        Id: 6636960671953744194
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
        ParentId: 999761559615921468
        UnregisteredParameters {
          Overrides {
            Name: "cs:ComponentRoot"
            ObjectReference {
              SubObjectId: 999761559615921468
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
        Id: 18386543462960161061
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
        ParentId: 999761559615921468
        ChildIds: 18200607321443270001
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
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
        Id: 18200607321443270001
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
        ParentId: 18386543462960161061
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
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
        Id: 6283171581381456151
        Name: "Tooltip Container"
        Transform {
          Location {
            X: 2976.57153
            Y: -1461.37097
            Z: 1202.99365
          }
          Rotation {
            Yaw: -26.3174953
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 14581587296823135529
        ChildIds: 5880739026859235665
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
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
        Id: 5880739026859235665
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
        ParentId: 6283171581381456151
        ChildIds: 10060240626987836032
        ChildIds: 15247274856434498142
        ChildIds: 940414689904711310
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
        Id: 10060240626987836032
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
        ParentId: 5880739026859235665
        UnregisteredParameters {
          Overrides {
            Name: "cs:ComponentRoot"
            ObjectReference {
              SubObjectId: 5880739026859235665
            }
          }
          Overrides {
            Name: "cs:Text"
            ObjectReference {
              SubObjectId: 940414689904711310
            }
          }
        }
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
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
        IsAdvanced: true
        NetworkRelevanceDistance {
          Value: "mc:eproxyrelevance:critical"
        }
      }
      Objects {
        Id: 15247274856434498142
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
        ParentId: 5880739026859235665
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
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
        Id: 940414689904711310
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
        ParentId: 5880739026859235665
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
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
    }
    Assets {
      Id: 7634571119250511053
      Name: "Fantasy Sack 002"
      PlatformAssetType: 9
      PrimaryAsset {
        AssetType: "PlatformBrushAssetRef"
        AssetId: "UI_Fantasy_Equip_Sack_002"
      }
    }
    PrimaryAssetId {
      AssetType: "None"
      AssetId: "None"
    }
  }
  SerializationVersion: 108
  VirtualFolderPath: "Functional"
  VirtualFolderPath: "Inventory"
}
