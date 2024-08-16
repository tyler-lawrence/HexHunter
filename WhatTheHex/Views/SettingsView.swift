//
//  SettingsView.swift
//  WhatTheHex
//
//  Created by Tyler Lawrence1 on 6/12/24.
//

import SwiftUI

struct SettingsView: View {
    
    @AppStorage("GameKitPreference") var gameKitPreference = true
    @AppStorage("darkModePreferred") var darkModePreferred = false
    
    var body: some View {
        Form{
            Toggle("Upload scores to the leaderboard", isOn: $gameKitPreference)
            Toggle("Dark mode", isOn: $darkModePreferred)
        }
    }
}

#Preview {
    SettingsView()
}
