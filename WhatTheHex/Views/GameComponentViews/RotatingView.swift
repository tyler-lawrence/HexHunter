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
        
        var flipped : Orientation {
            switch self {
            case .horizontal:
                    .vertical
            case .vertical:
                    .horizontal
            }
        }
    }
    
    var content: Content
    var originalOrientation: Orientation
    
    var original: some View {
        Group{
            switch originalOrientation {
            case .horizontal:
                HStack{content}
            case .vertical:
                VStack{content}
            }
        }
    }
    
    var flipped: some View {
        Group{
            switch originalOrientation {
            case .horizontal:
                VStack{content}
            case .vertical:
                HStack{content}
            }
        }
    }
        
}
