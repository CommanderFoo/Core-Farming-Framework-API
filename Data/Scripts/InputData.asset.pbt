Assets {
  Id: 4494013957619894437
  Name: "CostData"
  PlatformAssetType: 3
  TextAsset {
    CustomParameters {
      Overrides {
        Name: "cs:ItemId"
        String: ""
      }
      Overrides {
        Name: "cs:CurrencyId"
        String: ""
      }
      Overrides {
        Name: "cs:Amount"
        Int: 1
      }
      Overrides {
        Name: "cs:ItemId:tooltip"
        String: "(Optional) If set this cost will take an Item. This ItemId must match an ItemId that exists in a Database."
      }
      Overrides {
        Name: "cs:CurrencyId:tooltip"
        String: "(Optional) If ItemId is blank, this cost will take a Currency. This CurrencyId must match a CurrencyId on a Currency Settings."
      }
      Overrides {
        Name: "cs:Amount:tooltip"
        String: "The amount of the Item or Currency this cost will take."
      }
    }
  }
  SerializationVersion: 110
  VirtualFolderPath: "Data"
}
