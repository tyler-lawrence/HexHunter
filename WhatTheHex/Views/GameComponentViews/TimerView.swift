//
//  TimerBackgroundView.swift
//  WhatTheHex
//
//  Created by Tyler Lawrence1 on 4/2/24.
//

import SwiftUI

struct TimerView: View {
    @State var viewModel: TimedGameViewModel
    @State var lowTimeTrigger: Bool = false
    let lowTimeCounter = 5
    let circleFrameSize: CGFloat = 80
    var circleColor: Color {
        viewModel.timeRemaining <= 5 ? .red : .gray
    }
    var circleGradient: RadialGradient {
        RadialGradient(
            colors: [circleColor.opacity(0.2), circleColor],
            center: .center,
            startRadius: 0,
            endRadius: 40
        )
    }
    var body: some View {
        Text("\(viewModel.timeRemaining)")
            .font(.largeTitle)
            .foregroundStyle(.white)
            .shadow(radius: 1)
            .bold()
            .padding()
            .background(
                Circle()
                    .frame(width: circleFrameSize, height: circleFrameSize)
                    .foregroundStyle(circleGradient)
                    .shadow(radius: 10)
                    .phaseAnimator([1, 1.5], trigger: lowTimeTrigger) { content, phase in
                        content
                            .scaleEffect(phase)
                    }
            )
            .padding(5)
            // correct guess animation
            .overlay {
                    Circle()
                        .foregroundStyle(.green)
                        .overlay {
                            Text("+10")
                                .font(.largeTitle)
                                .foregroundStyle(.white)
                        }
                        .phaseAnimator([0, 1], trigger: viewModel.bonusTimeAnimationTrigger) { content, phase in
                            content
                                .opacity(phase)
                        }
            }
            .sensoryFeedback(.warning, trigger: lowTimeTrigger)
            .onReceive(viewModel.timer) { _ in
                viewModel.timeRemaining -= 1
                if viewModel.timeRemaining <= lowTimeCounter {
                    lowTimeTrigger.toggle()
                }
                if viewModel.timeRemaining <= 0 {
                    viewModel.gameOver = true
                    viewModel.timerSubscription?.cancel()
                }
            }
    }
}

#Preview {
    TimerView(viewModel: SurvivalGameViewModel())
}
