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
    
    var body: some View {
        TabView {
            ForEach(gameMode.onboardingInstructions, id: \.self){ instruction in
                ZStack{
                    BackgroundView()
                        .opacity(0.5)
                    if dynamicTypeSize.isAccessibilitySize {
                        ScrollView{
                            Text(instruction)
                                .font(.title2)
                                .bold()
                                .padding()
                        }
                    } else {
                        Text(instruction)
                            .font(.title2)
                            .bold()
                            .padding()
                    }
                    
                }
                .frame(width: 400, height: 300)
            }
            BeginView(hasOnboarded: $hasOnboarded)
                .tabItem{
                    Label("Start", systemImage: "play")
                }
                .frame(width: 400, height: 300)
        }
        .frame(width: 400, height: 400)
        #if os(iOS)
        .tabViewStyle(.page(indexDisplayMode: .always))
        #endif
    }
}

#Preview {
    OnboardingView(hasOnboarded: .constant(false), gameMode: .survival)
}
