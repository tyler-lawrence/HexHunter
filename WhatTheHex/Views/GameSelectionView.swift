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
            }
            .buttonStyle(.borderedProminent)
        }
    }
}

#Preview {
    GameSelectionView()
}
