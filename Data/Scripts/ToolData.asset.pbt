Assets {
  Id: 5521036964973432541
  Name: "ToolData"
  PlatformAssetType: 3
  TextAsset {
    CustomParameters {
      Overrides {
        Name: "cs:ToolType"
        String: ""
      }
      Overrides {
        Name: "cs:ActionSeconds"
        Float: 0
      }
      Overrides {
        Name: "cs:DoesToggle"
        Bool: true
      }
      Overrides {
        Name: "cs:AutoRepeat"
        Bool: true
      }
      Overrides {
        Name: "cs:EquipmentStance"
        String: "2hand_staff_stance"
      }
      Overrides {
        Name: "cs:RotateCWBinding"
        String: "ability_extra_22"
      }
      Overrides {
        Name: "cs:RotateCCWBinding"
        String: "ability_extra_20"
      }
      Overrides {
        Name: "cs:RotationSpeed"
        Float: 100
      }
      Overrides {
        Name: "cs:APIInteractionModule"
        AssetReference {
          Id: 10732033861455687124
        }
      }
      Overrides {
        Name: "cs:InteractionDistance"
        Float: 500
      }
      Overrides {
        Name: "cs:HologramMaterial"
        AssetReference {
          Id: 12384886729191949143
        }
      }
      Overrides {
        Name: "cs:CanPlaceColor"
        Color {
          G: 1
          A: 1
        }
      }
      Overrides {
        Name: "cs:CannotPlaceColor"
        Color {
          R: 1
          A: 1
        }
      }
      Overrides {
        Name: "cs:PlaceableId"
        String: ""
      }
      Overrides {
        Name: "cs:ToolType:isrep"
        Bool: false
      }
      Overrides {
        Name: "cs:DoesToggle:isrep"
        Bool: false
      }
      Overrides {
        Name: "cs:DoesToggle:ml"
        Bool: false
      }
      Overrides {
        Name: "cs:AutoRepeat:isrep"
        Bool: false
      }
      Overrides {
        Name: "cs:AutoRepeat:ml"
        Bool: false
      }
      Overrides {
        Name: "cs:EquipmentStance:isrep"
        Bool: false
      }
      Overrides {
        Name: "cs:EquipmentStance:category"
        String: "Custom"
      }
      Overrides {
        Name: "cs:RotateCWBinding:isrep"
        Bool: false
      }
      Overrides {
        Name: "cs:RotationSpeed:isrep"
        Bool: false
      }
      Overrides {
        Name: "cs:RotationSpeed:ml"
        Bool: false
      }
      Overrides {
        Name: "cs:APIInteractionModule:isrep"
        Bool: false
      }
      Overrides {
        Name: "cs:APIInteractionModule:ml"
        Bool: false
      }
      Overrides {
        Name: "cs:HologramMaterial:isrep"
        Bool: false
      }
      Overrides {
        Name: "cs:HologramMaterial:ml"
        Bool: false
      }
      Overrides {
        Name: "cs:PlaceableId:isrep"
        Bool: false
      }
      Overrides {
        Name: "cs:PlaceableId:category"
        String: "Custom"
      }
      Overrides {
        Name: "cs:ToolType:tooltip"
        String: "This is chacked against various lists of valid tool types depending on what the tool interacts with. To get this tool to work with Plants, Placeables or other interactive objects you will need to add this ToolType to those lists."
      }
      Overrides {
        Name: "cs:DoesToggle:tooltip"
        String: "If true, clicking this equipment in an Inventory will change it between an equipped and unequipped state. Otherwise clicking the equipment will equip it and subsequent clicks will do nothing."
      }
      Overrides {
        Name: "cs:AutoRepeat:tooltip"
        String: "If true, the equipment will continue trying to interact as long as the player holds down the ability binding."
      }
      Overrides {
        Name: "cs:EquipmentStance:tooltip"
        String: "The player will change into this stance while this equipment is equipped."
      }
      Overrides {
        Name: "cs:RotateCWBinding:tooltip"
        String: "If set, placed items will rotate when this binding is held or pressed if they are allowed to be rotated."
      }
      Overrides {
        Name: "cs:RotationSpeed:tooltip"
        String: "This affects the speed that rotation is applied while the RotationBinding is being held if the placed object allows rotation."
      }
      Overrides {
        Name: "cs:APIInteractionModule:tooltip"
        String: "This needs to be set to a valid Interaction System Module. Valid modules are \"APILookInteractionModule\" and \"APIPointerInteractionModule\". These modules change how the player interacts with the world while using this equipment."
      }
      Overrides {
        Name: "cs:HologramMaterial:tooltip"
        String: "This material will be applied to a preview when placing a Placeable item with this equipment."
      }
      Overrides {
        Name: "cs:PlaceableId:tooltip"
        String: "This optional ID can be set to enforce the placment of a specific Placeable with this Equipment."
      }
      Overrides {
        Name: "cs:ActionSeconds:category"
        String: "Custom"
      }
    }
    Assets {
      Id: 12384886729191949143
      Name: "Basic Hologram"
      PlatformAssetType: 2
      PrimaryAsset {
        AssetType: "MaterialAssetRef"
        AssetId: "fxmi_basic_hologram"
      }
    }
  }
  SerializationVersion: 108
  VirtualFolderPath: "Data"
}
