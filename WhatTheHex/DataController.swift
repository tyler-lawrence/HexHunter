//
//  DataController.swift
//  WhatTheHex
//
//  Created by Tyler Lawrence1 on 4/18/24.
//

import Foundation

@Observable
final class DataController {
    
    var datesCompletedColorOfTheDay: [Date] = []
    var completedColorOfTheDay: Bool {
        let lastMidnight: Date = calendar.startOfDay(for: Date.now)
        let mostRecentDate: Date? = datesCompletedColorOfTheDay.sorted(by: >).first
        guard let mostRecentDate else { return false }
        if mostRecentDate > lastMidnight {
            return true
        } else {
            return false
        }
    }
    
    var colorOfTheDayStreak: Int {
        datesCompletedColorOfTheDay.streakCount()
    }
    var lastRefresh: Date = Date.now
    
    private var calendar = Calendar(identifier: .gregorian)
    
    init() {
        self.datesCompletedColorOfTheDay = load()
    }
    
    
    private func toDate() -> DateComponents {
        calendar.dateComponents([.year, .month, .day], from: lastRefresh)
    }
    
//    /// check to see if we need to refresh the colorOfTheDay
//    func refresh() {
//        let lastMidnight: Date = calendar.startOfDay(for: Date.now)
//        if lastRefresh < lastMidnight {
//            completedColorOfTheDay = false
//        }
//        lastRefresh = Date.now
//    }
    
    func load() -> [Date] {
        do {
            let directory = try FileManager.default.url(
                for: .documentDirectory,
                in: .userDomainMask,
                appropriateFor: nil,
                create: false
            )
            let encodedDates = try Data(contentsOf: directory.appendingPathComponent("datesCompletedColorOfTheDay.json"))
            let decodedDates = try JSONDecoder().decode([Date].self, from: encodedDates)
            return decodedDates
        } catch {
            debugPrint(error)
            return []
        }
    }
    
    func save() {
        do {
            let directory = try FileManager.default.url(
                for: .documentDirectory,
                in: .userDomainMask,
                appropriateFor: nil,
                create: false
            )
            try JSONEncoder().encode(datesCompletedColorOfTheDay).write(to: directory.appendingPathComponent("datesCompletedColorOfTheDay.json"))
        } catch {
            print("Unable to save data")
        }
    }
}
