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
            VStack{
                NavigationLink("practice", destination: PracticeModeView())
                NavigationLink("timed", destination: GameView())
                Divider()
                NavigationLink("scoring", destination: ScoreExplanationView())
                NavigationLink("hexcode explanation", destination: HexcodeExplanationView())
            }
            .buttonStyle(.borderedProminent)
        }
    }
}

#Preview {
    GameSelectionView()
}
