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
        
        WindowGroup(id: "sample-window-1", content: {
            ZStack {
                Color.red
                Text("This is a custom Window")
                    .font(.largeTitle)
                    .foregroundStyle(.white)
            }
        })
    }
}

class ToggleManager: ObservableObject {
    @Published var oneToggled = false
}

//
//WindowGroup(id: "canvas-window-1", content: {
//    VStack {
//        Spacer()
//        CanvasWindow(toggleManager: toggleManager)
//    }
//    .onAppear {
//        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene else {
//            return
//        }
//            
//        windowScene.requestGeometryUpdate(.Reality(resizingRestrictions: UIWindowScene.ResizingRestrictions.none))
//    }
//})
//.windowStyle(.plain)
//.windowResizability(.automatic)

//ImmersiveSpace(id: "ImmersiveSpace") {
//    ImmersiveView()
//}.immersionStyle(selection: .constant(.full), in: .full)


//WindowGroup(for: CustomSizeWindow.self) { window in
//    VStack {
//        Spacer()
//        VStack {
//            Text(window.wrappedValue?.id.uuidString ?? "NO ID")
//        }
//        .background(Color.red)
//        .glassBackgroundEffect(
//            in: RoundedRectangle(
//                cornerRadius: 32,
//                style: .continuous
//            )
//        )
//        .frame(width: window.wrappedValue?.width, height: window.wrappedValue?.height)
//    }
//    .onAppear {
//        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene else {
//            return
//        }
//            
//        windowScene.requestGeometryUpdate(.Reality(resizingRestrictions: UIWindowScene.ResizingRestrictions.none))
//    }
//}
// Add this to make your windows any size you want
//.windowStyle(.plain)
