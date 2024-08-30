//
//  HexcodeComponentOnboardingView.swift
//  WhatTheHex
//
//  Created by Tyler Lawrence1 on 5/2/24.
//

import SwiftUI
import TipKit

struct TutorialView: View {
    @Binding var hasOnboarded: Bool
    @State var playerHexcode = Hexcode(from: "#888888")!
    @Environment(\.dynamicTypeSize) var dynamicTypeSize
    let sliderComponentTip = SliderComponentTip()
    @State var viewIdx = 0
    var nextButton: some View {
        Button("Next") {
            viewIdx += 1
        }
        .font(.largeTitle)
        .buttonStyle(GameSelectionButton())
    }
    var getStartedMessage: LocalizedStringKey {
        LocalizedStringKey("Let's get started by learning the basics of hexcodes")
    }
    var body: some View {
        VStack {
            if viewIdx == 0 {
                Text("Welcome to HexHunter")
                    .font(.largeTitle)
                    .padding()
                Text(getStartedMessage)
                        .font(.title)
                        .padding()
                nextButton
            } else if viewIdx == 1 {
                VStack {
                    Spacer()
                    Group {
                        Text("Use the sliders below to increase or decrease the amount of ") +
                        Text("red").foregroundStyle(.red).bold() +
                        Text(" in the displayed color.")
                    }
                    .font(.title2)
                    ColorSquareView(title: "", hexcode: playerHexcode, showingCode: false)
                    VStack {
                        Text("Hexcode: #\(playerHexcode.display)")
                        Text("Red: \(playerHexcode.red.toColorScale())")
                    }
                    .font(.title)
                    TipView(sliderComponentTip, arrowEdge: .bottom)
                    HexComponentPickerView(component: $playerHexcode.red)
                    Spacer()
                    nextButton
                }
                .padding(.horizontal)

            } else {
                GameplayTutorialView(hasOnboarded: $hasOnboarded)
            }
        }
    }
}

#Preview {
    TutorialView(hasOnboarded: .constant(false))
}
