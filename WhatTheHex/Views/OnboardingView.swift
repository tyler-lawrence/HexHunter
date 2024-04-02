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
        TabView{
            OnboardingRowView(systemImage: "doc.questionmark", title: "How to play", description: "Use the \(playDescriptionSelector) to adjust the hexcode to match the target before time runs out!")
                .tabItem{
                    Label("How to Play", systemImage: "doc.questionmark")
                }
            HexcodeExplanationView()
                .tabItem{
                    Label("Hexcode Explanation", systemImage: "brain")
                }
            BeginView(hasOnboarded: $hasOnboarded)
                .tabItem{
                    Label("Start", systemImage: "play")
                }
        }
        #if os(iOS)
        .tabViewStyle(.page)
        #endif
    }
}

#Preview {
    OnboardingView(hasOnboarded: .constant(false))
}
