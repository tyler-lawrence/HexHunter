//
//  QuickGameView.swift
//  WhatTheHex
//
//  Created by Tyler Lawrence1 on 4/6/24.
//

import SwiftUI

struct QuickGameView: View {
    @State var vm: QuickGameViewModel = QuickGameViewModel()
    var body: some View {
        TimedGameView(vm: vm)
            .alert(vm.gameOverMessage, isPresented: $vm.gameOver){
                Button("Play Again"){ vm.reset() }
            }
            .onAppear{
                vm.reset()
            }
    }
}

#Preview {
    QuickGameView(vm: QuickGameViewModel())
}
