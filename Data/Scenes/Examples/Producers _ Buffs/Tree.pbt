Name: "Producers _ Buffs"
RootId: 11057554454001341329
Objects {
  Id: 10179035655702816344
  Name: "ProducerStates"
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
  ParentId: 11057554454001341329
  UnregisteredParameters {
    Overrides {
      Name: "cs:DataTable"
      AssetReference {
        Id: 6992776839880844842
      }
    }
    Overrides {
      Name: "cs:Table_Information"
      String: "Hover over \"Table_Information\" for details on this table."
    }
    Overrides {
      Name: "cs:Table_Information:tooltip"
      String: "This table allows you to specify the art for various producer states (how the growing crop looks). The Ids in this table are used in the Producers table."
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
      Id: 8280669765240006703
    }
  }
  NetworkRelevanceDistance {
    Value: "mc:eproxyrelevance:critical"
  }
}
Objects {
  Id: 8905658998469131818
  Name: "ProducerBuffs"
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
  ParentId: 11057554454001341329
  UnregisteredParameters {
    Overrides {
      Name: "cs:DataTable"
      AssetReference {
        Id: 11576480281421293261
      }
    }
    Overrides {
      Name: "cs:Table_Information"
      String: "Hover over \"Table_Information\" for details on this table."
    }
    Overrides {
      Name: "cs:Table_Information:tooltip"
      String: "This table specifies how the producers respond to buffs. The Ids in this table are used in the Producers table. "
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
      Id: 8280669765240006703
    }
  }
  NetworkRelevanceDistance {
    Value: "mc:eproxyrelevance:critical"
  }
}
Objects {
  Id: 9382438377004645236
  Name: "Producers"
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
  ParentId: 11057554454001341329
  UnregisteredParameters {
    Overrides {
      Name: "cs:DataTable"
      AssetReference {
        Id: 6127875510793690277
      }
    }
    Overrides {
      Name: "cs:Table_Information"
      String: "Hover over \"Table_Information\" for details on this table."
    }
    Overrides {
      Name: "cs:Table_Information:tooltip"
      String: "Crops and other producers are set up in this table. The SourceItemId is the Id from the Items table, it is used to \"plant\" the producer. "
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
      Id: 8280669765240006703
    }
  }
  NetworkRelevanceDistance {
    Value: "mc:eproxyrelevance:critical"
  }
}
Objects {
  Id: 1842391966997804602
  Name: "Buffs"
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
  ParentId: 11057554454001341329
  UnregisteredParameters {
    Overrides {
      Name: "cs:DataTable"
      AssetReference {
        Id: 10981565176579185537
      }
    }
    Overrides {
      Name: "cs:Table_Information"
      String: "Hover over \"Table_Information\" for details on this table."
    }
    Overrides {
      Name: "cs:Table_Information:tooltip"
      String: "This table holds the basic Id for all buffs in the game. The Ids here will be be used in the CraftingStationBuffs, PlaceableBuffs, and ProducerBuffs."
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
      Id: 8280669765240006703
    }
  }
  NetworkRelevanceDistance {
    Value: "mc:eproxyrelevance:critical"
  }
}
