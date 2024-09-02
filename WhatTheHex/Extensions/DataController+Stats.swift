//
//  DataController+Stats.swift
//  WhatTheHex
//
//  Created by Tyler Lawrence1 on 6/10/24.
//

import Foundation

extension DataController {
    // MARK: Player
    var colorOfTheDayStreak: Int {
        colorOfTheDaySubmissions.map {$0.date}.streakCount()
    }
    // MARK: Color of the Day
    var totalGamesPlayed: Int {
        colorOfTheDaySubmissions.count
    }
    var averageScore: Double {
        Double(colorOfTheDaySubmissions.map {$0.accuracy}.reduce(0.0, +) / Double(colorOfTheDaySubmissions.count))
    }
}
