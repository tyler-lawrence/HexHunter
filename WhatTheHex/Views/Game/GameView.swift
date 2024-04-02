//
//  GameView.swift
//  WhatTheHex
//
//  Created by Tyler Lawrence1 on 4/2/24.
//

import SwiftUI

struct GameView: View {
    
    @State var vm = GameViewModel(gameTimeMax: 30)
    @State var showingScoreSheet = false
    var alertMessage: String {
        let guessDifference = String(format: "%.1f", vm.calculateScore())
        return "Score: \(guessDifference)"
    }
    var body: some View {
        VStack {
            HStack{
                Spacer()
                TimerView(vm: vm)
                Spacer()
                Button{
                    showingScoreSheet.toggle()
                } label: {
                    Image(systemName: "questionmark")
                }
            }
            HStack{
                ColorSquareView(title: "Target", hexcode: vm.targetHexcode, showingCode: vm.showingAlert)
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
                vm.showingAlert.toggle()
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
        .alert(alertMessage, isPresented: $vm.showingAlert){
            Button("Play Again"){ vm.reset() }
        }
        .sheet(isPresented: $showingScoreSheet){
            ScoreExplanationView()
        }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
            .previewDevice("iPhone 15")
        GameView()
            .previewDevice("My Mac")
    }
}
