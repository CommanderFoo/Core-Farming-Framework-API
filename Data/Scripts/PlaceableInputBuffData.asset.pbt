Assets {
  Id: 10158105344768693410
  Name: "PlaceableInputBuffData"
  PlatformAssetType: 3
  TextAsset {
    CustomParameters {
      Overrides {
        Name: "cs:CanReceive"
        Bool: true
      }
      Overrides {
        Name: "cs:OverrideBuffDuration"
        Bool: false
      }
      Overrides {
        Name: "cs:BuffDuration"
        Float: 0
      }
      Overrides {
        Name: "cs:ValidAddBuffToolTypes"
        String: ""
      }
      Overrides {
        Name: "cs:ToolsConsumedWhenAdded"
        Int: 0
      }
      Overrides {
        Name: "cs:InteractionText"
        String: ""
      }
      Overrides {
        Name: "cs:CanReceive:category"
        String: "Custom"
      }
      Overrides {
        Name: "cs:ValidAddBuffToolTypes:subcategory"
        String: "Interaction"
      }
      Overrides {
        Name: "cs:ValidAddBuffToolTypes:category"
        String: "Custom"
      }
      Overrides {
        Name: "cs:OverrideBuffDuration:category"
        String: "Custom"
      }
      Overrides {
        Name: "cs:BuffDuration:category"
        String: "Custom"
      }
      Overrides {
        Name: "cs:ValidAddBuffToolTypes:tooltip"
        String: "A comma separated list of any Tool Types that are able to add this Buff. Tool types are defined on Equipment or in the database. You can also use Item Ids to allow specific equippable Items."
      }
      Overrides {
        Name: "cs:CanReceive:tooltip"
        String: "Tick to be able to actually recieve this Buff."
      }
      Overrides {
        Name: "cs:OverrideBuffDuration:tooltip"
        String: "Tick to override the Buff duration that\'s in the Buff database."
      }
      Overrides {
        Name: "cs:BuffDuration:tooltip"
        String: "If \"OverrideBuffDuration\" is ticked, this is the new Buff duration."
      }
      Overrides {
        Name: "cs:ToolsConsumedWhenAdded:subcategory"
        String: "Interaction"
      }
      Overrides {
        Name: "cs:ToolsConsumedWhenAdded:tooltip"
        String: "If greater than 0, this number of the currently equipped Tool will be removed from the Players Inventory when this Buff is added."
      }
      Overrides {
        Name: "cs:InteractionText:subcategory"
        String: "Interaction"
      }
      Overrides {
        Name: "cs:InteractionText:tooltip"
        String: "This text will appear in some tooltips to tell the Player how to add the Buff. Something like \"Add Coal to the Furnace\" is recommended."
      }
    }
  }
  SerializationVersion: 110
  VirtualFolderPath: "Data"
}
