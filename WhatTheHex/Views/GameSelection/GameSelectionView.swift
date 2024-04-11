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
                        AccuracyGameView(vm: ColorOfTheDayViewModel())
                    } label: {
                        GameModeButtonView(title: "Color of the Day", description: "See how close you can get to the color of the day.")
                    }
                    
                    NavigationLink{
                        AccuracyGameView(vm: AccuracyGameViewModel())
                    } label: {
                        GameModeButtonView(title: "Accuracy Game", description: "How accurately can you guess one color?")
                    }
                    
                    NavigationLink{
                        RapidGameView()
                    } label: {
                        GameModeButtonView(title: "Rapid Game", description: "90 seconds: how many colors can you guess within 80% accuracy.")
                    }
                    
                    NavigationLink{
                        SurvivalGameView()
                    } label: {
                        GameModeButtonView(title: "Survival", description: "Correct guesses increase your time remaining. How long can you last?")
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
