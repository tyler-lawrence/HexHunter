//
//  SandboxGameView.swift
//  WhatTheHex
//
//  Created by Tyler Lawrence1 on 5/9/24.
//

import SwiftUI

struct SandboxGameView: View {
    @State var playerHexcode = Hexcode()
    
    var gameDetailsView: RotatingView< some View> {
        let g = Group{
            ColorSquareView(title: "", hexcode: playerHexcode, showingCode: true)
            VStack{
                Text("R: \(playerHexcode.red.toColorScale())")
                Text("G: \(playerHexcode.green.toColorScale())")
                Text("B: \(playerHexcode.blue.toColorScale())")
            }
            .font(.title2)
        }
            .padding()
        return RotatingView(content: g, originalOrientation: .horizontal)
    }
    
    
    var body: some View {
        GeometryReader{ geo in
            if geo.size.height > geo.size.width {
                VStack{
                    gameDetailsView.original
                    Divider()
                    RGBSlidersView(hexcode: $playerHexcode)
                }
                .padding()
            } else {
                HStack{
                    gameDetailsView.flipped
                    Divider()
                    RGBSlidersView(hexcode: $playerHexcode)
                }
                .padding()
            }
        }
    }
}

#Preview {
    SandboxGameView()
}
