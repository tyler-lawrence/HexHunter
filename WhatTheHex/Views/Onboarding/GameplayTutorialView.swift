//
//  PracticeModeView.swift
//  WhatTheHex
//
//  Created by Tyler Lawrence1 on 4/2/24.
//

import SwiftUI

struct GameplayTutorialView: View {
    
    @Binding var hasOnboarded: Bool
    @State var hexcode = Hexcode()
    let targetHexcode = Hexcode.teal
    let tip = OnboardingTip()
    var correctHexcode: Bool {
        targetHexcode != hexcode
    }
    @Environment(\.dynamicTypeSize) var dynamicTypeSize
    
    let squareFrameSize: CGFloat = 130
    @State var scale = 1.0
    
    let timer = Timer.publish(every: 0.01, on: .main, in: .common).autoconnect()

    @State var circleFrameSize: CGFloat = 0
    @State var correctGuessTimeCounter = 0
    @State var showingCircle = false
    
    var playerHexcodeSquare: some View {
        Group{
            Text("#\(hexcode.display)")
                .font(.largeTitle)
                .padding()
            ColorSquareView(title: "", hexcode: hexcode, size: squareFrameSize, showingCode: false)
                .padding(.horizontal)
                .overlay{
                    if hexcode == targetHexcode {
                        Image(systemName: "checkmark")
                            .resizable()
                            .scaledToFit()
                            .scaleEffect(scale)
                            .foregroundStyle(.white)
                            .onAppear{
                                let baseAnimation = Animation.easeInOut(duration: 1)
                                let repeated = baseAnimation.repeatForever(autoreverses: true)
                                withAnimation(repeated){
                                    scale = 0.5
                                }
                            }
                            .onDisappear{
                                correctGuessTimeCounter = 0
                            }
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
                RGBSlidersView(hexcode: $hexcode)
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
