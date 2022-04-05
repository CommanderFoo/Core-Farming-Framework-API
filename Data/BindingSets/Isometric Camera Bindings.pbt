Assets {
  Id: 5453964201076389098
  Name: "Isometric Camera Bindings"
  PlatformAssetType: 29
  SerializationVersion: 108
  BindingSetAsset {
    Bindings {
      BindingType {
        Value: "mc:ebindingtype:directional"
      }
      DirectionalBindingData {
        UpInputs {
          KeyboardPrimary {
            Value: "mc:ebindingkeyboard:w"
          }
          KeyboardSecondary {
            Value: "mc:ebindingkeyboard:up"
          }
          Controller {
            Value: "mc:ebindinggamepad:leftstickup"
          }
        }
        LeftInputs {
          KeyboardPrimary {
            Value: "mc:ebindingkeyboard:a"
          }
          KeyboardSecondary {
            Value: "mc:ebindingkeyboard:left"
          }
          Controller {
            Value: "mc:ebindinggamepad:leftstickleft"
          }
        }
        DownInputs {
          KeyboardPrimary {
            Value: "mc:ebindingkeyboard:s"
          }
          KeyboardSecondary {
            Value: "mc:ebindingkeyboard:down"
          }
          Controller {
            Value: "mc:ebindinggamepad:leftstickdown"
          }
        }
        RightInputs {
          KeyboardPrimary {
            Value: "mc:ebindingkeyboard:d"
          }
          KeyboardSecondary {
            Value: "mc:ebindingkeyboard:right"
          }
          Controller {
            Value: "mc:ebindinggamepad:leftstickright"
          }
        }
      }
      Action: "MoveCamera"
      Description: "Move the Camera"
      CoreBehavior {
        Value: "mc:ecorebehavior:none"
      }
      IsEnabledOnStart: true
    }
    Bindings {
      BindingType {
        Value: "mc:ebindingtype:axis"
      }
      AxisBindingData {
        IncreaseInputs {
          KeyboardPrimary {
            Value: "mc:ebindingkeyboard:mouseright"
          }
          KeyboardSecondary {
            Value: "mc:ebindingkeyboard:none"
          }
          Controller {
            Value: "mc:ebindinggamepad:rightstickright"
          }
        }
        DecreaseInputs {
          KeyboardPrimary {
            Value: "mc:ebindingkeyboard:mouseleft"
          }
          KeyboardSecondary {
            Value: "mc:ebindingkeyboard:none"
          }
          Controller {
            Value: "mc:ebindinggamepad:rightstickleft"
          }
        }
      }
      Action: "RotateCamera"
      Description: "Rotate the Camera"
      CoreBehavior {
        Value: "mc:ecorebehavior:none"
      }
      IsEnabledOnStart: true
    }
    Bindings {
      BindingType {
        Value: "mc:ebindingtype:basic"
      }
      BasicBindingData {
        BasicInputs {
          KeyboardPrimary {
            Value: "mc:ebindingkeyboard:rightclick"
          }
          KeyboardSecondary {
            Value: "mc:ebindingkeyboard:none"
          }
          Controller {
            Value: "mc:ebindinggamepad:none"
          }
        }
      }
      Action: "RightClick"
      Description: "Helper used to Rotate the Camera"
      CoreBehavior {
        Value: "mc:ecorebehavior:none"
      }
      IsEnabledOnStart: true
    }
  }
}
