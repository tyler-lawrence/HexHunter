//
//  ContentView.swift
//  WhatTheHex
//
//  Created by Tyler Lawrence1 on 3/29/24.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("hasOnboarded") var hasOnboarded: Bool = false
    var body: some View {
        if hasOnboarded {
            GameSelectionView()
        } else {
            PracticeModeView(hasOnboarded: $hasOnboarded)
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
