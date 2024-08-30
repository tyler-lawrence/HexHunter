//
//  ExplanationView.swift
//  WhatTheHex
//
//  Created by Tyler Lawrence1 on 5/7/24.
//

import SwiftUI

struct ExplanationView: View {
    enum Explanation: String, CaseIterable {
        case score = "Score"
        case hexcode = "Hexcodes"
    }
    @State var selectedExplanation: Explanation = .hexcode
    var body: some View {
        VStack {
            Picker("Category", selection: $selectedExplanation) {
                ForEach(Explanation.allCases, id: \.self) { explanation in
                    Text(explanation.rawValue)
                }
            }
            .pickerStyle(.segmented)
            switch selectedExplanation {
            case .score:
                ScoreExplanationView()
            case .hexcode:
                HexcodeExplanationView()
            }
        }
        .padding()
    }
}

#Preview {
    ExplanationView()
}
