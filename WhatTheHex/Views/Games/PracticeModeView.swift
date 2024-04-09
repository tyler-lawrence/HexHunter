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
        VStack{
            Text("Manipulate the values below to observe the color change")
            HStack{
                Text("#\(hexcode.display)")
                    .font(.largeTitle)
                    .padding()
                Spacer()
                ColorSquareView(title: "", hexcode: hexcode, size: 150, showingCode: false)
            }
            RGBSlidersView(hexcode: $hexcode)
        }
        .padding(.horizontal)
    }
}

#Preview {
    PracticeModeView()
}
