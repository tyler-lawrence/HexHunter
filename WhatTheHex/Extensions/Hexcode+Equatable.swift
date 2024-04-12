//
//  Hexcode+Equatable.swift
//  WhatTheHex
//
//  Created by Tyler Lawrence1 on 4/9/24.
//

import Foundation

extension Hexcode: Equatable {
    static func == (lhs: Hexcode, rhs: Hexcode) -> Bool {
        (lhs.red == rhs.red) &&
        (lhs.green == rhs.green) &&
        (lhs.blue == rhs.blue)
    }
}
