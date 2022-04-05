Assets {
  Id: 16537475397023390823
  Name: "Inventory and Hotbar"
  PlatformAssetType: 5
  TemplateAsset {
    ObjectBlock {
      RootId: 8773870628278064763
      Objects {
        Id: 8773870628278064763
        Name: "Inventory and Hotbar"
        Transform {
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 4781671109827199097
        ChildIds: 7826020511129457530
        ChildIds: 11851925185788552941
        ChildIds: 4925213489370037667
        ChildIds: 17094563023626202184
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
        Folder {
          IsGroup: true
        }
        NetworkRelevanceDistance {
          Value: "mc:eproxyrelevance:critical"
        }
      }
      Objects {
        Id: 7826020511129457530
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
        ParentId: 8773870628278064763
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
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
        Id: 11851925185788552941
        Name: "Inventory Settings"
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
        ParentId: 8773870628278064763
        ChildIds: 13808490665710735519
        ChildIds: 1911049434552275356
        ChildIds: 6818849767702581973
        UnregisteredParameters {
          Overrides {
            Name: "cs:InventoryId"
            String: "inventory"
          }
          Overrides {
            Name: "cs:InventoryName"
            String: "Inventory"
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
              SubObjectId: 13808490665710735519
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
            Int: 48
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
            String: "hotbar"
          }
          Overrides {
            Name: "cs:VerboseLogs"
            Bool: true
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
              SubObjectId: 6786864581287154804
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
        Id: 13808490665710735519
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
        ParentId: 11851925185788552941
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
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
        Id: 1911049434552275356
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
        ParentId: 11851925185788552941
        UnregisteredParameters {
          Overrides {
            Name: "cs:ComponentRoot"
            ObjectReference {
              SubObjectId: 11851925185788552941
            }
          }
        }
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
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
        Id: 6818849767702581973
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
        ParentId: 11851925185788552941
        ChildIds: 8343096203940239160
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
        Id: 8343096203940239160
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
        ParentId: 6818849767702581973
        UnregisteredParameters {
          Overrides {
            Name: "cs:ComponentRoot"
            ObjectReference {
              SubObjectId: 11851925185788552941
            }
          }
        }
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
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
        Id: 4925213489370037667
        Name: "Hotbar Settings"
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
        ParentId: 8773870628278064763
        ChildIds: 7850086733571654925
        ChildIds: 14861250819516905586
        ChildIds: 4503614549703885793
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
              SubObjectId: 7850086733571654925
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
            Int: 2
          }
          Overrides {
            Name: "cs:OverflowInventoryIds"
            String: "inventory"
          }
          Overrides {
            Name: "cs:VerboseLogs"
            Bool: true
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
              Id: 841534158063459245
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
        Id: 7850086733571654925
        Name: "Starting Items"
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
        ParentId: 4925213489370037667
        ChildIds: 15146575980585021578
        ChildIds: 7838149905353956930
        ChildIds: 10437057108379809222
        ChildIds: 10770701771583213163
        ChildIds: 7155251629053590326
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
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
        Id: 15146575980585021578
        Name: "Shovel"
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
        ParentId: 7850086733571654925
        UnregisteredParameters {
          Overrides {
            Name: "cs:ItemId"
            String: "Shovel"
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
        Id: 7838149905353956930
        Name: "Hammer"
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
        ParentId: 7850086733571654925
        UnregisteredParameters {
          Overrides {
            Name: "cs:ItemId"
            String: "Hammer"
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
        Id: 10437057108379809222
        Name: "Matches"
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
        ParentId: 7850086733571654925
        UnregisteredParameters {
          Overrides {
            Name: "cs:ItemId"
            String: "Matches"
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
        Id: 10770701771583213163
        Name: "Cage"
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
        ParentId: 7850086733571654925
        UnregisteredParameters {
          Overrides {
            Name: "cs:ItemId"
            String: "Cage"
          }
          Overrides {
            Name: "cs:SlotIndex"
            Int: 4
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
        Id: 7155251629053590326
        Name: "Charcoal"
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
        ParentId: 7850086733571654925
        UnregisteredParameters {
          Overrides {
            Name: "cs:ItemId"
            String: "Charcoal"
          }
          Overrides {
            Name: "cs:SlotIndex"
            Int: 5
          }
          Overrides {
            Name: "cs:Amount"
            Int: 25
          }
        }
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
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
        Id: 14861250819516905586
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
        ParentId: 4925213489370037667
        UnregisteredParameters {
          Overrides {
            Name: "cs:ComponentRoot"
            ObjectReference {
              SubObjectId: 4925213489370037667
            }
          }
        }
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
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
        Id: 4503614549703885793
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
        ParentId: 4925213489370037667
        ChildIds: 10730875082874024739
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
        Id: 10730875082874024739
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
        ParentId: 4503614549703885793
        UnregisteredParameters {
          Overrides {
            Name: "cs:ComponentRoot"
            ObjectReference {
              SubObjectId: 4925213489370037667
            }
          }
        }
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
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
        Id: 17094563023626202184
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
        ParentId: 8773870628278064763
        ChildIds: 11888124625134021903
        ChildIds: 7285656933620885006
        ChildIds: 5359314628380578603
        UnregisteredParameters {
          Overrides {
            Name: "cs:ScreenContainer"
            ObjectReference {
              SubObjectId: 7285656933620885006
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
        Id: 11888124625134021903
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
        ParentId: 17094563023626202184
        UnregisteredParameters {
          Overrides {
            Name: "cs:ComponentRoot"
            ObjectReference {
              SubObjectId: 17094563023626202184
            }
          }
        }
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
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
        Id: 7285656933620885006
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
        ParentId: 17094563023626202184
        ChildIds: 11154204077753282276
        ChildIds: 12041486600345425096
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
        Id: 11154204077753282276
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
        ParentId: 7285656933620885006
        ChildIds: 6820028457764060540
        ChildIds: 2969234425587336137
        UnregisteredParameters {
          Overrides {
            Name: "cs:Controller"
            ObjectReference {
              SubObjectId: 6820028457764060540
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
              SubObjectId: 3384702324355681143
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
        Id: 6820028457764060540
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
        ParentId: 11154204077753282276
        UnregisteredParameters {
          Overrides {
            Name: "cs:ComponentRoot"
            ObjectReference {
              SubObjectId: 11154204077753282276
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
        Id: 2969234425587336137
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
        ParentId: 11154204077753282276
        ChildIds: 3384702324355681143
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
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
        Id: 3384702324355681143
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
        ParentId: 2969234425587336137
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
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
        Id: 12041486600345425096
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
        ParentId: 7285656933620885006
        ChildIds: 9692691247082622270
        ChildIds: 5847079400324669292
        UnregisteredParameters {
          Overrides {
            Name: "cs:IconCameraId"
            String: "inventory"
          }
          Overrides {
            Name: "cs:IconAsset"
            AssetReference {
              Id: 6369796579891266339
            }
          }
          Overrides {
            Name: "cs:IsKitbashed2DIcon"
            Bool: false
          }
          Overrides {
            Name: "cs:Is3DIcon"
            Bool: true
          }
          Overrides {
            Name: "cs:IsImageIcon"
            Bool: false
          }
          Overrides {
            Name: "cs:Binding"
            String: "I"
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
        Id: 9692691247082622270
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
        ParentId: 12041486600345425096
        UnregisteredParameters {
          Overrides {
            Name: "cs:Icon"
            ObjectReference {
              SubObjectId: 3315142165402752591
            }
          }
          Overrides {
            Name: "cs:BindingText"
            ObjectReference {
              SubObjectId: 2079955399076856215
            }
          }
          Overrides {
            Name: "cs:ComponentRoot"
            ObjectReference {
              SubObjectId: 12041486600345425096
            }
          }
          Overrides {
            Name: "cs:BindingBackground"
            ObjectReference {
              SubObjectId: 76594103234866355
            }
          }
        }
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
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
        Id: 5847079400324669292
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
        ParentId: 12041486600345425096
        ChildIds: 2415593073887591710
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
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
        Id: 2415593073887591710
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
        ParentId: 5847079400324669292
        ChildIds: 3315142165402752591
        ChildIds: 76594103234866355
        ChildIds: 6786864581287154804
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
        Id: 3315142165402752591
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
        ParentId: 2415593073887591710
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
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
        Id: 76594103234866355
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
        ParentId: 2415593073887591710
        ChildIds: 2079955399076856215
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
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
        Id: 2079955399076856215
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
        ParentId: 76594103234866355
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
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
        Id: 6786864581287154804
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
        ParentId: 2415593073887591710
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
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
        Id: 5359314628380578603
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
        ParentId: 17094563023626202184
        ChildIds: 15750095182700182613
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
        Id: 15750095182700182613
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
        ParentId: 5359314628380578603
        ChildIds: 10451150651588916887
        ChildIds: 17592545368982683721
        ChildIds: 16312082529513411174
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
        Id: 10451150651588916887
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
        ParentId: 15750095182700182613
        UnregisteredParameters {
          Overrides {
            Name: "cs:ComponentRoot"
            ObjectReference {
              SubObjectId: 15750095182700182613
            }
          }
          Overrides {
            Name: "cs:Text"
            ObjectReference {
              SubObjectId: 16312082529513411174
            }
          }
        }
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
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
        Id: 17592545368982683721
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
        ParentId: 15750095182700182613
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
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
        Id: 16312082529513411174
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
        ParentId: 15750095182700182613
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
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
  VirtualFolderPath: "Inventory"
}
