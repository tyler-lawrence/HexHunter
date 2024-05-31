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
            String(entry.score)
        case .colorOfTheDay:
            String(format: "%.2f", Double(entry.score) / 100)
        default:
            "\(entry.score)"
        }
    }
    
    var hexFrameSize: CGFloat {
        dynamicTypeSize.isAccessibilitySize ? 140.0 : 80.0
    }
    
    var body: some View {
        HStack{
            Text("\(entry.rank).")
            Text(entry.alias)
                .padding(.horizontal)
            Spacer()
            Image(.blankHexToken)
                .resizable()
                .frame(width: hexFrameSize, height: hexFrameSize)
                .scaledToFit()
                .overlay{
                    Text(scoreDisplay)
                        .bold()
                        .foregroundStyle(.white)
                        .padding()
                        .lineLimit(1)
                        .dynamicTypeSize(...DynamicTypeSize.accessibility3)
                      
                }
           
        }
    }
}

#Preview {
    LeaderboardRowView(entry: MockGKLeaderboardEntry.sampleSurvival, gameMode: .survival)
}

#Preview {
    LeaderboardRowView(entry: MockGKLeaderboardEntry.sampleColorOfTheDay, gameMode: .colorOfTheDay)
}
