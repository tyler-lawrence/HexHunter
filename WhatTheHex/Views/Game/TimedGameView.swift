//
//  GameView.swift
//  WhatTheHex
//
//  Created by Tyler Lawrence1 on 4/6/24.
//

import SwiftUI

struct TimedGameView: View {
    
    @State var vm: TimedGameViewModel
    var alertMessage: String {
        "Good Game!"
    }
    var body: some View {
        
        VStack{
            TimerView(vm: vm)
            HStack{
                ColorSquareView(title: "Target", hexcode: vm.targetHexcode, showingCode: vm.gameOver)
                ColorSquareView(title: "Your guess", hexcode: vm.playerHexcode, showingCode: true)
            }
            Spacer()
            Divider()
            HStack{
                HexComponentPickerView(component: $vm.playerHexcode.red)
                HexComponentPickerView(component: $vm.playerHexcode.green)
                HexComponentPickerView(component: $vm.playerHexcode.blue)
            }
            Spacer()
            Button("Guess"){
                vm.submitGuess()
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
        .alert(alertMessage, isPresented: $vm.gameOver){
            Button("Play Again"){ vm.reset() }
        }
    }
}

#Preview {
    TimedGameView(vm: QuickGameViewModel())
}
