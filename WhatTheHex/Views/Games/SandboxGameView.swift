//
//  SandboxGameView.swift
//  WhatTheHex
//
//  Created by Tyler Lawrence1 on 5/9/24.
//

import SwiftUI

struct SandboxGameView: View {
    @State var playerHexcode = Hexcode()
    
    var body: some View {
        GeometryReader{ geo in
            if geo.size.height > geo.size.width {
                VStack{
                    RotatingView(portraitOrientation: .horizontal){
                        Group{
                            Spacer()
                            ColorSquareView(title: "", hexcode: playerHexcode, showingCode: true)
                               
                            Spacer()
                            VStack{
                                Text("R: \(playerHexcode.red.toColorScale())")
                                Text("G: \(playerHexcode.green.toColorScale())")
                                Text("B: \(playerHexcode.blue.toColorScale())")
                            }
                            .frame(width: geo.size.width * 0.3)
                            .font(.title)
                            Spacer()
                        }
                    }.original
                    Divider()
                    RGBSlidersView(hexcode: $playerHexcode)
                }
                
                .padding()
            } else {
                HStack{
                    RotatingView(portraitOrientation: .horizontal){
                        Group{
                            ColorSquareView(title: "", hexcode: playerHexcode, showingCode: true)
                            VStack{
                                Text("R: \(playerHexcode.red.toColorScale())")
                                Text("G: \(playerHexcode.green.toColorScale())")
                                Text("B: \(playerHexcode.blue.toColorScale())")
                            }
                            .font(.title2)
                        }
                    }.rotated
                        .frame(width: geo.size.width * 0.2)
                    Divider()
                    RGBSlidersView(hexcode: $playerHexcode)
                        
                }
                .padding()
            }
        }
        .onAppear{
            AudioPlayer.shared.startBackgroundLoop(sound: "PracticeMode", type: "mp3")
        }
        .onDisappear{
            AudioPlayer.shared.stopBackgroundSound()
        }
    }
}

#Preview {
    SandboxGameView()
}
