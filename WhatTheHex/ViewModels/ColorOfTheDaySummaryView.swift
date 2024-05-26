//
//  ColorOfTheDaySummaryView.swift
//  WhatTheHex
//
//  Created by Tyler Lawrence1 on 5/24/24.
//

import SwiftUI

struct ColorOfTheDaySummaryView: View {
    
    // TODO: get game center rank
    
    let submission: Submission
    
    var accuracyLabel: String {
        String(format: "%.2f", submission.accuracy)
    }
    
    var squaresView: RotatingView<some View> {
        RotatingView(portraitOrientation: .horizontal){
            Group{
                ColorSquareView(
                    title: "Target",
                    hexcode: submission.target,
                    showingCode: false
                )
                ColorSquareView(
                    title: "Your guess",
                    hexcode: submission.playerGuess,
                    showingCode: false
                )
            }
        }
    }
    
    var detailsView: some View {
        VStack(alignment: .trailing){
            Text("Target: \(submission.target.display)")
            Text("Your guess: \(submission.playerGuess.display)")
            Text("Accuracy: \(accuracyLabel)")
        }
        .font(.title)
    }
    
    var body: some View {
        
        GeometryReader{ geo in
            if geo.size.height > geo.size.width {
                VStack{
                    squaresView.original
                    detailsView
                }
                .padding()
            } else {
                HStack{
                    squaresView.rotated
                    detailsView
                }
                .padding()
            }
        }
    }
}

#Preview {
    ColorOfTheDaySummaryView(submission: Submission.sampleToday)
}
