//
//  GlobeView.swift
//  VisionOS-Examples
//
//  Created by Jordi Bruin on 06/08/2023.
//

import SwiftUI
import RealityKit

struct GlobeView: View {
    var body: some View {
        Model3D(named: "Globe") { model in
             model
                 .resizable()
                 .aspectRatio(contentMode: .fit)
         } placeholder: {
             ProgressView()
         }
    }
}

#Preview {
    GlobeView()
}
