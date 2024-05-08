//
//  ColorOfTheDayViewModel.swift
//  WhatTheHex
//
//  Created by Tyler Lawrence1 on 4/10/24.
//

import Foundation
import GameKit

/// When testing, make sure you are signed into iCloud on the simulator

@Observable
class ColorOfTheDayViewModel: PracticeModeViewModel & LeaderboardGame {
    
    private let service: ColorOfDayService
    let dataController: DataController
    
    init(service: ColorOfDayService, dataController: DataController) {
        self.dataController = dataController
        self.service = service
        super.init()
    }
    
    override var gameOverMessage: String {
                """
                Target: \(targetHexcode.display)
                Your Guess: \(playerHexcode.display)
                Accuracy: \(accuracy)
                """
    }
    
    var GKFormattedScore: Int {
        Int(calculateScore() * 100 )
    }
    
    /// fetch the hexcode for today from a colorOfDayService
    /// - Returns: Hexcode object for a fetched hexcode string if found
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
    
    /// adds current date to dataController and marks the game over
    override func submitGuess() {
        dataController.datesCompletedColorOfTheDay.append(Date.now)
        gameOver = true
    }
    
}

#if DEBUG
extension ColorOfTheDayViewModel {
    static var sample = ColorOfTheDayViewModel(service: CloudKitService(), dataController: DataController())
}
#endif
