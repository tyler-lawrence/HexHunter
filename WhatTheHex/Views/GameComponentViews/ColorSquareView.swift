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
    var showingCode: Bool
    init(
        font: Font = .title2,
        title: LocalizedStringKey?,
        hexcode: Hexcode,
        showingCode: Bool
    ) {
        self.font = font
        self.title = title
        self.hexcode = hexcode
        self.showingCode = showingCode
    }
    var body: some View {
        Rectangle()
            .foregroundStyle(Color(hexcode))
            .overlay {
                VStack {
                    if let title {
                        Text(title)
                            .font(.title2)
                            .padding(8)
                            .background(
                                RoundedRectangle(cornerRadius: 12.0)
                                    .fill(Material.thin)
                            )
                    }
                    Spacer()
                    if hexLabel != " " {
                        Text(hexLabel)
                            .font(.title2)
                            .padding(8)
                            .background(
                                RoundedRectangle(cornerRadius: 12.0)
                                    .fill(Material.thin)
                            )
                    }
                }
                .padding()
            }
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
