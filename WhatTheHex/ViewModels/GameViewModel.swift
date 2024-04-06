//
//  GameViewModel.swift
//  WhatTheHex
//
//  Created by Tyler Lawrence1 on 4/1/24.
//

import Foundation
import Combine

@Observable
class GameViewModel {
    
    var targetHexcode: Hexcode = Hexcode.random()
    var playerHexcode: Hexcode = Hexcode()
    
    var timer = Timer.publish(every: 1, on: .main, in: .common)
    var timerSubscription: Cancellable?
    let gameTimeMax: Int
    var timeRemaining: Int
    
    var showingAlert: Bool = false
    
    init(gameTimeMax: Int = 30){
        self.gameTimeMax = gameTimeMax
        self.timeRemaining = gameTimeMax
        self.timerSubscription = timer.connect()
    }
    
    /// triggers alert and cancels timer
    func gameOver() {
        showingAlert = true
        timerSubscription?.cancel()
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
        
        let redDifference = 1 - abs(targetHexcode.red.toColorScale() - playerHexcode.red.toColorScale()) / 255
        let greenDifference = 1 - abs(targetHexcode.green.toColorScale() - playerHexcode.green.toColorScale()) / 255
        let blueDifference = 1 - abs(targetHexcode.blue.toColorScale() - playerHexcode.blue.toColorScale()) / 255
        return (redDifference + greenDifference + blueDifference) / 3 * 100
    }
}
