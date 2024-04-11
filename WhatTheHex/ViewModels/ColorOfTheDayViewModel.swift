//
//  ColorOfTheDayViewModel.swift
//  WhatTheHex
//
//  Created by Tyler Lawrence1 on 4/10/24.
//

import Foundation

class ColorOfTheDayViewModel: AccuracyGameViewModel {
    
    private let service: ColorOfDayService
    
    init(service: ColorOfDayService) {
        self.service = service
    }
    
    func getHexcodeOfDay() async {
        
        do {
            // get hexcode string from cloudkit
            let colorOfTheDay: String = try await service.fetchColorOfDay(for: Date.now)
        } catch {
            print("\(error.localizedDescription)")
        }
        
        targetHexcode = Hexcode()
        
        // assign hex to target
        // targetHexcode = 
    }
    
    override func submitGuess() {
        // TODO: record completed daily challenge
        gameOver = true
    }
}
