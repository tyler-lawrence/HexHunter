//
//  ColorSquareView.swift
//  WhatTheHex
//
//  Created by Tyler Lawrence1 on 4/1/24.
//

import SwiftUI

struct ColorSquareView: View {
    let font: Font
    let title: LocalizedStringKey?
    let hexcode: Hexcode
    var hexLabel: String {
        showingCode ? hexcode.display : " "
    }
    var minimumFrameSize: CGFloat = 100
    var showingCode: Bool
    init(
        font: Font = .title2,
        title: LocalizedStringKey?,
        hexcode: Hexcode,
        minimumFrameSize: CGFloat = 100,
        showingCode: Bool
    ) {
        self.font = font
        self.title = title
        self.hexcode = hexcode
        self.minimumFrameSize = minimumFrameSize
        self.showingCode = showingCode
    }
    var body: some View {
        VStack(spacing: 0) {
            Text(title ?? "")
                .font(font)
            RoundedRectangle(cornerRadius: 15.0)
                .foregroundStyle(Color(hexcode))
                .frame(minWidth: minimumFrameSize, minHeight: minimumFrameSize * 0.5)
                .aspectRatio(1, contentMode: .fit)
            Text(hexLabel)
        }
        .lineLimit(1)
        .minimumScaleFactor(0.5)
    }
}

extension ColorSquareView {
    static let loading = ColorSquareView(
        font: .title2,
        title: "Loading...",
        hexcode: Hexcode(from: "#F4F4F4") ?? Hexcode(),
        showingCode: false
    )
}

#Preview {
    VStack {
        ColorSquareView(title: "Target", hexcode: Hexcode.random(), showingCode: true)
        ColorSquareView(title: "Your Guess", hexcode: Hexcode.random(), showingCode: false)
        ColorSquareView(title: "Target", hexcode: Hexcode.random(), showingCode: true)
    }
}
