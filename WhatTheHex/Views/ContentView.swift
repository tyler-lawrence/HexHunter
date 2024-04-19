//
//  ContentView.swift
//  WhatTheHex
//
//  Created by Tyler Lawrence1 on 3/29/24.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("hasOnboarded") var hasOnboarded: Bool = false
    @Environment(DataController.self) var dataController

    var body: some View {
        if hasOnboarded {
            GameSelectionView()
                .environment(dataController)
        } else {
            PracticeModeView(hasOnboarded: $hasOnboarded)
        }
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 15")
            .environment(DataController.sample1DayStreak)
        ContentView()
            .previewDevice("My Mac")
            .environment(DataController.sample1DayStreak)
    }
}
#endif
