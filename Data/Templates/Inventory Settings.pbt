Assets {
  Id: 9882206935542465206
  Name: "Inventory Settings"
  PlatformAssetType: 5
  TemplateAsset {
    ObjectBlock {
      RootId: 4513950664792054274
      Objects {
        Id: 4513950664792054274
        Name: "Inventory Settings"
        Transform {
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 4781671109827199097
        ChildIds: 10747559284269349998
        ChildIds: 15209345657066883952
        ChildIds: 2156074258852224019
        ChildIds: 2958868104667398575
        UnregisteredParameters {
          Overrides {
            Name: "cs:InventoryId"
            String: ""
          }
          Overrides {
            Name: "cs:InventoryName"
            String: ""
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
              SubObjectId: 15209345657066883952
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
            Int: 24
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
            String: "ability_extra_27"
          }
          Overrides {
            Name: "cs:CloseBinding"
            String: "ability_extra_27"
          }
          Overrides {
            Name: "cs:ShowCursor"
            Bool: true
          }
          Overrides {
            Name: "cs:InventoryId:tooltip"
            String: "The id for this Inventory. Must be unique within a scene."
          }
          Overrides {
            Name: "cs:InventoryName:tooltip"
            String: "The name of this Inventory."
          }
          Overrides {
            Name: "cs:StorageKey:tooltip"
            String: "An optional Shared Storage Key to use to save Inventory data to. Local Storage will be used if this is not set."
          }
          Overrides {
            Name: "cs:TotalSlots:tooltip"
            String: "The total number of slots in this Inventory. Must be greater than 0, defaults to 10."
          }
          Overrides {
            Name: "cs:SlotCapacity:tooltip"
            String: "The total number of items that can be stacked into a slot. 0 means no maximum."
          }
          Overrides {
            Name: "cs:UseStacks:tooltip"
            String: "If true, items will be able to exist in multiple slots and other stacking logic will be applied when moving items around."
          }
          Overrides {
            Name: "cs:CanEquip:tooltip"
            String: "If true, items will be able to be equipped from this Inventory."
          }
          Overrides {
            Name: "cs:CanDrop:tooltip"
            String: "If true, items will be able to be dropped into the world from this Inventory."
          }
          Overrides {
            Name: "cs:DropForAllPlayers:tooltip"
            String: "If true, dropped items will appear on all clients."
          }
          Overrides {
            Name: "cs:DropTimeoutSeconds:tooltip"
            String: "The number of seconds a dropped item will remain in world."
          }
          Overrides {
            Name: "cs:ItemPickupTemplate:tooltip"
            String: "The Item Pickup Template to use for dropped items."
          }
          Overrides {
            Name: "cs:ScreenTemplate:tooltip"
            String: "The Inventory Screen to use to display the contents of this Inventory."
          }
          Overrides {
            Name: "cs:VerboseLogs:tooltip"
            String: "If true, more detailed logs will be printed to the Event Log for warnings and errors."
          }
          Overrides {
            Name: "cs:AllowNonEmptyContainers:tooltip"
            String: "If true, Inventory Containers that contain items can be stored in this Inventory. Note: This could lead to storage issues if not carefully used."
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
            Name: "cs:ShowCursor:category"
            String: "Custom"
          }
          Overrides {
            Name: "cs:ShowCursor:subcategory"
            String: "Screen"
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
            Name: "cs:OpenBinding:category"
            String: "Custom"
          }
          Overrides {
            Name: "cs:OpenBinding:subcategory"
            String: "Screen"
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
            Name: "cs:ItemPickupTemplate:category"
            String: "Custom"
          }
          Overrides {
            Name: "cs:ItemPickupTemplate:subcategory"
            String: "Drops"
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
            Name: "cs:DropForAllPlayers:category"
            String: "Custom"
          }
          Overrides {
            Name: "cs:DropForAllPlayers:subcategory"
            String: "Drops"
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
            Name: "cs:ScreenToggleButton:tooltip"
            String: "An optional UIButton that can be used to toggle the Inventory Screen open and closed."
          }
          Overrides {
            Name: "cs:OpenBinding:tooltip"
            String: "The binding to use to open the Inventory Screen."
          }
          Overrides {
            Name: "cs:CloseBinding:tooltip"
            String: "The binding to use to close the Inventory Screen."
          }
          Overrides {
            Name: "cs:ShowCursor:tooltip"
            String: "If true, the cursor will be visible when the Inventory Screen is open."
          }
          Overrides {
            Name: "cs:Priority:tooltip"
            String: "Used when items are added or removed without a target Inventory. The Inventory with the highest priority that can add or remove the item will be used."
          }
          Overrides {
            Name: "cs:OverflowInventoryIds:tooltip"
            String: "A comma separated list of Inventory Ids that will be used for extra items that won\'t fit into this Inventory."
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
        Id: 10747559284269349998
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
        ParentId: 4513950664792054274
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
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
        Id: 15209345657066883952
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
        ParentId: 4513950664792054274
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
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
        Id: 2156074258852224019
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
        ParentId: 4513950664792054274
        UnregisteredParameters {
          Overrides {
            Name: "cs:ComponentRoot"
            ObjectReference {
              SubObjectId: 4513950664792054274
            }
          }
        }
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
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
        Id: 2958868104667398575
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
        ParentId: 4513950664792054274
        ChildIds: 9293744114005332631
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
        Id: 9293744114005332631
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
        ParentId: 2958868104667398575
        UnregisteredParameters {
          Overrides {
            Name: "cs:ComponentRoot"
            ObjectReference {
              SubObjectId: 4513950664792054274
            }
          }
        }
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
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
  SerializationVersion: 110
  VirtualFolderPath: "Functional"
  VirtualFolderPath: "Inventory"
}
