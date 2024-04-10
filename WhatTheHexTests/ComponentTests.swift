//
//  Component.swift
//  WhatTheHexTests
//
//  Created by Tyler Lawrence1 on 4/1/24.
//

import XCTest

final class ComponentTests: XCTestCase {
    
    func test_toColorScale_max() {
        let sut = Component(hexCategory: .red, digit1: 15, digit2: 15)
        
        let actual = sut.toColorScale()
        
        let expected: Int = 255
        
        XCTAssertEqual(expected, actual)
    }
    
    func test_toColorScale_0() {
        let sut = Component(hexCategory: .red, digit1: 0, digit2: 0)
        
        let actual = sut.toColorScale()
        
        let expected: Int = 0
        
        XCTAssertEqual(expected, actual)
    }

    func test_colorScaleNormalized_0s_stay_0() {
        let sut = Component(hexCategory: .red, digit1: 0, digit2: 0)
        
        let actual: Double = sut.colorScaleNormalized()
        
        let expected: Double = 0
        
        XCTAssertEqual(expected, actual)
        
    }
    
    func test_colorScaleNormalized_max() {
        let sut = Component(hexCategory: .red, digit1: 15, digit2: 15)
        
        let actual: Double = sut.colorScaleNormalized()
        
        let expected: Double = 1
        
        XCTAssertEqual(expected, actual)
    }
    
    func test_toColorScale_10Red_returns_160() {
        let sut = Component(hexCategory: .red, digit1: 10, digit2: 0)
        
        let actual: Int = sut.toColorScale()
        
        let expected: Int = 160
        
        XCTAssertEqual(expected, actual)
    }
    
    func test_colorScaleNormalized_10Red_returns_(){
        let sut = Component(hexCategory: .red, digit1: 10, digit2: 0)
        
        let actual = sut.colorScaleNormalized()
        
        let expected = 0.6274509803921569
        
        XCTAssertEqual(expected, actual)
    }

}
