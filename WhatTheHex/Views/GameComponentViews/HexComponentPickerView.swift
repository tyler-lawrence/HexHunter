//
//  HexComponentPicker.swift
//  WhatTheHex
//
//  Created by Tyler Lawrence1 on 3/30/24.
//

import SwiftUI

struct HexComponentPickerView: View {
    @Binding var component: Component
    @State private var selectedDigit: Component.Digit?
    var colorLabel: LocalizedStringKey {
        LocalizedStringKey(component.hexCategory.rawValue)
    }
    let detailOffset: CGFloat = 120
    var iosSliders: some View {
        HStack {
            Text(colorLabel)
                .font(.title)
                .foregroundStyle(component.hexCategory.displayColor)
                .bold()
            VStack {
                HStack {
                    Text(component.digit1Display)
                    Slider(value: .convert(from: $component.digit1), in: 0...15) { _ in
                        selectedDigit = nil
                    }
                    .sensoryFeedback(.selection, trigger: component.digit1) { _, new in
                        new != 0
                    }
                    .onChange(of: component.digit1) {
                        selectedDigit = .one
                    }
                }
                HStack {
                    Text(component.digit2Display)
                    Slider(value: .convert(from: $component.digit2), in: 0...15) { _ in
                        selectedDigit = nil
                    }
                    .sensoryFeedback(.selection, trigger: component.digit2) { _, new in
                        new != 0
                    }
                    .onChange(of: component.digit2) {
                        selectedDigit = .two
                    }
                }
            }
            Text(component.display)
                .font(.largeTitle)
                .foregroundStyle(component.hexCategory.displayColor)
                .frame(width: 80)
        }
        .overlay {
            if let selectedDigit {
                switch selectedDigit {
                case .one:
                    DetailedSliderView(
                        component: $component,
                        digitKeyPath: selectedDigit.keyPath
                    )
                    .offset(y: -detailOffset)
                case .two:
                    DetailedSliderView(
                        component: $component,
                        digitKeyPath: selectedDigit.keyPath
                    )
                    .offset(y: -detailOffset)
                }
            }
        }
        .tint(component.hexCategory.displayColor)
        .padding(5)
        .background(
            RoundedRectangle(cornerRadius: 15.0)
                .foregroundStyle(Material.thickMaterial)
        )
    }
    var macSliders: some View {
        VStack {
            HStack {
                Text(component.display)
                    .font(.largeTitle)
            }
            HStack {
                Text(component.digit1Display)
                Slider(value: .convert(from: $component.digit1), in: 0...15)
            }
            HStack {
                Text(component.digit2Display)
                Slider(value: .convert(from: $component.digit2), in: 0...15)
            }
            Text(component.hexCategory.rawValue)
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 15.0)
                .foregroundStyle(Material.thickMaterial)
        )
    }
    var body: some View {
    #if os(macOS)
            macSliders
    #else
            iosSliders
    #endif
        }
    }

#Preview {
    struct Preview: View {
        @State var component = Component(hexCategory: .red, digit1: 10, digit2: 4)
        var body: some View {
            HexComponentPickerView(component: $component)
        }
    }
    return Preview()
}
