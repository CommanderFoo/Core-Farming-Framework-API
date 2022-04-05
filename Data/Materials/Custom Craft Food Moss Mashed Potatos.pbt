Assets {
  Id: 9277536115046593126
  Name: "Custom Craft Food Moss Mashed Potatos"
  PlatformAssetType: 13
  SerializationVersion: 110
  CustomMaterialAsset {
    BaseMaterialId: 84881695398198198
    ParameterOverrides {
      Overrides {
        Name: "color"
        Color {
          R: 1
          G: 1
          B: 1
          A: 1
        }
      }
      Overrides {
        Name: "fresnel_color"
        Color {
          A: 1
        }
      }
      Overrides {
        Name: "fresnel_exponent"
        Float: 1
      }
      Overrides {
        Name: "fresnel_brightness"
        Float: 0
      }
    }
    Assets {
      Id: 84881695398198198
      Name: "Moss 01"
      PlatformAssetType: 2
      PrimaryAsset {
        AssetType: "MaterialAssetRef"
        AssetId: "mi_moss_001_uv"
      }
    }
  }
}
