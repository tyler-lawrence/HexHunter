//
//  GameManagerTests.swift
//  WhatTheHexTests
//
//  Created by Tyler Lawrence1 on 4/16/24.
//

import XCTest

final class DataControllerTests: XCTestCase {
        
    //MARK: colorOfTheDayStreak

    func test_colorOfTheDayStreak_empty_returns_0() {
        
        let sut = DataController()
        sut.datesCompletedColorOfTheDay = []
        
        let expected = 0
        
        let actual = sut.colorOfTheDayStreak
        
        XCTAssertEqual(expected, actual)
    }
    
    func test_colorOfTheDayStreak_3_ascending_returns_3() {
        
        let sut = DataController()

        sut.datesCompletedColorOfTheDay = [
            Date.now.minus(1),
            Date.now.minus(2),
            Date.now.minus(3),
        ]
        
        let expected = 3
        
        let actual = sut.colorOfTheDayStreak
        
        XCTAssertEqual(expected, actual)
    }
    
    func test_colorOfTheDayStreak_gap_in_3_day_span_returns_1() {
        let sut = DataController()

        sut.datesCompletedColorOfTheDay = [
            Date.now.minus(1),
            Date.now.minus(3),
        ]
        
        let expected = 1
        
        let actual = sut.colorOfTheDayStreak
        
        XCTAssertEqual(expected, actual)
    }
    
    func test_colorOfTheDayStreak_3_consecutive_days_then_1_missed_returns_1() {
        let sut = DataController()

        sut.datesCompletedColorOfTheDay = [
            Date.now,
            Date.now.minus(2),
            Date.now.minus(3),
            Date.now.minus(4)
        ]
        
        let expected = 1
        
        let actual = sut.colorOfTheDayStreak
        
        XCTAssertEqual(expected, actual)
    }
    
    func test_colorOfTheDayStreak_3_days_and_completed_today_returns_4() {
        let sut = DataController()

        sut.datesCompletedColorOfTheDay = [
            Date.now,
            Date.now.minus(1),
            Date.now.minus(2),
            Date.now.minus(3)
        ]
        
        let expected = 4
        
        let actual = sut.colorOfTheDayStreak
        
        XCTAssertEqual(expected, actual)
    }
    
    func test_colorOfTheDayStreak_1_day_returns_1() {
        let sut = DataController()

        sut.datesCompletedColorOfTheDay = [
            Date.now,
        ]
        
        let expected = 1
        
        let actual = sut.colorOfTheDayStreak
        
        XCTAssertEqual(expected, actual)
    }
    
    func test_colorOfTheDayStreak_2_day_returns_2() {
        let sut = DataController()

        sut.datesCompletedColorOfTheDay = [
            Date.now,
            Date.now.minus(1)
        ]
        
        let expected = 2
        
        let actual = sut.colorOfTheDayStreak
        
        XCTAssertEqual(expected, actual)
    }
    
    func test_colorOfTheDayStreak_unorderedDates_valid_streak_2_returns_2() {
        let sut = DataController()

        sut.datesCompletedColorOfTheDay = [
            Date.now.minus(1),
            Date.now
        ]
        
        let expected = 2
        
        let actual = sut.colorOfTheDayStreak
        
        XCTAssertEqual(expected, actual)
    }

    func test_colorOfTheDayStreak_3_consecutive_days_in_past_returns_0() {
        let sut = DataController()

        sut.datesCompletedColorOfTheDay = [
            Date.now.minus(10),
            Date.now.minus(11),
            Date.now.minus(12)
        ]
        
        let expected = 0
        
        let actual = sut.colorOfTheDayStreak
        
        XCTAssertEqual(expected, actual)
    }
}
