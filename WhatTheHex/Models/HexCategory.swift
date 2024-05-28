//
//  HexCategory.swift
//  WhatTheHex
//
//  Created by Tyler Lawrence1 on 3/30/24.
//

import SwiftUI

enum HexCategory: String, Codable {
    case red = "R"
    case green = "G"
    case blue = "B"
    case alpha = "A"
    
    var displayColor: Color {
        switch self {
        case .red:
                .red
        case .green:
                .green
        case .blue:
                .blue
        case .alpha:
                .black
        }
    }
}
