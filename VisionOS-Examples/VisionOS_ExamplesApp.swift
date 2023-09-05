//
//  VisionOS_ExamplesApp.swift
//  VisionOS-Examples
//
//  Created by Jordi Bruin on 28/07/2023.
//

import SwiftUI


@main
struct VisionOS_ExamplesApp: App {
    
    @StateObject var toggleManager = ToggleManager()
    @State var immersionState: ImmersionStyle = .mixed
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        
        WindowGroup(id: "sample-window-1", content: {
            ZStack {
                Color.red
                Text("This is a custom Window")
                    .font(.largeTitle)
                    .foregroundStyle(.white)
            }
        })
        
        WindowGroup(id: "volumetric", content: {
            GlobeView()
        })
        .windowStyle(.volumetric)
        .defaultSize(width: 0.5, height: 0.5, depth: 0.5, in: .meters)
        
        WindowGroup(for: CustomSizeWindow.self) { window in
//            Color.green
//                .ornament(attachmentAnchor: .scene(alignment: .trailing), ornament: {
//                    Color.red.frame(width: 100,height: 100)
//                })
            VStack {
                Spacer()
                
                SampleWindowView(window: window.wrappedValue!)
            }
            
            // This makes it so your window is actually the size you tell it to be
            // The resize button won't be on the original position all the way to the right
            // ⚠️ not working for the 200x200 width window some reason right now, investigating
            .onAppear {
                guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene else {
                    return
                }
                windowScene.requestGeometryUpdate(.Vision(resizingRestrictions: .none))
//                windowScene.requestGeometryUpdate(. Reality(resizingRestrictions: UIWindowScene.ResizingRestrictions.none))
            }
        }
        // Add this to make your windows any size you want
        .defaultSize(width: 400, height: 700)
        .windowStyle(.plain)

        ImmersiveSpace(id: "spatialAudio") {
            SoundOrbView(soundFile: "audio.mp3")
        }
        .immersionStyle(selection: $immersionState, in: .mixed)
    }
}

class ToggleManager: ObservableObject {
    @Published var oneToggled = false
}
