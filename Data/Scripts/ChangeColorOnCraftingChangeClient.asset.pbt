Assets {
  Id: 9262307817152873715
  Name: "ChangeColorOnCraftingChangeClient"
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
        Name: "cs:DefaultColor"
        Color {
          R: 1
          G: 1
          B: 1
          A: 1
        }
      }
      Overrides {
        Name: "cs:ChangeColor"
        Color {
          R: 1
          G: 1
          B: 1
          A: 1
        }
      }
      Overrides {
        Name: "cs:ObjectToColor"
        ObjectReference {
        }
      }
      Overrides {
        Name: "cs:DelaySeconds"
        Float: 0
      }
      Overrides {
        Name: "cs:ColorDescendants"
        Bool: false
      }
      Overrides {
        Name: "cs:UpdateOverTime"
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
