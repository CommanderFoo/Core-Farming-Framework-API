Assets {
  Id: 4861952781988709185
  Name: "Custom Crop Small Kelp Dead Still"
  PlatformAssetType: 13
  SerializationVersion: 108
  CustomMaterialAsset {
    BaseMaterialId: 18104699263672955032
    ParameterOverrides {
      Overrides {
        Name: "color"
        Color {
          R: 0.164
          G: 0.11546465
          B: 0.0144319907
          A: 1
        }
      }
      Overrides {
        Name: "color_accent"
        Color {
          R: 0.288000017
          G: 0.22719577
          B: 0.0584639907
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
          R: 0.399999976
          G: 0.230463564
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
