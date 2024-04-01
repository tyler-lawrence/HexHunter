//
//  GameViewModel.swift
//  WhatTheHex
//
//  Created by Tyler Lawrence1 on 4/1/24.
//

import Foundation

@Observable
class GameViewModel {
    
    var targetHexcode: Hexcode = Hexcode.random()
    var playerHexcode: Hexcode = Hexcode()
    
    func reset() {
        targetHexcode = Hexcode.random()
        playerHexcode = Hexcode()
    }
    
    /// Calculates a score representing the difference between two hexes.
    /// A higher score is a larger error
    /// - Parameter rhs: Hexcode to compare against
    /// - Returns: Double between 0 and 3
    func calculateScore() -> Double {
        let redDifference = abs(targetHexcode.red.toColorScale() - playerHexcode.red.toColorScale())
        let greenDifference = abs(targetHexcode.green.toColorScale() - playerHexcode.green.toColorScale())
        let blueDifference = abs(targetHexcode.blue.toColorScale() - playerHexcode.blue.toColorScale())
        return redDifference + greenDifference + blueDifference
    }
}
