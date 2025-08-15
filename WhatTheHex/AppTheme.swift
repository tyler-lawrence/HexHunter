//
//  AppTheme.swift
//  WhatTheHex
//
//  Created by Tyler Lawrence on 8/15/25.
//

import SwiftUI

enum AppTheme: String, CaseIterable, Identifiable {
    var id: String { self.rawValue }
    case light, dark, system

    var displayName: String {
        switch self {
        case .light:
            "Light"
        case .dark:
            "Dark"
        case .system:
            "System"
        }
    }
    var colorScheme: ColorScheme? {
        switch self {
        case .system: nil
        case .light: .light
        case .dark: .dark
        }
    }
}
