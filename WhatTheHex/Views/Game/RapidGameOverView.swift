//
//  RapidGameOverView.swift
//  WhatTheHex
//
//  Created by Tyler Lawrence1 on 4/6/24.
//

import SwiftUI

struct RapidGameOverView: View {
    let vm: RapidGameViewModel
    
    var numberOfGuesses: String { "\(vm.guesses.count)" }
    var body: some View {
        VStack{
            Text("You guessed \(numberOfGuesses) colors")
                .font(.largeTitle)
            ScrollView{
                ForEach(vm.guesses, id: \.self){ guess in
                    HStack{
                        ColorSquareView(title: "", hexcode: guess.playerGuess, showingCode: true)
                        Text(guess.similarity)
                        ColorSquareView(title: "", hexcode: guess.target, showingCode: true)
                    }
                    .padding()
                }
            }
        }
    }
}

#Preview {
    RapidGameOverView(vm: RapidGameViewModel.sample)
}
