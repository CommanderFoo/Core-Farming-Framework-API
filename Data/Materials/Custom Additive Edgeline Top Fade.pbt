Assets {
  Id: 15036318336933178496
  Name: "Custom Additive Edgeline Top Fade"
  PlatformAssetType: 13
  SerializationVersion: 110
  CustomMaterialAsset {
    BaseMaterialId: 4209000708929164058
    ParameterOverrides {
      Overrides {
        Name: "vertical fade"
        Float: 13
      }
      Overrides {
        Name: "edge line brightness"
        Float: 100
      }
      Overrides {
        Name: "overall brightness"
        Float: 5
      }
      Overrides {
        Name: "fresnel"
        Float: 1
      }
      Overrides {
        Name: "color"
        Color {
          R: 0.139999986
          G: 0.0556291379
          A: 1
        }
      }
      Overrides {
        Name: "noise color"
        Color {
          R: 0.429999948
          G: 0.239205271
          A: 1
        }
      }
      Overrides {
        Name: "edge line color"
        Color {
          R: 0.89
          G: 0.8133775
          A: 1
        }
      }
      Overrides {
        Name: "noise spread"
        Float: 1000
      }
      Overrides {
        Name: "noise sharpness"
        Float: 0.0944030657
      }
      Overrides {
        Name: "edge line sharpness"
        Float: 0.479365766
      }
      Overrides {
        Name: "edge line spread"
        Float: 110.443184
      }
    }
    Assets {
      Id: 4209000708929164058
      Name: "Additive Edgeline Top Fade"
      PlatformAssetType: 2
      PrimaryAsset {
        AssetType: "MaterialAssetRef"
        AssetId: "fxmi_add_edgeline_sharpline_topfade"
      }
    }
  }
}
