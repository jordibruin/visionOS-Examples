//
//  OrnamentView.swift
//  VisionOS-Examples
//
//  Created by Jordi Bruin on 01/08/2023.
//

import SwiftUI

struct OrnamentView: View {
    
    @State var showOrnament: Bool = true
    @State var ornamentPosition: OrnamentAlignment = .bottom
    @State var contentAlignment: OrnamentAlignment = .bottom
    
    @State var showLargeOrnament: Bool = true
    @State var largeOrnamentPosition: OrnamentAlignment = .trailing
    @State var largeContentAlignment: OrnamentAlignment = .leading
    
    var body: some View {
        List {
            
            Section {
                Toggle(isOn: $showOrnament) {
                    Text("Show Small Ornament")
                }
            
                Text("Small Ornament Anchor Position")
                Picker(selection: $ornamentPosition) {
                    Text("Top").tag(OrnamentAlignment.top)
                    Text("Top Trailing").tag(OrnamentAlignment.topTrailing)
                    Text("Trailing").tag(OrnamentAlignment.trailing)
                    Text("Bottom Trailing").tag(OrnamentAlignment.bottomTrailing)
                    Text("Bottom").tag(OrnamentAlignment.bottom)
                    Text("Leading").tag(OrnamentAlignment.leading)
                    Text("Center").tag(OrnamentAlignment.center)
                } label: {
                    Text("Ornament Position")
                }
                .pickerStyle(.segmented)
                
                Text("Small Ornament Content Alignment")
                Picker(selection: $contentAlignment) {
                    Text("Top").tag(OrnamentAlignment.top)
                    Text("Top Trailing").tag(OrnamentAlignment.topTrailing)
                    Text("Trailing").tag(OrnamentAlignment.trailing)
                    Text("Bottom Trailing").tag(OrnamentAlignment.bottomTrailing)
                    Text("Bottom").tag(OrnamentAlignment.bottom)
                    Text("Leading").tag(OrnamentAlignment.leading)
                    Text("Center").tag(OrnamentAlignment.center)
                } label: {
                    Text("Content Alignment")
                }
                .pickerStyle(.segmented)
            } header: {
                Text("Small Ornament Position")
            }
            
            
            Section {
                Toggle(isOn: $showLargeOrnament) {
                    Text("Show Large Ornament")
                }
        
                Text("Large Ornament Anchor Position")
                Picker(selection: $largeOrnamentPosition) {
                    Text("Top").tag(OrnamentAlignment.top)
                    Text("Top Trailing").tag(OrnamentAlignment.topTrailing)
                    Text("Trailing").tag(OrnamentAlignment.trailing)
                    Text("Bottom Trailing").tag(OrnamentAlignment.bottomTrailing)
                    Text("Bottom").tag(OrnamentAlignment.bottom)
                    Text("Leading").tag(OrnamentAlignment.leading)
                    Text("Center").tag(OrnamentAlignment.center)
                } label: {
                    Text("Large Ornament Position")
                }
                .pickerStyle(.segmented)
                
                Text("Large Ornament Content Alignment")
                Picker(selection: $largeContentAlignment) {
                    Text("Top").tag(OrnamentAlignment.top)
                    Text("Top Trailing").tag(OrnamentAlignment.topTrailing)
                    Text("Trailing").tag(OrnamentAlignment.trailing)
                    Text("Bottom Trailing").tag(OrnamentAlignment.bottomTrailing)
                    Text("Bottom").tag(OrnamentAlignment.bottom)
                    Text("Leading").tag(OrnamentAlignment.leading)
                    Text("Center").tag(OrnamentAlignment.center)
                } label: {
                    Text("Content Alignment")
                }
                .pickerStyle(.segmented)
            } header: {
                Text("Large Ornament")
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
        
        .ornament(
            visibility: showLargeOrnament ? .visible : .hidden,
            attachmentAnchor: .scene(alignment: largeOrnamentPosition.alignment),
            contentAlignment: largeContentAlignment.alignment) {
                VStack {
                    Text("Title")
                        .font(.largeTitle)
                    Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.")
                        .foregroundStyle(.secondary)
                    
                    Button {
                        showLargeOrnament = false
                    } label: {
                        Text("Hide Ornament")
                    }
                    .buttonStyle(.borderedProminent)

                }
                .frame(width: 200)
                .padding()
                .background(Color.blue.opacity(0.4))
                .glassBackgroundEffect(
                    in: RoundedRectangle(
                        cornerRadius: 32,
                        style: .continuous
                    )
                )
            }
    }
}

#Preview {
    OrnamentView()
}
