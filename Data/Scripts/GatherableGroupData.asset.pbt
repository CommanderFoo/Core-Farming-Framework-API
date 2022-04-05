Assets {
  Id: 13292399399888711014
  Name: "GatherableGroupData"
  PlatformAssetType: 3
  TextAsset {
    CustomParameters {
      Overrides {
        Name: "cs:Static"
        AssetReference {
          Id: 841534158063459245
        }
      }
      Overrides {
        Name: "cs:UniqueStorageId"
        Int: 0
      }
      Overrides {
        Name: "cs:Respawn"
        Bool: false
      }
      Overrides {
        Name: "cs:RespawnPlayerMinDistance"
        Float: 500
      }
      Overrides {
        Name: "cs:RespawnPlayerMaxDistance"
        Float: 2500
      }
      Overrides {
        Name: "cs:RespawnWhenNotVisible"
        Bool: true
      }
      Overrides {
        Name: "cs:RandomSpawn"
        Bool: false
      }
      Overrides {
        Name: "cs:RandomSpawnPercent"
        Float: 0
      }
      Overrides {
        Name: "cs:Respawn:tooltip"
        String: "If true, gathered objects will respawn based on the other respawn properties and their RespawnSeconds property."
      }
      Overrides {
        Name: "cs:Respawn:isrep"
        Bool: false
      }
      Overrides {
        Name: "cs:Respawn:ml"
        Bool: false
      }
      Overrides {
        Name: "cs:RespawnPlayerMinDistance:tooltip"
        String: "A Gatherable object will not respawn if any Player is closer than this distance."
      }
      Overrides {
        Name: "cs:RespawnPlayerMinDistance:isrep"
        Bool: false
      }
      Overrides {
        Name: "cs:RespawnPlayerMinDistance:ml"
        Bool: false
      }
      Overrides {
        Name: "cs:RespawnPlayerMaxDistance:tooltip"
        String: "A Gatherable object will ignore Players farther than this distance when making visibility checks to determine if it can respawn."
      }
      Overrides {
        Name: "cs:RespawnPlayerMaxDistance:isrep"
        Bool: false
      }
      Overrides {
        Name: "cs:RespawnPlayerMaxDistance:ml"
        Bool: false
      }
      Overrides {
        Name: "cs:RespawnWhenNotVisible:tooltip"
        String: "If true, Gatherable objects will only respawn when Players are facing away from them."
      }
      Overrides {
        Name: "cs:RespawnWhenNotVisible:isrep"
        Bool: false
      }
      Overrides {
        Name: "cs:RespawnWhenNotVisible:ml"
        Bool: false
      }
      Overrides {
        Name: "cs:RandomSpawn:tooltip"
        String: "If true, Gatherables will randomly spawn based on the \"RandomSpawnPercent\"."
      }
      Overrides {
        Name: "cs:RandomSpawn:isrep"
        Bool: false
      }
      Overrides {
        Name: "cs:RandomSpawn:ml"
        Bool: false
      }
      Overrides {
        Name: "cs:RandomSpawnPercent:tooltip"
        String: "The percentage (0 - 100) of Gatherables in this group to spawn at any given time."
      }
      Overrides {
        Name: "cs:RandomSpawnPercent:isrep"
        Bool: false
      }
      Overrides {
        Name: "cs:RandomSpawnPercent:ml"
        Bool: false
      }
    }
  }
  SerializationVersion: 108
  VirtualFolderPath: "Data"
}
