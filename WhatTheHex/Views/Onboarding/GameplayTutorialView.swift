//
//  PracticeModeView.swift
//  WhatTheHex
//
//  Created by Tyler Lawrence1 on 4/2/24.
//

import SwiftUI

struct GameplayTutorialView: View {
    
    @Binding var hasOnboarded: Bool
    @State var playerHexcode = Hexcode()
    let targetHexcode = Hexcode.teal
    let tip = OnboardingTip()

    @Environment(\.dynamicTypeSize) var dynamicTypeSize
    
    @State var scale = 0.0
    
    let timer = Timer.publish(every: 0.01, on: .main, in: .common).autoconnect()
    
    @State var circleFrameSize: CGFloat = 0
    @State var correctGuessTimeCounter = 0
    @State var showingCircle = false
    
    var playerHexcodeSquare: some View {
        Group{
            Text("#\(playerHexcode.display)")
                .font(.largeTitle)
                .padding()
            Spacer()
            ColorSquareView(title: "", hexcode: playerHexcode, showingCode: false)
                .padding(.horizontal)
                .overlay{
                    if playerHexcode == targetHexcode {
                        Image(systemName: "checkmark")
                            .resizable()
                            .scaledToFit()
                            .scaleEffect(scale)
                            .foregroundStyle(.white)
                            .animation(
                                .easeInOut(duration: 1)
                                    .repeatForever(autoreverses: true),
                                value: scale
                            )
                            // shows circle indicating tutorial is over after 2 seconds
                            .onReceive(timer){ _ in
                                correctGuessTimeCounter += 10
                                if correctGuessTimeCounter >= 2000 {
                                    showingCircle = true
                                }
                            }
                    }
                }
        }
    }
    
    var shared: some View {
        
        VStack{
            Text("Adjust the sliders below so your hexcode matches the target hexcode: ")
                .font(.title3)
                .padding(.bottom)
            Text("\(targetHexcode.display)").foregroundStyle(Color(targetHexcode))
                .bold()
                .font(.title)
            if dynamicTypeSize.isAccessibilitySize {
                VStack{ playerHexcodeSquare }
            } else {
                HStack{ playerHexcodeSquare }
            }
            RGBSlidersView(hexcode: $playerHexcode)
                .onChange(of: playerHexcode){
                    if playerHexcode == targetHexcode {
                        scale = 1
                    } else {
                        scale = 0
                        correctGuessTimeCounter = 0
                    }
                }
                .padding(.horizontal)
        }
    }
    
    var correctGuessView: some View {
        
        Circle()
            .frame(width: circleFrameSize, height: circleFrameSize)
            .foregroundStyle(Color(targetHexcode))
            .overlay{
                Button("Begin"){
                    hasOnboarded = true
                }
                .font(.largeTitle)
                .buttonStyle(GameSelectionButton())
                .opacity(circleFrameSize > 1000 ? 1 : 0)
            }
            .onReceive(timer){ _ in
                if circleFrameSize < 1000 {
                    circleFrameSize += 9
                }
            }
    }
    
    var body: some View {
        
        if showingCircle {
            correctGuessView
        } else {
            if dynamicTypeSize.isAccessibilitySize {
                ScrollView{
                    shared
                }
            } else {
                shared
            }
        }
    }
    
}

#Preview {
    GameplayTutorialView(hasOnboarded: .constant(false))
}
