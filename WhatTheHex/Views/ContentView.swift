//
//  ContentView.swift
//  WhatTheHex
//
//  Created by Tyler Lawrence1 on 3/29/24.
//

import SwiftUI
import GameKit
struct ContentView: View {
    @AppStorage("hasOnboarded") var hasOnboarded: Bool = false
    @Environment(DataController.self) var dataController
    @ViewBuilder func bodyContent() -> some View {
        if hasOnboarded {
            GameSelectionView()
                .environment(dataController)
        } else {
            TutorialView(hasOnboarded: $hasOnboarded)
        }
    }
    var body: some View {
        bodyContent()
            .onReceive(NotificationCenter.default.publisher(
                    for: .GKPlayerAuthenticationDidChangeNotificationName
                )
            ) { _ in
                NotificationManager.shared.setColorOfTheDayReminder(
                    using: dataController
                )
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
