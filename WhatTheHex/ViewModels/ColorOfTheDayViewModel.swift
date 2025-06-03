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
class ColorOfTheDayViewModel: GameViewModel & LeaderboardGame {
    var targetHexcode: Hexcode
    var playerHexcode: Hexcode
    var gameOver: Bool
    var audioFileName: String
    private let service: ColorOfDayService
    let dataController: DataController
    init(
        service: ColorOfDayService = CloudKitService(),
        dataController: DataController,
        audioFileName: String = "GameplayLoop",
        gameOver: Bool = false
    ) {
        self.dataController = dataController
        self.service = service
        self.audioFileName = audioFileName
        self.gameOver = gameOver
        self.playerHexcode = Hexcode()
        self.targetHexcode = Hexcode()
    }
    var accuracy: String {
        String(format: "%.2f", calculateScore())
    }
    var gameOverMessage: String {
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
    func submitGuess() {
        let submission = Submission(playerGuess: playerHexcode, target: targetHexcode)
        dataController.colorOfTheDaySubmissions.append(submission)
        gameOver = true
        NotificationManager.shared.update(using: dataController)
        dataController.refresh()
    }
    func reset() {
        gameOver = false
        targetHexcode = Hexcode.random()
        playerHexcode = Hexcode()
    }
    func calculateScore() -> Double {
        playerHexcode.calculateSimilarity(to: targetHexcode)
    }
}

#if DEBUG
extension ColorOfTheDayViewModel {
    static var sample = ColorOfTheDayViewModel(
        service: CloudKitService(),
        dataController: DataController()
    )
}
#endif
