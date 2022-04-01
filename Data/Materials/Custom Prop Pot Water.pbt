Assets {
  Id: 3703243427733717207
  Name: "Custom Prop Pot Water"
  PlatformAssetType: 13
  SerializationVersion: 110
  CustomMaterialAsset {
    BaseMaterialId: 2406410966014768844
    ParameterOverrides {
      Overrides {
        Name: "displacement distance"
        Float: 1
      }
      Overrides {
        Name: "displacement scale"
        Float: 2
      }
      Overrides {
        Name: "displacement speed"
        Float: 2
      }
      Overrides {
        Name: "sss"
        Color {
          G: 0.00490725785
          B: 0.0570000038
          A: 1
        }
      }
      Overrides {
        Name: "inner color"
        Color {
          R: 0.0598499961
          G: 0.103598155
          B: 0.225000009
          A: 1
        }
      }
      Overrides {
        Name: "color"
        Color {
          R: 0.152901977
          G: 0.704686582
          B: 0.859
          A: 1
        }
      }
      Overrides {
        Name: "bubble brightness"
        Float: 10
      }
      Overrides {
        Name: "bubble speed"
        Float: 3.91145134
      }
      Overrides {
        Name: "milkiness"
        Float: 0.351044863
      }
      Overrides {
        Name: "scale"
        Float: 3.51044869
      }
    }
    Assets {
      Id: 2406410966014768844
      Name: "Faucet Water"
      PlatformAssetType: 2
      PrimaryAsset {
        AssetType: "MaterialAssetRef"
        AssetId: "fxmi_faucet_water"
      }
    }
  }
}
