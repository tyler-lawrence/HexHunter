//
//  Component.swift
//  WhatTheHex
//
//  Created by Tyler Lawrence1 on 3/30/24.
//
import Foundation

/// Stores the two digits of a hexcode
struct Component: Hashable, Codable {
    let hexCategory: HexCategory
    
    /// first digit in a hexcode
    var digit1: Int
    /// second digit in a hexcode
    var digit2: Int
    
    init(hexCategory: HexCategory, digit1: Int, digit2: Int) {
        self.hexCategory = hexCategory
        self.digit1 = digit1
        self.digit2 = digit2
    }
    
    init?(hexCategory: HexCategory, from str: String) {
        guard str.count == 2 else { return nil }
        guard let digit1 = String(str[str.startIndex]).toHexadecimal() else { return nil }
        guard let digit2 = String(str[str.index(str.startIndex, offsetBy: 1)]).toHexadecimal() else { return nil }
        self.digit1 = digit1
        self.digit2 = digit2
        self.hexCategory = hexCategory
    }
    
    var digit1Display: String {
        digit1.toHexadecimalString() ?? ""
    }
    
    var digit2Display: String {
        digit2.toHexadecimalString() ?? ""
    }
    
    var display: String {
        "\(digit1Display)\(digit2Display)"
    }
    
    /// formatted string representing component on 0 - 255 scale
    var colorScaleLabel: String {
        String(self.toColorScale())
    }
    
    /// formatted string representing component on 0 - 1 scale
    var normalizedLabel: String {
        String(self.colorScaleNormalized())
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
