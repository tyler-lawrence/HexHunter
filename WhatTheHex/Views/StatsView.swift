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
    
    @State var submissionSortMethod: SortMethod = .date
    
    var sortedSubmissions: [Submission] {
        switch submissionSortMethod {
        case .date:
            dataController.colorOfTheDaySubmissions.sorted{$0.date > $1.date}
        case .score:
            dataController.colorOfTheDaySubmissions.sorted{ $0.accuracy > $1.accuracy }
        }
    }
    
    enum SortMethod: String, CaseIterable {
        case date = "Date"
        case score = "Score"
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
            Picker("Sort", selection: $submissionSortMethod){
                ForEach(SortMethod.allCases, id: \.self){ method in
                    Text(method.rawValue)
                }
            }
            .pickerStyle(.segmented)
            Divider()
            ScrollView{
                ForEach(sortedSubmissions, content: SubmissionRowView.init)
            }
        }
        .padding()
    }
}

#Preview {
    StatsView(dataController: DataController.sample)
}
