//
//  TimerBackgroundView.swift
//  WhatTheHex
//
//  Created by Tyler Lawrence1 on 4/2/24.
//

import SwiftUI

struct TimerView: View {
    @State var vm: GameViewModel
    var body: some View {
        
        Text("\(vm.timeRemaining)")
            .font(.largeTitle)
            .padding()
            .background(
                Circle()
                    .foregroundStyle(.blue)
                    .opacity(0.5)
                    .frame(width: 70, height: 70)
            )
            .onReceive(vm.timer){ _ in
                vm.timeRemaining -= 1
                if vm.timeRemaining == 0 {
                    vm.gameOver()
                }
            }
    }
}

#Preview {
    TimerView(vm: GameViewModel(gameTimeMax: 3))
}
