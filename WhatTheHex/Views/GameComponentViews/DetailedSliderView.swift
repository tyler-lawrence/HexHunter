//
//  DetailedSliderView.swift
//  WhatTheHex
//
//  Created by Tyler Lawrence1 on 6/3/25.
//

import SwiftUI

struct DetailedSliderView: View {
    @Binding var component: Component
    var digitKeyPath: WritableKeyPath<Component, Int>
    var digit1Scale: CGFloat {
        digitKeyPath == \.digit1 ? 1.3 : 1
    }
    var digit2Scale: CGFloat {
        digitKeyPath == \.digit2 ? 1.3 : 1
    }
    var body: some View {
        VStack {
            HStack {
                Text(component.digit1Display)
                    .bold(digitKeyPath == \.digit1)
                    .scaleEffect(digit1Scale)
                Text(component.digit2Display)
                    .bold(digitKeyPath == \.digit2)
                    .scaleEffect(digit2Scale)
            }
                .monospaced()
                .font(.title)
                .foregroundStyle(component.hexCategory.displayColor)
            HStack {
                Spacer()
                ForEach(0..<16) { val in
                    var scaleEffect: Double {
                        val == component[keyPath: digitKeyPath] ? 1.5 : 1
                    }
                    Text(val.toHexadecimalString()!)
                        .monospaced()
                        .bold(val == component[keyPath: digitKeyPath])
                        .scaleEffect(scaleEffect)
                    Spacer()
                }
            }
            Slider(
                value: .convert(from: Binding(
                    get: { component[keyPath: digitKeyPath] },
                    set: { component[keyPath: digitKeyPath] = $0 }
                )),
                in: 0...15
            )
                .sensoryFeedback(.selection, trigger: component[keyPath: digitKeyPath]) { _, new in
                    new != 0
                }
                .tint(component.hexCategory.displayColor)
        }
        .padding(.vertical)
        .background(Material.bar)
        .shadow(radius: 12.0)
    }
}

#Preview {
    @Previewable @State var component = Component(hexCategory: .red, digit1: 0, digit2: 0)
    DetailedSliderView(component: $component, digitKeyPath: \.digit1)
    DetailedSliderView(component: $component, digitKeyPath: \.digit2)
}
