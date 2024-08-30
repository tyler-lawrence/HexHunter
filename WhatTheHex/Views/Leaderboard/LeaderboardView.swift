//
//  LeaderboardView.swift
//  WhatTheHex
//
//  Created by Tyler Lawrence1 on 4/26/24.
//

import SwiftUI
import GameKit

struct LeaderboardView: View {
    @Environment(\.dynamicTypeSize) var dynamicTypeSize
    @State private var gameMode: GameMode = .survival
    @State var entries: [GKLeaderboard.Entry] = []
    var contentUnavailableMessage: String {
        GameCenterManager.shared.isGameCenterEnabled ?
            "Be the first to record a score!" :
            "Make sure you are signed into iCloud"
    }
    var pickerView: any View {
        if dynamicTypeSize.isAccessibilitySize {
            Picker("Mode", selection: $gameMode) {
                ForEach(GameMode.leaderboardModes, id: \.self) { mode in
                    Text(LocalizedStringKey(mode.rawValue))
                }
            }
            .pickerStyle(.automatic)
        } else {
            Picker("Mode", selection: $gameMode) {
                ForEach(GameMode.leaderboardModes, id: \.self) { mode in
                    Text(LocalizedStringKey(mode.rawValue))
                }
            }
            .pickerStyle(.segmented)
        }
    }
    var body: some View {
        VStack {
            AnyView(pickerView)
                .padding(.horizontal)
            List(entries, id: \.self) { entry in
                LeaderboardRowView(entry: entry, gameMode: gameMode)
            }
            .refreshable {
                Task {
                    entries = await GameCenterManager.shared.fetchLeaderboardEntries(for: gameMode)
                }
            }
            .overlay {
                if entries.isEmpty {
                    ContentUnavailableView {
                        Label("No Scores", systemImage: "chart.bar.xaxis.ascending")
                    } description: {
                        Text(contentUnavailableMessage)
                    }
                }
            }
        }
        .navigationTitle("Leaderboards")
        .onAppear {
            Task {
                entries = await GameCenterManager.shared.fetchLeaderboardEntries(for: gameMode)
            }
        }
        .onChange(of: gameMode) {
            entries.removeAll()
            Task {
                entries = await GameCenterManager.shared.fetchLeaderboardEntries(for: gameMode)
            }
        }
    }
}

#Preview {
    LeaderboardView()
}
