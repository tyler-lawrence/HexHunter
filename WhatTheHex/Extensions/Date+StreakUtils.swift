//
//  Date+StreakUtils.swift
//  WhatTheHex
//
//  Created by Tyler Lawrence1 on 4/16/24.
//

import Foundation

extension Date {
    
    func dayRange() -> ClosedRange<Date> {
        let secondsInDay: TimeInterval = 86_400
        let calendar = Calendar(identifier: .gregorian)
        let dayStart = calendar.startOfDay(for: self) - secondsInDay
        let dayEnd = dayStart + 86_400
        return dayStart-1 ... dayEnd+1
    }
    
}
