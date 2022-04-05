Assets {
  Id: 7457791479840550447
  Name: "ChangeMaterialOnCraftingChangeClient"
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
        Name: "cs:DefaultMaterial"
        AssetReference {
          Id: 841534158063459245
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
        Name: "cs:ChangeMaterial"
        AssetReference {
          Id: 841534158063459245
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
        Name: "cs:ObjectToChange"
        ObjectReference {
        }
      }
      Overrides {
        Name: "cs:DelaySeconds"
        Float: 0
      }
      Overrides {
        Name: "cs:ChangeDescendants"
        Bool: false
      }
      Overrides {
        Name: "cs:Recipes"
        String: ""
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
