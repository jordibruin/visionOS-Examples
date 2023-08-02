//
//  MapKitView.swift
//  VisionOS-Examples
//
//  Created by Jordi Bruin on 02/08/2023.
//

import SwiftUI
import MapKit

enum ExampleMapStyle: String, CaseIterable, Hashable, Identifiable {
    case hybrid
    case imagery
    case standard
    
    var id: String { self.rawValue }
    
    var style: MapStyle {
        switch self {
        case .hybrid:
            return .hybrid
        case .imagery:
            return .imagery
        case .standard:
            return .standard
        }
    }
}

struct MapKitView: View {
    
    @State var selectedMapStyle: ExampleMapStyle = .hybrid

    

    
    @State private var mapRegion = MKCoordinateRegion(
        center: CLLocationCoordinate2D(
            latitude: 51.5,
            longitude: -0.12
        ),
        span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
    )
    
    var body: some View {
        // This needs to not use a deprecated method
        Map(coordinateRegion: $mapRegion)
            .mapStyle(selectedMapStyle.style)
            .toolbar(content: {
                ToolbarItem {
                    Picker(selection: $selectedMapStyle) {
                        ForEach(ExampleMapStyle.allCases) { style in
                            Text(style.rawValue.capitalized).tag(style)
                        }
                    } label: {
                        Text("MapStyle")
                    }

                }
            })
    }
}

#Preview {
    MapKitView()
}
