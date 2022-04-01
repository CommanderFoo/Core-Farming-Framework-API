Assets {
  Id: 3033557993563810247
  Name: "Custom Crop Small Kelp Still"
  PlatformAssetType: 13
  SerializationVersion: 110
  CustomMaterialAsset {
    BaseMaterialId: 18104699263672955032
    ParameterOverrides {
      Overrides {
        Name: "color"
        Color {
          R: 0.0944370925
          G: 0.230000019
          A: 1
        }
      }
      Overrides {
        Name: "color_accent"
        Color {
          R: 0.0222516358
          G: 0.24000001
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
          R: 0.372450203
          G: 0.76
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
