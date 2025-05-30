//
//  GameSelectionView.swift
//  WhatTheHex
//
//  Created by Tyler Lawrence1 on 4/2/24.
//

import SwiftUI
import GameKit

struct GameSelectionView: View {
    @State var showingExplanationSheet = false
    @State var showingSettingsSheet = false
    @Environment(DataController.self) var dataController
    @State private var path = NavigationPath()
    var body: some View {
        NavigationStack(path: $path) {
            ZStack {
                BackgroundView()
                ScrollView {
                    Button {
                        if let submission =  dataController.todaySubmission {
                            path.append(AppRoute.colorOfTheDaySummary(submission))
                        } else {
                            path.append(AppRoute.colorOfTheDay)
                        }
                    } label: {
                        GameModeButtonView(
                            title: "Color of the Day",
                            streak: dataController.colorOfTheDayStreak
                        )
                    }
                    Button {
                        path.append(AppRoute.practice)
                    } label: {
                        GameModeButtonView(title: "Practice")
                    }
                    Button {
                        path.append(AppRoute.sandbox)
                    } label: {
                        GameModeButtonView(title: "Sandbox")
                    }
                    Button {
                        path.append(AppRoute.survival)
                    } label: {
                        GameModeButtonView(title: "Survival")
                    }
                }
                .padding()
                .buttonStyle(GameSelectionButton())
            }
            .toolbar {
                ToolbarItem {
                    Button {
                        path.append(AppRoute.leaderboard)
                    } label: {
                        Image(systemName: "trophy")
                    }
                }
                ToolbarItem {
                    Button {
                        path.append(AppRoute.stats)
                    } label: {
                        Image(systemName: "circle.dotted.circle")
                    }
                }
                ToolbarItem {
                    Button {
                        path.append(AppRoute.explanation)
                    } label: {
                        Image(systemName: "doc.text.magnifyingglass")
                    }
                }
                ToolbarItem {
                    Button {
                        path.append(AppRoute.settings)
                    } label: {
                        Image(systemName: "gear")
                    }
                }
            }
            .font(.title)
            .navigationDestination(for: AppRoute.self) { route in
                switch route {
                case .colorOfTheDay:
                    ColorOfTheDayView(
                        viewModel: ColorOfTheDayViewModel(
                            service: CloudKitService(),
                            dataController: dataController
                        )
                    )
                case .colorOfTheDaySummary(let sumbission):
                    ColorOfTheDaySummaryView(submission: sumbission)
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
}
#endif
