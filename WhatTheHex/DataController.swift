//
//  DataController.swift
//  WhatTheHex
//
//  Created by Tyler Lawrence1 on 4/18/24.
//

import Foundation

@Observable
final class DataController {
    
    var colorOfTheDaySubmissions: [Submission] = []
    
    var todaySubmission: Submission? {
        if completedColorOfTheDay{
            return colorOfTheDaySubmissions.sorted(by: {$0.date > $1.date} ).first
        } else {
            return nil
        }
    }
    
    /// indicator for if user has already completed the color of the day challenge
    var completedColorOfTheDay: Bool {
        let lastMidnight: Date = calendar.startOfDay(for: Date.now)
        let mostRecentDate: Date? = colorOfTheDaySubmissions.map{$0.date}.sorted(by: >).first
        guard let mostRecentDate else { return false }
        if mostRecentDate > lastMidnight {
            return true
        } else {
            return false
        }
    }
    
    var colorOfTheDayStreak: Int {
        colorOfTheDaySubmissions.map{$0.date}.streakCount()
    }
    
    private var calendar = Calendar(identifier: .gregorian)
    
    init() {
        self.colorOfTheDaySubmissions = load()
    }
    
    static private let submissionPath: String = "colorOfTheDaySubmissions.json"
    
    /// loads dates representing the completedColorOfTheDay from file manager
    /// - Returns: array of dates
    func load() -> [Submission] {
        do {
            let directory = try FileManager.default.url(
                for: .documentDirectory,
                in: .userDomainMask,
                appropriateFor: nil,
                create: false
            )
            let encodedSubmissions = try Data(contentsOf: directory.appendingPathComponent(DataController.submissionPath))
            let decodedDates = try JSONDecoder().decode([Submission].self, from: encodedSubmissions)
            return decodedDates
        } catch {
            debugPrint(error)
            return []
        }
    }
    
    /// saves the current dates of completion for ColorOfTheDay to file manager
    func save() {
        do {
            let directory = try FileManager.default.url(
                for: .documentDirectory,
                in: .userDomainMask,
                appropriateFor: nil,
                create: false
            )
            try JSONEncoder().encode(colorOfTheDaySubmissions).write(to: directory.appendingPathComponent(DataController.submissionPath))
        } catch {
            print("Unable to save data")
        }
    }
}

#if DEBUG
extension DataController {
    static var sample1DayStreak: DataController {
        let dc = DataController()
        dc.colorOfTheDaySubmissions = [
            Submission.sampleYesterday
        ]
        return dc
    }
}
#endif
