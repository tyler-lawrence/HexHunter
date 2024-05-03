//
//  ComponentSliderTip.swift
//  WhatTheHex
//
//  Created by Tyler Lawrence1 on 5/3/24.
//

import Foundation
import TipKit

struct ComponentSliderTip: Tip {
    
    let component: Component
    
    var title: Text {
        Text("These sliders control the amount of \(component.hexCategory.rawValue)")
    }
    
    var description: Text {
        Text("The first one controls large scale changes. The second controls small scale changes.")
    }
}
