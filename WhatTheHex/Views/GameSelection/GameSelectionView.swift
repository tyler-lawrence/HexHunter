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
    
    var body: some View {
        NavigationStack{
            ZStack{
                BackgroundView()
                ScrollView{
                    if let submission =  dataController.todaySubmission {
                        NavigationLink{
                            ColorOfTheDaySummaryView(submission: submission)
                        } label: {
                            GameModeButtonView(title: "Color of the Day", streak: dataController.colorOfTheDayStreak)
                        }
                    } else {
                        NavigationLink{
                            ColorOfTheDayView(vm: ColorOfTheDayViewModel(service: CloudKitService(), dataController: dataController))
                        } label: {
                            GameModeButtonView(title: "Color of the Day", streak: dataController.colorOfTheDayStreak)
                        }
                    }
                    
                    NavigationLink{
                        PracticeModeView(vm: PracticeModeViewModel())
                    } label: {
                        GameModeButtonView(title: "Practice")
                    }
                    
                    NavigationLink{
                        SandboxGameView()
                    } label: {
                        GameModeButtonView(title: "Sandbox")
                    }
                    
                    //                    NavigationLink{
                    //                        RapidGameView()
                    //                    } label: {
                    //                        GameModeButtonView(title: "Rapid")
                    //                    }
                    
                    NavigationLink{
                        SurvivalGameView()
                    } label: {
                        GameModeButtonView(title: "Survival")
                    }
                    
                }
                .padding()
                .buttonStyle(GameSelectionButton())
            }
            .toolbar{
                ToolbarItem{
                    NavigationLink{
                        LeaderboardView()
                    } label: {
                        Image(systemName: "trophy")
                    }
                }
                ToolbarItem{
                    NavigationLink{
                        StatsView(dataController: dataController)
                    } label: {
                        Image(systemName: "circle.dotted.circle")
                    }
                }
                ToolbarItem{
                    Button{
                        showingExplanationSheet.toggle()
                    } label: {
                        Image(systemName: "doc.text.magnifyingglass")
                    }
                }
                ToolbarItem{
                    Button{
                        showingSettingsSheet.toggle()
                    } label: {
                        Image(systemName: "gear")
                    }
                }
            }
            .font(.title)
            .sheet(isPresented: $showingExplanationSheet){
                ExplanationView()
            }
            .sheet(isPresented: $showingSettingsSheet){
                SettingsView()
            }
        }
        .onAppear{
            GameCenterManager.shared.authenticateLocalPlayer()
        }
        
    }
}

#if DEBUG
#Preview {
    GameSelectionView()
        .environment(DataController.sample1DayStreak)
}
#endif
