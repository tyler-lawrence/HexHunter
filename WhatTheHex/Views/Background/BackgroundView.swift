//
//  BackgroundView.swift
//  WhatTheHex
//
//  Created by Tyler Lawrence1 on 4/2/24.
//

import SwiftUI
import Foundation

/// modified code originally written by Paul Hudson

struct BackgroundView: View {
    @State var particleSystem = ParticleSystem(count: 15)
    @State var colors: [Color] = [
        .red,
        .orange,
        .yellow,
        .green,
        .blue,
        .indigo
    ]
    var body: some View {
        LinearGradient(
            colors: colors,
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
        .opacity(0.2)
        .mask {
            TimelineView(.animation) { timeline in
                Canvas { ctx, size in
                    particleSystem.update(date: timeline.date.timeIntervalSinceReferenceDate)
                    ctx.addFilter(.alphaThreshold(min: 0.5))
                    ctx.addFilter(.blur(radius: 30))
                    ctx.drawLayer { ctx in
                        for particle in particleSystem.particles {
                            let rect = CGRect(
                                x: particle.xPosition * size.width,
                                y: particle.yPosition * size.height,
                                width: particle.size,
                                height: particle.size
                            )
                            ctx.fill(Circle().path(in: rect), with: .color(.mint))
                        }
                    }
                }
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    BackgroundView()
}
