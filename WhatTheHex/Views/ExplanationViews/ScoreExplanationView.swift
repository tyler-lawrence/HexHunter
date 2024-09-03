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
    var redDiff: Double {
        Double(abs(hex1.red.toColorScale() - hex2.red.toColorScale()))
    }
    var redDiffLabel: String {
        String(format: "%.0f", redDiff)
    }
    var redSimilarityMeasure: String {
        String(format: "%.2f", redDiff / 255)
    }
    var greenDiff: Double {
        Double(abs(hex1.green.toColorScale() - hex2.green.toColorScale()))
    }
    var greenDiffLabel: String {
        String(format: "%.0f", greenDiff)
    }
    var greenSimilarityMeasure: String {
        String(format: "%.2f", greenDiff / 255)
    }
    var blueDiff: Double {
        Double(abs(hex1.blue.toColorScale() - hex2.blue.toColorScale()))
    }
    var blueDiffLabel: String {
        String(format: "%.0f", blueDiff)
    }
    var blueSimilarityMeasure: String {
        String(format: "%.2f", blueDiff / 255)
    }
    var score: Double {
        hex1.calculateSimilarity(to: hex2)
    }
    var introMessage: String =
    """
    Scores are calculated by measuring the difference between each component. \
    Each component (red, green, and blue) can be handled as a number between 0 and 255.
    """
    var summaryMessage: String =
    """
    Finally, we take the average of the three similarity\
    measures and multiply that by 100 to calculate our final score
    """
    var body: some View {
        VStack {
            HStack {
                ColorSquareView(title: "", hexcode: hex1, showingCode: true)
                ColorSquareView(title: "", hexcode: hex2, showingCode: true)
            }
            Divider()
            ScrollView {
                Text(introMessage)
                HStack {
                    VStack {
                        Text("Red: \(hex1.red.display) = \(hex1.red.colorScaleLabel)")
                        Text("Green: \(hex1.green.display) = \(hex1.green.colorScaleLabel)")
                        Text("Blue: \(hex1.blue.display) = \(hex1.blue.colorScaleLabel)")
                    }
                    Divider()
                    VStack {
                        Text("Red: \(hex2.red.display) = \(hex2.red.colorScaleLabel)")
                        Text("Green: \(hex2.green.display) = \(hex2.green.colorScaleLabel)")
                        Text("Blue: \(hex2.blue.display) = \(hex2.blue.colorScaleLabel)")
                    }
                }
                Divider()
                Text("To calculate the score we take the absolute difference of each component.")
                Text("Red = |\(hex1.red.colorScaleLabel) - \(hex2.red.colorScaleLabel)| = \(redDiffLabel)")
                Text("Green = |\(hex1.green.colorScaleLabel) - \(hex2.green.colorScaleLabel)| = \(greenDiffLabel)")
                Text("Blue = |\(hex1.blue.colorScaleLabel) - \(hex2.blue.colorScaleLabel)| = \(blueDiffLabel)")
                Divider()
                Text("Then we divide those differences by 255 to get a similarity measure.")
                Text("Red = \(redDiffLabel) / 255 = \(redSimilarityMeasure)")
                Text("Green = \(greenDiffLabel) / 255 = \(greenSimilarityMeasure)")
                Text("Blue = \(blueDiffLabel) / 255 = \(blueSimilarityMeasure)")
                Divider()
                Text(summaryMessage)
                Text("(\(redSimilarityMeasure) + \(greenSimilarityMeasure) + \(blueSimilarityMeasure)) / 3 * 100")
                Text("Score: \(String(format: "%.0f", score))")
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
