//
//  ColorSquareView.swift
//  WhatTheHex
//
//  Created by Tyler Lawrence1 on 4/1/24.
//

import SwiftUI

struct ColorSquareView: View {
    
    let title: String
    let hexcode: Hexcode
    let size: CGFloat = 150
    var hexLabel: String {
        showingCode ? hexcode.display : " "
    }
    @Binding var showingCode: Bool
    
    var body: some View {
        VStack{
            Text(title)
            RoundedRectangle(cornerRadius: 15.0)
                .foregroundStyle(Color(hexcode))
                .frame(width: size, height: size)
            Text(hexLabel)
        }
    }
}

#Preview {
    ColorSquareView(title: "Target", hexcode: Hexcode.random(), showingCode: .constant(true))
}
