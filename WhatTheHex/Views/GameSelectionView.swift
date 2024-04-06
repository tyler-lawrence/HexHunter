//
//  GameSelectionView.swift
//  WhatTheHex
//
//  Created by Tyler Lawrence1 on 4/2/24.
//

import SwiftUI

struct GameSelectionView: View {
    var body: some View {
        NavigationStack{
            ZStack{
                BackgroundView()
                VStack{
                    NavigationLink("Practice", destination: PracticeModeView())
                    NavigationLink("Quick", destination: TimedGameView(vm: QuickGameViewModel()))
                    NavigationLink("Rapid", destination: TimedGameView(vm: RapidGameViewModel()))
                    Divider()
                    NavigationLink("Scoring", destination: ScoreExplanationView())
                    NavigationLink("Hexcode explanation", destination: HexcodeExplanationView())
                }
                .buttonStyle(.borderedProminent)
            }
        }
        
    }
}

#Preview {
    GameSelectionView()
}
