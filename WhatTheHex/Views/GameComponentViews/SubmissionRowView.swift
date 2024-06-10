//
//  SubmissionRowView.swift
//  WhatTheHex
//
//  Created by Tyler Lawrence1 on 6/10/24.
//

import SwiftUI

struct SubmissionRowView: View {
    let submission: Submission
    var body: some View {
        VStack{
            HStack{
                Text(submission.date.formatted(date: .complete, time: .omitted))
                    .padding(.leading)
                    .padding(.top)
                    .font(.callout)
                Spacer()
            }
            HStack{
                Spacer()
                ColorSquareView(title: nil, hexcode: submission.playerGuess, showingCode: true)
                Text(submission.similarityLabel)
                    .font(.title)
                ColorSquareView(title: nil, hexcode: submission.target, showingCode: true)
                Spacer()
            }
            .padding(.horizontal)
        }
        .background(
            RoundedRectangle(cornerRadius: 25.0)
                .foregroundStyle(Material.bar)
        )
    }
}

#Preview {
    SubmissionRowView(submission: Submission.sampleToday)
}
