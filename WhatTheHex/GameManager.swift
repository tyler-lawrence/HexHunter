//
//  GameManager.swift
//  WhatTheHex
//
//  Created by Tyler Lawrence1 on 4/16/24.
//

import Foundation

@Observable
class GameManager {
    
    //MARK: Color of the Day
    var colorOfDayCompleted: Bool = false // compute from array?
    var datesCompletedColorOfDay: [Date] = []
    
    var lastRefresh: Date = Date.now
    
    private var calendar = Calendar(identifier: .gregorian)
    
    private func toDate() -> DateComponents {
        calendar.dateComponents([.year, .month, .day], from: lastRefresh)
    }
    
    /// check to see if we need to refresh the colorOfTheDay
    func refresh() {
        let lastMidnight: Date = calendar.startOfDay(for: Date.now)
        if lastRefresh < lastMidnight {
            colorOfDayCompleted = false
        }
        lastRefresh = Date.now
    }
    
    var colorOfTheDayStreak: Int {
        datesCompletedColorOfDay.streakCount()
    }
    
}


extension GameManager {
    static var sample: GameManager {
        let gm = GameManager()
        gm.datesCompletedColorOfDay = [
            Date.now,
            Date.now.addingTimeInterval(-86_400),
            Date.now.addingTimeInterval(-172_800)
        ]
        return gm
    }
}
