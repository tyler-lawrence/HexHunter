//
//  GameCenterManager.swift
//  WhatTheHex
//
//  Created by Tyler Lawrence1 on 4/26/24.
//

import Foundation
import GameKit

class GameCenterManager {
    
    static var shared = GameCenterManager()
    
    var localPlayer = GKLocalPlayer.local
    private(set) var isGameCenterEnabled: Bool = false
    
    func authenticateLocalPlayer(){
        localPlayer.authenticateHandler = { _, error in
            if error != nil {
                print(error!.localizedDescription)
            }  else if self.localPlayer.isAuthenticated {
                self.isGameCenterEnabled = true
            } else {
                print("could not authenticate")
            }
        }
    }
    
    func uploadScore(_ score: Int, for mode: GameMode) async {
        guard GameCenterManager.shared.isGameCenterEnabled else { return }
        guard let leaderboardID = mode.gameCenterLeaderboardID else { return }
        do {
            try await GKLeaderboard.submitScore(
                score,
                context: 0,
                player: GameCenterManager.shared.localPlayer,
                leaderboardIDs: [leaderboardID]
            )
        } catch {
            print(error.localizedDescription)
        }
    }
    
}
