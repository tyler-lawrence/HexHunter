//
//  SliderComponentTip.swift
//  WhatTheHex
//
//  Created by Tyler Lawrence1 on 5/3/24.
//

import Foundation
import TipKit

struct SliderComponentTip: Tip {
    var title: Text = Text("Changing the color components")
    
    var message: Text? = Text("The top slider controls large change. The bottom slider controls finer detail")
    
}
