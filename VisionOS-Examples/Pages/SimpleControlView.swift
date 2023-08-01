//
//  SimpleControlView.swift
//  VisionOS-Examples
//
//  Created by Jordi Bruin on 01/08/2023.
//

import SwiftUI

struct SimpleControlView: View {
    
    @State var toggleEnabled = false
    @State var pickerSelection = "Option 1"
    
    var body: some View {
        List {
            Toggle(isOn: $toggleEnabled) {
                Text("This is a simple toggle")
            }
        
            Picker(selection: $pickerSelection) {
                Text("Option 1").tag("Option 1")
                Text("Option 2").tag("Option 2")
                Text("Option 3").tag("Option 3")
            } label: {
                Text("This is a simple picker")
            }
        }
    }
}

#Preview {
    SimpleControlView()
}
