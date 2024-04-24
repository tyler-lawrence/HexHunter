//
//  PracticeModeView.swift
//  WhatTheHex
//
//  Created by Tyler Lawrence1 on 4/2/24.
//

import SwiftUI
import TipKit

struct PracticeModeView: View {
    @Binding var hasOnboarded: Bool
    @State var hexcode = Hexcode()
    let targetHexcode = Hexcode.orange
    let tip = OnboardingTip()
    var correctHexcode: Bool {
        targetHexcode != hexcode
    }
    @Environment(\.dynamicTypeSize) var dynamicTypeSize
    
    var playerHexcodeSquare: some View {
        Group{
            Text("#\(hexcode.display)")
                .font(.largeTitle)
                .padding()
            Spacer()
            ColorSquareView(title: "", hexcode: hexcode, size: 130, showingCode: false)
        }
    }
    
    var shared: some View {
        VStack{
            Text("Adjust the sliders below so your hexcode matches the target hexcode: ")
                .font(.title3)
            Text("\(targetHexcode.display)").foregroundStyle(Color(targetHexcode))
                .font(.title)
            if dynamicTypeSize.isAccessibilitySize {
                VStack{ playerHexcodeSquare }
            } else {
                HStack{ playerHexcodeSquare }
            }
            TipView(tip, arrowEdge: .bottom)
            RGBSlidersView(hexcode: $hexcode)
            Spacer()
            Button("Begin"){
                hasOnboarded = true
            }
            .buttonStyle(.borderedProminent)
            .disabled(correctHexcode)
            
        }
        .padding(.horizontal)
    }
    
    var body: some View {
        if dynamicTypeSize.isAccessibilitySize {
            ScrollView{
                shared
            }
        } else {
            shared
        }
    }
    
}

#Preview {
    PracticeModeView(hasOnboarded: .constant(false))
}
