//
//  SimpleTextView.swift
//  VisionOS-Examples
//
//  Created by Jordi Bruin on 01/08/2023.
//

import SwiftUI

struct SimpleTextView: View {
    var body: some View {
        List {
            Text("Caption")
                .font(.caption)
            
            Text("Caption 2")
                .font(.caption2)
            
            Text("Subheadline")
                .font(.subheadline)
            
            Text("Headline")
                .font(.headline)
            
            Text("Title 3")
                .font(.title3)
            
            Text("Title 2")
                .font(.title2)
            
            Text("Title")
                .font(.title)
            
            Text("Large Title")
                .font(.largeTitle)
            
            Text("Extra Large Title 2")
                .font(.extraLargeTitle2)
            
            Text("Extra Large Title")
                .font(.extraLargeTitle)
            
            Text("Call out")
                .font(.callout)
            
            Text("Footnote")
                .font(.footnote)
            
        }
    }
}

#Preview {
    SimpleTextView()
}
