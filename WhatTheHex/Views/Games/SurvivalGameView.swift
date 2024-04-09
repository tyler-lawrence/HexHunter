//
//  SurvivalGameView.swift
//  WhatTheHex
//
//  Created by Tyler Lawrence1 on 4/8/24.
//

import SwiftUI

struct SurvivalGameView: View {
    @State var vm: SurvivalGameViewModel = SurvivalGameViewModel()

    var body: some View {
        TimedGameView(vm: vm)
            .alert(vm.gameOverMessage, isPresented: $vm.gameOver) {
                Button("Play again"){ vm.reset() }
            }
            .onAppear{
                vm.reset()
            }
    }
}

#Preview {
    SurvivalGameView(vm: SurvivalGameViewModel(minimumSimilarityToScore: 0.0))
}
