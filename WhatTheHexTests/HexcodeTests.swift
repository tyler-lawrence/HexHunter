//
//  HexcodeTests.swift
//  WhatTheHexTests
//
//  Created by Tyler Lawrence1 on 4/10/24.
//

import XCTest

final class HexcodeTests: XCTestCase {

    func test_calculateSimilarity_same_hex_returns_100(){
        let sut = Hexcode()
        
        let expected: Double = 100
        
        let actual = sut.calculateSimilarity(to: Hexcode())
        
        XCTAssertEqual(expected, actual)
    }
    
    func test_calculateSimilarity_max_difference_returns_0(){
        let sut = Hexcode()
        
        let expected: Double = 0
        
        let actual = sut.calculateSimilarity(to: Hexcode.white)
        
        XCTAssertEqual(expected, actual)
    }
    
    func test_calculateSimilarity_one_component_max_difference_returns_66(){
        
        let hex1 = Hexcode(
            red: Component(hexCategory: .red, digit1: 15, digit2: 15),
            green: Component(hexCategory: .green, digit1: 15, digit2: 15),
            blue: Component(hexCategory: .red, digit1: 0, digit2: 0)
            )
        
        let hex2 = Hexcode(
            red: Component(hexCategory: .red, digit1: 15, digit2: 15),
            green: Component(hexCategory: .green, digit1: 15, digit2: 15),
            blue: Component(hexCategory: .red, digit1: 15, digit2: 15)
            )
            
        let expected: Double = 66
        
        let actual = hex1.calculateSimilarity(to: hex2).rounded(.down)
       
        XCTAssertEqual(expected, actual)
    }

}
