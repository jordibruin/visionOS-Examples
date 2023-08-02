//
//  SimpleGridView.swift
//  VisionOS-Examples
//
//  Created by Jordi Bruin on 01/08/2023.
//

import SwiftUI

struct SimpleGridView: View {
    
    let columns: [GridItem] = [
        GridItem(.flexible(minimum: 200, maximum: 500)),
        GridItem(.flexible(minimum: 200, maximum: 500)),
        GridItem(.flexible(minimum: 200, maximum: 500))
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, alignment: .leading) {
                ForEach(1...60, id: \.self) { index in
                    Color.random
                        .frame(height: 200)
                        .cornerRadius(14)
                }
            }
            .padding()
        }
    }
}

#Preview {
    SimpleGridView()
}

extension Color {
    static var random: Color {
        return Color(
            red: .random(in: 0...1),
            green: .random(in: 0...1),
            blue: .random(in: 0...1)
        )
    }
}
