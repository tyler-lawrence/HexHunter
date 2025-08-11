//
//  GameView.swift
//  WhatTheHex
//
//  Created by Tyler Lawrence1 on 4/6/24.
//

import SwiftUI

struct TimedGameBaseView: View {
    @State var viewModel: TimedGameViewModel
    var squaresView: RotatingView<some View> {
        RotatingView(portraitOrientation: .horizontal) {
            Group {
                ColorSquareView(
                    title: "Target",
                    hexcode: viewModel.targetHexcode,
                    showingCode: viewModel.gameOver
                )
                ColorSquareView(
                    title: "Your guess",
                    hexcode: viewModel.playerHexcode,
                    showingCode: true
                )
            }
        }
    }

    var guessButton: some View {
        Button("Guess") {
            viewModel.submitGuess()
        }
        .buttonStyle(GameSelectionButton())
    }
    var body: some View {
        GeometryReader { geo in
            if geo.size.height > geo.size.width {
                VStack {
                    TimerView(viewModel: viewModel)
                    squaresView.original
                    RGBSlidersView(hexcode: $viewModel.playerHexcode)
                    guessButton
                }
            } else {
                HStack {
                    squaresView.rotated
                    RGBSlidersView(hexcode: $viewModel.playerHexcode)
                        .frame(width: geo.size.width * 0.6)
                        .fixedSize(horizontal: true, vertical: false)
                        .padding()
                    VStack {
                        Spacer()
                        TimerView(viewModel: viewModel)
                        Spacer()
                        guessButton
                        Spacer()
                    }
                }
            }
        }
        .padding()
        .onAppear {
            AudioPlayer.shared.startBackgroundLoop(sound: viewModel.audioFileName, type: "mp3")
        }
        .onDisappear {
            AudioPlayer.shared.stopBackgroundSound()
        }
    }
}

#Preview {
    TimedGameBaseView(viewModel: SurvivalGameViewModel())
}
