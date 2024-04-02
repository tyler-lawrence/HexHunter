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
        abs(hex1.red.colorScaleNormalized() - hex2.red.colorScaleNormalized())
    }
    
    var greenDiff: Double {
        abs(hex1.green.colorScaleNormalized() - hex2.green.colorScaleNormalized())
    }
    
    var blueDiff: Double {
        abs(hex1.blue.colorScaleNormalized() - hex2.blue.colorScaleNormalized())
    }
    
    var score: Double {
        redDiff + greenDiff + blueDiff
    }
    
    var body: some View {
        VStack{
            Text("Scoring")
                .font(.largeTitle)
            HStack{
                ColorSquareView(title: "", hexcode: hex1, showingCode: true)
                ColorSquareView(title: "", hexcode: hex2, showingCode: true)
            }
            ScrollView{
                Text("The score is calculated by measuring the difference between each component. Each component can be handled as a number between 0 and 255.")
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
                Text("Color component values are normalized the values to a scale of 0 to 1 by dividing the component score by 255")
                
                HStack{
                    VStack{
                        Text("Red: \(hex1.red.display) = \(hex1.red.normalizedLabel)")
                        Text("Green: \(hex1.green.display) = \(hex1.green.normalizedLabel)")
                        Text("Blue: \(hex1.blue.display) = \(hex1.blue.normalizedLabel)")
                    }
                    Divider()
                    VStack{
                        Text("Red: \(hex2.red.display) = \(hex2.red.normalizedLabel)")
                        Text("Green: \(hex2.green.display) = \(hex2.green.normalizedLabel)")
                        Text("Blue: \(hex2.blue.display) = \(hex2.blue.normalizedLabel)")
                    }
                }
                Divider()
                Text("then we sum the absolute difference across same colors.")
                Text("Red = |\(hex1.red.normalizedLabel) - \(hex2.red.normalizedLabel)| = \(redDiff)")
                Text("Green = |\(hex1.green.normalizedLabel) - \(hex2.green.normalizedLabel)| = \(greenDiff)")
                Text("Blue = |\(hex1.blue.normalizedLabel) - \(hex2.blue.normalizedLabel)| = \(blueDiff)")
                Text("Score: \(String(format: "%.2f", score))")
                    .padding(.top)
                    .bold()
                Text("Scores range from 0 to 3. Lower scores are better!")                
            }
        }
        .padding()
    }
}

#Preview {
    ScoreExplanationView()
}
