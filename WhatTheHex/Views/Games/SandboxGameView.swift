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
        GeometryReader { geo in
            if geo.size.height > geo.size.width {
                VStack {
                    RotatingView(portraitOrientation: .horizontal) {
                        Group {
                            ColorSquareView(title: nil, hexcode: playerHexcode, showingCode: true)
                                .roundedCorner()
                                .padding(.trailing)

                            let channels: [(label: String, value: Int)] = [
                                ("R:", playerHexcode.red.toColorScale()),
                                ("G:", playerHexcode.green.toColorScale()),
                                ("B:", playerHexcode.blue.toColorScale())
                            ]
                            VStack(alignment: .leading) {
                                ForEach(channels, id: \.label) { channel in
                                    HStack {
                                        Text(channel.label)
                                        Text("\(channel.value)")
                                            .frame(width: 60, alignment: .trailing) // enough for 3 digits
                                    }
                                    .monospaced()
                                }
                            }
                            .font(.title)
                            .padding(.horizontal)
                        }
                    }.original
                    Divider()
                    RGBSlidersView(hexcode: $playerHexcode)
                }
                .padding()
            } else {
                HStack {
                    RotatingView(portraitOrientation: .horizontal) {
                        Group {
                            ColorSquareView(title: nil, hexcode: playerHexcode, showingCode: true)
                                .roundedCorner()
                            VStack {
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
        .onAppear {
            AudioPlayer.shared.startBackgroundLoop(sound: "PracticeMode", type: "mp3")
        }
        .onDisappear {
            AudioPlayer.shared.stopBackgroundSound()
        }
    }
}

#Preview {
    SandboxGameView()
}
