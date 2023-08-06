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
                    openWindow(value: CustomSizeWindow(width: 200, height: 200, adjustable: false))
                } label: {
                    Text("200x200")
                        .font(.title)
                }
                
                Button {
                    openWindow(value: CustomSizeWindow(width: 600, height: 200, adjustable: false))
                } label: {
                    Text("600x200")
                        .font(.title)
                }
                
                Button {
                    openWindow(value: CustomSizeWindow(width: 400, height: 400, adjustable: false))
                } label: {
                    Text("400x400")
                        .font(.title)
                }
                
                Button {
                    openWindow(value: CustomSizeWindow(width: 600, height: 400, adjustable: false))
                } label: {
                    Text("600x400")
                        .font(.title)
                }
            }
            
            Section {
                Button {
                    openWindow(value: CustomSizeWindow(width: 400, height: 400, adjustable: true))
                } label: {
                    Text("Adjustable Window")
                        .font(.title)
                }
            }
            
            Section {
                Button {
                    openWindow(id: "volumetric")
                } label: {
                    Text("Volumetric Window")
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
