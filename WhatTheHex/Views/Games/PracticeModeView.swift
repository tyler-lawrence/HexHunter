//
//  AccuracyGameView.swift
//  WhatTheHex
//
//  Created by Tyler Lawrence1 on 4/9/24.
//

import SwiftUI

struct PracticeModeView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @State var vm: PracticeModeViewModel
    
    var body: some View {
        
        VStack{
            HStack{
                ColorSquareView(title: "Target", hexcode: vm.targetHexcode, size: 150, showingCode: vm.gameOver)
                ColorSquareView(title: "Your guess", hexcode: vm.playerHexcode, size: 150, showingCode: true)
            }
            Text("Accuracy: \(vm.accuracy)")
                .font(.title2)
                .padding(.top)
            Divider()
            RGBSlidersView(hexcode: $vm.playerHexcode)
            Spacer()
            Button("Reveal"){
                vm.submitGuess()
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
        .onAppear{
            startBackgroundSound(sound: "PracticeMode", type: "mp3")
        }
        .onDisappear{
            stopBackgroundSound()
        }
        .alert(vm.gameOverMessage, isPresented: $vm.gameOver){
            Button("Exit"){
                vm.reset()
                presentationMode.wrappedValue.dismiss()
            }
            Button("Play again"){ vm.reset() }
        }
    }
}

#Preview {
    PracticeModeView(vm: PracticeModeViewModel())
}
