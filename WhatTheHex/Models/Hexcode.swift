//
//  Hexcode.swift
//  WhatTheHex
//
//  Created by Tyler Lawrence1 on 3/29/24.
//
import Foundation

struct Hexcode: Identifiable, Hashable, Codable {
    var id = UUID()
    var red: Component
    var green: Component
    var blue: Component
    
    /// shows 6 characters representing the hexcode (EX: FFFFFF, A023F8)
    var display: String {
        "\(red.display)\(green.display)\(blue.display)"
    }
    
    init(
        red: Component = Component(hexCategory: .red, digit1: 0, digit2: 0),
        green: Component = Component(hexCategory: .green, digit1: 0, digit2: 0),
        blue: Component = Component(hexCategory: .blue, digit1: 0, digit2: 0)) {
        self.red = red
        self.green = green
        self.blue = blue
    }
    
    init?(from str: String) {
        guard str.isValidHexcode() else { return nil }
        
        let redStringComponent1 = String(str[str.index(str.startIndex, offsetBy: 1)])
        let redStringComponent2 = String(str[str.index(str.startIndex, offsetBy: 2)])
        let redComponent = redStringComponent1+redStringComponent2
        let red = Component(hexCategory: .red, from: redComponent)
        
        let greenStringComponent1 = String(str[str.index(str.startIndex, offsetBy: 3)])
        let greenStringComponent2 = String(str[str.index(str.startIndex, offsetBy: 4)])
        let greenComponent = greenStringComponent1+greenStringComponent2
        let green = Component(hexCategory: .green, from: greenComponent)
        
        let blueStringComponent1 = String(str[str.index(str.startIndex, offsetBy: 5)])
        let blueStringComponent2 = String(str[str.index(str.startIndex, offsetBy: 6)])
        let blueComponent = blueStringComponent1+blueStringComponent2
        let blue = Component(hexCategory: .blue, from: blueComponent)
        
        guard let red, let blue, let green else { return nil }
        
        self.red = red
        self.green = green
        self.blue = blue
        
    }
    
    /// creates a random hexcode by randomly generating numbers
    static func random() -> Hexcode {
        func randomHexDigit() -> Int { Int.random(in: 0 ... 15 ) }
        let redComponent = Component(hexCategory: .red, digit1: randomHexDigit(), digit2: randomHexDigit())
        let greenComponent = Component(hexCategory: .green, digit1: randomHexDigit(), digit2: randomHexDigit())
        let blueComponent = Component(hexCategory: .blue, digit1: randomHexDigit(), digit2: randomHexDigit())
        return Hexcode(red: redComponent, green: greenComponent, blue: blueComponent)
    }
    
    
    /// Calculates the similarity of two hexcodes by measuring the difference of each color component. Higher numbers are more accurate
    /// - Parameter hex: hexcode to compare against
    /// - Returns: double between 0 and 100 representing accuracy
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
        red: Component(hexCategory: .red, digit1: 2, digit2: 11),
        green: Component(hexCategory: .green, digit1: 10, digit2: 5),
        blue: Component(hexCategory: .blue, digit1: 11, digit2: 3)
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
