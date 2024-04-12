//
//  HexadecimalConversions.swift
//  WhatTheHexTests
//
//  Created by Tyler Lawrence1 on 4/12/24.
//

import XCTest

final class HexadecimalConversions: XCTestCase {

    func test_FF_toHexadecimal_returns_255() {
        let input = "FF"
        
        let expected = 255
        
        let actual = input.toHexadecimal()
        
        XCTAssertEqual(expected, actual)
    }
    
    func test_00_toHexadecimal_returns_0() {
        let input = "00"
        
        let expected = 0
        
        let actual = input.toHexadecimal()
        
        XCTAssertEqual(expected, actual)
    }
    
    func test_1F_toHexadecimal_returns_32() {
        let input = "1F"
        
        let expected: Int? = 31
        
        let actual = input.toHexadecimal()
        
        XCTAssertEqual(expected, actual)
    }
    
    func test_255_toHexadecimalString_returns_FF(){
        let input = 255
        
        let expected: String? = "FF"
        
        let actual = input.toHexadecimalString()
        
        XCTAssertEqual(expected, actual)
    }
    
    func test_FF_toHexadecimal_returns_nil() {
        let input = "ZZ"
        
        let expected: Int? = nil
        
        let actual = input.toHexadecimal()
        
        XCTAssertEqual(expected, actual)
    }
    
    func test_negative_toHexadecimalString_returns_nil() {
        let input = -42
        
        let expected: String? = nil
        
        let actual = input.toHexadecimalString()
        
        XCTAssertEqual(expected, actual)
    }

}
