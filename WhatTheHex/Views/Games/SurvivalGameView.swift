//
//  SurvivalGameView.swift
//  WhatTheHex
//
//  Created by Tyler Lawrence1 on 4/8/24.
//

import SwiftUI

struct SurvivalGameView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @State var vm: SurvivalGameViewModel = SurvivalGameViewModel()
    @AppStorage("hasOnboarededSurvival") var hasOnboarded: Bool = false
    let squareSize: CGFloat = 150
    var minSimilarityScore: String {
        String(format: "%.0f", vm.minimumSimilarityToScore)
    }
    
    var body: some View {
        
        
        if hasOnboarded {
            VStack{
                HStack{
                    TimerView(vm: vm)
                    Spacer()
                    VStack(alignment: .trailing){
                        Text("Score: \(vm.correctGuesses)")
                            .contentTransition(.numericText())
                        Text("Minimum accuracy: \(minSimilarityScore)")
                            .contentTransition(.numericText())
                    }
                    .padding(.trailing)
                }
                .bold()
                .font(.title3)
                
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
            .alert(vm.gameOverMessage, isPresented: $vm.gameOver) {
                Button("Play again"){
                    Task{ await vm.uploadScore() }
                    vm.reset()
                }
                Button("Exit"){
                    Task{ await vm.uploadScore() }
                    presentationMode.wrappedValue.dismiss()
                }
            }
            
        } else {
            OnboardingView(hasOnboarded: $hasOnboarded, gameMode: .survival)
        }
        
    }
}


#Preview {
    SurvivalGameView(vm: SurvivalGameViewModel())
}
