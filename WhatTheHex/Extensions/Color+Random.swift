//
//  Color+Random.swift
//  WhatTheHex
//
//  Created by Tyler Lawrence1 on 3/30/24.
//

import SwiftUI

extension Color {
    /// a randomly generated color using rgb values
    /// - Returns: Color
    static func random() -> Color {
        let r = Double.random(in: 0...1)
        let b = Double.random(in: 0...1)
        let g = Double.random(in: 0...1)
        return Color(red: r, green: g, blue: b)
    }
}
