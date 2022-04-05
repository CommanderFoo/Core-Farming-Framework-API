Assets {
  Id: 13755345140416778812
  Name: "Player Farm - Front Yard"
  PlatformAssetType: 5
  TemplateAsset {
    ObjectBlock {
      RootId: 16168412818509290283
      Objects {
        Id: 16168412818509290283
        Name: "Front Yard"
        Transform {
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 11897029062006916514
        ChildIds: 9544296371713185208
        ChildIds: 15745653892156450829
        ChildIds: 880059351677451015
        ChildIds: 5968819137463351339
        ChildIds: 1603581654130172861
        ChildIds: 9619341415460899468
        ChildIds: 7187144013156160353
        ChildIds: 4197782376100787871
        ChildIds: 12934309498998507651
        ChildIds: 3822097903070271189
        ChildIds: 5835120082117998377
        ChildIds: 11454385233129807288
        ChildIds: 2807148479287079419
        ChildIds: 11451595860799656721
        ChildIds: 5433795213735458477
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
        Id: 9544296371713185208
        Name: "Player Lot Setup"
        Transform {
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 16168412818509290283
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
                Name: "cs:PlayerLot"
                ObjectReference {
                  SubObjectId: 16168412818509290283
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
                String: "Front Yard"
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
          ParameterOverrideMap {
            key: 15780582947342876332
            value {
              Overrides {
                Name: "cs:ComponentRoot"
                ObjectReference {
                  SubObjectId: 2107050717965066511
                }
              }
            }
          }
          TemplateAsset {
            Id: 4375924379775680731
          }
        }
      }
      Objects {
        Id: 15745653892156450829
        Name: "Area Player Lot Loader"
        Transform {
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 16168412818509290283
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
          ParameterOverrideMap {
            key: 17367524337397615604
            value {
              Overrides {
                Name: "cs:ComponentRoot"
                ObjectReference {
                  SubObjectId: 1015723319237345310
                }
              }
            }
          }
          TemplateAsset {
            Id: 18432192991312495731
          }
        }
      }
      Objects {
        Id: 880059351677451015
        Name: "Player Lot Spawn Point (Road)"
        Transform {
          Location {
            X: 0.00048828125
            Y: 1289.99951
            Z: 208.442017
          }
          Rotation {
            Yaw: -90
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 16168412818509290283
        ChildIds: 18370157568577703240
        ChildIds: 5876632331553553232
        ChildIds: 17624542685484868411
        UnregisteredParameters {
          Overrides {
            Name: "cs:PlayerLot"
            ObjectReference {
              SubObjectId: 16168412818509290283
            }
          }
          Overrides {
            Name: "cs:SpawnPointKey"
            String: "Road"
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
        Id: 18370157568577703240
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
        ParentId: 880059351677451015
        UnregisteredParameters {
          Overrides {
            Name: "cs:ComponentRoot"
            ObjectReference {
              SubObjectId: 880059351677451015
            }
          }
          Overrides {
            Name: "cs:Target"
            ObjectReference {
              SubObjectId: 17624542685484868411
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
        Id: 5876632331553553232
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
        ParentId: 880059351677451015
        ChildIds: 10936277881543300599
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
        Id: 10936277881543300599
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
        ParentId: 5876632331553553232
        UnregisteredParameters {
          Overrides {
            Name: "cs:ComponentRoot"
            ObjectReference {
              SubObjectId: 880059351677451015
            }
          }
          Overrides {
            Name: "cs:Target"
            ObjectReference {
              SubObjectId: 17624542685484868411
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
        Id: 17624542685484868411
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
        ParentId: 880059351677451015
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
              G: 0.736000061
              B: 0.688019097
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
        Id: 5968819137463351339
        Name: "Player Lot Spawn Point (House)"
        Transform {
          Location {
            X: -1279.97119
            Y: -199.994446
            Z: 208.442017
          }
          Rotation {
            Yaw: 90
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 16168412818509290283
        ChildIds: 11294846717953235229
        ChildIds: 12983043864178828653
        ChildIds: 11416806509481123749
        UnregisteredParameters {
          Overrides {
            Name: "cs:PlayerLot"
            ObjectReference {
              SubObjectId: 16168412818509290283
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
        Id: 11294846717953235229
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
        ParentId: 5968819137463351339
        UnregisteredParameters {
          Overrides {
            Name: "cs:ComponentRoot"
            ObjectReference {
              SubObjectId: 5968819137463351339
            }
          }
          Overrides {
            Name: "cs:Target"
            ObjectReference {
              SubObjectId: 11416806509481123749
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
        Id: 12983043864178828653
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
        ParentId: 5968819137463351339
        ChildIds: 13850497911837320016
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
        Id: 13850497911837320016
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
        ParentId: 12983043864178828653
        UnregisteredParameters {
          Overrides {
            Name: "cs:ComponentRoot"
            ObjectReference {
              SubObjectId: 5968819137463351339
            }
          }
          Overrides {
            Name: "cs:Target"
            ObjectReference {
              SubObjectId: 11416806509481123749
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
        Id: 11416806509481123749
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
        ParentId: 5968819137463351339
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
              G: 0.736000061
              B: 0.688019097
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
        Id: 1603581654130172861
        Name: "Player Lot Spawn Point (Gate)"
        Transform {
          Location {
            X: 1129.979
            Y: -209.995026
            Z: 208.442017
          }
          Rotation {
            Yaw: 90.0000229
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 16168412818509290283
        ChildIds: 8704438759619411628
        ChildIds: 11378562959723242571
        ChildIds: 4978764923918043171
        UnregisteredParameters {
          Overrides {
            Name: "cs:PlayerLot"
            ObjectReference {
              SubObjectId: 16168412818509290283
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
        Id: 8704438759619411628
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
        ParentId: 1603581654130172861
        UnregisteredParameters {
          Overrides {
            Name: "cs:ComponentRoot"
            ObjectReference {
              SubObjectId: 1603581654130172861
            }
          }
          Overrides {
            Name: "cs:Target"
            ObjectReference {
              SubObjectId: 4978764923918043171
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
        Id: 11378562959723242571
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
        ParentId: 1603581654130172861
        ChildIds: 18290987934283572622
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
        Id: 18290987934283572622
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
        ParentId: 11378562959723242571
        UnregisteredParameters {
          Overrides {
            Name: "cs:ComponentRoot"
            ObjectReference {
              SubObjectId: 1603581654130172861
            }
          }
          Overrides {
            Name: "cs:Target"
            ObjectReference {
              SubObjectId: 4978764923918043171
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
        Id: 4978764923918043171
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
        ParentId: 1603581654130172861
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
              G: 0.736000061
              B: 0.688019097
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
        Id: 9619341415460899468
        Name: "Player Lot Object Loader (Home Marker)"
        Transform {
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 16168412818509290283
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        TemplateInstance {
          ParameterOverrideMap {
            key: 5269134746227665817
            value {
              Overrides {
                Name: "Name"
                String: "Player Lot Object Loader (Home Marker)"
              }
              Overrides {
                Name: "Position"
                Vector {
                  Y: 761.301331
                  Z: 1116.06494
                }
              }
              Overrides {
                Name: "Rotation"
                Rotator {
                  Yaw: 90
                }
              }
              Overrides {
                Name: "cs:ClientAsset"
                AssetReference {
                  Id: 1812380577845185708
                }
              }
              Overrides {
                Name: "cs:RequiresOwnerToLoad"
                Bool: true
              }
              Overrides {
                Name: "cs:VisibleToOwnerOnly"
                Bool: true
              }
            }
          }
          ParameterOverrideMap {
            key: 16524940300580709148
            value {
              Overrides {
                Name: "Position"
                Vector {
                  Z: 51.2923584
                }
              }
              Overrides {
                Name: "Rotation"
                Rotator {
                  Yaw: -90
                }
              }
              Overrides {
                Name: "Scale"
                Vector {
                  X: 7.71260738
                  Y: 0.519700944
                  Z: 1
                }
              }
              Overrides {
                Name: "bp:Color"
                Color {
                  R: 0.410000026
                  G: 1
                  B: 0.753841162
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
        Id: 7187144013156160353
        Name: "Player Lot Object Loader"
        Transform {
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 16168412818509290283
        TemplateInstance {
          ParameterOverrideMap {
            key: 5269134746227665817
            value {
              Overrides {
                Name: "Name"
                String: "Player Lot Object Loader (Front Yard Art)"
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
                  Id: 17214597058087582816
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
            }
          }
          ParameterOverrideMap {
            key: 16524940300580709148
            value {
              Overrides {
                Name: "bp:Type"
                Enum {
                  Value: "mc:evolumetype:0"
                }
              }
              Overrides {
                Name: "bp:Color"
                Color {
                  R: 0.0723178163
                  G: 0.419999957
                  A: 1
                }
              }
              Overrides {
                Name: "bp:Absolute Scale"
                Bool: false
              }
              Overrides {
                Name: "Scale"
                Vector {
                  X: 44.5727348
                  Y: 1.00000346
                  Z: 3.6710937
                }
              }
              Overrides {
                Name: "Position"
                Vector {
                  Y: -821.224426
                  Z: 284.920715
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
        Id: 4197782376100787871
        Name: "Player Lot Upgrade Loader"
        Transform {
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 16168412818509290283
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
                String: "Front Yard"
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
              Overrides {
                Name: "Position"
                Vector {
                  X: -1149.2085
                  Y: -579.095459
                  Z: 100
                }
              }
            }
          }
          ParameterOverrideMap {
            key: 16700948332636095262
            value {
              Overrides {
                Name: "bp:Type"
                Enum {
                  Value: "mc:evolumetype:0"
                }
              }
              Overrides {
                Name: "Scale"
                Vector {
                  X: 8.30641556
                  Y: 1.12684381
                  Z: 8.18199539
                }
              }
              Overrides {
                Name: "bp:Absolute Scale"
                Bool: false
              }
              Overrides {
                Name: "bp:Color"
                Color {
                  R: 0.259
                  G: 0.242945448
                  B: 0.0725199953
                  A: 1
                }
              }
              Overrides {
                Name: "Position"
                Vector {
                  Z: 404.459869
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
        Id: 12934309498998507651
        Name: "Player Lot Upgrade Loader"
        Transform {
          Location {
            X: 6025
            Y: -1704.47876
            Z: -98.5
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 16168412818509290283
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
                  X: 1075.14941
                  Y: -730.702393
                  Z: 100
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
                String: "Front Yard"
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
                  R: 0.259
                  G: 0.242945448
                  B: 0.0725199953
                  A: 1
                }
              }
              Overrides {
                Name: "bp:Type"
                Enum {
                  Value: "mc:evolumetype:0"
                }
              }
              Overrides {
                Name: "Scale"
                Vector {
                  X: 7.01953077
                  Y: 0.999997735
                  Z: 8.29294395
                }
              }
              Overrides {
                Name: "bp:Absolute Scale"
                Bool: false
              }
              Overrides {
                Name: "Position"
                Vector {
                  X: 36.3374
                  Z: 411.232117
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
        Id: 3822097903070271189
        Name: "Player Lot Upgrade Loader"
        Transform {
          Location {
            X: 6025
            Y: -1704.47876
            Z: -98.5
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 16168412818509290283
        TemplateInstance {
          ParameterOverrideMap {
            key: 8995608314112120718
            value {
              Overrides {
                Name: "Name"
                String: "Player Lot Upgrade Loader (Fruit Stand)"
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
                  X: 1791.7832
                  Y: 720.356567
                  Z: 102.631744
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
                String: "Fruit Stand"
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
                String: "Damaged Fruit Stand"
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
                  R: 0.259
                  G: 0.242945448
                  B: 0.0725199953
                  A: 1
                }
              }
              Overrides {
                Name: "bp:Type"
                Enum {
                  Value: "mc:evolumetype:0"
                }
              }
              Overrides {
                Name: "Position"
                Vector {
                  Z: 127.480072
                }
              }
              Overrides {
                Name: "bp:Absolute Scale"
                Bool: false
              }
              Overrides {
                Name: "Scale"
                Vector {
                  X: 3.8124795
                  Y: 1.57106411
                  Z: 2.56860137
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
        Id: 5835120082117998377
        Name: "Player Lot Replicator Loader"
        Transform {
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 16168412818509290283
        ChildIds: 3370769730585287084
        ChildIds: 12214602721967462007
        UnregisteredParameters {
          Overrides {
            Name: "cs:RequireOwnerToLoad"
            Bool: false
          }
          Overrides {
            Name: "cs:Replicator"
            ObjectReference {
              SubObjectId: 11454385233129807288
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
            String: "FrontYardDebris"
          }
          Overrides {
            Name: "cs:Identifier"
            String: "FrontYardDebris"
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
        Id: 3370769730585287084
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
        ParentId: 5835120082117998377
        UnregisteredParameters {
          Overrides {
            Name: "cs:ComponentRoot"
            ObjectReference {
              SubObjectId: 5835120082117998377
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
        Id: 12214602721967462007
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
        ParentId: 5835120082117998377
        ChildIds: 3038601447099337424
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
        Id: 3038601447099337424
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
        ParentId: 12214602721967462007
        UnregisteredParameters {
          Overrides {
            Name: "cs:ComponentRoot"
            ObjectReference {
              SubObjectId: 5835120082117998377
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
        Id: 11454385233129807288
        Name: "Gatherable Debris Replicator"
        Transform {
          Location {
          }
          Rotation {
            Yaw: 6.83018243e-06
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 16168412818509290283
        ChildIds: 14742095386146344687
        ChildIds: 11180266878437739382
        ChildIds: 13897997270080293404
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
              SubObjectId: 13897997270080293404
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
        Id: 14742095386146344687
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
        ParentId: 11454385233129807288
        UnregisteredParameters {
          Overrides {
            Name: "cs:ComponentRoot"
            ObjectReference {
              SubObjectId: 11454385233129807288
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
        Id: 11180266878437739382
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
        ParentId: 11454385233129807288
        ChildIds: 17927969242264751731
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
        Id: 17927969242264751731
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
        ParentId: 11180266878437739382
        UnregisteredParameters {
          Overrides {
            Name: "cs:ComponentRoot"
            ObjectReference {
              SubObjectId: 11454385233129807288
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
        IsAdvanced: true
        NetworkRelevanceDistance {
          Value: "mc:eproxyrelevance:critical"
        }
      }
      Objects {
        Id: 13897997270080293404
        Name: "ReplicatedCoreObjects (Reset your data after changing these!)"
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
        ParentId: 11454385233129807288
        ChildIds: 8811979371211200756
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
        Id: 8811979371211200756
        Name: "Front Yard Debris"
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
        ParentId: 13897997270080293404
        ChildIds: 18268626316079038915
        UnregisteredParameters {
          Overrides {
            Name: "cs:GatherableGroupId"
            String: "Front Yard Debris"
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
        Id: 18268626316079038915
        Name: "The Custom Property on this group is for GatherableGroups Table"
        Transform {
          Location {
            X: 1.52587891e-05
            Y: 128.080917
            Z: 109.618073
          }
          Rotation {
          }
          Scale {
            X: 41.7626495
            Y: 11.9450216
            Z: 0.223972619
          }
        }
        ParentId: 8811979371211200756
        UnregisteredParameters {
          Overrides {
            Name: "bp:Type"
            Enum {
              Value: "mc:evolumetype:0"
            }
          }
          Overrides {
            Name: "bp:Absolute Scale"
            Bool: false
          }
          Overrides {
            Name: "bp:Color"
            Color {
              R: 0.0620000027
              G: 0.0541986786
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
      }
      Objects {
        Id: 2807148479287079419
        Name: "Player Lot Replicator Loader"
        Transform {
          Location {
          }
          Rotation {
            Yaw: 6.83018516e-06
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 16168412818509290283
        ChildIds: 10228351196186005002
        ChildIds: 17157330203298191157
        UnregisteredParameters {
          Overrides {
            Name: "cs:RequireOwnerToLoad"
            Bool: true
          }
          Overrides {
            Name: "cs:Replicator"
            ObjectReference {
              SubObjectId: 11451595860799656721
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
            String: "FrontYardPlaceables"
          }
          Overrides {
            Name: "cs:Identifier"
            String: "FrontYardPlaceables"
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
        Id: 10228351196186005002
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
        ParentId: 2807148479287079419
        UnregisteredParameters {
          Overrides {
            Name: "cs:ComponentRoot"
            ObjectReference {
              SubObjectId: 2807148479287079419
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
        Id: 17157330203298191157
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
        ParentId: 2807148479287079419
        ChildIds: 9143911568974326600
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
        Id: 9143911568974326600
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
        ParentId: 17157330203298191157
        UnregisteredParameters {
          Overrides {
            Name: "cs:ComponentRoot"
            ObjectReference {
              SubObjectId: 2807148479287079419
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
        Id: 11451595860799656721
        Name: "Placeables Replicator"
        Transform {
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 16168412818509290283
        ChildIds: 18000387681884446483
        ChildIds: 13784610589492158240
        ChildIds: 2200847815063911894
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
              SubObjectId: 2200847815063911894
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
        Id: 18000387681884446483
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
        ParentId: 11451595860799656721
        UnregisteredParameters {
          Overrides {
            Name: "cs:ComponentRoot"
            ObjectReference {
              SubObjectId: 11451595860799656721
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
        Id: 13784610589492158240
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
        ParentId: 11451595860799656721
        ChildIds: 14047441423385314197
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
        Id: 14047441423385314197
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
        ParentId: 13784610589492158240
        UnregisteredParameters {
          Overrides {
            Name: "cs:ComponentRoot"
            ObjectReference {
              SubObjectId: 11451595860799656721
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
        Id: 2200847815063911894
        Name: "ReplicatedCoreObjects (Reset your data after changing these!)"
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
        ParentId: 11451595860799656721
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
        Id: 5433795213735458477
        Name: "Front Yard Placeholder"
        Transform {
          Location {
            X: -4.99999952
            Y: -2.41308594
            Z: -1.38066101
          }
          Rotation {
            Yaw: -179.999954
          }
          Scale {
            X: 44.99
            Y: 17.83
            Z: 1
          }
        }
        ParentId: 16168412818509290283
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
              R: 0.0989403501
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
