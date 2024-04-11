//
//  DataManager.swift
//  WhatTheHex
//
//  Created by Tyler Lawrence1 on 4/11/24.
//

import Foundation

@Observable
final class DataManager {

    var completedDailyChallenge: Bool = false
    var dailyChallengeCompletionDate: Date = Date.now
    
    init() {
        self.completedDailyChallenge = dailyChallengeCompletionDate == Date.now
    }
}
