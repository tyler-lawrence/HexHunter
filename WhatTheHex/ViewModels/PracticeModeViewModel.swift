//
//  GameViewModel.swift
//  WhatTheHex
//
//  Created by Tyler Lawrence1 on 4/1/24.
//

import Foundation

@Observable
class PracticeModeViewModel: GameViewModel {
    
    var targetHexcode: Hexcode = Hexcode.random()
    var playerHexcode: Hexcode = Hexcode()
    
    var gameOverMessage: String {
        """
        Target: \(targetHexcode.display)
        Your Guess: \(playerHexcode.display)
        """
    }
    
    var accuracy: String {
        String(format: "%.2f", calculateScore())
    }
    
    var gameOver: Bool = false
    
    func submitGuess() {
        gameOver = true
    }
    
    /// resets the game and starts timer
    func reset() {
        gameOver = false
        targetHexcode = Hexcode.random()
        playerHexcode = Hexcode()
    }
    
    /// Calculates a score representing the difference between two hexes.
    /// scores range from 0 - 100. higher scores are better
    /// - Parameter rhs: Hexcode to compare against
    /// - Returns: Double between 0 and 100
    func calculateScore() -> Double {
        playerHexcode.calculateSimilarity(to: targetHexcode)
    }
}
