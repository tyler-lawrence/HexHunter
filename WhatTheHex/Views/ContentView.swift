//
//  ContentView.swift
//  WhatTheHex
//
//  Created by Tyler Lawrence1 on 3/29/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var hasOnboarded: Bool = UserDefaults.standard.bool(forKey: "hasOnboarded")
    
    var body: some View {
        if hasOnboarded {
            GameView()
        } else {
            OnboardingView(hasOnboarded: $hasOnboarded)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 15")
        ContentView()
            .previewDevice("My Mac")
    }
}
