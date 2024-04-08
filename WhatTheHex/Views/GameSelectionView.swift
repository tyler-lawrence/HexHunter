//
//  GameSelectionView.swift
//  WhatTheHex
//
//  Created by Tyler Lawrence1 on 4/2/24.
//

import SwiftUI

struct GameSelectionView: View {
    @State var showingScoreSheet = false
    @State var showingHexcodeSheet = false
    var body: some View {
        NavigationStack{
            ZStack{
                BackgroundView()
                VStack{
                    
                    NavigationLink{
                        QuickGameView(vm: QuickGameViewModel())
                    } label: {
                        GameModeButtonView(title: "Quick Game", description: "See how accurately you can guess one color in 30 seconds")
                    }
                    
                    NavigationLink{
                        RapidGameView(vm: RapidGameViewModel())
                    } label: {
                        GameModeButtonView(title: "Rapid Game", description: "90 seconds: how many colors can you guess within 80% accuracy")
                    }
                    
                    NavigationLink{
                        SurvivalGameView()
                    } label: {
                        GameModeButtonView(title: "Survival", description: "Correct guesses increase your time remaining. How long can you last?")
                    }
                    
                    NavigationLink{
                        PracticeModeView()
                    } label: {
                        GameModeButtonView(title: "Practice", description: "Explore the color pickers")
                    }
                }
                .padding(.horizontal)
                .buttonStyle(.borderedProminent)
            }
            .toolbar{
                ToolbarItem{
                    Button{
                        showingScoreSheet.toggle()
                    } label: {
                        Image(systemName: "gamecontroller")
                    }
                }
                ToolbarItem{
                    Button{
                        showingHexcodeSheet.toggle()
                    } label: {
                        Image(systemName: "circle.hexagonpath")
                    }
                }
            }
            .sheet(isPresented: $showingScoreSheet){
                ScoreExplanationView()
            }
            .sheet(isPresented: $showingHexcodeSheet){
                HexcodeExplanationView()
            }
        }
        
        
    }
}

#Preview {
    GameSelectionView()
}
