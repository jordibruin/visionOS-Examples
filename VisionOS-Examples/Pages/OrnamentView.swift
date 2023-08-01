//
//  OrnamentView.swift
//  VisionOS-Examples
//
//  Created by Jordi Bruin on 01/08/2023.
//

import SwiftUI

struct OrnamentView: View {
    
    @State var ornamentPosition: OrnamentAlignment = .bottom
    @State var contentAlignment: OrnamentAlignment = .bottom
    @State var showOrnament: Bool = true
    
    var body: some View {
        List {
            
            Section {
                Toggle(isOn: $showOrnament) {
                    Text("Show Ornament")
                }
            }
            
            Section {
                Picker(selection: $ornamentPosition) {
                    Text("Top").tag(OrnamentAlignment.top)
                    Text("Top Trailing").tag(OrnamentAlignment.topTrailing)
                    Text("Trailing").tag(OrnamentAlignment.trailing)
                    Text("Bottom Trailing").tag(OrnamentAlignment.bottomTrailing)
                    Text("Bottom").tag(OrnamentAlignment.bottom)
                    Text("Leading").tag(OrnamentAlignment.leading)
                } label: {
                    Text("Ornament Position")
                }
                .pickerStyle(.segmented)
            } header: {
                Text("Ornament Position")
            }
            
            Section {
                Picker(selection: $contentAlignment) {
                    Text("Top").tag(OrnamentAlignment.top)
                    Text("Top Trailing").tag(OrnamentAlignment.topTrailing)
                    Text("Trailing").tag(OrnamentAlignment.trailing)
                    Text("Bottom Trailing").tag(OrnamentAlignment.bottomTrailing)
                    Text("Bottom").tag(OrnamentAlignment.bottom)
                    Text("Leading").tag(OrnamentAlignment.leading)
                } label: {
                    Text("Content Alignment")
                }
                .pickerStyle(.segmented)
            } header: {
                Text("Content Alignment")
            }
        }
        .ornament(
            visibility: showOrnament ? .visible : .hidden,
            attachmentAnchor: .scene(alignment: ornamentPosition.alignment),
            contentAlignment: contentAlignment.alignment) {
                Text("Ornament Content")
                    .padding()
                    .glassBackgroundEffect(
                        in: RoundedRectangle(
                            cornerRadius: 32,
                            style: .continuous
                        )
                    )
            }
        
          
        // extra larger ornament, coming soon
//            .ornament(
//                visibility: showOrnament ? .visible : .hidden,
//                attachmentAnchor: .scene(alignment: .trailing),
//                contentAlignment: .center) {
//                    VStack {
//                        Text("Title")
//                            .font(.largeTitle)
//                        Text("Test")
//                            .font(.largeTitle)
//                        Text("Test")
//                            .font(.largeTitle)
//                        Text("Test")
//                            .font(.largeTitle)
//                        Text("Test")
//                            .font(.largeTitle)
//                    }
//                    .padding(32)
//                    .glassBackgroundEffect(
//                        in: RoundedRectangle(
//                            cornerRadius: 32,
//                            style: .continuous
//                        )
//                    )
//                }
    }
}

#Preview {
    OrnamentView()
}
