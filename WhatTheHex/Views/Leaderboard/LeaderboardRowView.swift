//
//  LeaderboardRowView.swift
//  WhatTheHex
//
//  Created by Tyler Lawrence1 on 4/30/24.
//

import SwiftUI
import GameKit

struct LeaderboardRowView: View {
    let entry: GKLeaderboard.Entry
    let gameMode: GameMode
    var scoreDisplay: String {
        switch gameMode {
        case .survival:
            "\(entry.score)"
        case .colorOfTheDay:
            "\(Double(entry.score) / 100)"
        default:
            "\(entry.score)"
        }
    }
    var body: some View {
        HStack{
            Text(entry.player.alias)
            Spacer()
            Image(.blankHexToken)
                .resizable()
                .scaledToFit()
                .overlay{
                    Text(scoreDisplay)
                        .bold()
                        .foregroundStyle(.white)
                }
                .frame(width: 60, height: 60)
        }
    }
}

//#Preview {
//    LeaderboardRowView(entry: GKLeaderboard.Entry, gameMode: <#GameMode#>)
//}
