//
//  ScoreExplanationView.swift
//  WhatTheHex
//
//  Created by Tyler Lawrence1 on 4/2/24.
//

import SwiftUI

struct ScoreExplanationView: View {
    let hex1 = Hexcode.teal
    let hex2 = Hexcode.orange
    
    var redDiff: String {
        String(format: "%.0f", Double(abs(hex1.red.toColorScale() - hex2.red.toColorScale())))
    }
    
    var greenDiff: String {
        String(format: "%.0f", Double(abs(hex1.green.toColorScale() - hex2.green.toColorScale())))
    }
    
    var blueDiff: String {
        String(format: "%.0f", Double(abs(hex1.blue.toColorScale() - hex2.blue.toColorScale())))
    }
    
    var score: Double {
        hex1.calculateSimilarity(to: hex2)
    }
    
    var body: some View {
        VStack{
            Text("Scoring")
                .font(.title)
            HStack{
                ColorSquareView(title: "", hexcode: hex1, size: 150, showingCode: true)
                ColorSquareView(title: "", hexcode: hex2, size: 150, showingCode: true)
            }
            Divider()
            ScrollView{
                Text("Scores are calculated by measuring the difference between each component. Each component can be handled as a number between 0 and 255.")
                HStack{
                    VStack{
                        Text("Red: \(hex1.red.display) = \(hex1.red.colorScaleLabel)")
                        Text("Green: \(hex1.green.display) = \(hex1.green.colorScaleLabel)")
                        Text("Blue: \(hex1.blue.display) = \(hex1.blue.colorScaleLabel)")
                    }
                    Divider()
                    VStack{
                        Text("Red: \(hex2.red.display) = \(hex2.red.colorScaleLabel)")
                        Text("Green: \(hex2.green.display) = \(hex2.green.colorScaleLabel)")
                        Text("Blue: \(hex2.blue.display) = \(hex2.blue.colorScaleLabel)")
                    }
                }
                Divider()
                Text("then we sum the absolute difference across same colors and divide that by 3.")
                Text("Red = |\(hex1.red.colorScaleLabel) - \(hex2.red.colorScaleLabel)| = \(redDiff)")
                Text("Green = |\(hex1.green.colorScaleLabel) - \(hex2.green.colorScaleLabel)| = \(greenDiff)")
                Text("Blue = |\(hex1.blue.colorScaleLabel) - \(hex2.blue.colorScaleLabel)| = \(blueDiff)")
                Text("Score: \(String(format: "%.2f", score))")
                    .padding(.top)
                    .bold()
                Divider()
                Text("Scores range from 0 to 100. Higher scores are better. See if you can get a perfect 100!")
            }
        }
        .padding()
    }
}

#Preview {
    ScoreExplanationView()
}
