//
//  LeaderboardRowView.swift
//  WhatTheHex
//
//  Created by Tyler Lawrence1 on 4/30/24.
//

import SwiftUI
import GameKit

struct LeaderboardRowView: View {
    
    @Environment(\.dynamicTypeSize) var dynamicTypeSize
    
    let entry: any HHLeaderboardEntry
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
    
    var hexFrameSize: CGFloat {
        dynamicTypeSize.isAccessibilitySize ? 120.0 : 60.0
    }
    
    var body: some View {
        HStack{
            Text("\(entry.rank).")
            Text(entry.alias)
            Spacer()
            
            Text(scoreDisplay)
                .bold()
                .foregroundStyle(.white)
                .padding()
                .background(
                    Image(.blankHexToken)
                        .resizable()
                        .scaledToFit()
                )
        }
    }
}

#Preview {
    LeaderboardRowView(entry: MockGKLeaderboardEntry.sample, gameMode: .survival)
}
