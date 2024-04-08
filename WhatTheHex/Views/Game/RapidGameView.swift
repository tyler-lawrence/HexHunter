//
//  RapidGameView.swift
//  WhatTheHex
//
//  Created by Tyler Lawrence1 on 4/6/24.
//

import SwiftUI

struct RapidGameView: View {
    @State var vm: RapidGameViewModel = RapidGameViewModel()
    var body: some View {
        TimedGameView(vm: vm)
            .sheet(isPresented: $vm.gameOver) {
                RapidGameOverView(vm: vm)
                    .onDisappear{
                        vm.reset()
                    }
            }
            .onAppear{
                vm.reset()
            }
    }
}

#if DEBUG
#Preview {
    RapidGameView(vm: RapidGameViewModel.sample)
}
#endif
