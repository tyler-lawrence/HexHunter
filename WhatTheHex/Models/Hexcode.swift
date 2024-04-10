//
//  Hexcode.swift
//  WhatTheHex
//
//  Created by Tyler Lawrence1 on 3/29/24.
//
import Foundation

struct Hexcode: Identifiable, Hashable {
    let id = UUID()
    var red: Component = Component(hexCategory: .red, digit1: 0, digit2: 0)
    var green: Component = Component(hexCategory: .green, digit1: 0, digit2: 0)
    var blue: Component = Component(hexCategory: .blue, digit1: 0, digit2: 0)
    
    /// shows 6 characters representing the hexcode (EX: FFFFFF, A023F8)
    var display: String {
        "\(red.display)\(green.display)\(blue.display)"
    }
    
    /// creates a random hexcode by randomly generating numbers
    static func random() -> Hexcode {
        func randomHexDigit() -> Int { Int.random(in: 0 ... 15 ) }
        let redComponent = Component(hexCategory: .red, digit1: randomHexDigit(), digit2: randomHexDigit())
        let greenComponent = Component(hexCategory: .green, digit1: randomHexDigit(), digit2: randomHexDigit())
        let blueComponent = Component(hexCategory: .blue, digit1: randomHexDigit(), digit2: randomHexDigit())
        return Hexcode(red: redComponent, green: greenComponent, blue: blueComponent)
    }
    
    func calculateSimilarity(to hex: Hexcode) -> Double {
        let redDifference: Double = Double(1 - Double(abs(red.toColorScale() - hex.red.toColorScale())) / 255)
        let greenDifference: Double = Double(1 - Double(abs(green.toColorScale() - hex.green.toColorScale())) / 255)
        let blueDifference: Double = Double(1 - Double(abs(blue.toColorScale() - hex.blue.toColorScale())) / 255)
        let score: Double = Double((redDifference + greenDifference + blueDifference)) / 3.0 * 100
        return Double(score)
    }
}

extension Hexcode {
    static let teal = Hexcode(
        red: Component(hexCategory: .red, digit1: 2, digit2: 0),
        green: Component(hexCategory: .green, digit1: 10, digit2: 0),
        blue: Component(hexCategory: .blue, digit1: 11, digit2: 0)
    )
    
    static let orange = Hexcode(
        red: Component(hexCategory: .red, digit1: 12, digit2: 13),
        green: Component(hexCategory: .green, digit1: 8, digit2: 0),
        blue: Component(hexCategory: .blue, digit1: 0, digit2: 0)
    )
    
    static let white = Hexcode(
        red: Component(hexCategory: .red, digit1: 15, digit2: 15),
        green: Component(hexCategory: .green, digit1: 15, digit2: 15),
        blue: Component(hexCategory: .blue, digit1: 15, digit2: 15)
    )
}
