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
    private var playerAlias: String {
        // will return "Unknown" if not authenticated
        GameCenterManager.shared.localPlayer.alias
    }
    private var components = DateComponents(calendar: .current, hour: 20)
    /// calculates the date to schedule notifications based on components
    func nextNotificationDate() -> Date? {
        Calendar.current.nextDate(
            after: Date.now,
            matching: components,
            matchingPolicy: .nextTime
        )
    }
    /// updates the hour component to current hour
    func updateComponents() {
        components.hour = Calendar.current.component(.hour, from: Date.now)
    }
    /// adds a notification request if the player has not completed the color of the day
    /// - Parameter dataController: dataController used to check the color of the day completion
    func setColorOfTheDayReminder(using dataController: DataController) {
        guard dataController.completedColorOfTheDay == false else { return }
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
        content.title = "👋 Hey \(playerAlias)!"
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
