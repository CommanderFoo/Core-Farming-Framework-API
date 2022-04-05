Assets {
  Id: 11403073064468988835
  Name: "Player Farm - Back Yard"
  PlatformAssetType: 5
  TemplateAsset {
    ObjectBlock {
      RootId: 5836927775022052130
      Objects {
        Id: 5836927775022052130
        Name: "Back Yard"
        Transform {
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 3115750280136511078
        ChildIds: 17741323969761443475
        ChildIds: 6508079714495392492
        ChildIds: 13913392195523155675
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
        Id: 17741323969761443475
        Name: "Area Setup"
        Transform {
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 5836927775022052130
        ChildIds: 1260967010269155419
        ChildIds: 2770144911657619766
        UnregisteredParameters {
          Overrides {
            Name: "cs:Area"
            ObjectReference {
              SubObjectId: 5836927775022052130
            }
          }
          Overrides {
            Name: "cs:Area:tooltip"
            String: "This should be assigned to a group of objects that represents an Area. This field will be assigned to the parent of this component if left blank."
          }
        }
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
        Id: 1260967010269155419
        Name: "AreaServer"
        Transform {
          Location {
          }
          Rotation {
            Yaw: -89.9999466
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 17741323969761443475
        UnregisteredParameters {
          Overrides {
            Name: "cs:ComponentRoot"
            ObjectReference {
              SubObjectId: 17741323969761443475
            }
          }
        }
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
        Script {
          ScriptAsset {
            Id: 15418553610681981069
          }
        }
        IsAdvanced: true
        NetworkRelevanceDistance {
          Value: "mc:eproxyrelevance:critical"
        }
      }
      Objects {
        Id: 2770144911657619766
        Name: "ClientContext"
        Transform {
          Location {
          }
          Rotation {
            Yaw: -89.9999466
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 17741323969761443475
        ChildIds: 13286824034354983667
        Collidable_v2 {
          Value: "mc:ecollisionsetting:forceoff"
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
        NetworkContext {
        }
        IsAdvanced: true
        NetworkRelevanceDistance {
          Value: "mc:eproxyrelevance:critical"
        }
      }
      Objects {
        Id: 13286824034354983667
        Name: "AreaClient"
        Transform {
          Location {
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 2770144911657619766
        UnregisteredParameters {
          Overrides {
            Name: "cs:ComponentRoot"
            ObjectReference {
              SubObjectId: 17741323969761443475
            }
          }
        }
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
        Script {
          ScriptAsset {
            Id: 5780573833862094328
          }
        }
        NetworkRelevanceDistance {
          Value: "mc:eproxyrelevance:critical"
        }
      }
      Objects {
        Id: 6508079714495392492
        Name: "Private Lot"
        Transform {
          Location {
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 5836927775022052130
        ChildIds: 2726820666485515075
        ChildIds: 17502305239653634362
        ChildIds: 2726642770619922349
        ChildIds: 10327433413152477847
        ChildIds: 17724243625447265162
        ChildIds: 7942770557396189122
        ChildIds: 2363005437618526916
        ChildIds: 9603143116996983271
        ChildIds: 5387572361689412577
        ChildIds: 13309247321061115778
        ChildIds: 5519096026046326596
        ChildIds: 2808069152153020518
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
        Id: 2726820666485515075
        Name: "Player Lot Setup"
        Transform {
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 6508079714495392492
        TemplateInstance {
          ParameterOverrideMap {
            key: 7943833858665744372
            value {
              Overrides {
                Name: "Name"
                String: "Player Lot Setup"
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
                Name: "cs:PlayerLot"
                ObjectReference {
                  SubObjectId: 6508079714495392492
                }
              }
              Overrides {
                Name: "cs:PlayerLot:tooltip"
                String: "(Optional) If set, the referenced object will be considered the root of this Player Lot. Otherwise the parent of this object will be used."
              }
              Overrides {
                Name: "cs:PlayerLot:isrep"
                Bool: false
              }
              Overrides {
                Name: "cs:PlayerLot:ml"
                Bool: false
              }
              Overrides {
                Name: "cs:LotType"
                String: "Back Yard"
              }
              Overrides {
                Name: "cs:LotType:tooltip"
                String: "(Optional) This can be used to assign Players to a specific Lot or group of Lots."
              }
              Overrides {
                Name: "cs:LotType:isrep"
                Bool: false
              }
              Overrides {
                Name: "cs:LotType:ml"
                Bool: false
              }
              Overrides {
                Name: "cs:OwnerOnly"
                Bool: true
              }
              Overrides {
                Name: "cs:OwnerOnly:tooltip"
                String: "If true, any dynamic objects on the lot, such as Gatherables and Producers, will only be accessible to the owner."
              }
              Overrides {
                Name: "cs:OwnerOnly:isrep"
                Bool: false
              }
              Overrides {
                Name: "cs:OwnerOnly:ml"
                Bool: false
              }
            }
          }
          TemplateAsset {
            Id: 4375924379775680731
          }
        }
      }
      Objects {
        Id: 17502305239653634362
        Name: "Area Player Lot Loader"
        Transform {
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 6508079714495392492
        TemplateInstance {
          ParameterOverrideMap {
            key: 8657038851454979284
            value {
              Overrides {
                Name: "Name"
                String: "Area Player Lot Loader"
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
                Name: "cs:ResetLotOnUnload"
                Bool: false
              }
              Overrides {
                Name: "cs:ResetLotOnUnload:tooltip"
                String: "If true, the associated Player Lot will be reset if the Player leaves the server."
              }
              Overrides {
                Name: "cs:ResetLotOnUnload:isrep"
                Bool: false
              }
              Overrides {
                Name: "cs:ResetLotOnUnload:ml"
                Bool: false
              }
            }
          }
          TemplateAsset {
            Id: 18432192991312495731
          }
        }
      }
      Objects {
        Id: 2726642770619922349
        Name: "Player Lot Spawn Point (Gate)"
        Transform {
          Location {
            X: -4122.82227
            Y: 1155.9668
            Z: 215.235077
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 6508079714495392492
        ChildIds: 15496757179772715490
        ChildIds: 8677767490387998714
        ChildIds: 15958107563750961041
        UnregisteredParameters {
          Overrides {
            Name: "cs:PlayerLot"
            ObjectReference {
              SubObjectId: 6508079714495392492
            }
          }
          Overrides {
            Name: "cs:SpawnPointKey"
            String: "Gate"
          }
          Overrides {
            Name: "cs:PlayerLot:tooltip"
            String: "(Optional) This should be assigned to a group of objects that represents a Player Lot. This will automatically find the Lot it is inside if left blank."
          }
          Overrides {
            Name: "cs:SpawnPointKey:tooltip"
            String: "(Optional) If set, this will allow portals and other teleport methods to target this spawn point."
          }
        }
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
        Id: 15496757179772715490
        Name: "PlayerLotSpawnPoint"
        Transform {
          Location {
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 2726642770619922349
        UnregisteredParameters {
          Overrides {
            Name: "cs:ComponentRoot"
            ObjectReference {
              SubObjectId: 2726642770619922349
            }
          }
          Overrides {
            Name: "cs:Target"
            ObjectReference {
              SubObjectId: 15958107563750961041
            }
          }
        }
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
        Script {
          ScriptAsset {
            Id: 6645690084526841844
          }
        }
        IsAdvanced: true
        NetworkRelevanceDistance {
          Value: "mc:eproxyrelevance:critical"
        }
      }
      Objects {
        Id: 8677767490387998714
        Name: "ClientContext"
        Transform {
          Location {
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 2726642770619922349
        ChildIds: 13701380240499595613
        Collidable_v2 {
          Value: "mc:ecollisionsetting:forceoff"
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
        NetworkContext {
        }
        IsAdvanced: true
        NetworkRelevanceDistance {
          Value: "mc:eproxyrelevance:critical"
        }
      }
      Objects {
        Id: 13701380240499595613
        Name: "PlayerLotSpawnPoint"
        Transform {
          Location {
          }
          Rotation {
            Yaw: -6.83018879e-06
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 8677767490387998714
        UnregisteredParameters {
          Overrides {
            Name: "cs:ComponentRoot"
            ObjectReference {
              SubObjectId: 2726642770619922349
            }
          }
          Overrides {
            Name: "cs:Target"
            ObjectReference {
              SubObjectId: 15958107563750961041
            }
          }
        }
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
        Script {
          ScriptAsset {
            Id: 6645690084526841844
          }
        }
        NetworkRelevanceDistance {
          Value: "mc:eproxyrelevance:critical"
        }
      }
      Objects {
        Id: 15958107563750961041
        Name: "Target"
        Transform {
          Location {
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 2726642770619922349
        UnregisteredParameters {
          Overrides {
            Name: "bp:Type"
            Enum {
              Value: "mc:evolumetype:2"
            }
          }
          Overrides {
            Name: "bp:X Offset"
            Float: 0
          }
          Overrides {
            Name: "bp:Y Offset"
            Float: 0
          }
          Overrides {
            Name: "bp:Y Scale"
            Float: 1
          }
          Overrides {
            Name: "bp:Z Scale"
            Float: 2.3
          }
          Overrides {
            Name: "bp:Color"
            Color {
              G: 1
              B: 0.934808493
              A: 1
            }
          }
        }
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
        Blueprint {
          BlueprintAsset {
            Id: 6442861049751997091
          }
          TeamSettings {
          }
        }
        NetworkRelevanceDistance {
          Value: "mc:eproxyrelevance:critical"
        }
      }
      Objects {
        Id: 10327433413152477847
        Name: "Player Lot Spawn Point (House)"
        Transform {
          Location {
            X: -4059.94263
            Y: -1141.77246
            Z: 302.159912
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 6508079714495392492
        ChildIds: 5136699018541272349
        ChildIds: 18275626868687078757
        ChildIds: 6928935577001213291
        UnregisteredParameters {
          Overrides {
            Name: "cs:PlayerLot"
            ObjectReference {
              SubObjectId: 6508079714495392492
            }
          }
          Overrides {
            Name: "cs:SpawnPointKey"
            String: "House"
          }
          Overrides {
            Name: "cs:PlayerLot:tooltip"
            String: "(Optional) This should be assigned to a group of objects that represents a Player Lot. This will automatically find the Lot it is inside if left blank."
          }
          Overrides {
            Name: "cs:SpawnPointKey:tooltip"
            String: "(Optional) If set, this will allow portals and other teleport methods to target this spawn point."
          }
        }
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
        Id: 5136699018541272349
        Name: "PlayerLotSpawnPoint"
        Transform {
          Location {
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 10327433413152477847
        UnregisteredParameters {
          Overrides {
            Name: "cs:ComponentRoot"
            ObjectReference {
              SubObjectId: 10327433413152477847
            }
          }
          Overrides {
            Name: "cs:Target"
            ObjectReference {
              SubObjectId: 6928935577001213291
            }
          }
        }
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
        Script {
          ScriptAsset {
            Id: 6645690084526841844
          }
        }
        IsAdvanced: true
        NetworkRelevanceDistance {
          Value: "mc:eproxyrelevance:critical"
        }
      }
      Objects {
        Id: 18275626868687078757
        Name: "ClientContext"
        Transform {
          Location {
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 10327433413152477847
        ChildIds: 11420514951559906106
        Collidable_v2 {
          Value: "mc:ecollisionsetting:forceoff"
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
        NetworkContext {
        }
        IsAdvanced: true
        NetworkRelevanceDistance {
          Value: "mc:eproxyrelevance:critical"
        }
      }
      Objects {
        Id: 11420514951559906106
        Name: "PlayerLotSpawnPoint"
        Transform {
          Location {
          }
          Rotation {
            Yaw: -6.83018879e-06
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 18275626868687078757
        UnregisteredParameters {
          Overrides {
            Name: "cs:ComponentRoot"
            ObjectReference {
              SubObjectId: 10327433413152477847
            }
          }
          Overrides {
            Name: "cs:Target"
            ObjectReference {
              SubObjectId: 6928935577001213291
            }
          }
        }
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
        Script {
          ScriptAsset {
            Id: 6645690084526841844
          }
        }
        NetworkRelevanceDistance {
          Value: "mc:eproxyrelevance:critical"
        }
      }
      Objects {
        Id: 6928935577001213291
        Name: "Target"
        Transform {
          Location {
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 10327433413152477847
        UnregisteredParameters {
          Overrides {
            Name: "bp:Type"
            Enum {
              Value: "mc:evolumetype:2"
            }
          }
          Overrides {
            Name: "bp:X Offset"
            Float: 0
          }
          Overrides {
            Name: "bp:Y Offset"
            Float: 0
          }
          Overrides {
            Name: "bp:Y Scale"
            Float: 1
          }
          Overrides {
            Name: "bp:Z Scale"
            Float: 2.3
          }
          Overrides {
            Name: "bp:Color"
            Color {
              G: 1
              B: 0.934808493
              A: 1
            }
          }
        }
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
        Blueprint {
          BlueprintAsset {
            Id: 6442861049751997091
          }
          TeamSettings {
          }
        }
        NetworkRelevanceDistance {
          Value: "mc:eproxyrelevance:critical"
        }
      }
      Objects {
        Id: 17724243625447265162
        Name: "Player Lot Object Loader"
        Transform {
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 6508079714495392492
        TemplateInstance {
          ParameterOverrideMap {
            key: 5269134746227665817
            value {
              Overrides {
                Name: "Name"
                String: "Player Lot Object Loader (Back Yard Art)"
              }
              Overrides {
                Name: "cs:RequiresOwnerToLoad"
                Bool: false
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
                Bool: false
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
                  Id: 9226931719402381876
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
                Name: "cs:LocalAsset"
                AssetReference {
                  Id: 841534158063459245
                }
              }
              Overrides {
                Name: "cs:LocalAsset:tooltip"
                String: "(Optional) A template to spawn into a Local Context when the Player Lot Loads. This template will be destroyed when the Player Lot unloads."
              }
              Overrides {
                Name: "cs:LocalAsset:isrep"
                Bool: false
              }
              Overrides {
                Name: "cs:LocalAsset:ml"
                Bool: false
              }
              Overrides {
                Name: "Position"
                Vector {
                  Z: 1
                }
              }
            }
          }
          ParameterOverrideMap {
            key: 16524940300580709148
            value {
              Overrides {
                Name: "Position"
                Vector {
                  X: -4724.21729
                  Z: 415.754761
                }
              }
              Overrides {
                Name: "Scale"
                Vector {
                  X: 2.0065918
                  Y: 52.8845711
                  Z: 5.97367764
                }
              }
              Overrides {
                Name: "bp:Color"
                Color {
                  R: 0.0141854035
                  G: 0.126
                  A: 1
                }
              }
            }
          }
          TemplateAsset {
            Id: 2202103686519227027
          }
        }
      }
      Objects {
        Id: 7942770557396189122
        Name: "Player Lot Upgrade Loader"
        Transform {
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 6508079714495392492
        TemplateInstance {
          ParameterOverrideMap {
            key: 8995608314112120718
            value {
              Overrides {
                Name: "Name"
                String: "Player Lot Upgrade Loader (House)"
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
                Name: "Position"
                Vector {
                  X: -4377.41406
                  Y: -1296.68359
                  Z: 100.999992
                }
              }
              Overrides {
                Name: "Rotation"
                Rotator {
                  Yaw: 179.999939
                }
              }
              Overrides {
                Name: "cs:RequiresOwnerToLoad"
                Bool: false
              }
              Overrides {
                Name: "cs:RequiresOwnerToLoad:tooltip"
                String: "If true, this will not load anything unless the owner of the Lot is online."
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
                Name: "cs:UpgradeCollectionId"
                String: "House"
              }
              Overrides {
                Name: "cs:UpgradeCollectionId:tooltip"
                String: "The Upgrade Collection to load Upgrade related assets for."
              }
              Overrides {
                Name: "cs:UpgradeCollectionId:isrep"
                Bool: false
              }
              Overrides {
                Name: "cs:UpgradeCollectionId:ml"
                Bool: false
              }
              Overrides {
                Name: "cs:DefaultUpgradeId"
                String: "Damaged House"
              }
              Overrides {
                Name: "cs:DefaultUpgradeId:tooltip"
                String: "(Optional) If set, this upgrade will be loaded if the Player Lot does not have an owner."
              }
              Overrides {
                Name: "cs:DefaultUpgradeId:isrep"
                Bool: false
              }
              Overrides {
                Name: "cs:DefaultUpgradeId:ml"
                Bool: false
              }
              Overrides {
                Name: "cs:UpgradeId"
                String: ""
              }
              Overrides {
                Name: "cs:UpgradeId:tooltip"
                String: "(Optional) If set, will only check for this specific Upgrade. Useful for non linear Upgrade Collections."
              }
              Overrides {
                Name: "cs:UpgradeId:isrep"
                Bool: false
              }
              Overrides {
                Name: "cs:UpgradeId:ml"
                Bool: false
              }
              Overrides {
                Name: "cs:TemplateSetId"
                String: "Back Yard"
              }
              Overrides {
                Name: "cs:TemplateSetId:tooltip"
                String: "(Optional) If set, this template set will be used to spawn the assets from if it exists. Otherwise the first template set found will be used."
              }
              Overrides {
                Name: "cs:TemplateSetId:isrep"
                Bool: false
              }
              Overrides {
                Name: "cs:TemplateSetId:ml"
                Bool: false
              }
            }
          }
          ParameterOverrideMap {
            key: 16700948332636095262
            value {
              Overrides {
                Name: "Scale"
                Vector {
                  X: 7.18776751
                  Y: 7.90535593
                  Z: 7.83342552
                }
              }
              Overrides {
                Name: "Position"
                Vector {
                  X: -223.615234
                  Y: -0.000213256106
                  Z: 396.789459
                }
              }
            }
          }
          ParameterOverrideMap {
            key: 16902259041727924328
            value {
              Overrides {
                Name: "CoreProxy.IsAdvanced"
                Bool: false
              }
            }
          }
          TemplateAsset {
            Id: 9441528603996975911
          }
        }
      }
      Objects {
        Id: 2363005437618526916
        Name: "Player Lot Upgrade Loader"
        Transform {
          Location {
            X: 12479.1934
            Y: 24278.1133
            Z: -99
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 6508079714495392492
        TemplateInstance {
          ParameterOverrideMap {
            key: 8995608314112120718
            value {
              Overrides {
                Name: "Name"
                String: "Player Lot Upgrade Loader (Gate)"
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
                Name: "Position"
                Vector {
                  X: -4525.45898
                  Y: 1105.43164
                  Z: 100.999992
                }
              }
              Overrides {
                Name: "Rotation"
                Rotator {
                  Yaw: -90
                }
              }
              Overrides {
                Name: "cs:RequiresOwnerToLoad"
                Bool: false
              }
              Overrides {
                Name: "cs:RequiresOwnerToLoad:tooltip"
                String: "If true, this will not load anything unless the owner of the Lot is online."
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
                Name: "cs:UpgradeCollectionId"
                String: "Gate"
              }
              Overrides {
                Name: "cs:UpgradeCollectionId:tooltip"
                String: "The Upgrade Collection to load Upgrade related assets for."
              }
              Overrides {
                Name: "cs:UpgradeCollectionId:isrep"
                Bool: false
              }
              Overrides {
                Name: "cs:UpgradeCollectionId:ml"
                Bool: false
              }
              Overrides {
                Name: "cs:DefaultUpgradeId"
                String: "Damaged Gate"
              }
              Overrides {
                Name: "cs:DefaultUpgradeId:tooltip"
                String: "(Optional) If set, this upgrade will be loaded if the Player Lot does not have an owner."
              }
              Overrides {
                Name: "cs:DefaultUpgradeId:isrep"
                Bool: false
              }
              Overrides {
                Name: "cs:DefaultUpgradeId:ml"
                Bool: false
              }
              Overrides {
                Name: "cs:UpgradeId"
                String: ""
              }
              Overrides {
                Name: "cs:UpgradeId:tooltip"
                String: "(Optional) If set, will only check for this specific Upgrade. Useful for non linear Upgrade Collections."
              }
              Overrides {
                Name: "cs:UpgradeId:isrep"
                Bool: false
              }
              Overrides {
                Name: "cs:UpgradeId:ml"
                Bool: false
              }
              Overrides {
                Name: "cs:TemplateSetId"
                String: "Back Yard"
              }
              Overrides {
                Name: "cs:TemplateSetId:tooltip"
                String: "(Optional) If set, this template set will be used to spawn the assets from if it exists. Otherwise the first template set found will be used."
              }
              Overrides {
                Name: "cs:TemplateSetId:isrep"
                Bool: false
              }
              Overrides {
                Name: "cs:TemplateSetId:ml"
                Bool: false
              }
            }
          }
          ParameterOverrideMap {
            key: 16700948332636095262
            value {
              Overrides {
                Name: "Scale"
                Vector {
                  X: 7.57992172
                  Y: 0.999997735
                  Z: 8.5711422
                }
              }
              Overrides {
                Name: "Position"
                Vector {
                  X: 31.8554649
                  Y: -1.90734863e-06
                  Z: 426.698029
                }
              }
            }
          }
          ParameterOverrideMap {
            key: 16902259041727924328
            value {
              Overrides {
                Name: "CoreProxy.IsAdvanced"
                Bool: false
              }
            }
          }
          TemplateAsset {
            Id: 9441528603996975911
          }
        }
      }
      Objects {
        Id: 9603143116996983271
        Name: "Expansions (Upgrade Loaders)"
        Transform {
          Location {
            Z: 1
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 6508079714495392492
        ChildIds: 10936786434230620400
        ChildIds: 6072574717629713226
        ChildIds: 2132317687931621827
        ChildIds: 3168948540977813043
        ChildIds: 16510237359851727331
        ChildIds: 944036220256897032
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
        Id: 10936786434230620400
        Name: "Player Lot Upgrade Loader (Land 1)"
        Transform {
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 9603143116996983271
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        TemplateInstance {
          ParameterOverrideMap {
            key: 8995608314112120718
            value {
              Overrides {
                Name: "Name"
                String: "Player Lot Upgrade Loader (Land 1)"
              }
              Overrides {
                Name: "Position"
                Vector {
                  X: -2691.4082
                  Y: -1134.75
                  Z: 99.9999924
                }
              }
              Overrides {
                Name: "Rotation"
                Rotator {
                }
              }
              Overrides {
                Name: "cs:UpgradeCollectionId"
                String: "Farm Land"
              }
              Overrides {
                Name: "cs:DefaultUpgradeId"
                String: "Locked Land 1"
              }
              Overrides {
                Name: "cs:UpgradeId"
                String: "Land Expansion 1"
              }
            }
          }
          ParameterOverrideMap {
            key: 16700948332636095262
            value {
              Overrides {
                Name: "Scale"
                Vector {
                  X: 27.0462303
                  Y: 21.2497978
                  Z: 0.16765748
                }
              }
              Overrides {
                Name: "Position"
                Vector {
                  Z: 9.99505615
                }
              }
              Overrides {
                Name: "bp:Color"
                Color {
                  R: 0.0754304603
                  G: 0.085
                  A: 1
                }
              }
            }
          }
          TemplateAsset {
            Id: 9441528603996975911
          }
        }
      }
      Objects {
        Id: 6072574717629713226
        Name: "Player Lot Upgrade Loader"
        Transform {
          Location {
            X: 12479.1934
            Y: 24278.1133
            Z: -98
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 9603143116996983271
        TemplateInstance {
          ParameterOverrideMap {
            key: 8995608314112120718
            value {
              Overrides {
                Name: "Name"
                String: "Player Lot Upgrade Loader (Land 2)"
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
                Name: "Position"
                Vector {
                  X: -2691.4082
                  Y: 1048.67969
                  Z: 99.9999924
                }
              }
              Overrides {
                Name: "Rotation"
                Rotator {
                }
              }
              Overrides {
                Name: "cs:RequiresOwnerToLoad"
                Bool: false
              }
              Overrides {
                Name: "cs:RequiresOwnerToLoad:tooltip"
                String: "If true, this will not load anything unless the owner of the Lot is online."
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
                Name: "cs:UpgradeCollectionId"
                String: "Farm Land"
              }
              Overrides {
                Name: "cs:UpgradeCollectionId:tooltip"
                String: "The Upgrade Collection to load Upgrade related assets for."
              }
              Overrides {
                Name: "cs:UpgradeCollectionId:isrep"
                Bool: false
              }
              Overrides {
                Name: "cs:UpgradeCollectionId:ml"
                Bool: false
              }
              Overrides {
                Name: "cs:DefaultUpgradeId"
                String: "Locked Land 2"
              }
              Overrides {
                Name: "cs:DefaultUpgradeId:tooltip"
                String: "(Optional) If set, this upgrade will be loaded if the Player Lot does not have an owner."
              }
              Overrides {
                Name: "cs:DefaultUpgradeId:isrep"
                Bool: false
              }
              Overrides {
                Name: "cs:DefaultUpgradeId:ml"
                Bool: false
              }
              Overrides {
                Name: "cs:UpgradeId"
                String: "Land Expansion 2"
              }
              Overrides {
                Name: "cs:UpgradeId:tooltip"
                String: "(Optional) If set, will only check for this specific Upgrade. Useful for non linear Upgrade Collections."
              }
              Overrides {
                Name: "cs:UpgradeId:isrep"
                Bool: false
              }
              Overrides {
                Name: "cs:UpgradeId:ml"
                Bool: false
              }
              Overrides {
                Name: "cs:TemplateSetId"
                String: ""
              }
              Overrides {
                Name: "cs:TemplateSetId:tooltip"
                String: "(Optional) If set, this template set will be used to spawn the assets from if it exists. Otherwise the first template set found will be used."
              }
              Overrides {
                Name: "cs:TemplateSetId:isrep"
                Bool: false
              }
              Overrides {
                Name: "cs:TemplateSetId:ml"
                Bool: false
              }
            }
          }
          ParameterOverrideMap {
            key: 16700948332636095262
            value {
              Overrides {
                Name: "Position"
                Vector {
                  Z: 9.99505615
                }
              }
              Overrides {
                Name: "Scale"
                Vector {
                  X: 27.0462303
                  Y: 21.2497978
                  Z: 0.16765748
                }
              }
              Overrides {
                Name: "bp:Color"
                Color {
                  R: 0.0754304603
                  G: 0.085
                  A: 1
                }
              }
            }
          }
          TemplateAsset {
            Id: 9441528603996975911
          }
        }
      }
      Objects {
        Id: 2132317687931621827
        Name: "Player Lot Upgrade Loader (Land 3)"
        Transform {
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 9603143116996983271
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        TemplateInstance {
          ParameterOverrideMap {
            key: 8995608314112120718
            value {
              Overrides {
                Name: "Name"
                String: "Player Lot Upgrade Loader (Land 3)"
              }
              Overrides {
                Name: "Position"
                Vector {
                  X: 107.290039
                  Y: -1134.75
                  Z: 99.9999924
                }
              }
              Overrides {
                Name: "Rotation"
                Rotator {
                }
              }
              Overrides {
                Name: "cs:UpgradeCollectionId"
                String: "Farm Land"
              }
              Overrides {
                Name: "cs:DefaultUpgradeId"
                String: "Locked Land 3"
              }
              Overrides {
                Name: "cs:UpgradeId"
                String: "Land Expansion 3"
              }
            }
          }
          ParameterOverrideMap {
            key: 16700948332636095262
            value {
              Overrides {
                Name: "bp:Color"
                Color {
                  R: 0.0754304603
                  G: 0.085
                  A: 1
                }
              }
              Overrides {
                Name: "Position"
                Vector {
                  Z: 9.99505615
                }
              }
              Overrides {
                Name: "Scale"
                Vector {
                  X: 27.0462303
                  Y: 21.2497978
                  Z: 0.16765748
                }
              }
            }
          }
          TemplateAsset {
            Id: 9441528603996975911
          }
        }
      }
      Objects {
        Id: 3168948540977813043
        Name: "Player Lot Upgrade Loader"
        Transform {
          Location {
            X: 12479.1934
            Y: 24278.1133
            Z: -98
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 9603143116996983271
        TemplateInstance {
          ParameterOverrideMap {
            key: 8995608314112120718
            value {
              Overrides {
                Name: "Name"
                String: "Player Lot Upgrade Loader (Land 4)"
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
                Name: "Position"
                Vector {
                  X: 107.290039
                  Y: 1048.67969
                  Z: 99.9999924
                }
              }
              Overrides {
                Name: "Rotation"
                Rotator {
                }
              }
              Overrides {
                Name: "cs:RequiresOwnerToLoad"
                Bool: false
              }
              Overrides {
                Name: "cs:RequiresOwnerToLoad:tooltip"
                String: "If true, this will not load anything unless the owner of the Lot is online."
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
                Name: "cs:UpgradeCollectionId"
                String: "Farm Land"
              }
              Overrides {
                Name: "cs:UpgradeCollectionId:tooltip"
                String: "The Upgrade Collection to load Upgrade related assets for."
              }
              Overrides {
                Name: "cs:UpgradeCollectionId:isrep"
                Bool: false
              }
              Overrides {
                Name: "cs:UpgradeCollectionId:ml"
                Bool: false
              }
              Overrides {
                Name: "cs:DefaultUpgradeId"
                String: "Locked Land 4"
              }
              Overrides {
                Name: "cs:DefaultUpgradeId:tooltip"
                String: "(Optional) If set, this upgrade will be loaded if the Player Lot does not have an owner."
              }
              Overrides {
                Name: "cs:DefaultUpgradeId:isrep"
                Bool: false
              }
              Overrides {
                Name: "cs:DefaultUpgradeId:ml"
                Bool: false
              }
              Overrides {
                Name: "cs:UpgradeId"
                String: "Land Expansion 4"
              }
              Overrides {
                Name: "cs:UpgradeId:tooltip"
                String: "(Optional) If set, will only check for this specific Upgrade. Useful for non linear Upgrade Collections."
              }
              Overrides {
                Name: "cs:UpgradeId:isrep"
                Bool: false
              }
              Overrides {
                Name: "cs:UpgradeId:ml"
                Bool: false
              }
              Overrides {
                Name: "cs:TemplateSetId"
                String: ""
              }
              Overrides {
                Name: "cs:TemplateSetId:tooltip"
                String: "(Optional) If set, this template set will be used to spawn the assets from if it exists. Otherwise the first template set found will be used."
              }
              Overrides {
                Name: "cs:TemplateSetId:isrep"
                Bool: false
              }
              Overrides {
                Name: "cs:TemplateSetId:ml"
                Bool: false
              }
            }
          }
          ParameterOverrideMap {
            key: 16700948332636095262
            value {
              Overrides {
                Name: "Position"
                Vector {
                  Z: 9.99505615
                }
              }
              Overrides {
                Name: "Scale"
                Vector {
                  X: 27.0462303
                  Y: 21.2497978
                  Z: 0.16765748
                }
              }
              Overrides {
                Name: "bp:Color"
                Color {
                  R: 0.0754304603
                  G: 0.085
                  A: 1
                }
              }
            }
          }
          TemplateAsset {
            Id: 9441528603996975911
          }
        }
      }
      Objects {
        Id: 16510237359851727331
        Name: "Player Lot Upgrade Loader"
        Transform {
          Location {
            X: 12479.1934
            Y: 24278.1133
            Z: -98
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 9603143116996983271
        TemplateInstance {
          ParameterOverrideMap {
            key: 8995608314112120718
            value {
              Overrides {
                Name: "Name"
                String: "Player Lot Upgrade Loader (Land 5)"
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
                Name: "Position"
                Vector {
                  X: 2923.86035
                  Y: -1134.75
                  Z: 99.9999924
                }
              }
              Overrides {
                Name: "Rotation"
                Rotator {
                }
              }
              Overrides {
                Name: "cs:RequiresOwnerToLoad"
                Bool: false
              }
              Overrides {
                Name: "cs:RequiresOwnerToLoad:tooltip"
                String: "If true, this will not load anything unless the owner of the Lot is online."
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
                Name: "cs:UpgradeCollectionId"
                String: "Farm Land"
              }
              Overrides {
                Name: "cs:UpgradeCollectionId:tooltip"
                String: "The Upgrade Collection to load Upgrade related assets for."
              }
              Overrides {
                Name: "cs:UpgradeCollectionId:isrep"
                Bool: false
              }
              Overrides {
                Name: "cs:UpgradeCollectionId:ml"
                Bool: false
              }
              Overrides {
                Name: "cs:DefaultUpgradeId"
                String: "Locked Land 5"
              }
              Overrides {
                Name: "cs:DefaultUpgradeId:tooltip"
                String: "(Optional) If set, this upgrade will be loaded if the Player Lot does not have an owner."
              }
              Overrides {
                Name: "cs:DefaultUpgradeId:isrep"
                Bool: false
              }
              Overrides {
                Name: "cs:DefaultUpgradeId:ml"
                Bool: false
              }
              Overrides {
                Name: "cs:UpgradeId"
                String: "Land Expansion 5"
              }
              Overrides {
                Name: "cs:UpgradeId:tooltip"
                String: "(Optional) If set, will only check for this specific Upgrade. Useful for non linear Upgrade Collections."
              }
              Overrides {
                Name: "cs:UpgradeId:isrep"
                Bool: false
              }
              Overrides {
                Name: "cs:UpgradeId:ml"
                Bool: false
              }
              Overrides {
                Name: "cs:TemplateSetId"
                String: ""
              }
              Overrides {
                Name: "cs:TemplateSetId:tooltip"
                String: "(Optional) If set, this template set will be used to spawn the assets from if it exists. Otherwise the first template set found will be used."
              }
              Overrides {
                Name: "cs:TemplateSetId:isrep"
                Bool: false
              }
              Overrides {
                Name: "cs:TemplateSetId:ml"
                Bool: false
              }
            }
          }
          ParameterOverrideMap {
            key: 16700948332636095262
            value {
              Overrides {
                Name: "bp:Color"
                Color {
                  R: 0.0754304603
                  G: 0.085
                  A: 1
                }
              }
              Overrides {
                Name: "Position"
                Vector {
                  Z: 9.99505615
                }
              }
              Overrides {
                Name: "Scale"
                Vector {
                  X: 27.0462303
                  Y: 21.2497978
                  Z: 0.16765748
                }
              }
            }
          }
          TemplateAsset {
            Id: 9441528603996975911
          }
        }
      }
      Objects {
        Id: 944036220256897032
        Name: "Player Lot Upgrade Loader"
        Transform {
          Location {
            X: 12479.1934
            Y: 24278.1133
            Z: -98
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 9603143116996983271
        TemplateInstance {
          ParameterOverrideMap {
            key: 8995608314112120718
            value {
              Overrides {
                Name: "Name"
                String: "Player Lot Upgrade Loader (Land 6)"
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
                Name: "Position"
                Vector {
                  X: 2923.85254
                  Y: 1048.67969
                  Z: 99.9999924
                }
              }
              Overrides {
                Name: "Rotation"
                Rotator {
                }
              }
              Overrides {
                Name: "cs:RequiresOwnerToLoad"
                Bool: false
              }
              Overrides {
                Name: "cs:RequiresOwnerToLoad:tooltip"
                String: "If true, this will not load anything unless the owner of the Lot is online."
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
                Name: "cs:UpgradeCollectionId"
                String: "Farm Land"
              }
              Overrides {
                Name: "cs:UpgradeCollectionId:tooltip"
                String: "The Upgrade Collection to load Upgrade related assets for."
              }
              Overrides {
                Name: "cs:UpgradeCollectionId:isrep"
                Bool: false
              }
              Overrides {
                Name: "cs:UpgradeCollectionId:ml"
                Bool: false
              }
              Overrides {
                Name: "cs:DefaultUpgradeId"
                String: "Locked Land 6"
              }
              Overrides {
                Name: "cs:DefaultUpgradeId:tooltip"
                String: "(Optional) If set, this upgrade will be loaded if the Player Lot does not have an owner."
              }
              Overrides {
                Name: "cs:DefaultUpgradeId:isrep"
                Bool: false
              }
              Overrides {
                Name: "cs:DefaultUpgradeId:ml"
                Bool: false
              }
              Overrides {
                Name: "cs:UpgradeId"
                String: "Land Expansion 6"
              }
              Overrides {
                Name: "cs:UpgradeId:tooltip"
                String: "(Optional) If set, will only check for this specific Upgrade. Useful for non linear Upgrade Collections."
              }
              Overrides {
                Name: "cs:UpgradeId:isrep"
                Bool: false
              }
              Overrides {
                Name: "cs:UpgradeId:ml"
                Bool: false
              }
              Overrides {
                Name: "cs:TemplateSetId"
                String: ""
              }
              Overrides {
                Name: "cs:TemplateSetId:tooltip"
                String: "(Optional) If set, this template set will be used to spawn the assets from if it exists. Otherwise the first template set found will be used."
              }
              Overrides {
                Name: "cs:TemplateSetId:isrep"
                Bool: false
              }
              Overrides {
                Name: "cs:TemplateSetId:ml"
                Bool: false
              }
            }
          }
          ParameterOverrideMap {
            key: 16700948332636095262
            value {
              Overrides {
                Name: "Position"
                Vector {
                  Z: 9.99505615
                }
              }
              Overrides {
                Name: "Scale"
                Vector {
                  X: 27.0462303
                  Y: 21.2497978
                  Z: 0.16765748
                }
              }
              Overrides {
                Name: "bp:Color"
                Color {
                  R: 0.0754304603
                  G: 0.085
                  A: 1
                }
              }
            }
          }
          TemplateAsset {
            Id: 9441528603996975911
          }
        }
      }
      Objects {
        Id: 5387572361689412577
        Name: "Player Lot Replicator Loader (Debris)"
        Transform {
          Location {
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 6508079714495392492
        ChildIds: 5184068235181454043
        ChildIds: 6692645746175540387
        UnregisteredParameters {
          Overrides {
            Name: "cs:RequireOwnerToLoad"
            Bool: false
          }
          Overrides {
            Name: "cs:Replicator"
            ObjectReference {
              SubObjectId: 13309247321061115778
            }
          }
          Overrides {
            Name: "cs:SharedStorageKey"
            NetReference {
              Type {
                Value: "mc:enetreferencetype:unknown"
              }
            }
          }
          Overrides {
            Name: "cs:StorageKey"
            String: "BackYardDebris"
          }
          Overrides {
            Name: "cs:Identifier"
            String: "BackYardDebris"
          }
          Overrides {
            Name: "cs:Populate"
            Bool: false
          }
          Overrides {
            Name: "cs:Replicator:tooltip"
            String: "Loads and unloads the Replicator when the Player Lot loads and unloads. This should point to the object with the \"UserFunctions\" and \"Parent\" properties."
          }
          Overrides {
            Name: "cs:StorageKey:tooltip"
            String: "The key to use for storing the data in Player Storage for this Replicator. This should be unique across all Replicators."
          }
          Overrides {
            Name: "cs:Identifier:tooltip"
            String: "A tag that can be used to limit what can be placed in the Replicator or allow other scripts to pick out this specific Replicator."
          }
          Overrides {
            Name: "cs:Populate:tooltip"
            String: "If true, and the Replicator has objects already existing in its Static Context folder, these objects will be added to its internal state and saved."
          }
          Overrides {
            Name: "cs:SharedStorageKey:tooltip"
            String: "An optional Shared Storage Key to save and load the replicator data from."
          }
          Overrides {
            Name: "cs:RequireOwnerToLoad:tooltip"
            String: "If true, the Replicator will not load until the Player Lot has an owner."
          }
        }
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
        Id: 5184068235181454043
        Name: "PlayerLotReplicatorLoaderServer"
        Transform {
          Location {
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 5387572361689412577
        UnregisteredParameters {
          Overrides {
            Name: "cs:ComponentRoot"
            ObjectReference {
              SubObjectId: 5387572361689412577
            }
          }
        }
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
        Script {
          ScriptAsset {
            Id: 13139588374210945403
          }
        }
        IsAdvanced: true
        NetworkRelevanceDistance {
          Value: "mc:eproxyrelevance:critical"
        }
      }
      Objects {
        Id: 6692645746175540387
        Name: "ClientContext"
        Transform {
          Location {
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 5387572361689412577
        ChildIds: 9718916776725959718
        Collidable_v2 {
          Value: "mc:ecollisionsetting:forceoff"
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
        NetworkContext {
        }
        IsAdvanced: true
        NetworkRelevanceDistance {
          Value: "mc:eproxyrelevance:critical"
        }
      }
      Objects {
        Id: 9718916776725959718
        Name: "PlayerLotReplicatorLoaderClient"
        Transform {
          Location {
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 6692645746175540387
        UnregisteredParameters {
          Overrides {
            Name: "cs:ComponentRoot"
            ObjectReference {
              SubObjectId: 5387572361689412577
            }
          }
        }
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
        Script {
          ScriptAsset {
            Id: 10089811666579520288
          }
        }
        NetworkRelevanceDistance {
          Value: "mc:eproxyrelevance:critical"
        }
      }
      Objects {
        Id: 13309247321061115778
        Name: "Gatherable Debris Replicator"
        Transform {
          Location {
            Z: 100
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 6508079714495392492
        ChildIds: 12581956034489847184
        ChildIds: 18166442838708716781
        ChildIds: 10959088932412174454
        UnregisteredParameters {
          Overrides {
            Name: "cs:UserFunctions"
            AssetReference {
              Id: 18146943269460124834
            }
          }
          Overrides {
            Name: "cs:Parent"
            ObjectReference {
              SubObjectId: 10959088932412174454
            }
          }
        }
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
        Id: 12581956034489847184
        Name: "CoreHierarchyReplicatorServer"
        Transform {
          Location {
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 13309247321061115778
        UnregisteredParameters {
          Overrides {
            Name: "cs:ComponentRoot"
            ObjectReference {
              SubObjectId: 13309247321061115778
            }
          }
        }
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Script {
          ScriptAsset {
            Id: 13852825441613215519
          }
        }
        IsAdvanced: true
        NetworkRelevanceDistance {
          Value: "mc:eproxyrelevance:critical"
        }
      }
      Objects {
        Id: 18166442838708716781
        Name: "ClientContext"
        Transform {
          Location {
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 13309247321061115778
        ChildIds: 329817453105827875
        Collidable_v2 {
          Value: "mc:ecollisionsetting:forceoff"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        NetworkContext {
        }
        IsAdvanced: true
        NetworkRelevanceDistance {
          Value: "mc:eproxyrelevance:critical"
        }
      }
      Objects {
        Id: 329817453105827875
        Name: "CoreHierarchyReplicatorClient"
        Transform {
          Location {
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 18166442838708716781
        UnregisteredParameters {
          Overrides {
            Name: "cs:ComponentRoot"
            ObjectReference {
              SubObjectId: 13309247321061115778
            }
          }
        }
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Script {
          ScriptAsset {
            Id: 5462950747896091420
          }
        }
        NetworkRelevanceDistance {
          Value: "mc:eproxyrelevance:critical"
        }
      }
      Objects {
        Id: 10959088932412174454
        Name: "ReplicatedCoreObjects"
        Transform {
          Location {
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 13309247321061115778
        ChildIds: 1255431925956292357
        UnregisteredParameters {
        }
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
        NetworkContext {
          Type: RuntimeStatic
        }
        NetworkRelevanceDistance {
          Value: "mc:eproxyrelevance:critical"
        }
      }
      Objects {
        Id: 1255431925956292357
        Name: "Back Yard Debris"
        Transform {
          Location {
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 10959088932412174454
        UnregisteredParameters {
          Overrides {
            Name: "cs:GatherableGroupId"
            String: "Back Yard Debris"
          }
        }
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
        Id: 5519096026046326596
        Name: "Player Lot Replicator Loader (Placeables)"
        Transform {
          Location {
          }
          Rotation {
            Yaw: 6.83018425e-06
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 6508079714495392492
        ChildIds: 15834046068045579217
        ChildIds: 9428409247090106674
        UnregisteredParameters {
          Overrides {
            Name: "cs:RequireOwnerToLoad"
            Bool: false
          }
          Overrides {
            Name: "cs:Replicator"
            ObjectReference {
              SubObjectId: 2808069152153020518
            }
          }
          Overrides {
            Name: "cs:SharedStorageKey"
            NetReference {
              Type {
                Value: "mc:enetreferencetype:unknown"
              }
            }
          }
          Overrides {
            Name: "cs:StorageKey"
            String: "BackYardPlaceables"
          }
          Overrides {
            Name: "cs:Identifier"
            String: "BackYardPlaceables"
          }
          Overrides {
            Name: "cs:Populate"
            Bool: false
          }
          Overrides {
            Name: "cs:Replicator:tooltip"
            String: "Loads and unloads the Replicator when the Player Lot loads and unloads. This should point to the object with the \"UserFunctions\" and \"Parent\" properties."
          }
          Overrides {
            Name: "cs:StorageKey:tooltip"
            String: "The key to use for storing the data in Player Storage for this Replicator. This should be unique across all Replicators."
          }
          Overrides {
            Name: "cs:Identifier:tooltip"
            String: "A tag that can be used to limit what can be placed in the Replicator or allow other scripts to pick out this specific Replicator."
          }
          Overrides {
            Name: "cs:Populate:tooltip"
            String: "If true, and the Replicator has objects already existing in its Static Context folder, these objects will be added to its internal state and saved."
          }
          Overrides {
            Name: "cs:SharedStorageKey:tooltip"
            String: "An optional Shared Storage Key to save and load the replicator data from."
          }
          Overrides {
            Name: "cs:RequireOwnerToLoad:tooltip"
            String: "If true, the Replicator will not load until the Player Lot has an owner."
          }
        }
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
        Id: 15834046068045579217
        Name: "PlayerLotReplicatorLoaderServer"
        Transform {
          Location {
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 5519096026046326596
        UnregisteredParameters {
          Overrides {
            Name: "cs:ComponentRoot"
            ObjectReference {
              SubObjectId: 5519096026046326596
            }
          }
        }
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
        Script {
          ScriptAsset {
            Id: 13139588374210945403
          }
        }
        IsAdvanced: true
        NetworkRelevanceDistance {
          Value: "mc:eproxyrelevance:critical"
        }
      }
      Objects {
        Id: 9428409247090106674
        Name: "ClientContext"
        Transform {
          Location {
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 5519096026046326596
        ChildIds: 86451064196833268
        Collidable_v2 {
          Value: "mc:ecollisionsetting:forceoff"
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
        NetworkContext {
        }
        IsAdvanced: true
        NetworkRelevanceDistance {
          Value: "mc:eproxyrelevance:critical"
        }
      }
      Objects {
        Id: 86451064196833268
        Name: "PlayerLotReplicatorLoaderClient"
        Transform {
          Location {
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 9428409247090106674
        UnregisteredParameters {
          Overrides {
            Name: "cs:ComponentRoot"
            ObjectReference {
              SubObjectId: 5519096026046326596
            }
          }
        }
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
        Script {
          ScriptAsset {
            Id: 10089811666579520288
          }
        }
        NetworkRelevanceDistance {
          Value: "mc:eproxyrelevance:critical"
        }
      }
      Objects {
        Id: 2808069152153020518
        Name: "Placeables Replicator"
        Transform {
          Location {
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 6508079714495392492
        ChildIds: 11465625534715423443
        ChildIds: 4417291151828849675
        ChildIds: 12652279975817402783
        UnregisteredParameters {
          Overrides {
            Name: "cs:UserFunctions"
            AssetReference {
              Id: 3797820098805527651
            }
          }
          Overrides {
            Name: "cs:Parent"
            ObjectReference {
              SubObjectId: 12652279975817402783
            }
          }
        }
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
        Id: 11465625534715423443
        Name: "CoreHierarchyReplicatorServer"
        Transform {
          Location {
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 2808069152153020518
        UnregisteredParameters {
          Overrides {
            Name: "cs:ComponentRoot"
            ObjectReference {
              SubObjectId: 2808069152153020518
            }
          }
        }
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Script {
          ScriptAsset {
            Id: 13852825441613215519
          }
        }
        IsAdvanced: true
        NetworkRelevanceDistance {
          Value: "mc:eproxyrelevance:critical"
        }
      }
      Objects {
        Id: 4417291151828849675
        Name: "ClientContext"
        Transform {
          Location {
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 2808069152153020518
        ChildIds: 3391812201072327773
        Collidable_v2 {
          Value: "mc:ecollisionsetting:forceoff"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        NetworkContext {
        }
        IsAdvanced: true
        NetworkRelevanceDistance {
          Value: "mc:eproxyrelevance:critical"
        }
      }
      Objects {
        Id: 3391812201072327773
        Name: "CoreHierarchyReplicatorClient"
        Transform {
          Location {
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 4417291151828849675
        UnregisteredParameters {
          Overrides {
            Name: "cs:ComponentRoot"
            ObjectReference {
              SubObjectId: 2808069152153020518
            }
          }
        }
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Script {
          ScriptAsset {
            Id: 5462950747896091420
          }
        }
        NetworkRelevanceDistance {
          Value: "mc:eproxyrelevance:critical"
        }
      }
      Objects {
        Id: 12652279975817402783
        Name: "ReplicatedCoreObjects"
        Transform {
          Location {
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 2808069152153020518
        ChildIds: 6830137677107449213
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
        NetworkContext {
          Type: RuntimeStatic
        }
        NetworkRelevanceDistance {
          Value: "mc:eproxyrelevance:critical"
        }
      }
      Objects {
        Id: 6830137677107449213
        Name: "Prebuilt Placeable"
        Transform {
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 12652279975817402783
        TemplateInstance {
          ParameterOverrideMap {
            key: 2636048883921823286
            value {
              Overrides {
                Name: "Name"
                String: "Prebuilt Placeable"
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
                Name: "Position"
                Vector {
                  X: -3903.83496
                  Y: -1518.70508
                  Z: 177.4
                }
              }
              Overrides {
                Name: "cs:PlaceableId"
                String: "Decorative Table"
              }
            }
          }
          ParameterOverrideMap {
            key: 17881350601930529513
            value {
              Overrides {
                Name: "bp:Absolute Scale"
                Bool: false
              }
              Overrides {
                Name: "Position"
                Vector {
                  Z: 56.9412689
                }
              }
              Overrides {
                Name: "Scale"
                Vector {
                  X: 0.871017098
                  Y: 0.871017098
                  Z: 1.14072204
                }
              }
            }
          }
          TemplateAsset {
            Id: 476602914582990699
          }
        }
      }
      Objects {
        Id: 13913392195523155675
        Name: "Backyard Placeholder"
        Transform {
          Location {
          }
          Rotation {
            Yaw: 89.9999084
          }
          Scale {
            X: 63.075
            Y: 110.243
            Z: 1
          }
        }
        ParentId: 5836927775022052130
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 3126861794795096530
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:color"
            Color {
              R: 0.0989403352
              G: 0.179999948
              A: 1
            }
          }
        }
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
        CoreMesh {
          MeshAsset {
            Id: 1903440566860194223
          }
          Teams {
            IsTeamCollisionEnabled: true
            IsEnemyCollisionEnabled: true
          }
          DisableDistanceFieldLighting: true
          StaticMesh {
            Physics {
              Mass: 100
              LinearDamping: 0.01
            }
            BoundsScale: 1
          }
        }
        Relevance {
          Value: "mc:eproxyrelevance:critical"
        }
        NetworkRelevanceDistance {
          Value: "mc:eproxyrelevance:critical"
        }
      }
    }
    Assets {
      Id: 6442861049751997091
      Name: "Dummy Object"
      PlatformAssetType: 6
      PrimaryAsset {
        AssetType: "BlueprintAssetRef"
        AssetId: "fxbp_dummy_pivot"
      }
    }
    Assets {
      Id: 1903440566860194223
      Name: "Cube - Bottom-Aligned"
      PlatformAssetType: 1
      PrimaryAsset {
        AssetType: "StaticMeshAssetRef"
        AssetId: "sm_cube_001"
      }
    }
    PrimaryAssetId {
      AssetType: "None"
      AssetId: "None"
    }
  }
  SerializationVersion: 110
  VirtualFolderPath: "Art and Collision - Farm"
  VirtualFolderPath: "Areas"
}
