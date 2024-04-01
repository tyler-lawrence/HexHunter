//
//  Component.swift
//  WhatTheHexTests
//
//  Created by Tyler Lawrence1 on 4/1/24.
//

import XCTest

final class ComponentTests: XCTestCase {

    func test_toColorScale_0s_stay_0() {
        let sut = Component(hexCategory: .red, v1: 0, v2: 0)
        
        let actual: Double = sut.toColorScale()
        
        let expected: Double = 0
        
        XCTAssertEqual(expected, actual)
        
    }
    
    func test_toColorScale_max() {
        let sut = Component(hexCategory: .red, v1: 15, v2: 15)
        
        let actual: Double = sut.toColorScale()
        
        let expected: Double = 1
        
        XCTAssertEqual(expected, actual)
    }

}
