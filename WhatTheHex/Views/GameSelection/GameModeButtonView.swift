//
//  GameModeButtonView.swift
//  WhatTheHex
//
//  Created by Tyler Lawrence1 on 4/6/24.
//

import SwiftUI

struct GameModeButtonView: View {

    let title: String
    let description: String
    var streak: Int? = nil
    
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                Text(title)
                    .font(.title)
                    .bold()
                Spacer()
                if let streak {
                    Text("\(streak)")
                        .font(.title2)
                        .bold()
                        .foregroundStyle(.white)
                        .padding()
                        .background(
                            Image("streakIcon")
                                .resizable()
                                .scaledToFit()
                        )
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
            GameModeButtonView(title: "Rapid", description: "How many colors can you accurately guess in 90 seconds", streak: 5)
        }
        
        NavigationLink{
            Text("test")
        } label: {
            GameModeButtonView(title: "Rapid", description: "How many colors can you accurately guess in 90 seconds")
        }
    }
    .buttonStyle(.borderedProminent)
}
