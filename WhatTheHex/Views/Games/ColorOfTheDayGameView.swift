//
//  ColorOfTheDayGameView.swift
//  WhatTheHex
//
//  Created by Tyler Lawrence1 on 4/15/24.
//

import SwiftUI

struct ColorOfTheDayGameView: View {
    
    @State var vm: ColorOfTheDayViewModel

    var body: some View {
        
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
            #warning("change the song to something slower and dreamier")
            startBackgroundSound(sound: "GameplayLoop", type: "mp3")
        }
        .onDisappear{
            stopBackgroundSound()
        }
        .alert(vm.gameOverMessage, isPresented: $vm.gameOver){
            // this should eventually be a sheet with navigation back to game selection
            Button("OK"){ }
        }
        .task {
            await vm.getHexcodeOfDay()
        }
    }
}

#Preview {
    ColorOfTheDayGameView(vm: ColorOfTheDayViewModel(service: CloudKitService()))
}
