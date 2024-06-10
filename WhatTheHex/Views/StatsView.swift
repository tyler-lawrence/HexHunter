//
//  StatsView.swift
//  WhatTheHex
//
//  Created by Tyler Lawrence1 on 6/10/24.
//

import SwiftUI

struct StatsView: View {
    let dataController: DataController
    var averageScoreLabel: String {
        dataController.averageScore.formatted(.number.precision(.significantDigits(4)))
    }
    
    
    var body: some View {
        VStack{
            Text("COLOR OF THE DAY")
                .foregroundStyle(
                    LinearGradient(
                        colors: [
                            .red,
                            .orange,
                            .yellow,
                            .green,
                            .indigo,
                            .purple
                        ],
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )
                .font(.largeTitle)
                .bold()
            VStack{
                Text("Total games played: \(dataController.totalGamesPlayed)")
                Text("Average score: \(averageScoreLabel)")
            }
            .font(.title2)
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 25.0)
                    .foregroundStyle(Material.bar)
            )
            Divider()
            ScrollView{
                ForEach(dataController.colorOfTheDaySubmissions, content: SubmissionRowView.init)
            }
        }
    }
}

#Preview {
    StatsView(dataController: DataController.sample)
}
