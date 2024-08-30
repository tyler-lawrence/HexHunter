//
//  gameDetails.swift
//  WhatTheHex
//
//  Created by Tyler Lawrence1 on 5/7/24.
//

import SwiftUI

struct RotatingView<Content: View> {
    enum Orientation {
        case horizontal
        case vertical
        var flipped: Orientation {
            switch self {
            case .horizontal:
                .vertical
            case .vertical:
                .horizontal
            }
        }
    }
    var portraitOrientation: Orientation
    var content: () -> Content
    init(portraitOrientation: Orientation, content: @escaping () -> Content) {
        self.portraitOrientation = portraitOrientation
        self.content = content
    }
    var original: some View {
        Group {
            switch portraitOrientation {
            case .horizontal:
                HStack {content()}
            case .vertical:
                VStack {content()}
            }
        }
    }
    var rotated: some View {
        Group {
            switch portraitOrientation {
            case .horizontal:
                VStack {content()}
            case .vertical:
                HStack {content()}
            }
        }
    }
}
