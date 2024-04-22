//
//  GameView.swift
//  WhatTheHex
//
//  Created by Tyler Lawrence1 on 4/6/24.
//

import SwiftUI

struct TimedGameBaseView: View {
    
    @State var vm: TimedGameViewModel
    let squareSize: CGFloat = 150
    var body: some View {
        
        VStack{
            TimerView(vm: vm)
            HStack{
                ColorSquareView(title: "Target", hexcode: vm.targetHexcode, size: squareSize, showingCode: vm.gameOver)
                ColorSquareView(title: "Your guess", hexcode: vm.playerHexcode, size: squareSize, showingCode: true)
            }
            RGBSlidersView(hexcode: $vm.playerHexcode)
            Spacer()
            Button("Guess"){
                vm.submitGuess()
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
        .onAppear{
            startBackgroundSound(sound: "GameplayLoop", type: "mp3")
        }
        .onDisappear{
            stopBackgroundSound()
        }
    }
}

#Preview {
    TimedGameBaseView(vm: SurvivalGameViewModel())
}
