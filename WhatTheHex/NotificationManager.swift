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
    private enum NotificationIdentifier {
        static let colorOfTheDay = "colorOfTheDay"
    }
    static let shared: NotificationManager = NotificationManager()
    private let center = UNUserNotificationCenter.current()
    private var playerAlias: String {
        // will return "Unknown" if not authenticated
        GameCenterManager.shared.localPlayer.alias
    }
    /// adds a notification request if the player has not completed the color of the day
    /// - Parameter dataController: dataController used to check the color of the day completion
    func setColorOfTheDayReminder(using dataController: DataController) {
        guard dataController.completedColorOfTheDay == false else { return }
        let content = colorOfTheDayReminder()
        var dateComponents = DateComponents()
        dateComponents.calendar = .current
        dateComponents.hour = 20
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        let request = UNNotificationRequest(
            identifier: NotificationIdentifier.colorOfTheDay,
            content: content,
            trigger: trigger
        )
        center.add(request)
    }
    /// removes scheduled notifications for color of the day
    func cancelColorOfTheDayReminders() {
        center.removePendingNotificationRequests(
            withIdentifiers: [NotificationIdentifier.colorOfTheDay]
        )
    }
    /// Creates the notification content for color of the day
    /// - Returns: notification content with player's GameKit alias
    private func colorOfTheDayReminder() -> UNMutableNotificationContent {
        let content = UNMutableNotificationContent()
        content.title = "👋 Hey \(playerAlias)!"
        content.subtitle = "Can you solve the color of the day?"
        return content
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
