//
//  Component.swift
//  WhatTheHex
//
//  Created by Tyler Lawrence1 on 3/30/24.
//
import Foundation

/// Stores the two digits of a hexcode
struct Component: Hashable {
    let hexCategory: HexCategory
    
    /// first digit in a hexcode
    var digit1: Double
    /// second digit in a hexcode
    var digit2: Double
    
    var colorScaleLabel: String {
        String(format: "%.0f", self.toColorScale())
    }
    
    var normalizedLabel: String {
        String(format: "%.2f", self.colorScaleNormalized())
    }
    
    var display: String {
        guard let display1 = Hexcode.lookup(digit1) else { return "error1" }
        guard let display2 = Hexcode.lookup(digit2) else { return "error2" }
        return "\(display1)\(display2)"
    }
    
    /// converts a component its numeric representation
    /// digit 1 * 16 + digit 2
    /// FF == 15, 15
    /// 15 * 16 + 15 = 255
    /// - Returns: color value between 0 and 255
    func toColorScale() -> Double {
        Double((digit1 * 16) + digit2)
    }
    
    /// normalizes a color scale to a double between 0 and 1 for use in a color init
    /// digit 1 * 16 + digit 2
    /// FF == 15, 15
    /// 15 * 16 + 15 = 255
    /// - Returns: Double between 0 and 1
    func colorScaleNormalized() -> Double {
        self.toColorScale() / 255
    }
}

extension Hexcode {
    
    static func lookup(_ val: Double) -> String? {
        let rounded = round(val)
        return Hexcode.labelMap[rounded]
    }
    
    static let labelMap: [Double: String] = [
        0:"0",
        1:"1",
        2:"2",
        3:"3",
        4:"4",
        5:"5",
        6:"6",
        7:"7",
        8:"8",
        9:"9",
        10:"A",
        11:"B",
        12:"C",
        13:"D",
        14:"E",
        15:"F"
    ]
    static var sortedKeys: [Double] = Array(labelMap.keys).sorted(by: <)
}
