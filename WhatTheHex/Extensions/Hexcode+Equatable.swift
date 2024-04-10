//
//  Hexcode+Equatable.swift
//  WhatTheHex
//
//  Created by Tyler Lawrence1 on 4/9/24.
//

import Foundation

extension Hexcode: Equatable {
    static func == (lhs: Hexcode, rhs: Hexcode) -> Bool {
        (lhs.red.toColorScale() == rhs.red.toColorScale()) &&
        (lhs.green.toColorScale() == rhs.green.toColorScale()) &&
        (lhs.blue.toColorScale() == rhs.blue.toColorScale())
    }
}
