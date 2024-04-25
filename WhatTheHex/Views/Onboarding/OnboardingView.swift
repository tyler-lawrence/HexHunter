//
//  OnboardingView.swift
//  WhatTheHex
//
//  Created by Tyler Lawrence1 on 4/2/24.
//

import SwiftUI

struct OnboardingView: View {
    
    @Environment(\.dynamicTypeSize) var dynamicTypeSize
    @Binding var hasOnboarded: Bool
    let gameMode: GameMode
    
    @State var idx = 0
    var instruction: String {
        guard idx < gameMode.onboardingInstructions.count else { return "" }
        return gameMode.onboardingInstructions[idx]
    }
    
    var body: some View {
        
        ZStack{
            BackgroundView()
            
            if idx < gameMode.onboardingInstructions.count {
                VStack{
                    Spacer()
                    Text(instruction)
                        .font(.title2)
                    Spacer()
                    Button {
                        idx += 1
                    } label: {
                        Image(systemName: "arrow.right")
                            .font(.title2)
                    }
                    .buttonStyle(.borderedProminent)
                    .padding()
                }
            } else {
                Button("Begin") {
                    hasOnboarded = true
                }
                .buttonStyle(.borderedProminent)
                .padding()
                
            }
            
        }
    }
}

#Preview {
    OnboardingView(hasOnboarded: .constant(false), gameMode: .survival)
}
