//
//  Guess.swift
//  WhatTheHex
//
//  Created by Tyler Lawrence1 on 4/6/24.
//

import Foundation

struct Guess: Hashable {
    
    static func == (lhs: Guess, rhs: Guess) -> Bool {
        (lhs.playerGuess.id == rhs.playerGuess.id) && (lhs.target.id == rhs.target.id)
    }
    
    let playerGuess: Hexcode
    let target: Hexcode
    
    var similarity: String {
        String(format: "%.2f", playerGuess.calculateSimilarity(to: target))
    }
}
