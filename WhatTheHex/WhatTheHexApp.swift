//
//  WhatTheHexApp.swift
//  WhatTheHex
//
//  Created by Tyler Lawrence1 on 3/29/24.
//

import SwiftUI
import TipKit

@main
struct WhatTheHexApp: App {
    @AppStorage("hasOnboarded") var hasOnboarded: Bool = false
    var body: some Scene {
        WindowGroup {
            GameSelectionView()
        }
    }
    init(){
        try? Tips.configure([.displayFrequency(.immediate), .datastoreLocation(.applicationDefault)])
    }
}
