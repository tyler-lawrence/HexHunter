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
    
    func test_hexcode_equality_white_and_white_return_true(){
        let lhs = Hexcode.white
        let rhs = Hexcode.white
        let expected = true
        let actual = lhs == rhs
        XCTAssertEqual(expected, actual)
    }
    
    func test_hexcode_equality_white_and_white_different_instance_return_true(){
        let lhs = Hexcode(
            red: Component(hexCategory: .red, digit1: 15, digit2: 15),
            green: Component(hexCategory: .green, digit1: 15, digit2: 15),
            blue: Component(hexCategory: .blue, digit1: 15, digit2: 15)
        )
        let rhs = Hexcode(
            red: Component(hexCategory: .red, digit1: 15, digit2: 15),
            green: Component(hexCategory: .green, digit1: 15, digit2: 15),
            blue: Component(hexCategory: .blue, digit1: 15, digit2: 15)
        )
        
        let expected = true
        let actual = lhs == rhs
        XCTAssertEqual(expected, actual, "\(lhs.calculateSimilarity(to: rhs))")
    }
    
    func test_hexcode_equality_white_and_teal_return_false(){
        let lhs = Hexcode.white
        let rhs = Hexcode.teal
        let expected = false
        let actual = lhs == rhs
        XCTAssertEqual(expected, actual)
    }
    
    func test_init_from_hex_ffffff_no_hashtag_returns_nil(){
        let input = "ffffff"
        
        let expected: Hexcode? = nil
        
        let actual = Hexcode(from: input)
        
        XCTAssertEqual(expected, actual)
    }
    
    func test_init_from_hex_ffffff_with_hashtag_returns_white(){
        let input = "#ffffff"
        
        let lhs: Hexcode = Hexcode(
            red: Component(hexCategory: .red, digit1: 15, digit2: 15),
            green: Component(hexCategory: .green, digit1: 15, digit2: 15),
            blue: Component(hexCategory: .blue, digit1: 15, digit2: 15)
        )
        
        guard let rhs: Hexcode = Hexcode(from: input) else { return }
        
        let expected = true
        let actual = lhs == rhs
        
        XCTAssertEqual(expected, actual, "\(lhs.calculateSimilarity(to: rhs))")
    }
    
    func test_init_from_hex_long_string_returns_nil(){
        let input = "#this string is way too long"
        
        let expected: Hexcode? = nil
        
        let actual = Hexcode(from: input)
        
        XCTAssertEqual(expected, actual)
    }
    
    func test_init_from_hex_with_spaces_returns_nil(){
        let input = "#ff ff ff"
        
        let expected: Hexcode? = nil
        
        let actual = Hexcode(from: input)
        
        XCTAssertEqual(expected, actual)
    }
    
    func test_init_from_hex_029AF1_with_hashtag_returns_valid(){
        let input = "#029AF1"
        
        let lhs: Hexcode = Hexcode(
            red: Component(hexCategory: .red, digit1: 0, digit2: 2),
            green: Component(hexCategory: .green, digit1: 9, digit2: 10),
            blue: Component(hexCategory: .blue, digit1: 15, digit2: 1)
        )
        
        guard let rhs: Hexcode = Hexcode(from: input) else { return }
        
        let expected = true
        let actual = lhs == rhs
        
        XCTAssertEqual(expected, actual, "\(lhs.calculateSimilarity(to: rhs))")
    }

}
