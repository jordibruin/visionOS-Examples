//
//  SimpleToggleWindow.swift
//  VisionOS-Examples
//
//  Created by Jordi Bruin on 31/07/2023.
//

import SwiftUI

struct SimpleToggleWindow: View {
    
    @ObservedObject var toggleManager: ToggleManager
        
    let colors: [Color] = [.red, .green, .yellow, .blue]
    
    var body: some View {
        Toggle(isOn: $toggleManager.oneToggled, label: {
            Text("Toggle on")
        })
        .labelsHidden()
        .scaleEffect(2)
        .rotationEffect(.degrees(90))
        .tint(colors.randomElement()!)
        .frame(width: 200, height: 130)
        .glassBackgroundEffect(
            in: RoundedRectangle(
                cornerRadius: 32,
                style: .continuous
            )
        )
    }
}


