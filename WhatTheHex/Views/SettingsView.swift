//
//  SettingsView.swift
//  WhatTheHex
//
//  Created by Tyler Lawrence1 on 6/12/24.
//

import SwiftUI

struct SettingsView: View {
    @Bindable(AudioPlayer.shared) var audioPlayer
    @AppStorage(DefaultsKey.gameCenterPreference) var gameKitPreference = true
    @AppStorage(DefaultsKey.preferredAppTheme) private var preferredAppTheme: AppTheme = .system

    var body: some View {
        Form {
            Section("Game Center") {
                Toggle("Upload scores to the leaderboard", isOn: $gameKitPreference)
            }
            Section("Theme") {
                Picker("App Theme", selection: $preferredAppTheme) {
                    ForEach(AppTheme.allCases) { theme in
                        Text(theme.displayName).tag(theme)
                    }
                }
            }
            Section("Sounds") {
                Toggle("Music", isOn: $audioPlayer.musicEnabled)
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
