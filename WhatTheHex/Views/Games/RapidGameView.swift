//
//  RapidGameView.swift
//  WhatTheHex
//
//  Created by Tyler Lawrence1 on 4/6/24.
//

import SwiftUI

struct RapidGameView: View {
    
    @State var vm: RapidGameViewModel = RapidGameViewModel()
    @AppStorage("hasOnboardedSurvival") var hasOnboarded: Bool = false
    var body: some View {
        
        if hasOnboarded {
            if vm.gameOver{
                RapidGameOverView(vm: vm)
                    .onDisappear{
                        vm.reset()
                    }
            } else {
                TimedGameBaseView(viewModel: vm)
                    .onAppear{
                        vm.reset()
                    }
            }
        } else {
            OnboardingView(hasOnboarded: $hasOnboarded, gameMode: .rapid)
        }
    }
}

#if DEBUG
#Preview {
    RapidGameView(vm: RapidGameViewModel.sample)
}
#endif
