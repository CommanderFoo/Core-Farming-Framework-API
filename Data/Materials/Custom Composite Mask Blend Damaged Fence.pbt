Assets {
  Id: 7253060865167261432
  Name: "Custom Composite Mask Blend Damaged Fence"
  PlatformAssetType: 13
  SerializationVersion: 108
  CustomMaterialAsset {
    BaseMaterialId: 17752943452224290169
    ParameterOverrides {
      Overrides {
        Name: "cmp:Material1"
        AssetReference {
          Id: 2360206302109331130
        }
      }
      Overrides {
        Name: "cmp:Material2"
        AssetReference {
          Id: 841534158063459245
        }
      }
      Overrides {
        Name: "cmpc:Material2"
        Color {
          R: 0.71875
          G: 0.104246
          A: 1
        }
      }
      Overrides {
        Name: "rotate_material2"
        Float: 0
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
      Id: 2360206302109331130
      Name: "Wood Painted 01"
      PlatformAssetType: 2
      PrimaryAsset {
        AssetType: "MaterialAssetRef"
        AssetId: "mi_wood_painted_white_001_uv"
      }
    }
  }
}
