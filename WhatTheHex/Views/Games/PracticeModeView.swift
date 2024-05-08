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
        let g = Group{
            ColorSquareView(title: "Target", hexcode: vm.targetHexcode, showingCode: false)
            ColorSquareView(title: "Your guess", hexcode: vm.playerHexcode, showingCode: true)
        }
        return RotatingView(content: g, originalOrientation: .horizontal)
    }
    
    
    var controlsView: RotatingView< some View > {
        let g = Group {
            RGBSlidersView(hexcode: $vm.playerHexcode)
            Spacer()
            Button("Reveal"){
                vm.submitGuess()
            }
            .buttonStyle(GameSelectionButton())
        }
        return RotatingView(content: g, originalOrientation: .vertical)
    }
    
    var body: some View {
        
        GeometryReader{ geo in
            if geo.size.height > geo.size.width {
                VStack{
                    squaresView.original
                    controlsView.original.padding()
                }
            } else {
                HStack{
                    squaresView.flipped
                    controlsView.flipped
                }
            }
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
