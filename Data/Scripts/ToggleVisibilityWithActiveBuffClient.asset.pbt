Assets {
  Id: 9246436151059596399
  Name: "ToggleVisibilityWithActiveBuffClient"
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
        Name: "cs:BuffId"
        String: ""
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
        Name: "cs:HideOnChange"
        Bool: false
      }
      Overrides {
        Name: "cs:APIReactiveComponent:isrep"
        Bool: false
      }
      Overrides {
        Name: "cs:APIReactiveComponent:ml"
        Bool: false
      }
      Overrides {
        Name: "cs:BuffId:tooltip"
        String: "The Id of the buff to detect. Leave blank if you want any buff to show and hide objects."
      }
      Overrides {
        Name: "cs:BuffId:isrep"
        Bool: false
      }
      Overrides {
        Name: "cs:ObjectToToggle:isrep"
        Bool: false
      }
      Overrides {
        Name: "cs:ObjectToToggle:ml"
        Bool: false
      }
      Overrides {
        Name: "cs:ObjectToToggle:tooltip"
        String: "The target object or group of objects to show and hide."
      }
      Overrides {
        Name: "cs:HideOnChange:tooltip"
        String: "If true, the target objects will be hidden while the Buff is active. Otherwise they will be visible while the Buff is active."
      }
    }
  }
  SerializationVersion: 110
  VirtualFolderPath: "Reactive Components"
}
