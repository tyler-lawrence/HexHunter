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
        targetHexcode == hexcode
    }
    var body: some View {
        VStack{
            Text("Adjust the sliders below so your hexcode matches the target hexcode: ")
                .font(.title)
            + Text("\(targetHexcode.display)").foregroundStyle(Color(targetHexcode))
                .font(.title)
            HStack{
                Text("#\(hexcode.display)")
                    .font(.largeTitle)
                    .padding()
                Spacer()
                ColorSquareView(title: "", hexcode: hexcode, size: 130, showingCode: false)
            }
            TipView(tip, arrowEdge: .bottom)
            RGBSlidersView(hexcode: $hexcode)
            Text("\(hexcode.calculateSimilarity(to: targetHexcode))")
            if correctHexcode {
                Button("Begin"){
                    hasOnboarded = true
                }
            }
        }
        .padding(.horizontal)
        
    }
}

#Preview {
    PracticeModeView(hasOnboarded: .constant(false))
}
