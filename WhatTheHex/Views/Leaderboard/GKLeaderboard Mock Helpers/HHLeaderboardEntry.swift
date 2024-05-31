//
//  HHLeaderboardEntry.swift
//  WhatTheHex
//
//  Created by Tyler Lawrence1 on 5/30/24.
//

import Foundation

protocol HHLeaderboardEntry {
    var rank: Int { get }
    var score: Int { get }
    var alias: String { get }
}
