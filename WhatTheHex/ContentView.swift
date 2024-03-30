//
//  ContentView.swift
//  WhatTheHex
//
//  Created by Tyler Lawrence1 on 3/29/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var hex = Hexcode(
        red: 0b00000000,
        green: 0b00000000,
        blue: 0b11111111
    )
    
    @State private var colorToGuess: Color = Color.random()
    
    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 15.0)
                .foregroundStyle(colorToGuess)
            Divider()
            HStack{
                Text("red: \(Int(hex.red))")
                Text("green: \(Int(hex.green))")
                Text("blue: \(Int(hex.blue))")
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
