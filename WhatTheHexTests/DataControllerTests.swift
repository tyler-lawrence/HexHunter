//
//  GameManagerTests.swift
//  WhatTheHexTests
//
//  Created by Tyler Lawrence1 on 4/16/24.
//

import XCTest

final class DataControllerTests: XCTestCase {
        
    //MARK: colorOfTheDayStreak
    
    func sampleSubmission(daysInPast: Int) -> Submission {
        return Submission(playerGuess: Hexcode.random(), target: Hexcode.random(), date: Date.now.minus(daysInPast))
    }

    func test_colorOfTheDayStreak_empty_returns_0() {
        
        let sut = DataController()
        sut.colorOfTheDaySubmissions = []
        
        let expected = 0
        
        let actual = sut.colorOfTheDayStreak
        
        XCTAssertEqual(expected, actual)
    }
    
    func test_colorOfTheDayStreak_3_ascending_returns_3() {
        
        let sut = DataController()

        sut.colorOfTheDaySubmissions = [
            sampleSubmission(daysInPast: 1),
            sampleSubmission(daysInPast: 2),
            sampleSubmission(daysInPast: 3)
        ]
        
        let expected = 3
        
        let actual = sut.colorOfTheDayStreak
        
        XCTAssertEqual(expected, actual)
    }
    
    func test_colorOfTheDayStreak_gap_in_3_day_span_returns_1() {
        let sut = DataController()

        sut.colorOfTheDaySubmissions = [
            sampleSubmission(daysInPast: 1),
            sampleSubmission(daysInPast: 3),
        ]
        
        let expected = 1
        
        let actual = sut.colorOfTheDayStreak
        
        XCTAssertEqual(expected, actual)
    }
    
    func test_colorOfTheDayStreak_3_consecutive_days_then_1_missed_returns_1() {
        let sut = DataController()

        sut.colorOfTheDaySubmissions = [
            sampleSubmission(daysInPast: 0),
            sampleSubmission(daysInPast: 2),
            sampleSubmission(daysInPast: 3),
            sampleSubmission(daysInPast: 4)
        ]
        
        let expected = 1
        
        let actual = sut.colorOfTheDayStreak
        
        XCTAssertEqual(expected, actual)
    }
    
    func test_colorOfTheDayStreak_3_days_and_completed_today_returns_4() {
        let sut = DataController()

        sut.colorOfTheDaySubmissions = [
            sampleSubmission(daysInPast: 0),
            sampleSubmission(daysInPast: 1),
            sampleSubmission(daysInPast: 2),
            sampleSubmission(daysInPast: 3)
        ]
        
        let expected = 4
        
        let actual = sut.colorOfTheDayStreak
        
        XCTAssertEqual(expected, actual)
    }
    
    func test_colorOfTheDayStreak_1_day_returns_1() {
        let sut = DataController()

        sut.colorOfTheDaySubmissions = [
            sampleSubmission(daysInPast: 0),
        ]
        
        let expected = 1
        
        let actual = sut.colorOfTheDayStreak
        
        XCTAssertEqual(expected, actual)
    }
    
    func test_colorOfTheDayStreak_2_day_returns_2() {
        let sut = DataController()

        sut.colorOfTheDaySubmissions = [
            sampleSubmission(daysInPast: 0),
            sampleSubmission(daysInPast: 1)
        ]
        
        let expected = 2
        
        let actual = sut.colorOfTheDayStreak
        
        XCTAssertEqual(expected, actual)
    }
    
    func test_colorOfTheDayStreak_unorderedDates_valid_streak_2_returns_2() {
        let sut = DataController()

        sut.colorOfTheDaySubmissions = [
            sampleSubmission(daysInPast: 1),
            sampleSubmission(daysInPast: 0)
        ]
        
        let expected = 2
        
        let actual = sut.colorOfTheDayStreak
        
        XCTAssertEqual(expected, actual)
    }

    func test_colorOfTheDayStreak_3_consecutive_days_in_past_returns_0() {
        let sut = DataController()

        sut.colorOfTheDaySubmissions = [
            sampleSubmission(daysInPast: 10),
            sampleSubmission(daysInPast: 11),
            sampleSubmission(daysInPast: 12)
        ]
        
        let expected = 0
        
        let actual = sut.colorOfTheDayStreak
        
        XCTAssertEqual(expected, actual)
    }
}
