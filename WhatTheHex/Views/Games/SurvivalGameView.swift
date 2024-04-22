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

    var minSimilarityScore: String {
        String(format: "%.0f", vm.minimumSimilarityToScore)
    }
    
    var body: some View {
        VStack{
            HStack{
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
            .padding(.vertical, 0)
            TimedGameBaseView(vm: vm)
                .alert(vm.gameOverMessage, isPresented: $vm.gameOver) {
                    Button("Play again"){ vm.reset() }
                    Button("Exit"){ presentationMode.wrappedValue.dismiss() }
                }
                .onAppear{
                    vm.reset()
                }
        }
    }
}

#Preview {
    SurvivalGameView(vm: SurvivalGameViewModel())
}
