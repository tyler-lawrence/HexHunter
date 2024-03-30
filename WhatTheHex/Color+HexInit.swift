//
//  Color+HexInit.swift
//  WhatTheHex
//
//  Created by Tyler Lawrence1 on 3/29/24.
//

import SwiftUI

extension Color {
    init(_ hex: Hexcode){
        self.init(red: Double(hex.red), green: Double(hex.red), blue: Double(hex.blue))
    }
}
