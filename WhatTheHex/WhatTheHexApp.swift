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
   @State var gameManager = GameManager()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(gameManager)
        }
    }
    init(){
        try? Tips.configure([.displayFrequency(.immediate), .datastoreLocation(.applicationDefault)])
    }
}
