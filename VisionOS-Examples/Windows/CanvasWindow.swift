//
//  CanvasWindow.swift
//  VisionOS-Examples
//
//  Created by Jordi Bruin on 31/07/2023.
//

import SwiftUI

struct CanvasWindow: View {
    
    @ObservedObject var toggleManager: ToggleManager
    @State var toggled = false
    
    let colors: [Color] = [.red, .green, .yellow, .blue]
    
    var body: some View {
        colors.randomElement()!
            .opacity(toggleManager.oneToggled ? 1 : 0.6 )
        .labelsHidden()
        .scaleEffect(2)
        .rotationEffect(.degrees(90))
        .frame(width: 200, height: 130)
        .glassBackgroundEffect(
            in: RoundedRectangle(
                cornerRadius: 32,
                style: .continuous
            )
        )
    }
}
