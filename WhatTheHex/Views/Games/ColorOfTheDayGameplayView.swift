//
//  ColorOfTheDayGameplayView.swift
//  WhatTheHex
//
//  Created by Tyler Lawrence1 on 5/30/25.
//

import SwiftUI

struct ColorOfTheDayGameplayView: View {
    @Environment(\.presentationMode) var presentationMode
    @State var viewModel: ColorOfTheDayViewModel
    @State var colorOfTheDay: Hexcode?
    @AppStorage("hasOnboardedColorOfTheDay") var hasOnboarded: Bool = false
    @AppStorage("GameKitPreference") var gameKitPreference: Bool = true
    @State var showingConfirmGuessAlert = false
    // loading time
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State var loadingTime = 0
    var loadingTimeMax = 30
    @State var showingLoadingAlert = false
    var targetView: some View {
        Group {
            if colorOfTheDay != nil {
                ColorSquareView(
                    title: "Target",
                    hexcode: viewModel.targetHexcode,
                    showingCode: viewModel.gameOver
                )
            } else {
                HHProgressView()
                    .task {
                        await colorOfTheDay = viewModel.getHexcodeOfDay()
                    }
                    .onReceive(timer) { _ in
                        loadingTime += 1
                        if loadingTime >= loadingTimeMax {
                            showingLoadingAlert = true
                        }
                    }
            }
        }
    }
    var squaresView: RotatingView<some View> {
        RotatingView(portraitOrientation: .horizontal) {
            Group {
                targetView
                ColorSquareView(title: "Your guess", hexcode: viewModel.playerHexcode, showingCode: true)
            }
        }
    }
    var controlsView: RotatingView< some View > {
        RotatingView(portraitOrientation: .vertical) {
            Group {
                RGBSlidersView(hexcode: $viewModel.playerHexcode)
                    .padding(.bottom)
                Button("Guess") {
                    showingConfirmGuessAlert.toggle()
                }.buttonStyle(GameSelectionButton())
            }
        }
    }
    var body: some View {
        if hasOnboarded {
            GeometryReader { geo in
                if geo.size.height > geo.size.width {
                    VStack {
                        squaresView.original
                            .roundedCorner()
                            .padding(.horizontal)
                        controlsView.original
                    }
                } else {
                    HStack {
                        squaresView.rotated
                            .roundedCorner()
                            .padding(.horizontal)
                        controlsView.rotated
                    }
                }
            }
            .onAppear {
                AudioPlayer.shared.startBackgroundLoop(sound: viewModel.audioFileName, type: "mp3")
            }
            .onDisappear {
                AudioPlayer.shared.stopBackgroundSound()
            }
            .alert("Are you sure?", isPresented: $showingConfirmGuessAlert) {
                Button("Yes!") {
                    viewModel.submitGuess()
                    if gameKitPreference {
                        Task {
                            await uploadScoreToGameCenter()
                        }
                    }
                }
                Button("No") {
                    showingConfirmGuessAlert.toggle()
                }
            }
            .alert("Check your network connection", isPresented: $showingLoadingAlert) {
                    Button("Ok") { loadingTime = 0 }
            }
        } else {
            OnboardingView(hasOnboarded: $hasOnboarded, gameMode: .colorOfTheDay)
        }
    }
    private func uploadScoreToGameCenter() async {
        if gameKitPreference {
            Task {
                await GameCenterManager.shared.uploadScore(
                    viewModel.GKFormattedScore,
                    for: .colorOfTheDay
                )
            }
        }
    }
}

#Preview {
    ColorOfTheDayGameplayView(
        viewModel: ColorOfTheDayViewModel(service: CloudKitService(), dataController: DataController())
    )
}
