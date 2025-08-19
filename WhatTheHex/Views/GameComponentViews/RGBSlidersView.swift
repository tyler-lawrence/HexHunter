//
//  RGBSlidersView.swift
//  WhatTheHex
//
//  Created by Tyler Lawrence1 on 4/9/24.
//

import SwiftUI

struct RGBSlidersView: View {
    @Binding var hexcode: Hexcode
    @Environment(\.dynamicTypeSize) var dynamicTypeSize
    @State var selectedComponentKeyPath: WritableKeyPath<Hexcode, Component>?
    @State var selectedDigit: Component.Digit?
    var shared: some View {
        Group {
            Spacer()
            if let selectedComponentKeyPath,
               let selectedDigit {
                @State var component = hexcode[keyPath: selectedComponentKeyPath]
                DetailedSliderView(
                    component: component,
                    digitKeyPath: selectedDigit.keyPath
                )
                .id(component)
                .transition(.scale.combined(with: .opacity))
            }
            HexComponentPickerView(
                component: $hexcode.red,
                selectedDigit: $selectedDigit,
                onEdit: { selectedComponentKeyPath = \.red }
            )
            HexComponentPickerView(
                component: $hexcode.green,
                selectedDigit: $selectedDigit,
                onEdit: { selectedComponentKeyPath = \.green }
            )
            HexComponentPickerView(
                component: $hexcode.blue,
                selectedDigit: $selectedDigit,
                onEdit: { selectedComponentKeyPath = \.blue }
            )
        }
        .padding(.horizontal)
    }
    var body: some View {
        #if os(iOS)
        if dynamicTypeSize.isAccessibilitySize {
            ScrollView {
                shared
            }
        } else {
            VStack {
                shared
            }
        }
        #elseif os(macOS)
        HStack {shared}
        #endif
    }
}

#Preview {
    struct Preview: View {
        @State var viewModel = PracticeModeViewModel()
        var body: some View {
            RGBSlidersView(hexcode: $viewModel.playerHexcode)
        }
    }
    return Preview()
}
