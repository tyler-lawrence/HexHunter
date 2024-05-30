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
    static let sample = MockGKLeaderboardEntry(rank: 2, score: 20, alias: "LonesomeMouse 23487")
}
