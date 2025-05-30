//
//  AppState.swift
//  WhatTheHex
//
//  Created by Tyler Lawrence1 on 5/30/25.
//

import SwiftUI

@Observable
class AppState {
    var path: [AppRoute] = []
    var launchedFromNotification = false
    func handleNotificationTap() {
        path = [.colorOfTheDay]
        launchedFromNotification = true
    }
}
