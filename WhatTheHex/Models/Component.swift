//
//  Component.swift
//  WhatTheHex
//
//  Created by Tyler Lawrence1 on 3/30/24.
//

/// Stores the two digits of a hexcode
struct Component: Hashable {
    let hexCategory: HexCategory
    #warning("make property wrapper to trim?")
    
    /// first digit in a hexcode
    var digit1: Double
    /// second digit in a hexcode
    var digit2: Double
    
    /// converts a component to a double for use in Color init
    /// digit 1 * 16 + digit 2
    /// FF == 15, 15
    /// 15 * 16 + 15 = 255
    /// - Returns: Double between 0 and 1
    func toColorScale() -> Double {
        let scaled = Double((digit1 * 16) + digit2) / 255
        if scaled < 0 || scaled > 1 {
            print("unexpected result")
        }
        return scaled
    }
}
