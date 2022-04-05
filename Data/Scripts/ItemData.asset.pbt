Assets {
  Id: 501900872994821339
  Name: "ItemData"
  PlatformAssetType: 3
  TextAsset {
    CustomParameters {
      Overrides {
        Name: "cs:Name"
        String: ""
      }
      Overrides {
        Name: "cs:Description"
        String: ""
      }
      Overrides {
        Name: "cs:Tags"
        String: ""
      }
      Overrides {
        Name: "cs:ContextActions"
        String: ""
      }
      Overrides {
        Name: "cs:IsInventory"
        Bool: false
      }
      Overrides {
        Name: "cs:InventoryId"
        String: ""
      }
      Overrides {
        Name: "cs:CanDrop"
        Bool: false
      }
      Overrides {
        Name: "cs:DropTemplate"
        AssetReference {
          Id: 841534158063459245
        }
      }
      Overrides {
        Name: "cs:IconCameraId"
        String: ""
      }
      Overrides {
        Name: "cs:IconAsset"
        AssetReference {
          Id: 11569295798238027817
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
        Name: "cs:CanEquip"
        Bool: false
      }
      Overrides {
        Name: "cs:EquipmentTemplate"
        AssetReference {
          Id: 841534158063459245
        }
      }
      Overrides {
        Name: "cs:EquipmentVisualTemplate"
        AssetReference {
          Id: 841534158063459245
        }
      }
      Overrides {
        Name: "cs:DetailsText"
        String: ""
      }
      Overrides {
        Name: "cs:DetailsIconAsset"
        AssetReference {
          Id: 841534158063459245
        }
      }
      Overrides {
        Name: "cs:IsDetailsKitbashed2DIcon"
        Bool: false
      }
      Overrides {
        Name: "cs:IsDetails3DIcon"
        Bool: false
      }
      Overrides {
        Name: "cs:IsDetailsImageIcon"
        Bool: false
      }
      Overrides {
        Name: "cs:DetailsScreen"
        String: "Item Details Screen"
      }
      Overrides {
        Name: "cs:Name:tooltip"
        String: "The name of the Item. This shows up in Inventory tooltips and other UI."
      }
      Overrides {
        Name: "cs:Description:tooltip"
        String: "The description of the item. This shows up in Inventory Tooltips and other UI."
      }
      Overrides {
        Name: "cs:EquipmentTemplate:tooltip"
        String: "The Equipment to spawn and attach to the Player when this item is equipped from an Inventory."
      }
      Overrides {
        Name: "cs:IconAsset:tooltip"
        String: "The image or template to use for an icon. If \"IsKitbashed2DIcon\" is true, this should be a UI template. If \"Is3DIcon\" is true, this should be a 3D object template. If \"IsImageIcon\" is true, this should be an image/brush asset. If \"DetailsIconAsset\" is left blank, this icon and its associated settings will also be used for the detailed view of the item."
      }
      Overrides {
        Name: "cs:IsKitbashed2DIcon:tooltip"
        String: "If true, the \"IconAsset\" should point to a UI template. This template will be spawned as the icon."
      }
      Overrides {
        Name: "cs:CanEquip:category"
        String: "Custom"
      }
      Overrides {
        Name: "cs:CanEquip:subcategory"
        String: "Equipment"
      }
      Overrides {
        Name: "cs:EquipmentTemplate:category"
        String: "Custom"
      }
      Overrides {
        Name: "cs:EquipmentTemplate:subcategory"
        String: "Equipment"
      }
      Overrides {
        Name: "cs:EquipmentVisualTemplate:category"
        String: "Custom"
      }
      Overrides {
        Name: "cs:EquipmentVisualTemplate:subcategory"
        String: "Equipment"
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
        Name: "cs:CanDrop:category"
        String: "Custom"
      }
      Overrides {
        Name: "cs:CanDrop:subcategory"
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
        Name: "cs:IsInventory:tooltip"
        String: "If true, the item is an inventory. Useful for chests and other containers. See the Container Inventory template."
      }
      Overrides {
        Name: "cs:CanDrop:tooltip"
        String: "If true, this item can be dropped out of Inventories that support dropping."
      }
      Overrides {
        Name: "cs:DropTemplate:tooltip"
        String: "The template to use to display the dropped item in world."
      }
      Overrides {
        Name: "cs:IconCameraId:tooltip"
        String: "If \"Is3DIcon\" is true, this should match the \"CameraId\" of an \"Icon Generator\" in the scene."
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
        Name: "cs:CanEquip:tooltip"
        String: "If true, this item can be equipped from inventories that allow equipping."
      }
      Overrides {
        Name: "cs:EquipmentVisualTemplate:tooltip"
        String: "An optional visual asset to spawn into invisible Equipment that supports this feature. This is useful for sharing a single Equipment across many items."
      }
      Overrides {
        Name: "cs:Description:ml"
        Bool: true
      }
      Overrides {
        Name: "cs:IsInventory:subcategory"
        String: "Inventory"
      }
      Overrides {
        Name: "cs:InventoryId:subcategory"
        String: "Inventory"
      }
      Overrides {
        Name: "cs:Tags:tooltip"
        String: "A list of tags associated with this object, that can be used to group items into categories. Separate tags with commas (e.g. \"food,seed,small\")"
      }
      Overrides {
        Name: "cs:DetailsText:tooltip"
        String: "This text will be displayed when a user inspects the details of this item."
      }
      Overrides {
        Name: "cs:DetailsText:subcategory"
        String: "Details"
      }
      Overrides {
        Name: "cs:DetailsText:ml"
        Bool: true
      }
      Overrides {
        Name: "cs:DetailsIconAsset:tooltip"
        String: "The image or template to use for an icon when the user inspects the details of this item. If left blank, the regular Icon settings will be used. If \"IsDetailsKitbashed2DIcon\" is true, this should be a UI template. If \"IsDetails3DIcon\" is true, this should be a 3D object template. If \"IsDetailsImageIcon\" is true, this should be an image/brush asset."
      }
      Overrides {
        Name: "cs:DetailsIconAsset:subcategory"
        String: "Details"
      }
      Overrides {
        Name: "cs:IsDetailsKitbashed2DIcon:tooltip"
        String: "If true, the \"DetailsIconAsset\" should point to a UI template. This template will be spawned as the icon."
      }
      Overrides {
        Name: "cs:IsDetailsKitbashed2DIcon:subcategory"
        String: "Details"
      }
      Overrides {
        Name: "cs:IsDetails3DIcon:tooltip"
        String: "If true, the \"DetailsIconAsset\" should point to a 3D object template. An image of this template will be used as the icon."
      }
      Overrides {
        Name: "cs:IsDetails3DIcon:subcategory"
        String: "Details"
      }
      Overrides {
        Name: "cs:IsDetailsImageIcon:tooltip"
        String: "If true, the \"DetailsIconAsset\" should point to an image/brush asset. This will be used as the icon."
      }
      Overrides {
        Name: "cs:IsDetailsImageIcon:subcategory"
        String: "Details"
      }
      Overrides {
        Name: "cs:ContextActions:tooltip"
        String: "A set of actions that will be available in the right-click context menu of this item. These will be added to any context actions enabled by the inventory."
      }
      Overrides {
        Name: "cs:DetailsScreen:tooltip"
        String: "The id of the Screen to use when displaying the details of this item."
      }
      Overrides {
        Name: "cs:DetailsScreen:subcategory"
        String: "Details"
      }
      Overrides {
        Name: "cs:Tags:category"
        String: "Custom"
      }
      Overrides {
        Name: "cs:ContextActions:category"
        String: "Custom"
      }
    }
    Assets {
      Id: 11569295798238027817
      Name: "Fantasy Sack 008"
      PlatformAssetType: 9
      PrimaryAsset {
        AssetType: "PlatformBrushAssetRef"
        AssetId: "UI_Fantasy_Equip_Sack_008"
      }
    }
  }
  SerializationVersion: 108
  VirtualFolderPath: "Data"
}
