//
//  OnboardingView.swift
//  WhatTheHex
//
//  Created by Tyler Lawrence1 on 4/2/24.
//

import SwiftUI

struct OnboardingView: View {
    @Binding var hasOnboarded: Bool
    var playDescriptionSelector: String {
        #if os(iOS)
        "pickers"
        #else
        "sliders"
        #endif
    }
    var body: some View {
        ZStack{
            BackgroundView()
            VStack{
                Text("What the Hex?")
                    .font(.largeTitle)
                TabView{
                    OnboardingRowView(systemImage: "doc.questionmark", title: "How to play", description: "Use the \(playDescriptionSelector) to adjust the hexcode to match the target before time runs out!")
                    HexcodeExplanationView()
                    ScoreExplanationView()
                    BeginView(hasOnboarded: $hasOnboarded)
                }
                .tabViewStyle(.page)
            }
        }
        
    }
}

#Preview {
    OnboardingView(hasOnboarded: .constant(false))
}
