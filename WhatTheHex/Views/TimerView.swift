//
//  TimerBackgroundView.swift
//  WhatTheHex
//
//  Created by Tyler Lawrence1 on 4/2/24.
//

import SwiftUI

struct TimerView: View {
    @State var vm: TimedGameViewModel
    @State var lowTimeCounter = 5
    var body: some View {
        
        Text("\(vm.timeRemaining)")
            .foregroundStyle(.white)
            .font(.largeTitle)
            .padding()
            .background(
                Circle()
                    .foregroundStyle(vm.timeRemaining <= 5 ? .red : .blue)
//                    .opacity(0.5)
                    .frame(width: 70, height: 70)
                    .shadow(radius: 10)
                    .phaseAnimator([1, 1.5], trigger: lowTimeCounter){ content, phase in
                        content
                            .scaleEffect(phase)
                    }
            )
            .sensoryFeedback(.warning, trigger: lowTimeCounter)
            .onReceive(vm.timer){ _ in
                vm.timeRemaining -= 1
                if vm.timeRemaining <= lowTimeCounter {
                    lowTimeCounter -= 1
                }
                if vm.timeRemaining <= 0 {
                    vm.gameOver = true
                    vm.timerSubscription?.cancel()
                }
            }
    }
}

#Preview {
    TimerView(vm: QuickGameViewModel(gameTimeMax: 10))
}
