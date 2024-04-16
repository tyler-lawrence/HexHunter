//
//  GameManagerTests.swift
//  WhatTheHexTests
//
//  Created by Tyler Lawrence1 on 4/16/24.
//

import XCTest

extension Date {
    func minus(_ days: Int) -> Date {
        let secondsInDay = 86_400
        let intervalToSubtract = TimeInterval(secondsInDay * days)
        return Date.now - intervalToSubtract
    }
}

final class GameManagerTests: XCTestCase {
        
    //MARK: colorOfTheDayStreak

    func test_colorOfTheDayStreak_empty_returns_0() {
        
        let sut = GameManager()
        sut.datesCompletedColorOfDay = []
        
        let expected = 0
        
        let actual = sut.colorOfTheDayStreak()
        
        XCTAssertEqual(expected, actual)
    }
    
    func test_colorOfTheDayStreak_3_ascending_returns_3() {
        
        let sut = GameManager()

        sut.datesCompletedColorOfDay = [
            Date.now.minus(1),
            Date.now.minus(2),
            Date.now.minus(3),
        ]
        
        let expected = 3
        
        let actual = sut.colorOfTheDayStreak()
        
        XCTAssertEqual(expected, actual)
    }
    
    func test_colorOfTheDayStreak_gap_in_3_day_span_returns_1() {
        let sut = GameManager()

        sut.datesCompletedColorOfDay = [
            Date.now.minus(1),
            Date.now.minus(3),
        ]
        
        let expected = 1
        
        let actual = sut.colorOfTheDayStreak()
        
        XCTAssertEqual(expected, actual)
    }
    
    func test_colorOfTheDayStreak_3_consecutive_days_then_1_missed_returns_1() {
        let sut = GameManager()

        sut.datesCompletedColorOfDay = [
            Date.now,
            Date.now.minus(2),
            Date.now.minus(3),
            Date.now.minus(4)
        ]
        
        let expected = 1
        
        let actual = sut.colorOfTheDayStreak()
        
        XCTAssertEqual(expected, actual)
    }
    
    func test_colorOfTheDayStreak_3_days_and_completed_today_returns_4() {
        let sut = GameManager()

        sut.datesCompletedColorOfDay = [
            Date.now,
            Date.now.minus(1),
            Date.now.minus(2),
            Date.now.minus(3)
        ]
        
        let expected = 4
        
        let actual = sut.colorOfTheDayStreak()
        
        XCTAssertEqual(expected, actual)
    }

}
