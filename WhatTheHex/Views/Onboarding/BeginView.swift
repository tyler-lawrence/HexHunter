//
//  BeginView.swift
//  WhatTheHex
//
//  Created by Tyler Lawrence1 on 4/2/24.
//

import SwiftUI

struct BeginView: View {
    @Binding var hasOnboarded: Bool
    var body: some View {
        ZStack {
            BackgroundView()
                .ignoresSafeArea()
            Button("start guessing") {
                hasOnboarded = true
            }
            .buttonStyle(.borderedProminent)
        }
    }
}

#Preview {
    BeginView(hasOnboarded: .constant(false))
}
