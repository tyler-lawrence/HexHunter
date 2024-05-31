//
//  MockGKLeaderboardEntry.swift
//  WhatTheHex
//
//  Created by Tyler Lawrence1 on 5/30/24.
//

import Foundation

struct MockGKLeaderboardEntry: HHLeaderboardEntry {
    var rank: Int
    var score: Int
    var alias: String
    static let sampleSurvival = MockGKLeaderboardEntry(rank: 2, score: 20, alias: "LonesomeMouse 23487")
    static let sampleColorOfTheDay = MockGKLeaderboardEntry(rank: 2, score: 9870, alias: "LonesomeMouse 23487")
}
