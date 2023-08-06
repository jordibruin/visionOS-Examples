//
//  ContentView.swift
//  VisionOS-Examples
//
//  Created by Jordi Bruin on 28/07/2023.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {

    @State var selectedPage: Page?
    
    var body: some View {
        NavigationSplitView {
            List {
                ForEach(Page.allCases) { page in
                    Button {
                        selectedPage = page
                    } label: {
                        Label {
                            Text(page.title)
                        } icon: {
                            Image(systemName: page.symbolName)
                        }
                    }
                }
            }
            .navigationTitle("Pages")
            .onAppear {
                selectedPage = .openWindow
            }
        } detail: {
            if let selectedPage {
                selectedPage.content
                    .navigationTitle(selectedPage.title)
            }
        }        
    }
}

#Preview {
    ContentView()
}


//@State private var showImmersiveSpace = false
//@Environment(\.openImmersiveSpace) var openImmersiveSpace
//@Environment(\.dismissImmersiveSpace) var dismissImmersiveSpace

//.onChange(of: showImmersiveSpace) { _, newValue in
//    Task {
//        if newValue {
//            await openImmersiveSpace(id: "ImmersiveSpace")
//        } else {
//            await dismissImmersiveSpace()
//        }
//    }
//}

//Button(action: {
//    showImmersiveSpace.toggle()
//}, label: {
//    Text("Toggle Immersive Mode")
//})

