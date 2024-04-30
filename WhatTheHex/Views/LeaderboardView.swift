//
//  LeaderboardView.swift
//  WhatTheHex
//
//  Created by Tyler Lawrence1 on 4/26/24.
//

import SwiftUI
import GameKit

struct LeaderboardView: View {
    
    @State private var gameMode: GameMode = .survival
    @State var entries: [GKLeaderboard.Entry] = []
    
    var body: some View {
        VStack{
            Picker("Mode", selection: $gameMode){
                ForEach(GameMode.leaderboardModes, id: \.self){ mode in
                    Text(mode.rawValue)
                }
            }
            .pickerStyle(.segmented)
            .padding(.horizontal)
            List(entries, id: \.self){ entry in
                LeaderboardRowView(entry: entry, gameMode: gameMode)
            }
            .refreshable {
                Task{ await loadLeaderboard() }
            }
            .overlay{
                if entries.isEmpty {
                    ContentUnavailableView{
                        Label("No Scores", systemImage: "chart.bar.xaxis.ascending")
                    } description: {
                        Text("Make sure you are signed into iCloud")
                    }
                }
            }
        }
        .navigationTitle("Leaderboards")
        .onAppear(){
            Task{
                await loadLeaderboard()
            }
        }
        .onChange(of: gameMode){ _ in
            entries.removeAll()
            Task{
                await loadLeaderboard()
            }
        }
        
    }
    
    func loadLeaderboard() async {
        
        guard let leaderboardID = gameMode.gameCenterLeaderboardID else { return }
        
        do {
            let leaderboards  = try await GKLeaderboard.loadLeaderboards(IDs: [leaderboardID])
            if let modeLeaderboard = leaderboards.first(where: {$0.baseLeaderboardID == leaderboardID}) {
                let leaderboardEntries = try await modeLeaderboard.loadEntries(for: .global, timeScope: .allTime, range: NSRange(1...100))
                entries = leaderboardEntries.1
            }
        } catch {
            print(error.localizedDescription)
        }
    }
}

#Preview {
    LeaderboardView()
}
