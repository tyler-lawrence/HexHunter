//
//  OnboardingRowView.swift
//  WhatTheHex
//
//  Created by Tyler Lawrence1 on 4/2/24.
//

import SwiftUI

struct OnboardingRowView: View {
    let systemImage: String
    let title: String
    let description: String
    let cornerRadius: CGFloat = 20
    var body: some View {
        ZStack{
            BackgroundView()
                .ignoresSafeArea()
            HStack{
                Image(systemName: systemImage)
                    .padding(.trailing, 10)
                    .font(.largeTitle)
                VStack(alignment: .leading){
                    Text(title)
                        .font(.title2)
                        .bold()
                        .offset(x: -5)
                    Text(description)
                }
            }
        }
    }
}

#Preview {
    OnboardingRowView(systemImage: "doc.questionmark", title: "How to play", description: "these are the rules")
}
