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
    var digit1: Int
    /// second digit in a hexcode
    var digit2: Int
    
    /// formatted string representing component on 0 - 255 scale
    var colorScaleLabel: String {
        String(self.toColorScale())
    }
    
    /// formatted string representing component on 0 - 1 scale
    var normalizedLabel: String {
        String(self.colorScaleNormalized())
    }
    
    /// displays the component as hex label (ex: 2E, FF, 08)
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
    func toColorScale() -> Int {
        (digit1 * 16) + digit2
    }
    
    /// normalizes a color scale to a double between 0 and 1 for use in a color init
    /// digit 1 * 16 + digit 2
    /// FF == 15, 15
    /// 15 * 16 + 15 = 255
    /// - Returns: Int between 0 and 1
    func colorScaleNormalized() -> Double {
        Double(self.toColorScale()) / 255
    }
}

extension Hexcode {
    
    /// searches the label map for a given value
    /// - Parameter val: Double representing a hex digit
    /// - Returns: string representation of the hex digit
    static func lookup(_ val: Int) -> String? {
        return Hexcode.numberToHexLabel[val]
    }
    
    /// maps the hex digits to their letter component
    /// using a double because the slider on the macOS version was giving me problems with integers
    static let numberToHexLabel: [Int: String] = [
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
    
    /// keys from dictionary sorted in ascending order
    static var sortedKeys: [Int] = Array(numberToHexLabel.keys).sorted(by: <)
}
