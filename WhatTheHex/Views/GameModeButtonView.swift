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
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                Text(title)
                    .font(.title)
                Spacer()
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
        }
    }
    .buttonStyle(.borderedProminent)
}
