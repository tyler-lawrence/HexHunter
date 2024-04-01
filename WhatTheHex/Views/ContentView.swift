//
//  ContentView.swift
//  WhatTheHex
//
//  Created by Tyler Lawrence1 on 3/29/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var hex = Hexcode()
    @State private var colorToGuess: Color = Color.random()
    let size: CGFloat = 150
    
    var body: some View {
        VStack {
            HStack{
                VStack{
                    Text("Target")
                    RoundedRectangle(cornerRadius: 15.0)
                        .foregroundStyle(colorToGuess)
                        .frame(width: size, height: size)
                }
                VStack{
                    Text("Your guess")
                    RoundedRectangle(cornerRadius: 15.0)
                        .foregroundStyle(Color(hex))
                        .frame(width: size, height: size)
                }
            }
            Divider()
            Text(Color(hex).description)
            HStack{
                HexComponentPicker(component: $hex.red)
                HexComponentPicker(component: $hex.green)
                HexComponentPicker(component: $hex.blue)
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        ContentView()
            .previewDevice("My Mac")
    }
}
