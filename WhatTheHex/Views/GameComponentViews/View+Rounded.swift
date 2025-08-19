//
//  View+Rounded.swift
//  WhatTheHex
//
//  Created by Tyler Lawrence on 8/12/25.
//

import SwiftUI

struct RoundedCorner: ViewModifier {
    let radius: CGFloat

    func body(content: Content) -> some View {
        content
            .clipShape(RoundedRectangle(cornerRadius: radius))
    }
}

extension View {
    func roundedCorner(_ radius: CGFloat = Constants.cornerRadius) -> some View {
        modifier(RoundedCorner(radius: radius))
    }
}
