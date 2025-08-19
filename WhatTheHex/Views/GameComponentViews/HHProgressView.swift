//
//  HHProgressView.swift
//  WhatTheHex
//
//  Created by Tyler Lawrence1 on 5/14/24.
//

import SwiftUI

struct HHProgressView: View {
    @State var rotation3D = 0.0
    @State var scale = 0.85
    var color: Color {
        rotation3D > 180.0 ? .teal : .orange
    }
    var hhLoadingAnimation: some View {
        Image("HexHunter.H")
            .resizable()
            .scaledToFit()
            .scaleEffect(scale)
            .foregroundStyle(color)
            .rotation3DEffect(
                Angle(degrees: rotation3D),
                axis: (x: 1.0, y: 1.0, z: 1.0)
            )
            .onAppear {
                rotation3D = 360
                scale = 0.6
            }
            .animation(
                .spring(duration: 0.5).repeatForever(),
                value: rotation3D
            )
            .padding()
    }
    var body: some View {
        ColorSquareView.loading
            .overlay {
                hhLoadingAnimation
            }
    }
}

#Preview {
    HHProgressView()
}
