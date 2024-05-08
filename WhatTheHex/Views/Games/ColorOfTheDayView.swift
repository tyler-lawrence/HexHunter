//
//  ColorOfTheDayView.swift
//  WhatTheHex
//
//  Created by Tyler Lawrence1 on 4/18/24.
//

import SwiftUI

struct ColorOfTheDayView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @State var vm: ColorOfTheDayViewModel
    @State var colorOfTheDay: Hexcode?
    @AppStorage("hasOnboardedColorOfTheDay") var hasOnboarded: Bool = false
    
    var targetView: some View {
        Group{
            if colorOfTheDay != nil {
                ColorSquareView(title: "Target", hexcode: vm.targetHexcode, showingCode: vm.gameOver)
            } else {
                ProgressView()
                    .task{
                        await colorOfTheDay = vm.getHexcodeOfDay()
                    }
            }
        }
    }
    
    var squaresView: RotatingView<some View> {
        let g = Group{
            targetView
            ColorSquareView(title: "Your guess", hexcode: vm.playerHexcode, showingCode: true)
        }
        return RotatingView(content: g, originalOrientation: .horizontal)
    }
    
    var controlsView: RotatingView< some View > {
        let g = Group {
            RGBSlidersView(hexcode: $vm.playerHexcode)
            Button("Guess"){
                vm.submitGuess()
            }.buttonStyle(.borderedProminent)
        }
        return RotatingView(content: g, originalOrientation: .vertical)
    }
    
    var body: some View {
        
        if hasOnboarded{

            GeometryReader{ geo in
                if geo.size.height > geo.size.width {
                    VStack{
                        squaresView.original
                        controlsView.original
                    }
                    .padding()
                } else {
                    HStack{
                        squaresView.flipped
                        controlsView.flipped
                    }
                    .padding()
                }
            }
            .onAppear{
                startBackgroundSound(sound: "GameplayLoop", type: "mp3")
            }
            .onDisappear{
                stopBackgroundSound()
            }
            .alert(vm.gameOverMessage, isPresented: $vm.gameOver){
                Button("Ok"){
                    Task {
                        await GameCenterManager.shared.uploadScore(
                            vm.GKFormattedScore,
                            for: .colorOfTheDay
                        )
                    }
                    presentationMode.wrappedValue.dismiss()
                }
            }
            
        } else {
            OnboardingView(hasOnboarded: $hasOnboarded, gameMode: .colorOfTheDay)
        }
        
    }
}

#Preview {
    ColorOfTheDayView(vm: ColorOfTheDayViewModel(service: CloudKitService(), dataController: DataController()))
}
