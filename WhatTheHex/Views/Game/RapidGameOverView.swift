//
//  RapidGameOverView.swift
//  WhatTheHex
//
//  Created by Tyler Lawrence1 on 4/6/24.
//

import SwiftUI

struct RapidGameOverView: View {
    let vm: RapidGameViewModel
    var body: some View {
        ScrollView{
            VStack{
                ForEach(vm.guesses, id: \.self){ guess in
                    HStack{
                        ColorSquareView(title: "", hexcode: guess.playerGuess, showingCode: true)
                        Text(guess.similarity)
                        ColorSquareView(title: "", hexcode: guess.target, showingCode: true)
                    }
                }
            }
        }
    }
}

#Preview {
    RapidGameOverView(vm: RapidGameViewModel.sample)
}
