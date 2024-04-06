//
//  GameViewModel.swift
//  WhatTheHex
//
//  Created by Tyler Lawrence1 on 4/1/24.
//

import Foundation
import Combine

@Observable
class QuickGameViewModel: TimedGameViewModel {
    
    var targetHexcode: Hexcode = Hexcode.random()
    var playerHexcode: Hexcode = Hexcode()
    
    var timer = Timer.publish(every: 1, on: .main, in: .common)
    var timerSubscription: Cancellable?
    let gameTimeMax: Int
    var timeRemaining: Int
    
    var gameOver: Bool = false
    
    init(gameTimeMax: Int = 30){
        self.gameTimeMax = gameTimeMax
        self.timeRemaining = gameTimeMax
        self.timerSubscription = timer.connect()
    }
    
    func submitGuess() {
        gameOver = true
    }
    
    /// resets the game and starts timer
    func reset() {
        targetHexcode = Hexcode.random()
        playerHexcode = Hexcode()
        timeRemaining = gameTimeMax
        timer = Timer.publish(every: 1, on: .main, in: .common)
        timerSubscription = timer.connect()
    }
    
    /// Calculates a score representing the difference between two hexes.
    /// scores range from 0 - 100. higher scores are better
    /// - Parameter rhs: Hexcode to compare against
    /// - Returns: Double between 0 and 100
    func calculateScore() -> Double {
        playerHexcode.calculateSimilarity(to: targetHexcode)
    }
}
