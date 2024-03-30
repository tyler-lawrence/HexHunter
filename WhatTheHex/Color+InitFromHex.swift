//
//  Color+InitFromHex.swift
//  WhatTheHex
//
//  Created by Tyler Lawrence1 on 3/30/24.
//

import SwiftUI

extension Color {
    init(_ hex: Hexcode){
        self.init(
            red: hex.red.toColorScale(),
            green: hex.green.toColorScale(),
            blue: hex.blue.toColorScale()
        )
    }
}
