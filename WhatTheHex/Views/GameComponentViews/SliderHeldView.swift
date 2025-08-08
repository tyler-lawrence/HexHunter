//
//  SliderHeldView.swift
//  WhatTheHex
//
//  Created by Tyler Lawrence on 8/8/25.
//

import SwiftUI

struct SliderHeldView: View {
    @State var player = Hexcode()
    @State var target = Hexcode.random()
    @State var selectedComponentKeyPath: WritableKeyPath<Hexcode, Component>?
    @State var selectedDigit: Component.Digit?
    var body: some View {
        GeometryReader { _ in
            VStack {
                HStack(spacing: 0) {
                    Rectangle()
                        .fill(Color(target))
                    Rectangle()
                        .fill(Color(player))
                }
                if let componentPath: WritableKeyPath<Hexcode, Component> = selectedComponentKeyPath,
                   let selectedDigit = selectedDigit?.keyPath {
                    let bindingToDigit = Binding<Component>(
                            get: {
                                player[keyPath: componentPath]
                            },
                            set: { newValue in
                                player[keyPath: componentPath] = newValue
                            }
                        )
                    DetailedSliderView(
                        component: bindingToDigit,
                        digitKeyPath: selectedDigit
                    )
                    .transition(.scale.combined(with: .opacity))
                }
                sliderGroup(for: \.red)
                sliderGroup(for: \.green)
                sliderGroup(for: \.blue)
                Button("Guess") {}
                    .buttonStyle(GameSelectionButton())
            }
        }
    }

    @ViewBuilder
    private func sliderGroup(for componentPath: WritableKeyPath<Hexcode, Component>) -> some View {
        VStack {
            sliderRow(for: componentPath, digit: .one)
            sliderRow(for: componentPath, digit: .two)
        }
    }

    private func sliderRow(
        for componentPath: WritableKeyPath<Hexcode, Component>,
        digit: Component.Digit
    ) -> some View {
        let bindingToDigit = Binding<Int>(
                get: {
                    player[keyPath: componentPath][keyPath: digit.keyPath]
                },
                set: { newValue in
                    player[keyPath: componentPath][keyPath: digit.keyPath] = newValue
                }
            )
        return HStack {
            Text(player[keyPath: componentPath][keyPath: digit.keyPath].toHexadecimalString() ?? "")
            Slider(
                value: .convert(from: bindingToDigit),
                in: 0...15
            ) { editing in
                withAnimation {
                    selectedComponentKeyPath = editing ? componentPath : nil
                    selectedDigit = editing ? digit : nil
                }
            }
        }
    }
}

#Preview {
    SliderHeldView()
}
