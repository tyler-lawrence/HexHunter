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
    @ScaledMetric(relativeTo: .body) var bodyHeight = 90
    @ScaledMetric(relativeTo: .body) var bodyWidth = 50
    var scoreDisplay: String {
        switch gameMode {
        case .survival:
            entry.score.formatted(.number)
        case .colorOfTheDay:
            (Double(entry.score) / 10000).formatted(.percent.precision(.fractionLength(2)))
        default:
            "\(entry.score)"
        }
    }
    var rankAlias: some View {
        Group {
            Text("\(entry.rank). ")
            Text(entry.alias)
            Spacer()
        }
    }
    var scoreToken: some View {
        Text(scoreDisplay)
            .bold()
            .foregroundStyle(.white)
            .lineLimit(1)
            .fixedSize()
            .frame(width: bodyWidth, height: bodyHeight)
            .background {
                Image(.blankHexToken)
                    .resizable()
                    .scaledToFill()
            }
            .padding(.horizontal)
    }
    var body: some View {
        if dynamicTypeSize.isAccessibilitySize {
            VStack {
                HStack {rankAlias}
                scoreToken
            }
        } else {
            HStack {
                rankAlias
                scoreToken
            }
        }
    }
}

#Preview {
    List {
        LeaderboardRowView(entry: MockGKLeaderboardEntry.sampleSurvival, gameMode: .survival)
    }
}

#Preview {
    List {
        LeaderboardRowView(entry: MockGKLeaderboardEntry.sampleColorOfTheDay, gameMode: .colorOfTheDay)
    }
}
