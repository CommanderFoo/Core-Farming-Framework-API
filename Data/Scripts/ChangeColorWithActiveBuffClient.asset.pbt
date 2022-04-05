Assets {
  Id: 10296350106069483895
  Name: "ChangeColorWithActiveBuffClient"
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
        Name: "cs:BuffId"
        String: ""
      }
      Overrides {
        Name: "cs:InactiveColor"
        Color {
          A: 1
        }
      }
      Overrides {
        Name: "cs:ActiveColor"
        Color {
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
        Name: "cs:BuffId:tooltip"
        String: "The Id of the Buff to detect. Leave blank if you want any buff to change the color."
      }
      Overrides {
        Name: "cs:InactiveColor:tooltip"
        String: "The color to change to while the target Buff is not active."
      }
      Overrides {
        Name: "cs:ActiveColor:tooltip"
        String: "The color to change to while the target Buff is active."
      }
      Overrides {
        Name: "cs:ObjectToColor:tooltip"
        String: "The target object or group of objects to color."
      }
      Overrides {
        Name: "cs:ColorDescendants:tooltip"
        String: "If true, all objects underneath the \"ObjectToColor\" will also change color."
      }
      Overrides {
        Name: "cs:UpdateOverTime:tooltip"
        String: "If true, the color will change between the active and inactive color over the duration of the buff."
      }
    }
  }
  SerializationVersion: 108
  VirtualFolderPath: "Reactive Components"
}
