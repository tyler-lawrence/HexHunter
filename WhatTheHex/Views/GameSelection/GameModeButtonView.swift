//
//  GameModeButtonView.swift
//  WhatTheHex
//
//  Created by Tyler Lawrence1 on 4/6/24.
//

import SwiftUI

struct GameModeButtonView: View {
    @Environment(GameManager.self) var gameManager
    let title: String
    let description: String
    var showStreak: Bool = false
    
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                Text(title)
                    .font(.title)
                Spacer()
                if showStreak {
                    Text("\(gameManager.colorOfTheDayStreak())")
                        .foregroundStyle(.white)
                        .padding()
                        .background(Circle().foregroundStyle(.red))
                        .offset(x: 40, y: -40)
                }
            }
            Text(description)
                .offset(x: 10)
                .multilineTextAlignment(.leading)
        }
        .padding()
    }
}

#Preview {
    NavigationStack{
        NavigationLink{
            Text("test")
        } label: {
            GameModeButtonView(title: "Rapid", description: "How many colors can you accurately guess in 90 seconds")
                .environment(GameManager.sample)
        }
    }
    .buttonStyle(.borderedProminent)
}
