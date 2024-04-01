//
//  Hexcode.swift
//  WhatTheHex
//
//  Created by Tyler Lawrence1 on 3/29/24.
//

struct Hexcode {
    var red: Component = Component(hexCategory: .red, digit1: 0, digit2: 0)
    var green: Component = Component(hexCategory: .green, digit1: 0, digit2: 0)
    var blue: Component = Component(hexCategory: .blue, digit1: 0, digit2: 0)
    
    var display: String {
        "\(red.display)\(green.display)\(blue.display)"
    }
    
//    mutating func randomize() {
//        red.digit1 = randomHexDigit()
//        red.digit2 = randomHexDigit()
//        green.digit1 = randomHexDigit()
//        green.digit2 = randomHexDigit()
//        blue.digit1 = randomHexDigit()
//        blue.digit2 = randomHexDigit()
//    }
//    
//    private func randomHexDigit() -> Double { Double(Int.random(in: 0 ... 15)) }
//    
    static func random() -> Hexcode {
        func randomHexDigit() -> Double { Double(Int.random(in: 0 ... 15 )) }
        let redComponent = Component(hexCategory: .red, digit1: randomHexDigit(), digit2: randomHexDigit())
        let greenComponent = Component(hexCategory: .green, digit1: randomHexDigit(), digit2: randomHexDigit())
        let blueComponent = Component(hexCategory: .blue, digit1: randomHexDigit(), digit2: randomHexDigit())
        return Hexcode(red: redComponent, green: greenComponent, blue: blueComponent)
    }
}
