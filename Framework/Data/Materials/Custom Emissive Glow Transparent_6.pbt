Assets {
  Id: 16202183720221189005
  Name: "Custom Emissive Glow Transparent_6"
  PlatformAssetType: 13
  SerializationVersion: 120
  CustomMaterialAsset {
    BaseMaterialId: 675563715440209277
    ParameterOverrides {
      Overrides {
        Name: "emissive_boost"
        Float: 0
      }
      Overrides {
        Name: "color"
        Color {
          R: 1
          B: 0.005
          A: 1
        }
      }
    }
    Assets {
      Id: 675563715440209277
      Name: "Emissive Glow Transparent"
      PlatformAssetType: 2
      PrimaryAsset {
        AssetType: "MaterialAssetRef"
        AssetId: "mi_basic_emissive_001"
      }
    }
  }
}
