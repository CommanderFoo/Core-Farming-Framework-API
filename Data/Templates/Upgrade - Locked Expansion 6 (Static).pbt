Assets {
  Id: 2743800723055976820
  Name: "Upgrade - Locked Expansion 6 (Static)"
  PlatformAssetType: 5
  TemplateAsset {
    ObjectBlock {
      RootId: 6008728566196283549
      Objects {
        Id: 6008728566196283549
        Name: "Upgrade - Locked Expansion 6 (Static)"
        Transform {
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 4781671109827199097
        ChildIds: 17414744547107502494
        ChildIds: 16955448821013053230
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        EditorIndicatorVisibility {
          Value: "mc:eindicatorvisibility:visiblewhenselected"
        }
        Folder {
          IsGroup: true
        }
        NetworkRelevanceDistance {
          Value: "mc:eproxyrelevance:critical"
        }
      }
      Objects {
        Id: 17414744547107502494
        Name: "Land Boarder"
        Transform {
          Location {
            X: -8275.07
            Y: 40480.6719
            Z: 0.999992371
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 6008728566196283549
        TemplateInstance {
          ParameterOverrideMap {
            key: 14032395007725706971
            value {
              Overrides {
                Name: "Name"
                String: "Land Boarder"
              }
              Overrides {
                Name: "Position"
                Vector {
                }
              }
              Overrides {
                Name: "Rotation"
                Rotator {
                }
              }
              Overrides {
                Name: "Scale"
                Vector {
                  X: 1
                  Y: 1
                  Z: 1
                }
              }
            }
          }
          TemplateAsset {
            Id: 8700324804989759364
          }
        }
      }
      Objects {
        Id: 16955448821013053230
        Name: "Player Lot Object Loader"
        Transform {
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 6008728566196283549
        TemplateInstance {
          ParameterOverrideMap {
            key: 5269134746227665817
            value {
              Overrides {
                Name: "Name"
                String: "Player Lot Object Loader (Unlock Sign)"
              }
              Overrides {
                Name: "Scale"
                Vector {
                  X: 1
                  Y: 1
                  Z: 1
                }
              }
              Overrides {
                Name: "cs:RequiresOwnerToLoad"
                Bool: true
              }
              Overrides {
                Name: "cs:RequiresOwnerToLoad:tooltip"
                String: "If true, will only load the objects if the Player Lot has an owner. Objects will be unloaded if the owner is cleared."
              }
              Overrides {
                Name: "cs:RequiresOwnerToLoad:isrep"
                Bool: false
              }
              Overrides {
                Name: "cs:RequiresOwnerToLoad:ml"
                Bool: false
              }
              Overrides {
                Name: "cs:RequiresNoOwnerToLoad"
                Bool: false
              }
              Overrides {
                Name: "cs:RequiresNoOwnerToLoad:tooltip"
                String: "If true, will only load the objects if the Player Lot does not have an owner. Objects will be unloaded if the owner is set."
              }
              Overrides {
                Name: "cs:RequiresNoOwnerToLoad:isrep"
                Bool: false
              }
              Overrides {
                Name: "cs:RequiresNoOwnerToLoad:ml"
                Bool: false
              }
              Overrides {
                Name: "cs:VisibleToOwnerOnly"
                Bool: true
              }
              Overrides {
                Name: "cs:VisibleToOwnerOnly:tooltip"
                String: "If true, the loaded client and static assets will only load for the owner of the lot."
              }
              Overrides {
                Name: "cs:VisibleToOwnerOnly:isrep"
                Bool: false
              }
              Overrides {
                Name: "cs:VisibleToOwnerOnly:ml"
                Bool: false
              }
              Overrides {
                Name: "cs:ServerAsset"
                AssetReference {
                  Id: 841534158063459245
                }
              }
              Overrides {
                Name: "cs:ServerAsset:tooltip"
                String: "(Optional) A template to spawn into a Server Context when the Player Lot Loads. This template will be destroyed when the Player Lot unloads."
              }
              Overrides {
                Name: "cs:ServerAsset:isrep"
                Bool: false
              }
              Overrides {
                Name: "cs:ServerAsset:ml"
                Bool: false
              }
              Overrides {
                Name: "cs:StaticAsset"
                AssetReference {
                  Id: 13650436665616346971
                }
              }
              Overrides {
                Name: "cs:StaticAsset:tooltip"
                String: "(Optional) A template to spawn into a Static Context when the Player Lot Loads. This template will be destroyed when the Player Lot unloads."
              }
              Overrides {
                Name: "cs:StaticAsset:isrep"
                Bool: false
              }
              Overrides {
                Name: "cs:StaticAsset:ml"
                Bool: false
              }
              Overrides {
                Name: "cs:ClientAsset"
                AssetReference {
                  Id: 841534158063459245
                }
              }
              Overrides {
                Name: "cs:ClientAsset:tooltip"
                String: "(Optional) A template to spawn into a Client Context when the Player Lot Loads. This template will be destroyed when the Player Lot unloads."
              }
              Overrides {
                Name: "cs:ClientAsset:isrep"
                Bool: false
              }
              Overrides {
                Name: "cs:ClientAsset:ml"
                Bool: false
              }
              Overrides {
                Name: "Position"
                Vector {
                  X: -1295.76172
                  Y: -37.6914062
                  Z: -38.3319855
                }
              }
            }
          }
          TemplateAsset {
            Id: 2202103686519227027
          }
        }
      }
    }
    PrimaryAssetId {
      AssetType: "None"
      AssetId: "None"
    }
  }
  SerializationVersion: 110
  VirtualFolderPath: "Art and Collision - Farm"
  VirtualFolderPath: "Farm Upgrades"
}
