//
//  CustomSizeWindow.swift
//  VisionOS-Examples
//
//  Created by Jordi Bruin on 01/08/2023.
//

import SwiftUI

struct CustomSizeWindow: Equatable, Identifiable, Codable, Hashable {
    let id = UUID()
    var width: CGFloat
    var height: CGFloat
    
    let adjustable: Bool
}
