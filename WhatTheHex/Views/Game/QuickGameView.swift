//
//  QuickGameView.swift
//  WhatTheHex
//
//  Created by Tyler Lawrence1 on 4/6/24.
//

import SwiftUI

struct QuickGameView: View {
    @State var vm: QuickGameViewModel

    var body: some View {
        TimedGameView(vm: vm)
            .alert("Good Guess", isPresented: $vm.gameOver){
                Button("Play Again"){ vm.reset() }
            }
    }
}

#Preview {
    QuickGameView(vm: QuickGameViewModel())
}
