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
    @AppStorage("hasOnboardedPracticeMode") var hasOnboarded: Bool = false

    var body: some View {
        
        
        if hasOnboarded{
            VStack{
                HStack{
                    ColorSquareView(title: "Target", hexcode: vm.targetHexcode, size: 150, showingCode: vm.gameOver)
                    ColorSquareView(title: "Your guess", hexcode: vm.playerHexcode, size: 150, showingCode: true)
                }
                Spacer()
                Divider()
                RGBSlidersView(hexcode: $vm.playerHexcode)
                Spacer()
                Button("Guess"){
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
                Button("Play again"){ vm.reset() }
                Button("Exit"){
                    vm.reset()
                    presentationMode.wrappedValue.dismiss() }
            }
        } else {
            OnboardingView(hasOnboarded: $hasOnboarded, gameMode: .practice)
        }
        
        
    }
}

#Preview {
    PracticeModeView(vm: PracticeModeViewModel())
}
