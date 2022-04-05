Assets {
  Id: 2177181377895567687
  Name: "Custom Composite Triplanar Blend Damaged House"
  PlatformAssetType: 13
  SerializationVersion: 110
  CustomMaterialAsset {
    BaseMaterialId: 8018064924197854427
    ParameterOverrides {
      Overrides {
        Name: "cmp:Sides"
        AssetReference {
          Id: 14231809728886464860
        }
      }
      Overrides {
        Name: "cmpc:Sides"
        Color {
          R: 0.452000022
          G: 0.401711285
          B: 0.343520015
          A: 1
        }
      }
      Overrides {
        Name: "edge_wear"
        Float: 0.43926549
      }
      Overrides {
        Name: "cmp:Top"
        AssetReference {
          Id: 84881695398198198
        }
      }
      Overrides {
        Name: "cmpc:Top"
        Color {
          R: 0.124251299
          G: 0.163
          B: 0.0585169941
          A: 1
        }
      }
      Overrides {
        Name: "splotchiness"
        Float: 0.407185256
      }
      Overrides {
        Name: "density"
        Float: 0
      }
    }
    Assets {
      Id: 8018064924197854427
      Name: "Composite Triplanar Blend"
      PlatformAssetType: 2
      PrimaryAsset {
        AssetType: "MaterialAssetRef"
        AssetId: "mi_composite_triplanar_wa"
      }
    }
    Assets {
      Id: 14231809728886464860
      Name: "Wood Raw White"
      PlatformAssetType: 2
      PrimaryAsset {
        AssetType: "MaterialAssetRef"
        AssetId: "mi_wood_raw_white_001_uv"
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
