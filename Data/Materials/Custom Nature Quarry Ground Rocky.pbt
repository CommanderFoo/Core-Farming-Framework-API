Assets {
  Id: 367062359584612131
  Name: "Custom Nature Quarry Ground Rocky"
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
        Name: "cmp:Material2"
        AssetReference {
          Id: 8185982158984412434
        }
      }
      Overrides {
        Name: "cmpc:Material1"
        Color {
          R: 0.38934651
          G: 0.437
          B: 0.0498179831
          A: 1
        }
      }
      Overrides {
        Name: "blend_amount"
        Float: 0.607686639
      }
      Overrides {
        Name: "mask_scale"
        Float: 0.2
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
      Id: 8185982158984412434
      Name: "Rocky Ground 01"
      PlatformAssetType: 2
      PrimaryAsset {
        AssetType: "MaterialAssetRef"
        AssetId: "rocky_001"
      }
    }
  }
}
