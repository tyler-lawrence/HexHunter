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
    @State private var audioPlayer = AudioPlayer()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(dataController)
                .environment(audioPlayer)
                .onChange(of: scenePhase) {
                    dataController.refresh()
                }
        }
    }
    
    init(){
        try? Tips.configure([.displayFrequency(.immediate), .datastoreLocation(.applicationDefault)])
    }
}
