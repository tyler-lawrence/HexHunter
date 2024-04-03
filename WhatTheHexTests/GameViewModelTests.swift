//
//  GameViewModelTests.swift
//  WhatTheHexTests
//
//  Created by Tyler Lawrence1 on 4/3/24.
//

import XCTest

final class GameViewModelTests: XCTestCase {
    
    func test_same_black_hex_returns_score_0() {
        let sut = GameViewModel()
        let hex1 = Hexcode()
        sut.playerHexcode = hex1
        sut.targetHexcode = hex1
        
        let expected: Double = 0.0
        
        let actual = sut.calculateScore()
        
        XCTAssertEqual(expected, actual)
    }
    
    func test_max_difference_returns_3() {
        let sut = GameViewModel()
        let blackHexcode = Hexcode(
            red: Component(hexCategory: .red, digit1: 0, digit2: 0),
            green: Component(hexCategory: .green, digit1: 0, digit2: 0),
            blue: Component(hexCategory: .blue, digit1: 0, digit2: 0)
        )
        let whiteHexcode = Hexcode(
            red: Component(hexCategory: .red, digit1: 15, digit2: 15),
            green: Component(hexCategory: .green, digit1: 15, digit2: 15),
            blue: Component(hexCategory: .blue, digit1: 15, digit2: 15)
        )
        sut.playerHexcode = blackHexcode
        sut.targetHexcode = whiteHexcode
        
        let expected = 3.0
        
        let actual = sut.calculateScore()
        
        XCTAssertEqual(expected, actual)
    }
    
    func test_same_teal_hex_returns_score_0() {
        let sut = GameViewModel()
        sut.playerHexcode = Hexcode.teal
        sut.targetHexcode = Hexcode.teal
        
        let expected: Double = 0.0
        
        let actual: Double = sut.calculateScore()
        
        XCTAssertEqual(expected, actual)
    }
}
