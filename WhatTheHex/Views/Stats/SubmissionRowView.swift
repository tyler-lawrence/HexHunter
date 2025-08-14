//
//  SubmissionRowView.swift
//  WhatTheHex
//
//  Created by Tyler Lawrence1 on 6/10/24.
//

import SwiftUI

struct SubmissionRowView: View {
    @Environment(\.dynamicTypeSize) var dynamicTypeSize
    let submission: Submission
    var dateLabel: some View {
        ViewThatFits {
            Text(submission.date.formatted(date: .complete, time: .omitted))
            Text(submission.date.formatted(date: .numeric, time: .omitted))
        }
    }
    var squares: some View {
        HStack(spacing: 0) {
            ColorSquareView(title: "Target", hexcode: submission.target, showingCode: true)
            ColorSquareView(title: "Your guess", hexcode: submission.playerGuess, showingCode: true)
        }
        .frame(height: 150)
        .roundedCorner()
        .padding(.horizontal)
    }
    var scoreLabel: some View {
        Text("\(submission.similarityLabel)%")
            .lineLimit(1)
            .font(.title)
            .dynamicTypeSize(...DynamicTypeSize.accessibility2)
    }
    var body: some View {
        VStack {
            HStack {
                dateLabel
                    .padding(.leading)
                    .padding(.top)
                    .font(.callout)
                Spacer()
            }
            if dynamicTypeSize.isAccessibilitySize {
                HStack {
                    squares
                    scoreLabel
                }.padding(.horizontal)
            } else {
                VStack {
                    squares
                    scoreLabel
                }
            }
        }
        .background(
            Rectangle()
                .roundedCorner()
                .foregroundStyle(Material.bar)
        )
    }
}

#if DEBUG
#Preview {
    ScrollView {
        ForEach(1..<10) { _ in
            SubmissionRowView(submission: Submission.sampleToday)
        }
    }
}
#endif
