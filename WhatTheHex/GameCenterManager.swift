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
    
    func fetchLeaderboardEntries(for gameMode: GameMode) async -> [GKLeaderboard.Entry] {
        var entries: [GKLeaderboard.Entry] = []
        guard let leaderboardID = gameMode.gameCenterLeaderboardID else { return entries }
        
        do {
            let leaderboards  = try await GKLeaderboard.loadLeaderboards(IDs: [leaderboardID])
            if let modeLeaderboard = leaderboards.first(where: {$0.baseLeaderboardID == leaderboardID}) {
                let leaderboardEntries = try await modeLeaderboard.loadEntries(for: .global, timeScope: .allTime, range: NSRange(1...100))
                entries = leaderboardEntries.1
            }
        } catch {
            print(error.localizedDescription)
        }
        return entries
    }
    
    func fetchPlayerLeaderboardEntry(for gameMode: GameMode) async -> GKLeaderboard.Entry? {
        var entry: GKLeaderboard.Entry? = nil
        guard let leaderboardID = gameMode.gameCenterLeaderboardID else { return entry }
        
        do {
            let leaderboards  = try await GKLeaderboard.loadLeaderboards(IDs: [leaderboardID])
            if let modeLeaderboard = leaderboards.first(where: {$0.baseLeaderboardID == leaderboardID}) {
                let fetchedEntry: (GKLeaderboard.Entry?, [GKLeaderboard.Entry]) = try await modeLeaderboard.loadEntries(for: [localPlayer], timeScope: .today)
                entry = fetchedEntry.0
            }
        } catch {
            print(error.localizedDescription)
        }
        
        return entry
    }
}
