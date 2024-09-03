//
//  RapidGameView.swift
//  WhatTheHex
//
//  Created by Tyler Lawrence1 on 4/6/24.
//

import SwiftUI

struct RapidGameView: View {
    @State var viewModel: RapidGameViewModel = RapidGameViewModel()
    @AppStorage("hasOnboardedSurvival") var hasOnboarded: Bool = false
    var body: some View {
        if hasOnboarded {
            if viewModel.gameOver {
                RapidGameOverView(viewModel: viewModel)
                    .onDisappear {
                        viewModel.reset()
                    }
            } else {
                TimedGameBaseView(viewModel: viewModel)
                    .onAppear {
                        viewModel.reset()
                    }
            }
        } else {
            OnboardingView(hasOnboarded: $hasOnboarded, gameMode: .rapid)
        }
    }
}

#if DEBUG
#Preview {
    RapidGameView(viewModel: RapidGameViewModel.sample)
}
#endif
