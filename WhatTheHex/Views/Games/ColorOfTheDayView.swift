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
    let frameSize: CGFloat = 150
    
    var body: some View {
        
        if hasOnboarded{
            VStack{
                HStack{
                    if colorOfTheDay != nil {
                        ColorSquareView(title: "Target", hexcode: vm.targetHexcode, size: frameSize, showingCode: vm.gameOver)
                    } else {
                        ProgressView()
                            .frame(width: frameSize, height: frameSize)
                            .task{
                                await colorOfTheDay = vm.getHexcodeOfDay()
                            }
                    }
                    ColorSquareView(title: "Your guess", hexcode: vm.playerHexcode, size: frameSize, showingCode: true)
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
                Button("Ok"){
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
