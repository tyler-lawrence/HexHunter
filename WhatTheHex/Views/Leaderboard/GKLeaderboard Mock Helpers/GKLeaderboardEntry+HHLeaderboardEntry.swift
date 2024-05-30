//
//  GKLeaderboardEntry+HHLeaderboardEntry.swift
//  WhatTheHex
//
//  Created by Tyler Lawrence1 on 5/30/24.
//

import Foundation
import GameKit

extension GKLeaderboard.Entry: HHLeaderboardEntry {
    var alias: String {
        self.player.alias
    }
}
