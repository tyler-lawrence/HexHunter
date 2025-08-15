//
//  WhatTheHexApp.swift
//  WhatTheHex
//
//  Created by Tyler Lawrence1 on 3/29/24.
//

import SwiftUI
import TipKit
import UserNotifications

@main
struct WhatTheHexApp: App {
    @Environment(\.scenePhase) var scenePhase
    @State private var dataController = DataController()
    @State private var appState = AppState()
    @State private var audioPlayer = AudioPlayer()
    @AppStorage(DefaultsKey.preferredAppTheme) private var appTheme: AppTheme = .system
    init() {
        NotificationManager.shared.configure(with: appState)
        try? Tips.configure([.displayFrequency(.immediate), .datastoreLocation(.applicationDefault)])
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
                .preferredColorScheme(appTheme.colorScheme)
                .environment(dataController)
                .environment(audioPlayer)
                .environment(appState)
                .onChange(of: scenePhase) {
                    dataController.refresh()
                }
                .onAppear {
                    GameCenterManager.shared.authenticateLocalPlayer()
                    NotificationManager.shared.requestNotificationAuthorization()
                }
                .onReceive(NotificationCenter.default.publisher(for: .notificationTapped)) { _ in
                    appState.handleNotificationTap()
                }
        }
    }
}
