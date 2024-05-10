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
    @Environment(DataController.self) var dataController
    
    var body: some View {
        NavigationStack{
            ZStack{
                BackgroundView()
                ScrollView{
                    NavigationLink{
                        ColorOfTheDayView(vm: ColorOfTheDayViewModel(service: CloudKitService(), dataController: dataController))
                    } label: {
                        GameModeButtonView(title: "Color of the Day", streak: dataController.colorOfTheDayStreak)
                    }
                    .disabled(dataController.completedColorOfTheDay)
                    
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
                    Button{
                        showingExplanationSheet.toggle()
                    } label: {
                        Image(systemName: "doc.text.magnifyingglass")
                    }
                }
            }
            .font(.title)
            .sheet(isPresented: $showingExplanationSheet){
                ExplanationView()
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
