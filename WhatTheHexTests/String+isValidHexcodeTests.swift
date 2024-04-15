//
//  String+isValidHexcodeTests.swift
//  WhatTheHexTests
//
//  Created by Tyler Lawrence1 on 4/12/24.
//

import XCTest

final class String_isValidHexcodeTests: XCTestCase {
    func test_isValidHexcode_ffffff_returns_true() {
        let input = "#ffffff"
        
        let expected = true
        
        let actual = input.isValidHexcode()
        
        XCTAssertEqual(expected, actual)
    }
    
    func test_isValidHexcode_zzzzzz_returns_false() {
        let input = "#zzzzzz"
        
        let expected = false
        
        let actual = input.isValidHexcode()
        
        XCTAssertEqual(expected, actual)
    }
    
    func test_isValidHexcode_junk_returns_false() {
        let input = "#sdfffsldfkjlkjhasdf"
        
        let expected = false
        
        let actual = input.isValidHexcode()
        
        XCTAssertEqual(expected, actual)
    }
    
    func test_isValidHexcode_048965_with_hashtag_returns_true() {
        let input = "#048965"
        
        let expected = true
        
        let actual = input.isValidHexcode()
        
        XCTAssertEqual(expected, actual)
    }
    
    func test_isValidHexcode_048965_no_hashtag_returns_false() {
        let input = "048965"
        
        let expected = false
        
        let actual = input.isValidHexcode()
        
        XCTAssertEqual(expected, actual)
    }
    
}
