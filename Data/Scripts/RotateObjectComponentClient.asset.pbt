Assets {
  Id: 16037863468541834679
  Name: "RotateObjectComponentClient"
  PlatformAssetType: 3
  TextAsset {
    CustomParameters {
      Overrides {
        Name: "cs:ComponentRoot"
        ObjectReference {
        }
      }
      Overrides {
        Name: "cs:APIInteractionModule"
        AssetReference {
          Id: 841534158063459245
        }
      }
      Overrides {
        Name: "cs:SubTarget"
        ObjectReference {
        }
      }
      Overrides {
        Name: "cs:ObjectToRotate"
        ObjectReference {
        }
      }
      Overrides {
        Name: "cs:PressBinding"
        String: ""
      }
      Overrides {
        Name: "cs:RotateOnBeginHover"
        Bool: false
      }
      Overrides {
        Name: "cs:BeginHoverRotation"
        Rotator {
        }
      }
      Overrides {
        Name: "cs:BeginHoverCurve"
        SimpleCurve {
          Keys {
            Interpolation {
              Value: "mc:erichcurveinterpmode:rcim_linear"
            }
            TangentMode {
              Value: "mc:erichcurvetangentmode:rctm_auto"
            }
          }
          Keys {
            Interpolation {
              Value: "mc:erichcurveinterpmode:rcim_linear"
            }
            TangentMode {
              Value: "mc:erichcurvetangentmode:rctm_auto"
            }
            Time: 1
            Value: 1
          }
          PreExtrapolation {
            Value: "mc:erichcurveextrapolation:rcce_constant"
          }
          PostExtrapolation {
            Value: "mc:erichcurveextrapolation:rcce_constant"
          }
          DefaultValue: 3.40282347e+38
        }
      }
      Overrides {
        Name: "cs:BeginHoverDuration"
        Float: 1
      }
      Overrides {
        Name: "cs:BeginHoverUseLocalSpace"
        Bool: true
      }
      Overrides {
        Name: "cs:RotateOnEndHover"
        Bool: false
      }
      Overrides {
        Name: "cs:EndHoverRotation"
        Rotator {
        }
      }
      Overrides {
        Name: "cs:EndHoverCurve"
        SimpleCurve {
          Keys {
            Interpolation {
              Value: "mc:erichcurveinterpmode:rcim_linear"
            }
            TangentMode {
              Value: "mc:erichcurvetangentmode:rctm_auto"
            }
          }
          Keys {
            Interpolation {
              Value: "mc:erichcurveinterpmode:rcim_linear"
            }
            TangentMode {
              Value: "mc:erichcurvetangentmode:rctm_auto"
            }
            Time: 1
            Value: 1
          }
          PreExtrapolation {
            Value: "mc:erichcurveextrapolation:rcce_constant"
          }
          PostExtrapolation {
            Value: "mc:erichcurveextrapolation:rcce_constant"
          }
          DefaultValue: 3.40282347e+38
        }
      }
      Overrides {
        Name: "cs:EndHoverDuration"
        Float: 1
      }
      Overrides {
        Name: "cs:EndHoverUseLocalSpace"
        Bool: true
      }
      Overrides {
        Name: "cs:RotateOnBeginPress"
        Bool: false
      }
      Overrides {
        Name: "cs:BeginPressRotation"
        Rotator {
        }
      }
      Overrides {
        Name: "cs:BeginPressCurve"
        SimpleCurve {
          Keys {
            Interpolation {
              Value: "mc:erichcurveinterpmode:rcim_linear"
            }
            TangentMode {
              Value: "mc:erichcurvetangentmode:rctm_auto"
            }
          }
          Keys {
            Interpolation {
              Value: "mc:erichcurveinterpmode:rcim_linear"
            }
            TangentMode {
              Value: "mc:erichcurvetangentmode:rctm_auto"
            }
            Time: 1
            Value: 1
          }
          PreExtrapolation {
            Value: "mc:erichcurveextrapolation:rcce_constant"
          }
          PostExtrapolation {
            Value: "mc:erichcurveextrapolation:rcce_constant"
          }
          DefaultValue: 3.40282347e+38
        }
      }
      Overrides {
        Name: "cs:BeginPressDuration"
        Float: 1
      }
      Overrides {
        Name: "cs:BeginPressUseLocalSpace"
        Bool: true
      }
      Overrides {
        Name: "cs:RotateOnEndPress"
        Bool: false
      }
      Overrides {
        Name: "cs:EndPressRotation"
        Rotator {
        }
      }
      Overrides {
        Name: "cs:EndPressCurve"
        SimpleCurve {
          Keys {
            Interpolation {
              Value: "mc:erichcurveinterpmode:rcim_linear"
            }
            TangentMode {
              Value: "mc:erichcurvetangentmode:rctm_auto"
            }
          }
          Keys {
            Interpolation {
              Value: "mc:erichcurveinterpmode:rcim_linear"
            }
            TangentMode {
              Value: "mc:erichcurvetangentmode:rctm_auto"
            }
            Time: 1
            Value: 1
          }
          PreExtrapolation {
            Value: "mc:erichcurveextrapolation:rcce_constant"
          }
          PostExtrapolation {
            Value: "mc:erichcurveextrapolation:rcce_constant"
          }
          DefaultValue: 3.40282347e+38
        }
      }
      Overrides {
        Name: "cs:EndPressDuration"
        Float: 1
      }
      Overrides {
        Name: "cs:EndPressUseLocalSpace"
        Bool: true
      }
      Overrides {
        Name: "cs:ComponentRoot:tooltip"
        String: "The Component Root is registered as the target and any interactions will affect it and potentially its children"
      }
      Overrides {
        Name: "cs:APIInteractionModule:tooltip"
        String: "Must be set to a compatible Input Module"
      }
      Overrides {
        Name: "cs:ObjectToRotate:tooltip"
        String: "An optional single object or group of objects to apply rotation to. Defaults to the Component Root"
      }
      Overrides {
        Name: "cs:BeginHoverRotation:tooltip"
        String: "The rotation to apply"
      }
      Overrides {
        Name: "cs:BeginHoverDuration:tooltip"
        String: "The duration of the rotation in seconds"
      }
      Overrides {
        Name: "cs:BeginHoverUseLocalSpace:tooltip"
        String: "If true the rotation will be applied in local space, otherwise in world space"
      }
      Overrides {
        Name: "cs:PressBinding:tooltip"
        String: "The binding to use for press interactions"
      }
      Overrides {
        Name: "cs:RotateOnBeginHover:tooltip"
        String: "If true the rotation will start when a hover begins"
      }
      Overrides {
        Name: "cs:RotateOnEndHover:tooltip"
        String: "If true the rotation will start when a hover ends"
      }
      Overrides {
        Name: "cs:RotateOnBeginPress:tooltip"
        String: "If true the rotation will start when a press begins"
      }
      Overrides {
        Name: "cs:RotateOnEndPress:tooltip"
        String: "If true the rotation will start when a press ends"
      }
      Overrides {
        Name: "cs:SubTarget:tooltip"
        String: "The Sub Target can be used to set a specific Trigger or UIButton to use for interaction events. If left blank the Input Module will find the first appropriate object."
      }
    }
  }
  SerializationVersion: 108
  VirtualFolderPath: "Interaction System"
  VirtualFolderPath: "Components"
}
