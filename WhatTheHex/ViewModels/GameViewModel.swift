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
    
    func gameOver() {
        showingAlert = true
        timerSubscription?.cancel()
    }
    
    func reset() {
        targetHexcode = Hexcode.random()
        playerHexcode = Hexcode()
        timeRemaining = gameTimeMax
        timer = Timer.publish(every: 1, on: .main, in: .common)
        timerSubscription = timer.connect()
    }
    
    /// Calculates a score representing the difference between two hexes.
    /// A higher score is a larger error
    /// - Parameter rhs: Hexcode to compare against
    /// - Returns: Double between 0 and 3
    func calculateScore() -> Double {
        let redDifference = abs(targetHexcode.red.colorScaleNormalized() - playerHexcode.red.colorScaleNormalized())
        let greenDifference = abs(targetHexcode.green.colorScaleNormalized() - playerHexcode.green.colorScaleNormalized())
        let blueDifference = abs(targetHexcode.blue.colorScaleNormalized() - playerHexcode.blue.colorScaleNormalized())
        return redDifference + greenDifference + blueDifference
    }
}
