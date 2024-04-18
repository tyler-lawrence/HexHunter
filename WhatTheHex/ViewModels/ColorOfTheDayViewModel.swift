//
//  ColorOfTheDayViewModel.swift
//  WhatTheHex
//
//  Created by Tyler Lawrence1 on 4/10/24.
//

import Foundation

/// When testing, make sure you are signed into iCloud on the simulator

@Observable
class ColorOfTheDayViewModel: AccuracyGameViewModel {
    
    private let service: ColorOfDayService
    var completedColorOfTheDay = false
    
    init(service: ColorOfDayService) {
        self.service = service
    }
    
    func getHexcodeOfDay() async -> Hexcode? {
        
        do {
            let colorOfTheDay: String = try await service.fetchColorOfDay(for: NSDate())
            guard let hexcode = Hexcode(from: colorOfTheDay) else { return nil}
            targetHexcode = hexcode
            return hexcode
        } catch {
            print("\(error.localizedDescription)")
        }
        
        return nil
    }
    
    override func submitGuess() {
        completedColorOfTheDay = true
        gameOver = true
    }
}
