Assets {
  Id: 15164551205303792187
  Name: "ChangeMaterialWithActiveBuffClient"
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
        Name: "cs:APIBuffs"
        AssetReference {
          Id: 13989659271932831225
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
        Name: "cs:BuffId"
        String: ""
      }
      Overrides {
        Name: "cs:ObjectToChange"
        ObjectReference {
        }
      }
      Overrides {
        Name: "cs:ChangeDescendants"
        Bool: false
      }
      Overrides {
        Name: "cs:DelaySeconds"
        Float: 0
      }
      Overrides {
        Name: "cs:BuffId:tooltip"
        String: "The Id of the Buff to detect. Leave blank if you want any buff to change the color."
      }
      Overrides {
        Name: "cs:ObjectToChange:tooltip"
        String: "The target object or group of objects to color."
      }
      Overrides {
        Name: "cs:ChangeDescendants:tooltip"
        String: "If true, all objects underneath the \"ObjectToColor\" will also change color."
      }
    }
  }
  SerializationVersion: 110
  VirtualFolderPath: "Reactive Components"
}
