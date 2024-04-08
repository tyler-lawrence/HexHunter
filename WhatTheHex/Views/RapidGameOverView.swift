//
//  RapidGameOverView.swift
//  WhatTheHex
//
//  Created by Tyler Lawrence1 on 4/6/24.
//

import SwiftUI

struct RapidGameOverView: View {
    let vm: RapidGameViewModel
    var score: String {
        String(format: "%.0f", vm.calculateScore())
    }
    var body: some View {
        VStack{
            Text("Score: \(score)")
                .font(.largeTitle)
            ScrollView{
                ForEach(vm.guesses, id: \.self){ guess in
                    HStack{
                        ColorSquareView(title: "", hexcode: guess.playerGuess, size: 100, showingCode: true)
                        Text(guess.similarityLabel)
                            .bold()
                            .foregroundStyle(guess.similarityScore >= 80 ? .green : .red)
                            .padding(.horizontal)
                        ColorSquareView(title: "", hexcode: guess.target, size: 100, showingCode: true)
                    }
                    .padding()
                }
            }
        }
    }
}

#if DEBUG
#Preview {
    RapidGameOverView(vm: RapidGameViewModel.sample)
}
#endif
