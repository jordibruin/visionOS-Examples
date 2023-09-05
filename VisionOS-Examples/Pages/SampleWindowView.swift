//
//  SampleWindowView.swift
//  VisionOS-Examples
//
//  Created by Jordi Bruin on 02/08/2023.
//

import SwiftUI

struct SampleWindowView: View {
    
    @State var window: CustomSizeWindow
    
    var body: some View {
        ZStack {
            Color.red
            VStack {
                Text("Window")
                    .font(.largeTitle)
                    .bold()
                    .foregroundStyle(.white)
                
                
                Text("\(Int(window.width)) x \(Int(window.height))")
                    .font(.title2)
                    .bold()
                    .foregroundStyle(.white)
                
                if window.adjustable {
                    Button {
                        withAnimation {
                            window.width = CGFloat.random(in: 300...500)
                            window.height = CGFloat.random(in: 300...500)
                        }
                    } label: {
                        Text("Change size")
                    }
                }
            }
        }
        .glassBackgroundEffect(
            in: RoundedRectangle(
                cornerRadius: 32,
                style: .continuous
            )
        )
        .frame(width: window.width, height: window.height)
    }
}

//#Preview {
//    SampleWindowView()
//}
