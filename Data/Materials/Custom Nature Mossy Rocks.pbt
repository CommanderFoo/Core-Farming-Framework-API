Assets {
  Id: 3135180655224893148
  Name: "Custom Nature Mossy Rocks"
  PlatformAssetType: 13
  SerializationVersion: 108
  CustomMaterialAsset {
    BaseMaterialId: 10567468338059136635
    ParameterOverrides {
      Overrides {
        Name: "splotchiness"
        Float: 0.615706682
      }
      Overrides {
        Name: "density"
        Float: 1
      }
      Overrides {
        Name: "edge_wear"
        Float: 1
      }
      Overrides {
        Name: "color_top"
        Color {
          R: 0.38934651
          G: 0.437
          B: 0.0498179831
          A: 1
        }
      }
      Overrides {
        Name: "material_scale"
        Float: 6
      }
    }
    Assets {
      Id: 10567468338059136635
      Name: "Terrain - Moss"
      PlatformAssetType: 2
      PrimaryAsset {
        AssetType: "MaterialAssetRef"
        AssetId: "mi_terrain_rock-moss_001_wa"
      }
    }
  }
}
