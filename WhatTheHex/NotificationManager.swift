//
//  NotificationManager.swift
//  WhatTheHex
//
//  Created by Tyler Lawrence1 on 9/11/24.
//

import Foundation
import NotificationCenter

class NotificationManager {
    private var playerAlias: String {
        GameCenterManager.shared.localPlayer.alias
    }
    func setColorOfTheDayReminder(using dataController: DataController) {
        guard dataController.completedColorOfTheDay == false else { return }
        let center = UNUserNotificationCenter.current()
        let content = colorOfTheDayReminder()
        var dateComponents = DateComponents()
        // TODO: replace hour with 20 when done testing
        dateComponents.calendar = .current
        dateComponents.hour = 13
        dateComponents.minute = 58
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        let request = UNNotificationRequest(
            identifier: UUID().uuidString,
            content: content,
            trigger: trigger
        )
        center.add(request)
    }
    private func colorOfTheDayReminder() -> UNMutableNotificationContent {
        let content = UNMutableNotificationContent()
        content.title = "👋 Hey \(playerAlias)!"
        content.subtitle = "Can you solve the color of the day?"
        return content
    }
}
