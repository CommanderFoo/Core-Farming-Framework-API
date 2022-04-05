Assets {
  Id: 14190284585730369373
  Name: "CraftingStationInputBuffData"
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
        Name: "cs:DrainWhilePlaced"
        Bool: true
      }
      Overrides {
        Name: "cs:DrainWhileCrafting"
        Bool: true
      }
      Overrides {
        Name: "cs:DrainWhileReady"
        Bool: true
      }
      Overrides {
        Name: "cs:RemoveOnCollect"
        Bool: false
      }
      Overrides {
        Name: "cs:RequireToStartCrafting"
        Bool: false
      }
      Overrides {
        Name: "cs:AffectsCraftRate"
        Bool: false
      }
      Overrides {
        Name: "cs:CraftRateMultiplierPercent"
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
        Name: "cs:MinAllowedBuffConsumption"
        Float: 0.8
      }
      Overrides {
        Name: "cs:AddBuffEffect"
        AssetReference {
          Id: 841534158063459245
        }
      }
      Overrides {
        Name: "cs:AddBuffEffectOffset"
        Vector {
        }
      }
      Overrides {
        Name: "cs:CanReceive:category"
        String: "Custom"
      }
      Overrides {
        Name: "cs:RequireToStartCrafting:subcategory"
        String: "Crafting"
      }
      Overrides {
        Name: "cs:CraftRateMultiplierPercent:subcategory"
        String: "Crafting"
      }
      Overrides {
        Name: "cs:AffectsCraftRate:subcategory"
        String: "Crafting"
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
        Name: "cs:AffectsCraftRate:category"
        String: "Custom"
      }
      Overrides {
        Name: "cs:CraftRateMultiplierPercent:category"
        String: "Custom"
      }
      Overrides {
        Name: "cs:ValidAddBuffToolTypes:tooltip"
        String: "A comma separated list of any tool types that are able to add this buff. Tool types are defined on Equipment or in the database"
      }
      Overrides {
        Name: "cs:AffectsCraftRate:tooltip"
        String: "If true, this Buff will affect the craft rate while the Buff is active."
      }
      Overrides {
        Name: "cs:RequireToStartCrafting:tooltip"
        String: "If true, the Crafting Station won\'t be able to start crafting until it has this Buff."
      }
      Overrides {
        Name: "cs:CanReceive:tooltip"
        String: "Tick to be able to actually recieve this buff"
      }
      Overrides {
        Name: "cs:OverrideBuffDuration:tooltip"
        String: "Tick to override the buff duration thats in the buff database"
      }
      Overrides {
        Name: "cs:BuffDuration:tooltip"
        String: "If OverrideBuffDuration is ticked, this is the new buff duration"
      }
      Overrides {
        Name: "cs:ToolsConsumedWhenAdded:tooltip"
        String: "If greater than 0, this number of the currently equipped Tool will be removed from the Players Inventory when this Buff is added."
      }
      Overrides {
        Name: "cs:ToolsConsumedWhenAdded:subcategory"
        String: "Interaction"
      }
      Overrides {
        Name: "cs:InteractionText:subcategory"
        String: "Interaction"
      }
      Overrides {
        Name: "cs:DrainWhilePlaced:subcategory"
        String: "Consumption"
      }
      Overrides {
        Name: "cs:DrainWhileCrafting:subcategory"
        String: "Consumption"
      }
      Overrides {
        Name: "cs:DrainWhileReady:subcategory"
        String: "Consumption"
      }
      Overrides {
        Name: "cs:RemoveOnCollect:subcategory"
        String: "Consumption"
      }
      Overrides {
        Name: "cs:AddBuffEffect:subcategory"
        String: "VFX"
      }
      Overrides {
        Name: "cs:AddBuffEffectOffset:subcategory"
        String: "VFX"
      }
      Overrides {
        Name: "cs:AddBuffEffect:tooltip"
        String: "VFX that is spawned when this buff is added via a tool."
      }
      Overrides {
        Name: "cs:AddBuffEffectOffset:tooltip"
        String: "This will move where the \"AddBuffEffect\" template spawns. It can be used to position the effect exactly where you need it."
      }
      Overrides {
        Name: "cs:MinAllowedBuffConsumption:tooltip"
        String: "Each time you use the tool, it will add \'1\' Buff. Set this to 0 if you want to allow the Player to add a Buff even if there is 99% remaining, use 0.5 if the Player can add the Buff when it is 50%, use 0 if you want the Buff to only apply when it\'s gone. Useful to ensure the Player doesn\'t waste items for little or no gain."
      }
      Overrides {
        Name: "cs:MinAllowedBuffConsumption:subcategory"
        String: "Interaction"
      }
      Overrides {
        Name: "cs:DrainWhilePlaced:tooltip"
        String: "If true, the Buff duration will decrement while the Crafting Station is not being used. Otherwise it will pause."
      }
      Overrides {
        Name: "cs:DrainWhileCrafting:tooltip"
        String: "If true, the Buff duration will decrement while the Crafting Station is crafting a Recipe. Otherwise it will pause."
      }
      Overrides {
        Name: "cs:DrainWhileReady:tooltip"
        String: "If true, the Buff duration will decrement while the Crafting Station has a craft ready to be collected. Otherwise it will pause."
      }
      Overrides {
        Name: "cs:RemoveOnCollect:tooltip"
        String: "If true, the Buff will be removed when the Player collects the craft from the Crafting Station."
      }
      Overrides {
        Name: "cs:CraftRateMultiplierPercent:tooltip"
        String: "If \"AffectsCraftRate\" is true, this multiplier percentage will be applied to the craft rate while this Buff is active. For example \"100\" would multiply the rate by 100% doubling the craft rate."
      }
    }
  }
  SerializationVersion: 110
  VirtualFolderPath: "Data"
}
