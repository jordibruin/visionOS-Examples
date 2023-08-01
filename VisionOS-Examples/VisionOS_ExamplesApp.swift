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
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        // Add this to make your windows any size you want
        .windowStyle(.plain)
        
        WindowGroup(id: "sample-window-1", content: {
            VStack {
                Spacer()
                SimpleToggleWindow(toggleManager: toggleManager)
            }
            
            // to make the resize thing not appear
            .onAppear {
                guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene else {
                    return
                }
                    
                windowScene.requestGeometryUpdate(.Reality(resizingRestrictions: UIWindowScene.ResizingRestrictions.none))
            }
        })
        .windowStyle(.plain)
        
        WindowGroup(for: CustomSizeWindow.self) { window in
            VStack {
                Spacer()
                VStack {
                    Text(window.wrappedValue?.id.uuidString ?? "NO ID")
                }
                .background(Color.red)
                .glassBackgroundEffect(
                    in: RoundedRectangle(
                        cornerRadius: 32,
                        style: .continuous
                    )
                )
                .frame(width: window.wrappedValue?.width, height: window.wrappedValue?.height)
            }
            .onAppear {
                guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene else {
                    return
                }
                    
                windowScene.requestGeometryUpdate(.Reality(resizingRestrictions: UIWindowScene.ResizingRestrictions.none))
            }
        }
        .windowStyle(.plain)
        
        WindowGroup(id: "canvas-window-1", content: {
            VStack {
                Spacer()
                CanvasWindow(toggleManager: toggleManager)
            }
            .onAppear {
                guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene else {
                    return
                }
                    
                windowScene.requestGeometryUpdate(.Reality(resizingRestrictions: UIWindowScene.ResizingRestrictions.none))
            }
        })
        .windowStyle(.plain)
        .windowResizability(.automatic)
        
        ImmersiveSpace(id: "ImmersiveSpace") {
            ImmersiveView()
        }.immersionStyle(selection: .constant(.full), in: .full)
    }
}

class ToggleManager: ObservableObject {
    @Published var oneToggled = false
}
