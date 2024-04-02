//
//  WhatTheHexApp.swift
//  WhatTheHex
//
//  Created by Tyler Lawrence1 on 3/29/24.
//

import SwiftUI

@main
struct WhatTheHexApp: App {
    @AppStorage("hasOnboarded") private var hasOnboarded = false
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
