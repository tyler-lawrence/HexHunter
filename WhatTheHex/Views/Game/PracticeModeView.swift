//
//  PracticeModeView.swift
//  WhatTheHex
//
//  Created by Tyler Lawrence1 on 4/2/24.
//

import SwiftUI

struct PracticeModeView: View {
    @State var hexcode = Hexcode()
    var body: some View {
        Text("Manipulate the values below to observe the color change")
        HStack{
            Text("#\(hexcode.display)")
                .font(.largeTitle)
                .padding()
            ColorSquareView(title: "", hexcode: hexcode, size: 150, showingCode: false)
        }
        HStack{
            HexComponentPickerView(component: $hexcode.red)
            HexComponentPickerView(component: $hexcode.green)
            HexComponentPickerView(component: $hexcode.blue)
        }
        .padding(.horizontal)
    }
}

#Preview {
    PracticeModeView()
}
