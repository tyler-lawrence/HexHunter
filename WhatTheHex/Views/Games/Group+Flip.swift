//
//  Group+Flip.swift
//  WhatTheHex
//
//  Created by Tyler Lawrence1 on 5/7/24.
//

import SwiftUI

extension Group {
    enum Direction {
        case horizontal
        case vertical
        
        var flipped: Direction {
            switch self{
            case .horizontal:
                    .vertical
            case .vertical:
                    .horizontal
            }
        }
    }
    
}
