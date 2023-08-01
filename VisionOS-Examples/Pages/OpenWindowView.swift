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
        Button {
            openWindow(id: "sample-window-1")
        } label: {
            Text("Open new window")
        }
    }
}

#Preview {
    OpenWindowView()
}
