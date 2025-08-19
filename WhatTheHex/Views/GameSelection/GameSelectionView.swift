//
//  GameSelectionView.swift
//  WhatTheHex
//
//  Created by Tyler Lawrence1 on 4/2/24.
//

import SwiftUI
import GameKit

struct GameSelectionView: View {
    @Environment(DataController.self) var dataController
    @Environment(AppState.self) var appState
    @State var showingExplanationSheet = false
    @State var showingSettingsSheet = false
    var body: some View {
        @Bindable var appState = appState
        NavigationStack(path: $appState.path) {
            ZStack {
                BackgroundView()
                ScrollView {
                    Button {
                        appState.path.append(AppRoute.colorOfTheDay)
                    } label: {
                        GameModeButtonView(
                            title: "Color of the Day",
                            streak: dataController.colorOfTheDayStreak
                        )
                    }
                    Button {
                        appState.path.append(AppRoute.practice)
                    } label: {
                        GameModeButtonView(title: "Practice")
                    }
                    Button {
                        appState.path.append(AppRoute.sandbox)
                    } label: {
                        GameModeButtonView(title: "Sandbox")
                    }
                    Button {
                        appState.path.append(AppRoute.survival)
                    } label: {
                        GameModeButtonView(title: "Survival")
                    }
                }
                .padding()
                .buttonStyle(GameSelectionButton())
            }
            .sheet(isPresented: $showingSettingsSheet) {
                SettingsView()
            }
            .sheet(isPresented: $showingExplanationSheet) {
                ExplanationView()
            }
            .toolbar {
                ToolbarItem {
                    Button {
                        appState.path.append(AppRoute.leaderboard)
                    } label: {
                        Image(systemName: "trophy")
                    }
                }
                ToolbarItem {
                    Button {
                        appState.path.append(AppRoute.stats)
                    } label: {
                        Image(systemName: "circle.dotted.circle")
                    }
                }
                ToolbarItem {
                    Button {
                        showingExplanationSheet.toggle()
                    } label: {
                        Image(systemName: "doc.text.magnifyingglass")
                    }
                }
                ToolbarItem {
                    Button {
                        showingSettingsSheet.toggle()
                    } label: {
                        Image(systemName: "gear")
                    }
                }
            }
            .font(.title)
            .navigationDestination(for: AppRoute.self) { route in
                switch route {
                case .colorOfTheDay:
                    ColorOfTheDayView()
                case .practice:
                    PracticeModeView()
                case .sandbox:
                    SandboxGameView()
                case .survival:
                    SurvivalGameView()
                case .leaderboard:
                    LeaderboardView()
                case .stats:
                    StatsView(dataController: dataController)
                case .explanation:
                    ExplanationView()
                case .settings:
                    SettingsView()
                }
            }
            .onAppear {
                NotificationManager.shared.setColorOfTheDayReminder()
            }
        }
    }
}

#if DEBUG
#Preview {
    GameSelectionView()
        .environment(DataController.sample1DayStreak)
        .environment(AppState())
}
#endif
