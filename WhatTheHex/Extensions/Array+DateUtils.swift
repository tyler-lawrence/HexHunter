//
//  Array+DateUtils.swift
//  WhatTheHex
//
//  Created by Tyler Lawrence1 on 4/16/24.
//

import Foundation

extension Array where Element == Date {
    
    func streakCount() -> Int {
        
        let reverseChronologicalSorted = self.sorted(by: >)
        
        guard !reverseChronologicalSorted.isEmpty else { return 0 }
        guard reverseChronologicalSorted.count > 1 else { return 1 }
        var streak: Int = 1
        
        for i in 1 ... self.count - 1 {
            
            let validRange = self[i-1].dayRange()

            if validRange.contains(self[i]) {
                streak += 1
            } else {
                break
            }
            
        }
        
        return streak
    }
}
