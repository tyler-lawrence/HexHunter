//
//  Guess.swift
//  WhatTheHex
//
//  Created by Tyler Lawrence1 on 4/6/24.
//

import Foundation

struct Submission: Hashable, Identifiable, Codable {
    
    static func == (lhs: Submission, rhs: Submission) -> Bool {
        (lhs.playerGuess.id == rhs.playerGuess.id) && (lhs.target.id == rhs.target.id)
    }
    var id = UUID()
    let playerGuess: Hexcode
    let target: Hexcode
    var date: Date
    
    var similarityScore: Double {
        playerGuess.calculateSimilarity(to: target)
    }
    
    var similarityLabel: String {
        String(format: "%.2f", playerGuess.calculateSimilarity(to: target))
    }
    
    init(playerGuess: Hexcode, target: Hexcode, date: Date = Date.now){
        self.playerGuess = playerGuess
        self.target = target
        self.date = date
    }

}

#if DEBUG
extension Submission {
    static let sampleToday = Submission(playerGuess: Hexcode.random(), target: Hexcode.random())
    static let sampleYesterday = Submission(playerGuess: Hexcode.random(), target: Hexcode.random(), date: Date.now.minus(1))
    
}
#endif
