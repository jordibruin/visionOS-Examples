//
//  SpatialAudioView.swift
//  VisionOS-Examples
//
//  Created by Jordi Bruin on 02/08/2023.
//

import SwiftUI

struct SpatialAudioView: View {
    
    @Environment(\.openImmersiveSpace) private var openImmersiveSpace
    
    var body: some View {
        VStack {
            Text("Add a 3D orb with an audio file attached to it. You can drag it around to test spatial audio experiences.")
            Button {
                Task {
                    await openImmersiveSpace(id: "spatialAudio")
                }
            } label: {
                Text("Start Spatial Audio Experience")
            }
        }
    }
}

#Preview {
    SpatialAudioView()
}

struct SpatialAudioImmersiveSpace: View {
    var body: some View {
        RealityView { content in
            SoundOrbView(soundFile: "audio.mp3")
        } update: { updateContent in
            
        }
    }
}

//
//  SoundOrbView.swift
//
//  Created by Rutger Schimmel on 27/07/2023.
//  Based on https://developer.apple.com/videos/play/wwdc2023/10080/
//
//  This view can be placed in a ImmersiveSpace, creating a floating orb that projects sounds.
//  The orb can be interacted with by dragging.
//

import SwiftUI
import RealityKit

struct SoundOrbView: View {
    let soundFile: String
    var orb: Entity
    
    init(soundFile: String) {
        self.soundFile = soundFile
        self.orb = ModelEntity(
            mesh: .generateSphere(radius: 0.1),
            materials: [SimpleMaterial(color: .white, isMetallic: false)]
        )
        setupModel()
        loadAudio()
    }
    
    func setupModel() {
        // Set the position of the orb in meters.
        orb.position.x = 0
        orb.position.y = 1.5
        orb.position.z = -1
        
        // Make the orb selectable.
        orb.components.set(InputTargetComponent())
        orb.components.set(CollisionComponent(shapes: [.generateSphere(radius: 0.1)]))
        
        // Make the orb cast a shadow.
        orb.components.set(GroundingShadowComponent(castsShadow: true))
    }
    
    func loadAudio() {
        // Create an empty entity to act as an audio source.
        let audioSource = Entity()
        audioSource.spatialAudio = SpatialAudioComponent()
        
        do {
            let resource = try AudioFileResource.load(named: soundFile, configuration: .init(shouldLoop: true))
            
            // Place the loaded audio resource onto the orb.
            orb.addChild(audioSource)
            audioSource.playAudio(resource)
        } catch {
            print("Error loading audio file: \(error.localizedDescription)")
        }
    }
    
    var body: some View {
        RealityView { content in
            content.add(orb)
        }
        .gesture(DragGesture()
            .targetedToAnyEntity()
            .onChanged { value in
                // The value is in SwiftUI's coordinate space, so we have to convert it to RealityKit's coordinate space.
                orb.position = value.convert(value.location3D, from: .local, to: orb.parent!)
            })
    }
}
