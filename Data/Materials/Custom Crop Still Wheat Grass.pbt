Assets {
  Id: 5262558939979870818
  Name: "Custom Crop Still Wheat Grass"
  PlatformAssetType: 13
  SerializationVersion: 110
  CustomMaterialAsset {
    BaseMaterialId: 3063632184274471005
    ParameterOverrides {
      Overrides {
        Name: "wind_weight"
        Float: 0
      }
      Overrides {
        Name: "color"
        Color {
          R: 0.220000029
          G: 0.166092753
          A: 1
        }
      }
      Overrides {
        Name: "color_roots"
        Color {
          R: 0.120000005
          G: 0.119205311
          A: 1
        }
      }
    }
    Assets {
      Id: 3063632184274471005
      Name: "Grass (default)"
      PlatformAssetType: 2
      PrimaryAsset {
        AssetType: "MaterialAssetRef"
        AssetId: "mi_grass_dynamic_001_uv"
      }
    }
  }
}
