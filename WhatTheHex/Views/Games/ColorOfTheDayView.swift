//
//  ColorOfTheDayView.swift
//  WhatTheHex
//
//  Created by Tyler Lawrence1 on 4/18/24.
//

import SwiftUI

struct ColorOfTheDayView: View {
    @Environment(DataController.self) var dataController
    var body: some View {
        if dataController.completedColorOfTheDay {
            if let submission = dataController.todaySubmission {
                ColorOfTheDaySummaryView(submission: submission)
            }
        } else {
            ColorOfTheDayGameplayView(
                viewModel: ColorOfTheDayViewModel(
                    service: CloudKitService(),
                    dataController: dataController
                )
            )
        }
    }
}

#Preview {
    ColorOfTheDayView()
        .environment(DataController.sample)
}
