Assets {
  Id: 11142875505686443139
  Name: "Custom Crop Potato"
  PlatformAssetType: 13
  SerializationVersion: 110
  CustomMaterialAsset {
    BaseMaterialId: 16263501854538201902
    ParameterOverrides {
      Overrides {
        Name: "color"
        Color {
          R: 0.718000054
          G: 0.718000054
          B: 0.718000054
          A: 1
        }
      }
      Overrides {
        Name: "fresnel_brightness"
        Float: 0
      }
      Overrides {
        Name: "fresnel_exponent"
        Float: 1
      }
      Overrides {
        Name: "roughness_multiplier"
        Float: 5
      }
    }
    Assets {
      Id: 16263501854538201902
      Name: "Sand 01"
      PlatformAssetType: 2
      PrimaryAsset {
        AssetType: "MaterialAssetRef"
        AssetId: "mi_sand_001_uv"
      }
    }
  }
}
