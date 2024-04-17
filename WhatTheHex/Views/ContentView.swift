//
//  ContentView.swift
//  WhatTheHex
//
//  Created by Tyler Lawrence1 on 3/29/24.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("hasOnboarded") var hasOnboarded: Bool = false
    @Environment(GameManager.self) var gameManager
    @State var colorOfTheDayVM = ColorOfTheDayViewModel(service: CloudKitService())
    var body: some View {
        if hasOnboarded {
            GameSelectionView(colorOfTheDayVM: colorOfTheDayVM)
                .environment(gameManager)
        } else {
            PracticeModeView(hasOnboarded: $hasOnboarded)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environment(GameManager())
            .previewDevice("iPhone 15")
        ContentView()
            .previewDevice("My Mac")
            .environment(GameManager())
    }
}
