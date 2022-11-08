Name: "Level Design"
RootId: 2615354378792015726
Objects {
  Id: 7227978848362701552
  Name: "Safe Zones"
  Transform {
    Location {
    }
    Rotation {
    }
    Scale {
      X: 1
      Y: 1
      Z: 1
    }
  }
  ParentId: 2615354378792015726
  ChildIds: 1077240009137784358
  ChildIds: 2482249312035097780
  ChildIds: 1535855961205412056
  Collidable_v2 {
    Value: "mc:ecollisionsetting:inheritfromparent"
  }
  Visible_v2 {
    Value: "mc:evisibilitysetting:inheritfromparent"
  }
  CameraCollidable {
    Value: "mc:ecollisionsetting:inheritfromparent"
  }
  EditorIndicatorVisibility {
    Value: "mc:eindicatorvisibility:visiblewhenselected"
  }
  Folder {
    IsGroup: true
  }
  NetworkRelevanceDistance {
    Value: "mc:eproxyrelevance:critical"
  }
  IsReplicationEnabledByDefault: true
}
Objects {
  Id: 1535855961205412056
  Name: "World Text - Safe Zone"
  Transform {
    Location {
      Z: 2.03845215
    }
    Rotation {
      Pitch: 90
      Yaw: 174.948837
      Roll: -5.05114746
    }
    Scale {
      X: 7
      Y: 7
      Z: 7
    }
  }
  ParentId: 7227978848362701552
  Collidable_v2 {
    Value: "mc:ecollisionsetting:inheritfromparent"
  }
  Visible_v2 {
    Value: "mc:evisibilitysetting:inheritfromparent"
  }
  CameraCollidable {
    Value: "mc:ecollisionsetting:inheritfromparent"
  }
  EditorIndicatorVisibility {
    Value: "mc:eindicatorvisibility:visiblewhenselected"
  }
  Text {
    Text: "Safe Zone"
    FontAsset {
    }
    Color {
      R: 1
      G: 1
      B: 1
      A: 1
    }
    HorizontalAlignment {
      Value: "mc:ecoretexthorizontalalign:center"
    }
    VerticalAlignment {
      Value: "mc:ecoretextverticalalign:center"
    }
  }
  NetworkRelevanceDistance {
    Value: "mc:eproxyrelevance:critical"
  }
  IsReplicationEnabledByDefault: true
}
Objects {
  Id: 2482249312035097780
  Name: "Cube - Bottom-Aligned"
  Transform {
    Location {
    }
    Rotation {
    }
    Scale {
      X: 10
      Y: 10
      Z: 0.01
    }
  }
  ParentId: 7227978848362701552
  UnregisteredParameters {
    Overrides {
      Name: "ma:Shared_BaseMaterial:color"
      Color {
        R: 0.120321013
        G: 0.385417
        B: 0.129157603
        A: 1
      }
    }
  }
  Collidable_v2 {
    Value: "mc:ecollisionsetting:inheritfromparent"
  }
  Visible_v2 {
    Value: "mc:evisibilitysetting:inheritfromparent"
  }
  CameraCollidable {
    Value: "mc:ecollisionsetting:inheritfromparent"
  }
  EditorIndicatorVisibility {
    Value: "mc:eindicatorvisibility:visiblewhenselected"
  }
  CoreMesh {
    MeshAsset {
      Id: 198353679974341757
    }
    Teams {
      IsTeamCollisionEnabled: true
      IsEnemyCollisionEnabled: true
    }
    StaticMesh {
      Physics {
        Mass: 100
        LinearDamping: 0.01
      }
      BoundsScale: 1
    }
  }
  Relevance {
    Value: "mc:eproxyrelevance:critical"
  }
  NetworkRelevanceDistance {
    Value: "mc:eproxyrelevance:critical"
  }
  IsReplicationEnabledByDefault: true
}
Objects {
  Id: 1077240009137784358
  Name: "MMOSafeZone"
  Transform {
    Location {
    }
    Rotation {
    }
    Scale {
      X: 1
      Y: 1
      Z: 1
    }
  }
  ParentId: 7227978848362701552
  ChildIds: 3195521629494651202
  UnregisteredParameters {
    Overrides {
      Name: "cs:Trigger"
      ObjectReference {
        SelfId: 3195521629494651202
      }
    }
    Overrides {
      Name: "cs:ZoneName"
      String: "Bag Selection Screen"
    }
  }
  Collidable_v2 {
    Value: "mc:ecollisionsetting:inheritfromparent"
  }
  Visible_v2 {
    Value: "mc:evisibilitysetting:inheritfromparent"
  }
  CameraCollidable {
    Value: "mc:ecollisionsetting:inheritfromparent"
  }
  EditorIndicatorVisibility {
    Value: "mc:eindicatorvisibility:visiblewhenselected"
  }
  Script {
    ScriptAsset {
      Id: 7595779808583929273
    }
  }
  NetworkRelevanceDistance {
    Value: "mc:eproxyrelevance:critical"
  }
  IsReplicationEnabledByDefault: true
}
Objects {
  Id: 3195521629494651202
  Name: "SafeZone Trigger"
  Transform {
    Location {
    }
    Rotation {
    }
    Scale {
      X: 10
      Y: 10
      Z: 3
    }
  }
  ParentId: 1077240009137784358
  Collidable_v2 {
    Value: "mc:ecollisionsetting:forceon"
  }
  Visible_v2 {
    Value: "mc:evisibilitysetting:inheritfromparent"
  }
  CameraCollidable {
    Value: "mc:ecollisionsetting:inheritfromparent"
  }
  EditorIndicatorVisibility {
    Value: "mc:eindicatorvisibility:visiblewhenselected"
  }
  Trigger {
    TeamSettings {
      IsTeamCollisionEnabled: true
      IsEnemyCollisionEnabled: true
    }
    TriggerShape_v2 {
      Value: "mc:etriggershape:box"
    }
    InteractionTemplate {
    }
    BreadcrumbTemplate {
    }
  }
  NetworkRelevanceDistance {
    Value: "mc:eproxyrelevance:critical"
  }
  IsReplicationEnabledByDefault: true
}
Objects {
  Id: 12162480117084644050
  Name: "Default Floor"
  Transform {
    Location {
      Z: -50
    }
    Rotation {
    }
    Scale {
      X: 50
      Y: 50
      Z: 1
    }
  }
  ParentId: 2615354378792015726
  UnregisteredParameters {
  }
  Collidable_v2 {
    Value: "mc:ecollisionsetting:inheritfromparent"
  }
  Visible_v2 {
    Value: "mc:evisibilitysetting:inheritfromparent"
  }
  CameraCollidable {
    Value: "mc:ecollisionsetting:inheritfromparent"
  }
  CoreMesh {
    MeshAsset {
      Id: 12095835209017042614
    }
    Teams {
      IsTeamCollisionEnabled: true
      IsEnemyCollisionEnabled: true
    }
    InteractWithTriggers: true
    StaticMesh {
      Physics {
      }
      BoundsScale: 1
    }
  }
  Relevance {
    Value: "mc:eproxyrelevance:critical"
  }
  NetworkRelevanceDistance {
    Value: "mc:eproxyrelevance:critical"
  }
  IsReplicationEnabledByDefault: true
}
Objects {
  Id: 5833936413876751956
  Name: "Default Sky"
  Transform {
    Location {
      Z: 700
    }
    Rotation {
    }
    Scale {
      X: 1
      Y: 1
      Z: 1
    }
  }
  ParentId: 2615354378792015726
  ChildIds: 12256592250584223692
  UnregisteredParameters {
  }
  Collidable_v2 {
    Value: "mc:ecollisionsetting:inheritfromparent"
  }
  Visible_v2 {
    Value: "mc:evisibilitysetting:inheritfromparent"
  }
  CameraCollidable {
    Value: "mc:ecollisionsetting:inheritfromparent"
  }
  Folder {
    IsGroup: true
  }
  NetworkRelevanceDistance {
    Value: "mc:eproxyrelevance:critical"
  }
  IsReplicationEnabledByDefault: true
}
Objects {
  Id: 12256592250584223692
  Name: "Dungeon Environmentals v2"
  Transform {
    Scale {
      X: 1
      Y: 1
      Z: 1
    }
  }
  ParentId: 5833936413876751956
  TemplateInstance {
    ParameterOverrideMap {
      key: 140619704307305013
      value {
        Overrides {
          Name: "bp:Intensity"
          Float: 0.5
        }
        Overrides {
          Name: "bp:Draw Sun"
          Bool: false
        }
        Overrides {
          Name: "bp:Cast Shadows"
          Bool: false
        }
        Overrides {
          Name: "bp:Use Temperature"
          Bool: false
        }
        Overrides {
          Name: "bp:Light Shaft Occlusion"
          Bool: false
        }
      }
    }
    ParameterOverrideMap {
      key: 3238107202644882520
      value {
        Overrides {
          Name: "bp:Color"
          Color {
            R: 1
            G: 0.963133395
            B: 0.447000027
            A: 1
          }
        }
        Overrides {
          Name: "bp:Albedo"
          Color {
            R: 1
            G: 0.798666656
            B: 0.244999945
            A: 1
          }
        }
        Overrides {
          Name: "bp:Directional Inscattering Color"
          Color {
            R: 0.256
            G: 0.190173864
            B: 0.187904
            A: 1
          }
        }
      }
    }
    ParameterOverrideMap {
      key: 3904399569566402538
      value {
        Overrides {
          Name: "bp:Intensity"
          Float: 1.06819534
        }
        Overrides {
          Name: "bp:Tint Color"
          Color {
            R: 1
            G: 0.910166681
            B: 0.51
            A: 1
          }
        }
        Overrides {
          Name: "bp:Cast Shadows"
          Bool: false
        }
        Overrides {
          Name: "bp:Occlusion Contrast"
          Float: 0.543528557
        }
        Overrides {
          Name: "bp:Indirect Intensity"
          Float: 0.552470863
        }
        Overrides {
          Name: "bp:Ambient Image"
          Enum {
            Value: "mc:eambientcubemapssmall:5"
          }
        }
      }
    }
    ParameterOverrideMap {
      key: 4117456179752281557
      value {
        Overrides {
          Name: "Name"
          String: "Dungeon Environmentals v2"
        }
        Overrides {
          Name: "Scale"
          Vector {
            X: 1
            Y: 1
            Z: 1
          }
        }
      }
    }
    ParameterOverrideMap {
      key: 4198575006130768415
      value {
        Overrides {
          Name: "bp:Brightness"
          Float: 0.230546772
        }
        Overrides {
          Name: "bp:Overall Tint"
          Color {
            R: 1
            G: 0.677
            B: 0.677
            A: 1
          }
        }
        Overrides {
          Name: "bp:Clouds"
          Bool: false
        }
        Overrides {
          Name: "bp:Horizon Color"
          Color {
            R: 0.193
            G: 0.184019864
            B: 0.181535989
            A: 0.9
          }
        }
        Overrides {
          Name: "bp:Zenith Color"
          Color {
            R: 0.35
            G: 0.248484507
            B: 0.085177
            A: 0.6
          }
        }
        Overrides {
          Name: "bp:Enable Opaque Sky"
          Bool: true
        }
        Overrides {
          Name: "bp:Horizon Falloff"
          Float: 6
        }
        Overrides {
          Name: "bp:Haze Falloff"
          Float: 15
        }
      }
    }
    TemplateAsset {
      Id: 12438803575706966398
    }
  }
}
Objects {
  Id: 17432699200936892611
  Name: "Spawn Point - PortalReturn"
  Transform {
    Location {
      X: -150
      Y: 150
      Z: 115
    }
    Rotation {
    }
    Scale {
      X: 1
      Y: 1
      Z: 1
    }
  }
  ParentId: 2615354378792015726
  UnregisteredParameters {
  }
  Collidable_v2 {
    Value: "mc:ecollisionsetting:inheritfromparent"
  }
  Visible_v2 {
    Value: "mc:evisibilitysetting:inheritfromparent"
  }
  CameraCollidable {
    Value: "mc:ecollisionsetting:inheritfromparent"
  }
  EditorIndicatorVisibility {
    Value: "mc:eindicatorvisibility:alwaysvisible"
  }
  PlayerSpawnPoint {
    TeamInt: 1
    PlayerScaleMultiplier: 1
    SpawnKey: "PortalReturn"
    SpawnEffectsTemplate {
      Id: 841534158063459245
    }
    ShouldDecrowdPlayers: true
  }
  NetworkRelevanceDistance {
    Value: "mc:eproxyrelevance:critical"
  }
  IsReplicationEnabledByDefault: true
}
Objects {
  Id: 11297646828485559796
  Name: "Spawn Point - Social"
  Transform {
    Location {
      Z: 115
    }
    Rotation {
    }
    Scale {
      X: 1
      Y: 1
      Z: 1
    }
  }
  ParentId: 2615354378792015726
  UnregisteredParameters {
  }
  Collidable_v2 {
    Value: "mc:ecollisionsetting:inheritfromparent"
  }
  Visible_v2 {
    Value: "mc:evisibilitysetting:inheritfromparent"
  }
  CameraCollidable {
    Value: "mc:ecollisionsetting:inheritfromparent"
  }
  EditorIndicatorVisibility {
    Value: "mc:eindicatorvisibility:alwaysvisible"
  }
  PlayerSpawnPoint {
    TeamInt: 1
    PlayerScaleMultiplier: 1
    SpawnKey: "Social"
    SpawnEffectsTemplate {
      Id: 841534158063459245
    }
    ShouldDecrowdPlayers: true
  }
  NetworkRelevanceDistance {
    Value: "mc:eproxyrelevance:critical"
  }
  IsReplicationEnabledByDefault: true
}
Objects {
  Id: 1211604476238307673
  Name: "Travel Triggers"
  Transform {
    Location {
    }
    Rotation {
    }
    Scale {
      X: 1
      Y: 1
      Z: 1
    }
  }
  ParentId: 2615354378792015726
  ChildIds: 1331412810180589703
  ChildIds: 15960513227561265828
  ChildIds: 8105243572270528003
  Collidable_v2 {
    Value: "mc:ecollisionsetting:inheritfromparent"
  }
  Visible_v2 {
    Value: "mc:evisibilitysetting:inheritfromparent"
  }
  CameraCollidable {
    Value: "mc:ecollisionsetting:inheritfromparent"
  }
  EditorIndicatorVisibility {
    Value: "mc:eindicatorvisibility:visiblewhenselected"
  }
  Folder {
    IsGroup: true
  }
  NetworkRelevanceDistance {
    Value: "mc:eproxyrelevance:critical"
  }
  IsReplicationEnabledByDefault: true
}
Objects {
  Id: 8105243572270528003
  Name: "Portal to SocialHub"
  Transform {
    Location {
      X: 1650
      Y: 2314.35522
    }
    Rotation {
      Yaw: 89.9999771
    }
    Scale {
      X: 1
      Y: 1
      Z: 1
    }
  }
  ParentId: 1211604476238307673
  ChildIds: 15355575651929674893
  UnregisteredParameters {
    Overrides {
      Name: "cs:IsEnabled"
      Bool: true
    }
    Overrides {
      Name: "cs:DestinationName"
      String: ""
    }
    Overrides {
      Name: "cs:IsEnabled:isrep"
      Bool: true
    }
    Overrides {
      Name: "cs:DestinationName:isrep"
      Bool: true
    }
  }
  Collidable_v2 {
    Value: "mc:ecollisionsetting:inheritfromparent"
  }
  Visible_v2 {
    Value: "mc:evisibilitysetting:inheritfromparent"
  }
  CameraCollidable {
    Value: "mc:ecollisionsetting:inheritfromparent"
  }
  NetworkContext {
    MinDetailLevel {
      Value: "mc:edetaillevel:low"
    }
    MaxDetailLevel {
      Value: "mc:edetaillevel:ultra"
    }
  }
  NetworkRelevanceDistance {
    Value: "mc:eproxyrelevance:high"
  }
}
Objects {
  Id: 15355575651929674893
  Name: "Portal VFX"
  Transform {
    Location {
      X: -2.91038305e-11
      Y: 5.53131104e-05
      Z: 316.210449
    }
    Rotation {
      Yaw: -1.36603776e-05
    }
    Scale {
      X: 0.55800271
      Y: 0.927319288
      Z: 1.38385987
    }
  }
  ParentId: 8105243572270528003
  UnregisteredParameters {
    Overrides {
      Name: "bp:Portal Shape"
      Int: 2
    }
    Overrides {
      Name: "bp:Portal Spread"
      Float: 0.4
    }
    Overrides {
      Name: "bp:Intensity Color Blend"
      Float: 1
    }
    Overrides {
      Name: "bp:Background Texture"
      Enum {
        Value: "mc:eportalbackground:15"
      }
    }
    Overrides {
      Name: "bp:Scene View Distortion Type"
      Enum {
        Value: "mc:eportalscenedistortiontype:newenumerator0"
      }
    }
    Overrides {
      Name: "bp:Edge Distortion"
      Float: 0
    }
    Overrides {
      Name: "bp:Speed"
      Float: 0.247848794
    }
    Overrides {
      Name: "bp:Intersection Distance"
      Float: 44.234417
    }
    Overrides {
      Name: "bp:Cast Shadows"
      Bool: false
    }
    Overrides {
      Name: "bp:Maintain picture scale"
      Bool: false
    }
    Overrides {
      Name: "bp:Edge Distance"
      Float: 0.45
    }
    Overrides {
      Name: "bp:Unlit"
      Bool: true
    }
    Overrides {
      Name: "bp:Disable Swirl and Edge"
      Bool: false
    }
    Overrides {
      Name: "bp:Color A"
      Color {
        G: 1.79999971
        B: 2
        A: 1
      }
    }
    Overrides {
      Name: "bp:Color B"
      Color {
        G: 0.228999957
        B: 0.687000036
        A: 1
      }
    }
    Overrides {
      Name: "bp:Color C"
      Color {
        G: 0.0599999391
        B: 0.399999976
        A: 1
      }
    }
    Overrides {
      Name: "bp:Swirl Color"
      Color {
        A: 1
      }
    }
  }
  Collidable_v2 {
    Value: "mc:ecollisionsetting:inheritfromparent"
  }
  Visible_v2 {
    Value: "mc:evisibilitysetting:inheritfromparent"
  }
  CameraCollidable {
    Value: "mc:ecollisionsetting:inheritfromparent"
  }
  Blueprint {
    BlueprintAsset {
      Id: 6677237403455816226
    }
  }
  NetworkRelevanceDistance {
    Value: "mc:eproxyrelevance:critical"
  }
  IsReplicationEnabledByDefault: true
}
Objects {
  Id: 15960513227561265828
  Name: "Trigger - Portal to Main game"
  Transform {
    Location {
      X: 1650
      Y: 2273.39624
      Z: 155.700851
    }
    Rotation {
      Yaw: 90
    }
    Scale {
      X: 0.51303339
      Y: 2.40888762
      Z: 1.9
    }
  }
  ParentId: 1211604476238307673
  UnregisteredParameters {
    Overrides {
      Name: "cs:SceneName"
      String: "Main"
    }
    Overrides {
      Name: "cs:SpawnKey"
      String: "Social"
    }
  }
  Collidable_v2 {
    Value: "mc:ecollisionsetting:forceon"
  }
  Visible_v2 {
    Value: "mc:evisibilitysetting:inheritfromparent"
  }
  CameraCollidable {
    Value: "mc:ecollisionsetting:inheritfromparent"
  }
  EditorIndicatorVisibility {
    Value: "mc:eindicatorvisibility:visiblewhenselected"
  }
  Trigger {
    Interactable: true
    InteractionLabel: "Travel to Tavern"
    TeamSettings {
      IsTeamCollisionEnabled: true
      IsEnemyCollisionEnabled: true
    }
    TriggerShape_v2 {
      Value: "mc:etriggershape:box"
    }
    InteractionTemplate {
    }
    BreadcrumbTemplate {
    }
  }
  NetworkRelevanceDistance {
    Value: "mc:eproxyrelevance:critical"
  }
  IsReplicationEnabledByDefault: true
}
Objects {
  Id: 1331412810180589703
  Name: "TravelTriggersServer"
  Transform {
    Location {
    }
    Rotation {
    }
    Scale {
      X: 1
      Y: 1
      Z: 1
    }
  }
  ParentId: 1211604476238307673
  UnregisteredParameters {
    Overrides {
      Name: "cs:LoadGearOnJoin"
      Bool: true
    }
  }
  Collidable_v2 {
    Value: "mc:ecollisionsetting:inheritfromparent"
  }
  Visible_v2 {
    Value: "mc:evisibilitysetting:inheritfromparent"
  }
  CameraCollidable {
    Value: "mc:ecollisionsetting:inheritfromparent"
  }
  EditorIndicatorVisibility {
    Value: "mc:eindicatorvisibility:visiblewhenselected"
  }
  Script {
    ScriptAsset {
      Id: 16171759585992088772
    }
  }
  NetworkRelevanceDistance {
    Value: "mc:eproxyrelevance:critical"
  }
  IsReplicationEnabledByDefault: true
}
