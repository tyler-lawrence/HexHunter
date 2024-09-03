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
        if completedColorOfTheDay {
            return colorOfTheDaySubmissions.sorted(by: {$0.date > $1.date}).first
        } else {
            return nil
        }
    }
    /// indicator for if user has already completed the color of the day challenge
    var completedColorOfTheDay: Bool {
        let lastMidnight: Date = calendar.startOfDay(for: Date.now)
        let sortedDates: [Date] = colorOfTheDaySubmissions.map {$0.date}.sorted(by: >)
        let mostRecentDate: Date? = sortedDates.first
        guard let mostRecentDate else { return false }
        if mostRecentDate > lastMidnight {
            return true
        } else {
            return false
        }
    }
    private var calendar = Calendar(identifier: .gregorian)
    init() {
        self.colorOfTheDaySubmissions = load()
    }
    static private let submissionPath: String = "colorOfTheDaySubmissions.json"
    /// loads submissions to color of the day from file manager
    /// - Returns: array of Submissions
    func load() -> [Submission] {
        do {
            let directory = try FileManager.default.url(
                for: .documentDirectory,
                in: .userDomainMask,
                appropriateFor: nil,
                create: false
            )
            let url: URL = directory.appendingPathComponent(DataController.submissionPath)
            let encodedSubmissions = try Data(contentsOf: url)
            let decodedSubmissions = try JSONDecoder().decode([Submission].self, from: encodedSubmissions)
            return decodedSubmissions
        } catch {
            debugPrint(error)
            return []
        }
    }
    /// saves the current submissions to ColorOfTheDay to file manager
    func save() {
        do {
            let directory = try FileManager.default.url(
                for: .documentDirectory,
                in: .userDomainMask,
                appropriateFor: nil,
                create: false
            )
            try JSONEncoder()
                .encode(colorOfTheDaySubmissions)
                .write(to: directory.appendingPathComponent(DataController.submissionPath))
        } catch {
            print("Unable to save data")
        }
    }
    func refresh() {
        save()
        self.colorOfTheDaySubmissions = load()
    }
}

#if DEBUG
extension DataController {
    static var sample1DayStreak: DataController {
        let dataController = DataController()
        dataController.colorOfTheDaySubmissions = [
            Submission.sampleYesterday
        ]
        return dataController
    }
    static var sample: DataController {
        let dataController = DataController()
        dataController.colorOfTheDaySubmissions = [
            Submission.sampleYesterday,
            Submission.sampleToday,
            Submission.sampleToday,
            Submission.sampleToday,
            Submission.sampleToday,
            Submission.sampleToday,
            Submission.sampleToday
        ]
        return dataController
    }
}
#endif
