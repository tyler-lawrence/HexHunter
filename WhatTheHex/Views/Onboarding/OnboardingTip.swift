//
//  OnboardingTip.swift
//  WhatTheHex
//
//  Created by Tyler Lawrence1 on 4/9/24.
//

import Foundation
import TipKit

struct OnboardingTip: Tip {
    var title: Text {
        Text("Move the slider to increase or decrease the amount of color present")
    }
    
    var message: Text? {
        Text("R adjusts the red component, G adjusts the green component, and B adjusts the blue component.")
    }
}
