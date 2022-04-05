Assets {
  Id: 6263372138000189282
  Name: "Custom Composite Mask Blend Damaged House"
  PlatformAssetType: 13
  SerializationVersion: 108
  CustomMaterialAsset {
    BaseMaterialId: 17752943452224290169
    ParameterOverrides {
      Overrides {
        Name: "cmp:Material1"
        AssetReference {
          Id: 84881695398198198
        }
      }
      Overrides {
        Name: "cmpc:Material1"
        Color {
          R: 0.124251299
          G: 0.163
          B: 0.0585169941
          A: 1
        }
      }
      Overrides {
        Name: "cmp:Material2"
        AssetReference {
          Id: 9664077890076808850
        }
      }
      Overrides {
        Name: "blend_amount"
        Float: 0.535506129
      }
      Overrides {
        Name: "cmpc:Material2"
        Color {
          R: 0.123
          G: 0.117408797
          B: 0.113406
          A: 1
        }
      }
      Overrides {
        Name: "invert_height"
        Bool: true
      }
      Overrides {
        Name: "material2_scale"
        Float: 1
      }
      Overrides {
        Name: "material1_scale"
        Float: 1
      }
    }
    Assets {
      Id: 17752943452224290169
      Name: "Composite Mask Blend"
      PlatformAssetType: 2
      PrimaryAsset {
        AssetType: "MaterialAssetRef"
        AssetId: "mi_composite_mask_blend_001_uv"
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
    Assets {
      Id: 9664077890076808850
      Name: "Wood Siding White"
      PlatformAssetType: 2
      PrimaryAsset {
        AssetType: "MaterialAssetRef"
        AssetId: "mi_wood_siding_white_001_uv"
      }
    }
  }
}
