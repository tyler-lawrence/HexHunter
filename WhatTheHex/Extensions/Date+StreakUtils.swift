//
//  Date+StreakUtils.swift
//  WhatTheHex
//
//  Created by Tyler Lawrence1 on 4/16/24.
//

import Foundation

extension Date {
    
    /// calculates the datetimes capturing the 24 hour span of the previous day
    /// ex: if now is 4/19 at 2:00 pm the valid range is 4/18 12:00 am to 4:18 11:59 pm (with a 1 minute buffer on both sides to account for records in CloudKit that might be created exactly at 12:00 am)
    /// - Returns: valid date range
    func dayRange() -> ClosedRange<Date> {
        let secondsInDay: TimeInterval = 86_400
        let calendar = Calendar(identifier: .gregorian)
        let dayStart = calendar.startOfDay(for: self) - secondsInDay
        let dayEnd = calendar.startOfDay(for: self)
        return dayStart-1 ... dayEnd+1
    }
    
    /// Helper function to simulate recording a date in the past
    /// - Parameter days: number of days to subtract
    /// - Returns: Date of Now - days
    func minus(_ days: Int) -> Date {
        let secondsInDay = 86_400
        let intervalToSubtract = TimeInterval(secondsInDay * days)
        return Date.now - intervalToSubtract
    }
    
}
