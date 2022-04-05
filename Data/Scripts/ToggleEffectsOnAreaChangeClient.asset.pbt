Assets {
  Id: 6799979075302683923
  Name: "ToggleEffectsOnAreaChangeClient"
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
        Name: "cs:Area"
        ObjectReference {
        }
      }
      Overrides {
        Name: "cs:AreaGroupKey"
        String: ""
      }
      Overrides {
        Name: "cs:ObjectToToggle"
        ObjectReference {
        }
      }
      Overrides {
        Name: "cs:IncludeDescendants"
        Bool: false
      }
      Overrides {
        Name: "cs:LocalPlayerOnly"
        Bool: false
      }
      Overrides {
        Name: "cs:DelaySeconds"
        Float: 0
      }
      Overrides {
        Name: "cs:ChangeOnEnterArea"
        Bool: false
      }
      Overrides {
        Name: "cs:ChangeOnExitArea"
        Bool: false
      }
      Overrides {
        Name: "cs:Area:tooltip"
        String: "(Optional) A specific Area that will activate this component."
      }
      Overrides {
        Name: "cs:AreaGroupKey:tooltip"
        String: "(Optional) An Assignable Area group key for a set of Areas that will activate this component."
      }
      Overrides {
        Name: "cs:ObjectToToggle:tooltip"
        String: "The Audio / Vfx or heirarchy containing multiple Audio and Vfx objects that you want to control."
      }
      Overrides {
        Name: "cs:IncludeDescendants:tooltip"
        String: "If true, the entire heirarchy referenced in \"Effects\" will be searched for Audio and Vfx, otherwise only the top level will be searched."
      }
      Overrides {
        Name: "cs:DelaySeconds:tooltip"
        String: "If greater than 0, will wait this many seconds before running."
      }
      Overrides {
        Name: "cs:LocalPlayerOnly:tooltip"
        String: "If true, the effect(s) will play when a Player enters the Area."
      }
      Overrides {
        Name: "cs:ChangeOnEnterArea:tooltip"
        String: "If true, the effect(s) will play when a Player exits the Area."
      }
      Overrides {
        Name: "cs:ChangeOnExitArea:tooltip"
        String: "If true, the effect(s) will stop when a Player enters the Area."
      }
    }
  }
  SerializationVersion: 108
  VirtualFolderPath: "Reactive Components"
}
