//
//  Page.swift
//  VisionOS-Examples
//
//  Created by Jordi Bruin on 01/08/2023.
//

import Foundation
import SwiftUI


enum Page: String, CaseIterable, Identifiable {
    
    case simpleText
    case simpleToggle
    case simpleGrid
    
    var id: String { self.rawValue }
    
    var title: String {
        switch self {
        case .simpleText:
            "Simple Text Elements"
        case .simpleToggle:
            "Simple Control Elements"
        case .simpleGrid:
            "Simple Grid"
        }
    }
    
    var symbolName: String {
        switch self {
        case .simpleText:
            "textformat.size"
        case .simpleToggle:
            "switch.2"
        case .simpleGrid:
            "rectangle.grid.2x2"
        }
    }
    
    @ViewBuilder
    var content: some View {
        switch self {
        case .simpleText:
            SimpleTextView()
        case .simpleToggle:
            SimpleControlView()
        case .simpleGrid:
            SimpleGridView()
        }
    }
}
