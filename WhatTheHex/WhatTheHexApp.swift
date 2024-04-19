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
    @Environment(\.scenePhase) var scenePhase
    @State private var dataController = DataController()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(dataController)
                .onChange(of: scenePhase) {
                    dataController.save()
                }
        }
    }
    init(){
        try? Tips.configure([.displayFrequency(.immediate), .datastoreLocation(.applicationDefault)])
    }
}
