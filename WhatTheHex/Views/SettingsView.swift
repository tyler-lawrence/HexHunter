//
//  SettingsView.swift
//  WhatTheHex
//
//  Created by Tyler Lawrence1 on 6/12/24.
//

import SwiftUI

struct SettingsView: View {
    
    @AppStorage("GameKitPreference") var gameKitPreference = true
    
    var body: some View {
        Form{
            Toggle("Upload scores to the leaderboard", isOn: $gameKitPreference)
        }
    }
}

#Preview {
    SettingsView()
}
