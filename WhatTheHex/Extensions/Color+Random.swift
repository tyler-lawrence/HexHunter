//
//  Color+Random.swift
//  WhatTheHex
//
//  Created by Tyler Lawrence1 on 3/30/24.
//

import SwiftUI

extension Color {
    /// randomly generates color using rgb values
    /// - Returns: Color
    static func random() -> Color {
        let red = Double.random(in: 0...1)
        let blue = Double.random(in: 0...1)
        let green = Double.random(in: 0...1)
        return Color(red: red, green: green, blue: blue)
    }
}
