//
//  ColorSquareView.swift
//  WhatTheHex
//
//  Created by Tyler Lawrence1 on 4/1/24.
//

import SwiftUI

struct ColorSquareView: View {
    
    let title: String?
    let hexcode: Hexcode
    var hexLabel: String {
        showingCode ? hexcode.display : " "
    }
    var minimumFrameSize: CGFloat = 100
    var showingCode: Bool
    
    var body: some View {
        VStack{
            Text(title ?? "")
            RoundedRectangle(cornerRadius: 15.0)
                .foregroundStyle(Color(hexcode))
                .frame(minWidth: minimumFrameSize, minHeight: minimumFrameSize * 0.5)
                .aspectRatio(1, contentMode: .fit)
            Text(hexLabel)
        }
        .lineLimit(1)
        .minimumScaleFactor(0.6)
    }
}

#Preview {
    VStack{
        ColorSquareView(title: "Target", hexcode: Hexcode.random(), showingCode: true)
        ColorSquareView(title: "Target", hexcode: Hexcode.random(), showingCode: true)
    }
}
