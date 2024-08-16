//
//  ColorOfTheDayView.swift
//  WhatTheHex
//
//  Created by Tyler Lawrence1 on 4/18/24.
//

import SwiftUI

struct ColorOfTheDayView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @State var vm: ColorOfTheDayViewModel
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
        Group{
            if colorOfTheDay != nil {
                ColorSquareView(title: "Target", hexcode: vm.targetHexcode, showingCode: vm.gameOver)
            } else {
                HHProgressView()
                    .task{
                        await colorOfTheDay = vm.getHexcodeOfDay()
                    }
                    .onReceive(timer){ _ in
                        loadingTime += 1
                        if loadingTime >= loadingTimeMax {
                            showingLoadingAlert = true
                        }
                    }
            }
        }
    }
    
    var squaresView: RotatingView<some View> {
        RotatingView(portraitOrientation: .horizontal){
            Group{
                targetView
                ColorSquareView(title: "Your guess", hexcode: vm.playerHexcode, showingCode: true)
            }
        }
    }
    
    var controlsView: RotatingView< some View > {
        RotatingView(portraitOrientation: .vertical){
            Group {
                RGBSlidersView(hexcode: $vm.playerHexcode)
                Button("Guess"){
                    showingConfirmGuessAlert.toggle()
                }.buttonStyle(GameSelectionButton())
            }
        }
    }
    
    var body: some View {
        
        if hasOnboarded{

            GeometryReader{ geo in
                if geo.size.height > geo.size.width {
                    VStack{
                        squaresView.original
                        controlsView.original
                    }
                    .padding()
                } else {
                    HStack{
                        squaresView.rotated
                        controlsView.rotated
                    }
                    .padding()
                }
            }
            .onAppear{
                AudioPlayer.shared.startBackgroundLoop(sound: "GameplayLoop", type: "mp3")
            }
            .onDisappear{
                AudioPlayer.shared.stopBackgroundSound()
            }
            .alert("Are you sure?", isPresented: $showingConfirmGuessAlert){
                Button("Yes!") {
                    vm.submitGuess()
                }
                Button("No"){
                    showingConfirmGuessAlert.toggle()
                }
            }
            .alert(vm.gameOverMessage, isPresented: $vm.gameOver){
                Button("Ok"){
                    // upload to game center
                    if gameKitPreference {
                        Task {
                            await GameCenterManager.shared.uploadScore(
                                vm.GKFormattedScore,
                                for: .colorOfTheDay
                            )
                        }
                    }
                    
                    presentationMode.wrappedValue.dismiss()
                }
            }
            .alert("Check your network connection", isPresented: $showingLoadingAlert){
                    Button("Ok"){ loadingTime = 0 }
            }
            
        } else {
            OnboardingView(hasOnboarded: $hasOnboarded, gameMode: .colorOfTheDay)
        }
        
    }
}

#Preview {
    ColorOfTheDayView(vm: ColorOfTheDayViewModel(service: CloudKitService(), dataController: DataController()))
}
