Assets {
  Id: 1521488515793737855
  Name: "ToggleEnabledOnCraftingChangeClient"
  PlatformAssetType: 3
  TextAsset {
    CustomParameters {
      Overrides {
        Name: "cs:APIReactiveComponent"
        AssetReference {
          Id: 3917939568215981647
        }
      }
      Overrides {
        Name: "cs:ObjectToToggle"
        ObjectReference {
        }
      }
      Overrides {
        Name: "cs:DelaySeconds"
        Float: 0
      }
      Overrides {
        Name: "cs:DisableOnChange"
        Bool: false
      }
      Overrides {
        Name: "cs:ChangeOnCraft"
        Bool: false
      }
      Overrides {
        Name: "cs:ChangeOnReady"
        Bool: false
      }
      Overrides {
        Name: "cs:ChangeOnCollected"
        Bool: false
      }
    }
  }
  SerializationVersion: 110
  VirtualFolderPath: "Reactive Components"
}
