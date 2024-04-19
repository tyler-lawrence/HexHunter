//
//  GameSelectionButton.swift
//  WhatTheHex
//
//  Created by Tyler Lawrence1 on 4/17/24.
//

import SwiftUI

struct GameSelectionButton: ButtonStyle {
    @Environment(\.isEnabled) private var isEnabled: Bool
    func makeBody(configuration: Configuration) -> some View {
        
        configuration.label
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 25.0)
                .stroke(.black, lineWidth: 4)
                .fill(isEnabled ? .white : .gray)
                .shadow(color: .black, radius: 4)
            )
            .foregroundStyle(.black)
            .padding(5)
            .opacity(isEnabled ? 1.0 : 0.6)
    }
}
