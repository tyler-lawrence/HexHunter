//
//  Component.swift
//  WhatTheHex
//
//  Created by Tyler Lawrence1 on 3/30/24.
//

struct Component: Hashable {
    let hexCategory: HexCategory
    var v1: Double
    var v2: Double
    
    func toColorScale() -> Double {
        Double((v1 * 16) + v2) / 255
    }
}
