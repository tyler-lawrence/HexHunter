//
//  LeaderboardView.swift
//  WhatTheHex
//
//  Created by Tyler Lawrence1 on 4/26/24.
//

import SwiftUI
import GameKit

struct LeaderboardView: View {
    
    let leaderboardID = "survivalmode"
    @State var entries: [GKLeaderboard.Entry] = []
    
    var body: some View {
        VStack{
//            Text("Survival Mode High Scores")
            List(entries, id: \.self){ entry in
                
                HStack{
                    Text(entry.player.alias)
                    Spacer()
//                    Text("\(entry.score)")
                    Image(.blankHexToken)
                        .resizable()
                        .scaledToFit()
                        .overlay{
                            Text("\(entry.score)")
                                .bold()
                                .foregroundStyle(.white)
                        }
                        .frame(width: 50, height: 50)
                }
            }
            .refreshable {
                Task{ await loadLeaderboard() }
            }
        }
        .navigationTitle("Survival Mode High Scores")
        .onAppear(){
            Task{
                await loadLeaderboard()
            }
        }
        
    }
    
    func loadLeaderboard() async {
        
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
