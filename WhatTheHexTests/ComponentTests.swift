//
//  Component.swift
//  WhatTheHexTests
//
//  Created by Tyler Lawrence1 on 4/1/24.
//

import XCTest

final class ComponentTests: XCTestCase {

    func test_toColorScale_0s_stay_0() {
        let sut = Component(hexCategory: .red, digit1: 0, digit2: 0)
        
        let actual: Double = sut.toColorScale()
        
        let expected: Double = 0
        
        XCTAssertEqual(expected, actual)
        
    }
    
    func test_toColorScale_max() {
        let sut = Component(hexCategory: .red, digit1: 15, digit2: 15)
        
        let actual: Double = sut.toColorScale()
        
        let expected: Double = 1
        
        XCTAssertEqual(expected, actual)
    }

}
