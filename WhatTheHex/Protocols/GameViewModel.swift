//
//  GameViewModel.swift
//  WhatTheHex
//
//  Created by Tyler Lawrence1 on 4/6/24.
//

import Foundation
import Combine

typealias TimedGameViewModel = TimedGame & GameViewModel

protocol GameViewModel {
    var targetHexcode: Hexcode { get set }
    var playerHexcode: Hexcode { get set }
    var gameOver: Bool  { get set }
    
    func submitGuess()
    func reset()
    func calculateScore() -> Double
}
