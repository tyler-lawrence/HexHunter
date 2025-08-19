//
//  Array+DateUtils.swift
//  WhatTheHex
//
//  Created by Tyler Lawrence1 on 4/16/24.
//

import Foundation

extension Array where Element == Date {
    /// calculates the number of consecutive days by calendar date
    /// - Returns: int representing number of days in streak
    func streakCount() -> Int {
        let reverseChronologicalSorted = self.sorted(by: >)
        guard !reverseChronologicalSorted.isEmpty else { return 0 }
        // check to see if first day is > yesterday start
        let yesterdayStart = Calendar(identifier: .gregorian).startOfDay(for: Date.now.minus(1))
        if let first = reverseChronologicalSorted.first {
            guard first > yesterdayStart else { return 0 }
        }
        guard reverseChronologicalSorted.count > 1 else { return 1 }
        var streak: Int = 1
        /// given a day in the sorted array we look at the day before it, calculate its valid range
        /// and then see if the given day is within the valid range
        for dateIndex in 1 ... reverseChronologicalSorted.count - 1 {
            let validRange = reverseChronologicalSorted[dateIndex-1].dayRange()
            if validRange.contains(reverseChronologicalSorted[dateIndex]) {
                streak += 1
            } else {
                break
            }
        }
        return streak
    }
}
