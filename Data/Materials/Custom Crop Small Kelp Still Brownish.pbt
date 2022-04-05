Assets {
  Id: 7281493517602497473
  Name: "Custom Crop Small Kelp Still Brownish"
  PlatformAssetType: 13
  SerializationVersion: 110
  CustomMaterialAsset {
    BaseMaterialId: 18104699263672955032
    ParameterOverrides {
      Overrides {
        Name: "color"
        Color {
          R: 0.137945533
          G: 0.209
          B: 0.0359479859
          A: 1
        }
      }
      Overrides {
        Name: "color_accent"
        Color {
          R: 0.297000021
          G: 0.266616404
          B: 0.0742499903
          A: 1
        }
      }
      Overrides {
        Name: "wind_weight"
        Float: 0
      }
      Overrides {
        Name: "SSS"
        Color {
          R: 0.3423841
          G: 0.470000029
          A: 1
        }
      }
      Overrides {
        Name: "wind_speed"
        Float: 0
      }
    }
    Assets {
      Id: 18104699263672955032
      Name: "Kelp (default)"
      PlatformAssetType: 2
      PrimaryAsset {
        AssetType: "MaterialAssetRef"
        AssetId: "mi_kelp_001_uv"
      }
    }
  }
}
