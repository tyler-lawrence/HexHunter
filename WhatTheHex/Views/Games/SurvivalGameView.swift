//
//  SurvivalGameView.swift
//  WhatTheHex
//
//  Created by Tyler Lawrence1 on 4/8/24.
//

import SwiftUI

struct SurvivalGameView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.dynamicTypeSize) var dynamicTypeSize
    @Environment(\.layoutDirection) var layoutDirection
    @State var vm: SurvivalGameViewModel = SurvivalGameViewModel()
    @AppStorage("hasOnboarededSurvival") var hasOnboarded: Bool = false
    @State var showingExitConfirmation: Bool = false
    
    var backIcon: String {
        switch layoutDirection {
        case .leftToRight:
            "chevron.left"
        case .rightToLeft:
            "chevron.right"
        @unknown default:
            "chevron.left"
        }
    }
    
    var minSimilarityScore: String {
        String(format: "%.0f", vm.minimumSimilarityToScore)
    }
    
    var squaresView: RotatingView<some View> {
        RotatingView(portraitOrientation: .horizontal){
            Group{
                ColorSquareView(title: "Target", hexcode: vm.targetHexcode, showingCode: vm.gameOver)
                ColorSquareView(title: "Your guess", hexcode: vm.playerHexcode, showingCode: true)
            }
        }
    }
    
    var backButtonPosition: ToolbarItemPlacement {
        #if os(iOS)
        return .topBarLeading
        #else
        return ToolbarItemPlacement.navigation
        #endif
    }
    
    var gameDetailsView: RotatingView<some View> {
        
        RotatingView(portraitOrientation: .vertical){
            Group{
                Spacer()
                TimerView(vm: vm)
                Spacer()
                VStack(alignment: .trailing){
                    Text("Score: \(vm.correctGuesses)")
                        .contentTransition(.numericText())
                    HStack{
                        Image(systemName: "scope")
                        Text("\(minSimilarityScore)")
                    }
                }
                .padding(.vertical, 10)
                .font(.title2)
                .lineLimit(1)
                .minimumScaleFactor(0.6)
                Spacer()
            }
        }
    }
    
    var guessButton: some View {
        Button("Guess"){
            vm.submitGuess()
        }
        .buttonStyle(GameSelectionButton())
        .disabled(!vm.playerCanGuess)
    }
    
    var body: some View {
    
        if hasOnboarded {
            GeometryReader{ geo in
                if geo.size.height > geo.size.width {
                    VStack{
                        gameDetailsView.rotated
                        squaresView.original
                        RGBSlidersView(hexcode: $vm.playerHexcode)
                        Spacer()
                        guessButton
                    }
                } else {
                    HStack{
                        squaresView.rotated
                        RGBSlidersView(hexcode: $vm.playerHexcode)
                            .frame(minWidth: geo.size.width * 0.3)
                        if dynamicTypeSize.isAccessibilitySize{
                            ScrollView{
                                VStack{
                                    gameDetailsView.original
                                    guessButton
                                }
                            }
                        } else {
                            VStack{
                                gameDetailsView.original
                                guessButton
                            }
                        }
                    }
                }
            }
            .padding()
            .onAppear{
                AudioPlayer.shared.startBackgroundLoop(sound: "GameplayLoop", type: "mp3")
            }
            .onDisappear{
                vm.reset()
                AudioPlayer.shared.stopBackgroundSound()
            }
            .alert(vm.gameOverMessage, isPresented: $vm.gameOver) {
                Button("Play again"){
                    Task{
                        await GameCenterManager.shared.uploadScore(
                            vm.GKFormattedScore,
                            for: .survival
                        )
                        vm.reset()
                    }
                    
                }
                Button("Exit"){
                    Task{
                        await GameCenterManager.shared.uploadScore(
                            vm.GKFormattedScore,
                            for: .survival
                        )
                        vm.reset()
                    }
                    presentationMode.wrappedValue.dismiss()
                }
            }
            .alert("Are you sure you want to leave?", isPresented: $showingExitConfirmation){
                Button("Yes", role: .destructive){
                    Task{
                        await GameCenterManager.shared.uploadScore(
                            vm.GKFormattedScore,
                            for: .survival
                        )
                    }
                    presentationMode.wrappedValue.dismiss()
                }
            }
            .onChange(of: showingExitConfirmation){
                vm.toggleTimer()
            }
            .onChange(of: vm.playerHexcode){ oldValue, newValue in
                /// onChange was noticing changes from the viewmodel initializing a new playerhexcode. this is checking to see if the newValue that onChange finds is not a new Hexcode then we can allow the player to guess
                if newValue != Hexcode() {
                    vm.playerCanGuess = true
                }
            }
            .navigationBarBackButtonHidden()
            .toolbar{
                ToolbarItem(placement: backButtonPosition){
                    Button{
                        showingExitConfirmation.toggle()
                    } label: {
                        HStack{
                            Image(systemName: backIcon)
                            Text("Back")
                        }
                    }
                }
            }
        } else {
            OnboardingView(hasOnboarded: $hasOnboarded, gameMode: .survival)
        }
        
    }
}


#Preview {
    SurvivalGameView(vm: SurvivalGameViewModel())
}
