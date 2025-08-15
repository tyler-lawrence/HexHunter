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
        Form {
            Toggle("Upload scores to the leaderboard", isOn: $gameKitPreference)
            Section("Theme") {
                Toggle("Dark mode", isOn: $darkModePreferred)
            }
            Section("Notifications") {
                Button("Open iOS Settings") {
                    if let settingsURL = URL(string: UIApplication.openSettingsURLString) {
                        if UIApplication.shared.canOpenURL(settingsURL) {
                            UIApplication.shared.open(settingsURL)
                        }
                    }
                }
            }
        }
        .font(.body)
    }
}

#Preview {
    SettingsView()
}
