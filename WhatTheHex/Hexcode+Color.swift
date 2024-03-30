//
//  Hexcode+Color.swift
//  WhatTheHex
//
//  Created by Tyler Lawrence1 on 3/30/24.
//

import SwiftUI

extension Hexcode {
    func convertToDouble(_ hexCategory: HexCategory) -> Int {
        switch hexCategory {
        case .red:
            return (h0*16) + h1
        case .green:
            return (h2*16) + h3
        case .blue:
            return (h4*16) + h5
        }
    }
    
    var color: Color {
        let r: Double = Double(convertToDouble(.red)) / 256
        let g: Double = Double(convertToDouble(.green)) / 256
        let b: Double = Double(convertToDouble(.blue)) / 256
        return Color(red: r, green: g, blue: b)
    }
}
