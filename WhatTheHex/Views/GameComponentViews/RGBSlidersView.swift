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
    let detailEnabled: Bool
    var shared: some View {
        Group {
            HexComponentPickerView(component: $hexcode.red, detailEnabled: detailEnabled)
            HexComponentPickerView(component: $hexcode.green, detailEnabled: detailEnabled)
            HexComponentPickerView(component: $hexcode.blue, detailEnabled: detailEnabled)
        }
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
            RGBSlidersView(hexcode: $viewModel.playerHexcode, detailEnabled: true)
        }
    }
    return Preview()
}
