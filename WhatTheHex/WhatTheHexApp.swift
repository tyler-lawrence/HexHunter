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
    @State private var audioPlayer = AudioPlayer()
    let notifictionManager = NotificationManager()
    @AppStorage("darkModePreferred") var darkModePreferred: Bool = false
    @AppStorage("needsNotificationAuthorization") var needsNotificationAuthorization = true
    var preferredScheme: ColorScheme {
        darkModePreferred ? .dark : .light
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
                .preferredColorScheme(preferredScheme)
                .environment(dataController)
                .environment(audioPlayer)
                .onChange(of: scenePhase) {
                    dataController.refresh()
                }
                .onAppear {
                    Task {
                        if needsNotificationAuthorization {
                            requestNotificationAuthorization()
                        }
                        notifictionManager.setColorOfTheDayReminder(using: dataController)
                    }
                }
        }
    }
    init() {
        try? Tips.configure([.displayFrequency(.immediate), .datastoreLocation(.applicationDefault)])
    }
    func requestNotificationAuthorization() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
            if success {
                needsNotificationAuthorization = false
                // schedule notification
                print("success")
            } else if let error {
                print(error.localizedDescription)
            }
        }
    }
}
