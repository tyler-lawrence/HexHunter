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
        
    var squaresView: RotatingView<some View> {
        RotatingView(portraitOrientation: .horizontal){
            Group{
                ColorSquareView(title: "Target", hexcode: vm.targetHexcode, showingCode: false)
                ColorSquareView(title: "Your guess", hexcode: vm.playerHexcode, showingCode: true)
            }
        }
    }
    
    var controlsView: RotatingView< some View > {
        RotatingView(portraitOrientation: .vertical){
            Group{
                RGBSlidersView(hexcode: $vm.playerHexcode)
                Spacer()
            }
        }
    }
    
    var buttonView: some View {
        Button("Reveal"){
            vm.submitGuess()
        }
        .buttonStyle(GameSelectionButton())
    }
    
    var accuracyLabel: some View {
        HStack{
            Image(systemName: "scope")
            Text("Accuracy: \(vm.accuracy)")
        }
        .font(.title)
    }
    
    var body: some View {
        
        GeometryReader{ geo in
            if geo.size.height > geo.size.width {
                VStack{
                    squaresView.original
                    accuracyLabel
                    controlsView.original.padding()
                    buttonView
                }
            } else {
                HStack{
                    squaresView.rotated
                    controlsView.rotated
                    VStack{
                        accuracyLabel
                        buttonView
                    }
                }
            }
        }
        .padding()
        .onAppear{
            AudioPlayer.shared.startBackgroundLoop(sound: "PracticeMode", type: "mp3")
        }
        .onDisappear{
            AudioPlayer.shared.stopBackgroundSound()
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
