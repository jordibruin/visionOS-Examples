//
//  PresentWindowView.swift
//  VisionOS-Examples
//
//  Created by Jordi Bruin on 01/08/2023.
//

import SwiftUI

struct OpenWindowView: View {
    
    @Environment(\.openWindow) var openWindow
    
    var body: some View {
        
        List {
            Section {
                Button {
                    openWindow(id: "sample-window-1")
                } label: {
                    Text("Open new window")
                        .font(.title)
                }
            }
            
            Section {
                Button {
                    openWindow(value: CustomSizeWindow(width: 200, height: 200))
                } label: {
                    Text("200x200")
                        .font(.title)
                }
                
                Button {
                    openWindow(value: CustomSizeWindow(width: 600, height: 200))
                } label: {
                    Text("600x200")
                        .font(.title)
                }
                
                Button {
                    openWindow(value: CustomSizeWindow(width: 600, height: 400))
                } label: {
                    Text("600x400")
                        .font(.title)
                }
            }
        }
        .foregroundStyle(.white)
    }
}

#Preview {
    OpenWindowView()
}
