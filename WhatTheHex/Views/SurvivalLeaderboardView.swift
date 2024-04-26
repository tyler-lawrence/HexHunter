//
//  SurvivalLeaderboardView.swift
//  WhatTheHex
//
//  Created by Tyler Lawrence1 on 4/26/24.
//

import SwiftUI
import GameKit

struct SurvivalLeaderboardView: View {
    let leaderboard = GKLeaderboard()
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
    
    func updateLeaderboard() async {
        let leaderboard = GKLeaderboard.loadLeaderboards(IDs: ["survivalmode"]
    }
}

#Preview {
    SurvivalLeaderboardView()
}
