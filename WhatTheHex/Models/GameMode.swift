//
//  GameMode.swift
//  WhatTheHex
//
//  Created by Tyler Lawrence1 on 4/25/24.
//

import Foundation

enum GameMode: String {
    
    case practice = "Practice"
    case rapid = "Rapid"
    case survival = "Survival"
    case colorOfTheDay = "Color of the Day"
    
    static var leaderboardModes: [GameMode] = [.colorOfTheDay, .survival]
    
    var gameCenterLeaderboardID: String? {
        switch self {
        case .practice:
            nil
        case .rapid:
            nil
        case .survival:
            "survivalmode"
        case .colorOfTheDay:
            "ColorOfTheDay"
        }
    }
    
    var onboardingInstructions: [String] {
        switch self {
        case .practice:
            ["Hone your hex hunting skills"]
        case .rapid:
            [
                "90 seconds to correctly guess as many hexcodes as you can.",
                "Your guess must be 80% accurate to count as a success."
            ]
        case .survival:
            [
                "See how long you can last in this hex hunting endurance game.",
                "Correct guesses add time back to the clock. Be careful! Each guess costs 2 seconds.",
                "As you progress through the game the difficulty will increase."
            ]
        case .colorOfTheDay:
            [
                "See how accurately you can guess today's color.",
                "A new color is available each day. Play every day to maintain a streak."
            ]
        }
    }
}
