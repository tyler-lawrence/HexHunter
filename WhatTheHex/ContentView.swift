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
    let rectangleWidth: CGFloat = 450
    let rectangleHeight: CGFloat = 100
    
    var body: some View {
        VStack {
            HStack{
                Spacer()
                Text("Color to guess")
                RoundedRectangle(cornerRadius: 15.0)
                    .frame(width: rectangleWidth, height: rectangleHeight)
                    .foregroundStyle(colorToGuess)
            }
            Divider()
            HStack{
                Picker("", selection: $hex.h0){
                    ForEach(Hexcode.sortedKeys, id: \.self){ k in
                        if let val: String = Hexcode.lookup[k]{
                            Text(val)
                        }
                        
                    }
                }
                .pickerStyle(.wheel)
                Picker("", selection: $hex.h1){
                    ForEach(Hexcode.sortedKeys, id: \.self){ k in
                        if let val: String = Hexcode.lookup[k]{
                            Text(val)
                        }
                        
                    }
                }
                .pickerStyle(.wheel)
                Picker("", selection: $hex.h2){
                    ForEach(Hexcode.sortedKeys, id: \.self){ k in
                        if let val: String = Hexcode.lookup[k]{
                            Text(val)
                        }
                        
                    }
                }
                .pickerStyle(.wheel)
                Picker("", selection: $hex.h3){
                    ForEach(Hexcode.sortedKeys, id: \.self){ k in
                        if let val: String = Hexcode.lookup[k]{
                            Text(val)
                        }
                        
                    }
                }
                .pickerStyle(.wheel)
                Picker("", selection: $hex.h4){
                    ForEach(Hexcode.sortedKeys, id: \.self){ k in
                        if let val: String = Hexcode.lookup[k]{
                            Text(val)
                        }
                        
                    }
                }
                .pickerStyle(.wheel)
                Picker("", selection: $hex.h5){
                    ForEach(Hexcode.sortedKeys, id: \.self){ k in
                        if let val: String = Hexcode.lookup[k]{
                            Text(val)
                        }
                        
                    }
                }
                .pickerStyle(.wheel)
            }
            Divider()
            
            HStack{
                Spacer()
                Text("Your guess")
                RoundedRectangle(cornerRadius: 15.0)
                    .frame(width: rectangleWidth, height: rectangleHeight)
                    .foregroundStyle(hex.color)
                
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
