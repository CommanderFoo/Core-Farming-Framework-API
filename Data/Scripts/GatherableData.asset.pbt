Assets {
  Id: 12507447135978785278
  Name: "GatherableData"
  PlatformAssetType: 3
  TextAsset {
    CustomParameters {
      Overrides {
        Name: "cs:Name"
        String: ""
      }
      Overrides {
        Name: "cs:ValidGatheringToolTypes"
        String: "hand"
      }
      Overrides {
        Name: "cs:ToolsConsumedPerGather"
        Int: 0
      }
      Overrides {
        Name: "cs:InteractionError"
        String: "Could not gather this"
      }
      Overrides {
        Name: "cs:GatherEffects"
        AssetReference {
          Id: 841534158063459245
        }
      }
      Overrides {
        Name: "cs:GatherEffectsOffset"
        Vector {
        }
      }
      Overrides {
        Name: "cs:SpawnTemplateOnLoad"
        Bool: true
      }
      Overrides {
        Name: "cs:RespawnSeconds"
        Float: 0
      }
      Overrides {
        Name: "cs:DestroyGatheredStateDelaySeconds"
        Float: 0
      }
      Overrides {
        Name: "cs:RespawnEffects"
        AssetReference {
          Id: 841534158063459245
        }
      }
      Overrides {
        Name: "cs:RespawnEffectsOffset"
        Vector {
        }
      }
      Overrides {
        Name: "cs:DropOnGather"
        Bool: true
      }
      Overrides {
        Name: "cs:DropEveryGather"
        Bool: true
      }
      Overrides {
        Name: "cs:DropForAllPlayers"
        Bool: true
      }
      Overrides {
        Name: "cs:SinglePlayerDrops"
        Bool: false
      }
      Overrides {
        Name: "cs:MaxPickupsPerDrop"
        Int: 3
      }
      Overrides {
        Name: "cs:DropMinDistance"
        Float: 50
      }
      Overrides {
        Name: "cs:DropMaxDistance"
        Float: 150
      }
      Overrides {
        Name: "cs:DropTimeoutSeconds"
        Float: 60
      }
      Overrides {
        Name: "cs:DropItemPickupTemplate"
        AssetReference {
          Id: 8040246261067913342
        }
      }
      Overrides {
        Name: "cs:State1"
        AssetReference {
          Id: 841534158063459245
        }
      }
      Overrides {
        Name: "cs:State1_Client"
        AssetReference {
          Id: 841534158063459245
        }
      }
      Overrides {
        Name: "cs:State1_Server"
        AssetReference {
          Id: 841534158063459245
        }
      }
      Overrides {
        Name: "cs:State2"
        AssetReference {
          Id: 841534158063459245
        }
      }
      Overrides {
        Name: "cs:State2_Client"
        AssetReference {
          Id: 841534158063459245
        }
      }
      Overrides {
        Name: "cs:State2_Server"
        AssetReference {
          Id: 841534158063459245
        }
      }
      Overrides {
        Name: "cs:State3"
        AssetReference {
          Id: 841534158063459245
        }
      }
      Overrides {
        Name: "cs:State3_Client"
        AssetReference {
          Id: 841534158063459245
        }
      }
      Overrides {
        Name: "cs:State3_Server"
        AssetReference {
          Id: 841534158063459245
        }
      }
      Overrides {
        Name: "cs:GatheredState"
        AssetReference {
          Id: 841534158063459245
        }
      }
      Overrides {
        Name: "cs:GatheredState_Client"
        AssetReference {
          Id: 841534158063459245
        }
      }
      Overrides {
        Name: "cs:GatheredState_Server"
        AssetReference {
          Id: 841534158063459245
        }
      }
      Overrides {
        Name: "cs:ValidGatheringToolTypes:tooltip"
        String: "A comma separated list of tools that are allowed to gather this. An empty string means any tool will be able to gather this."
      }
      Overrides {
        Name: "cs:ValidGatheringToolTypes:isrep"
        Bool: false
      }
      Overrides {
        Name: "cs:ValidGatheringToolTypes:ml"
        Bool: false
      }
      Overrides {
        Name: "cs:InteractionError:tooltip"
        String: "An error that is broadcast if the Player tries to interact wth this Gatherable with the wrong Equipment."
      }
      Overrides {
        Name: "cs:InteractionError:isrep"
        Bool: false
      }
      Overrides {
        Name: "cs:InteractionError:ml"
        Bool: false
      }
      Overrides {
        Name: "cs:GatherEffects:tooltip"
        String: "This template will be spawned every time this is gathered. It is recommended to have a lifespan on this template. A default lifespan of 5 seconds will be used if it is set to 0."
      }
      Overrides {
        Name: "cs:GatherEffects:isrep"
        Bool: false
      }
      Overrides {
        Name: "cs:GatherEffects:ml"
        Bool: false
      }
      Overrides {
        Name: "cs:GatherEffectsOffset:tooltip"
        String: "This will move where the \"GatherEffects\" template spawns. It can be used to position the effect exactly where you need it."
      }
      Overrides {
        Name: "cs:GatherEffectsOffset:isrep"
        Bool: false
      }
      Overrides {
        Name: "cs:GatherEffectsOffset:ml"
        Bool: false
      }
      Overrides {
        Name: "cs:SpawnTemplateOnLoad:tooltip"
        String: "If true, the first state template will be spawned in place of the existing object. This allows you to use simple proxy objects in your template to reduce object count."
      }
      Overrides {
        Name: "cs:SpawnTemplateOnLoad:isrep"
        Bool: false
      }
      Overrides {
        Name: "cs:SpawnTemplateOnLoad:ml"
        Bool: false
      }
      Overrides {
        Name: "cs:RespawnSeconds:tooltip"
        String: "If \"Respawn\" is true on the parent Gatherables Group, the gatherable will respawn after this amount of seconds has passed and it can be respawned."
      }
      Overrides {
        Name: "cs:RespawnSeconds:isrep"
        Bool: false
      }
      Overrides {
        Name: "cs:RespawnSeconds:ml"
        Bool: false
      }
      Overrides {
        Name: "cs:RespawnSeconds:category"
        String: "Custom"
      }
      Overrides {
        Name: "cs:RespawnSeconds:subcategory"
        String: "Respawn"
      }
      Overrides {
        Name: "cs:DestroyGatheredStateDelaySeconds:tooltip"
        String: "Waits this amount of seconds before destroying a Gatherable with a \"GatheredState\" to respawn other Gatherables."
      }
      Overrides {
        Name: "cs:DestroyGatheredStateDelaySeconds:isrep"
        Bool: false
      }
      Overrides {
        Name: "cs:DestroyGatheredStateDelaySeconds:ml"
        Bool: false
      }
      Overrides {
        Name: "cs:DestroyGatheredStateDelaySeconds:subcategory"
        String: "Respawn"
      }
      Overrides {
        Name: "cs:RespawnEffects:tooltip"
        String: "If \"Respawn\" is true on the parent Gatherables Group, this template will be spawned when the gatherable respawns."
      }
      Overrides {
        Name: "cs:RespawnEffects:isrep"
        Bool: false
      }
      Overrides {
        Name: "cs:RespawnEffects:ml"
        Bool: false
      }
      Overrides {
        Name: "cs:RespawnEffects:category"
        String: "Custom"
      }
      Overrides {
        Name: "cs:RespawnEffects:subcategory"
        String: "Respawn"
      }
      Overrides {
        Name: "cs:RespawnEffectsOffset:tooltip"
        String: "This will move where the \"RespawnEffects\" template spawns. It can be used to position the effect exactly where you need it."
      }
      Overrides {
        Name: "cs:RespawnEffectsOffset:isrep"
        Bool: false
      }
      Overrides {
        Name: "cs:RespawnEffectsOffset:ml"
        Bool: false
      }
      Overrides {
        Name: "cs:RespawnEffectsOffset:category"
        String: "Custom"
      }
      Overrides {
        Name: "cs:RespawnEffectsOffset:subcategory"
        String: "Respawn"
      }
      Overrides {
        Name: "cs:DropOnGather:tooltip"
        String: "If true, gathered objects will drop their contents into the world. Otherwise they will be directly added to the highest priority Inventory."
      }
      Overrides {
        Name: "cs:DropOnGather:isrep"
        Bool: false
      }
      Overrides {
        Name: "cs:DropOnGather:ml"
        Bool: false
      }
      Overrides {
        Name: "cs:DropOnGather:category"
        String: "Custom"
      }
      Overrides {
        Name: "cs:DropOnGather:subcategory"
        String: "Drops"
      }
      Overrides {
        Name: "cs:DropEveryGather:tooltip"
        String: "If true, drops will be created every time this is gathered from. Otherwise, drops will only be created when the gatherable is fully gathered."
      }
      Overrides {
        Name: "cs:DropEveryGather:isrep"
        Bool: false
      }
      Overrides {
        Name: "cs:DropEveryGather:ml"
        Bool: false
      }
      Overrides {
        Name: "cs:DropEveryGather:category"
        String: "Custom"
      }
      Overrides {
        Name: "cs:DropEveryGather:subcategory"
        String: "Drops"
      }
      Overrides {
        Name: "cs:DropForAllPlayers:tooltip"
        String: "If true, gathered objects will drop on all clients if DropOnGather is also true."
      }
      Overrides {
        Name: "cs:DropForAllPlayers:isrep"
        Bool: false
      }
      Overrides {
        Name: "cs:DropForAllPlayers:ml"
        Bool: false
      }
      Overrides {
        Name: "cs:DropForAllPlayers:category"
        String: "Custom"
      }
      Overrides {
        Name: "cs:DropForAllPlayers:subcategory"
        String: "Drops"
      }
      Overrides {
        Name: "cs:SinglePlayerDrops:tooltip"
        String: "If true, gathered object drops will be destroyed on other clients when the first Player picks them up."
      }
      Overrides {
        Name: "cs:SinglePlayerDrops:isrep"
        Bool: false
      }
      Overrides {
        Name: "cs:SinglePlayerDrops:ml"
        Bool: false
      }
      Overrides {
        Name: "cs:SinglePlayerDrops:category"
        String: "Custom"
      }
      Overrides {
        Name: "cs:SinglePlayerDrops:subcategory"
        String: "Drops"
      }
      Overrides {
        Name: "cs:MaxPickupsPerDrop:tooltip"
        String: "The maximum number of Item Pickups to generate for a drop. The amount of dropped items will be split into multiple pickups up to this maximum."
      }
      Overrides {
        Name: "cs:MaxPickupsPerDrop:isrep"
        Bool: false
      }
      Overrides {
        Name: "cs:MaxPickupsPerDrop:ml"
        Bool: false
      }
      Overrides {
        Name: "cs:MaxPickupsPerDrop:category"
        String: "Custom"
      }
      Overrides {
        Name: "cs:MaxPickupsPerDrop:subcategory"
        String: "Drops"
      }
      Overrides {
        Name: "cs:DropMinDistance:tooltip"
        String: "If DropOnGather is true, the minimum distance from the gatherable the drop will appear."
      }
      Overrides {
        Name: "cs:DropMinDistance:isrep"
        Bool: false
      }
      Overrides {
        Name: "cs:DropMinDistance:ml"
        Bool: false
      }
      Overrides {
        Name: "cs:DropMinDistance:category"
        String: "Custom"
      }
      Overrides {
        Name: "cs:DropMinDistance:subcategory"
        String: "Drops"
      }
      Overrides {
        Name: "cs:DropMaxDistance:tooltip"
        String: "If DropOnGather is true, the maximum distance from the gatherable the drop will appear."
      }
      Overrides {
        Name: "cs:DropMaxDistance:isrep"
        Bool: false
      }
      Overrides {
        Name: "cs:DropMaxDistance:ml"
        Bool: false
      }
      Overrides {
        Name: "cs:DropMaxDistance:category"
        String: "Custom"
      }
      Overrides {
        Name: "cs:DropMaxDistance:subcategory"
        String: "Drops"
      }
      Overrides {
        Name: "cs:DropTimeoutSeconds:tooltip"
        String: "If DropOnGather is true, the number of seconds the drop will exist in the world."
      }
      Overrides {
        Name: "cs:DropTimeoutSeconds:isrep"
        Bool: false
      }
      Overrides {
        Name: "cs:DropTimeoutSeconds:ml"
        Bool: false
      }
      Overrides {
        Name: "cs:DropTimeoutSeconds:category"
        String: "Custom"
      }
      Overrides {
        Name: "cs:DropTimeoutSeconds:subcategory"
        String: "Drops"
      }
      Overrides {
        Name: "cs:DropItemPickupTemplate:tooltip"
        String: "If DropOnGather is true, this Item Pickup template will be spawned in world to contain the drop."
      }
      Overrides {
        Name: "cs:DropItemPickupTemplate:isrep"
        Bool: false
      }
      Overrides {
        Name: "cs:DropItemPickupTemplate:ml"
        Bool: false
      }
      Overrides {
        Name: "cs:DropItemPickupTemplate:category"
        String: "Custom"
      }
      Overrides {
        Name: "cs:DropItemPickupTemplate:subcategory"
        String: "Drops"
      }
      Overrides {
        Name: "cs:State1:tooltip"
        String: "One of 32 potential state templates for this Gatherable. States will be displayed in order from 1 - 32 as gather interactions happen. The static state is required for interaction purposes."
      }
      Overrides {
        Name: "cs:State1:isrep"
        Bool: false
      }
      Overrides {
        Name: "cs:State1:ml"
        Bool: false
      }
      Overrides {
        Name: "cs:State1:category"
        String: "Custom"
      }
      Overrides {
        Name: "cs:State1:subcategory"
        String: "States"
      }
      Overrides {
        Name: "cs:State2:tooltip"
        String: "One of 32 potential state templates for this Gatherable. States will be displayed in order from 1 - 32 as gather interactions happen. The static state is required for interaction purposes."
      }
      Overrides {
        Name: "cs:State2:isrep"
        Bool: false
      }
      Overrides {
        Name: "cs:State2:ml"
        Bool: false
      }
      Overrides {
        Name: "cs:State2:category"
        String: "Custom"
      }
      Overrides {
        Name: "cs:State2:subcategory"
        String: "States"
      }
      Overrides {
        Name: "cs:State3:tooltip"
        String: "One of 32 potential state templates for this Gatherable. States will be displayed in order from 1 - 32 as gather interactions happen. The static state is required for interaction purposes."
      }
      Overrides {
        Name: "cs:State3:isrep"
        Bool: false
      }
      Overrides {
        Name: "cs:State3:ml"
        Bool: false
      }
      Overrides {
        Name: "cs:State3:category"
        String: "Custom"
      }
      Overrides {
        Name: "cs:State3:subcategory"
        String: "States"
      }
      Overrides {
        Name: "cs:GatheredState:tooltip"
        String: "If set, this state will be used when the Gatherable has been fully gathered. Useful for things that need to keep a visual presence even after being gathered from. This state is required for client or server gathered states to appear. "
      }
      Overrides {
        Name: "cs:GatheredState:isrep"
        Bool: false
      }
      Overrides {
        Name: "cs:GatheredState:ml"
        Bool: false
      }
      Overrides {
        Name: "cs:GatheredState:category"
        String: "Custom"
      }
      Overrides {
        Name: "cs:GatheredState:subcategory"
        String: "States"
      }
      Overrides {
        Name: "cs:ToolsConsumedPerGather:tooltip"
        String: "The number of Tools that are removed from the Inventory each time this Gatherable is gathered."
      }
      Overrides {
        Name: "cs:State1_Client:subcategory"
        String: "States"
      }
      Overrides {
        Name: "cs:State2_Client:subcategory"
        String: "States"
      }
      Overrides {
        Name: "cs:State3_Client:subcategory"
        String: "States"
      }
      Overrides {
        Name: "cs:GatheredState_Client:subcategory"
        String: "States"
      }
      Overrides {
        Name: "cs:State1_Server:subcategory"
        String: "States"
      }
      Overrides {
        Name: "cs:State2_Server:subcategory"
        String: "States"
      }
      Overrides {
        Name: "cs:State3_Server:subcategory"
        String: "States"
      }
      Overrides {
        Name: "cs:GatheredState_Server:subcategory"
        String: "States"
      }
      Overrides {
        Name: "cs:State1_Client:tooltip"
        String: "One of 32 potential state templates for this Gatherable. States will be displayed in order from 1 - 32 as gather interactions happen. This state will only appear if a corresponding static state is set."
      }
      Overrides {
        Name: "cs:State1_Server:tooltip"
        String: "One of 32 potential state templates for this Gatherable. States will be displayed in order from 1 - 32 as gather interactions happen. This state will only appear if a corresponding static state is set."
      }
      Overrides {
        Name: "cs:State2_Client:tooltip"
        String: "One of 32 potential state templates for this Gatherable. States will be displayed in order from 1 - 32 as gather interactions happen. This state will only appear if a corresponding static state is set."
      }
      Overrides {
        Name: "cs:State2_Server:tooltip"
        String: "One of 32 potential state templates for this Gatherable. States will be displayed in order from 1 - 32 as gather interactions happen. This state will only appear if a corresponding static state is set."
      }
      Overrides {
        Name: "cs:State3_Client:tooltip"
        String: "One of 32 potential state templates for this Gatherable. States will be displayed in order from 1 - 32 as gather interactions happen. This state will only appear if a corresponding static state is set."
      }
      Overrides {
        Name: "cs:State3_Server:tooltip"
        String: "One of 32 potential state templates for this Gatherable. States will be displayed in order from 1 - 32 as gather interactions happen. This state will only appear if a corresponding static state is set."
      }
      Overrides {
        Name: "cs:GatheredState_Client:tooltip"
        String: "If set, this state will be used when the Gatherable has been fully gathered. Useful for things that need to keep a visual presence even after being gathered from. Requires a static gathered state to work."
      }
      Overrides {
        Name: "cs:GatheredState_Server:tooltip"
        String: "If set, this state will be used when the Gatherable has been fully gathered. Useful for things that need to server logic even after being gathered from. Requires a static gathered state to work."
      }
    }
  }
  SerializationVersion: 110
  VirtualFolderPath: "Data"
}
