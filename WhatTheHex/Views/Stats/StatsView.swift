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
            dataController.colorOfTheDaySubmissions.sorted {$0.date > $1.date}
        case .score:
            dataController.colorOfTheDaySubmissions.sorted {$0.accuracy > $1.accuracy}
        }
    }
    enum SortMethod: String, CaseIterable {
        case date
        case score
        var localizedRawValue: LocalizedStringKey {
            switch self {
            case .date:
                LocalizedStringKey("Date")
            case .score:
                LocalizedStringKey("Score")
            }
        }
    }
    var body: some View {
        VStack {
            VStack(alignment: .trailing) {
                Text("Total games played: \(dataController.totalGamesPlayed)")
                Text("Average score: \(averageScoreLabel)")
            }
            .font(.title2)
            .dynamicTypeSize(...DynamicTypeSize.accessibility1)
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 25.0)
                    .foregroundStyle(Material.bar)
                    .shadow(radius: 10)
            )
            .padding(.bottom)
            Picker("Sort", selection: $submissionSortMethod) {
                ForEach(SortMethod.allCases, id: \.self) { method in
                    Text(method.localizedRawValue)
                }
            }
            .pickerStyle(.segmented)
            Divider()
            ScrollView {
                ForEach(sortedSubmissions) { submission in
                    SubmissionRowView(submission: submission)
                }
            }
        }
        .navigationTitle("Color of the Day Stats")
        .padding()
    }
}

#if DEBUG
#Preview {
    StatsView(dataController: DataController.sample)
}
#endif
