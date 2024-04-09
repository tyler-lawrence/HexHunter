//
//  AccuracyGameView.swift
//  WhatTheHex
//
//  Created by Tyler Lawrence1 on 4/9/24.
//

import SwiftUI

struct AccuracyGameView: View {
    @State var vm = AccuracyGameViewModel()
    
    var shared: some View {
        Group{
            HexComponentPickerView(component: $vm.playerHexcode.red)
            HexComponentPickerView(component: $vm.playerHexcode.green)
            HexComponentPickerView(component: $vm.playerHexcode.blue)
        }
    }

    var body: some View {
        
        VStack{
            HStack{
                ColorSquareView(title: "Target", hexcode: vm.targetHexcode, size: 150, showingCode: vm.gameOver)
                ColorSquareView(title: "Your guess", hexcode: vm.playerHexcode, size: 150, showingCode: true)
            }
            Spacer()
            Divider()
            #if os(iOS)
            VStack{shared}
            #elseif os(macOS)
            HStack{shared}
            #endif
            Spacer()
            Button("Guess"){
                vm.submitGuess()
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
        .onAppear{
            #warning("change the song to something slower and dreamier")
            startBackgroundSound(sound: "GameplayLoop", type: "mp3")
        }
        .onDisappear{
            stopBackgroundSound()
        }
        .alert(vm.gameOverMessage, isPresented: $vm.gameOver){
            Button("Play again"){vm.reset()}
        }
    }
}

#Preview {
    AccuracyGameView()
}
