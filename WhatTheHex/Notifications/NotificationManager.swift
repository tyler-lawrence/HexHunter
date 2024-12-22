//
//  NotificationManager.swift
//  WhatTheHex
//
//  Created by Tyler Lawrence1 on 9/11/24.
//

import Foundation
import NotificationCenter

/// Singleton for managing notifications.
final class NotificationManager {
    static let shared: NotificationManager = NotificationManager()
    private let center = UNUserNotificationCenter.current()
    private var playerName: String {
        // will return "Unknown" if not authenticated
        GameCenterManager.shared.localPlayer.displayName
    }
    private var components = DateComponents(calendar: .current, hour: 20)
    /// updates the hour component to current hour
    func updateComponents() {
        components.hour = Calendar.current.component(.hour, from: Date.now)
    }
    /// Schedules a recurring notification
    func setColorOfTheDayReminder() {
        let content = colorOfTheDayReminder()
        let trigger = UNCalendarNotificationTrigger(
            dateMatching: components,
            repeats: true
        )
        let request = UNNotificationRequest(
            identifier: NotificationIdentifier.colorOfTheDay,
            content: content,
            trigger: trigger
        )
        center.add(request)
    }
    /// removes scheduled notifications for color of the day
    func cancelNotifications(for identifier: String) {
        center.removePendingNotificationRequests(
            withIdentifiers: [identifier]
        )
    }
    /// Creates the notification content for color of the day
    /// - Returns: notification content with player's GameKit alias
    private func colorOfTheDayReminder() -> UNMutableNotificationContent {
        let content = UNMutableNotificationContent()
        content.title = "👋 Hey \(playerName)!"
        content.subtitle = "Can you solve the color of the day?"
        content.badge = 1
        return content
    }
    static func requestNotificationAuthorization() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
            if success {
                print("success")
            } else if let error {
                print(error.localizedDescription)
            }
        }
    }
    func setBadgeCount(to newValue: Int = 0) {
        center.setBadgeCount(newValue)
    }
    func update(using dataController: DataController) {
        Self.shared.setBadgeCount(to: 0)
        Self.shared.cancelNotifications(for: NotificationIdentifier.colorOfTheDay)
        Self.shared.updateComponents()
        Self.shared.setColorOfTheDayReminder()
    }
}

#if DEBUG
extension NotificationManager {
    private func nextMinute() -> DateComponents {
        var components = DateComponents()
        guard let nextMinute: Date = Calendar.current.date(
            byAdding: DateComponents(minute: 1),
            to: Date.now
        ) else { return components }
        components.hour = Calendar.current.component(.hour, from: nextMinute)
        components.minute = Calendar.current.component(.minute, from: nextMinute)
        print("notification scheduled time: \(components.description)")
        return components
    }
}
#endif
