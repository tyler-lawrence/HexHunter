//
//  Hexcode+InitFromString.swift
//  WhatTheHex
//
//  Created by Tyler Lawrence1 on 4/11/24.
//

import Foundation

extension Hexcode {
    init?(code: String) {
        guard code.count == 6 else { return }
    }
}
