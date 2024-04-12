//
//  Int+toHexadecimal.swift
//  WhatTheHex
//
//  Created by Tyler Lawrence1 on 4/11/24.
//

import Foundation

extension Int {
    func toHexadecimalString() -> String? {
        guard self >= 0 else { return nil }
        return String(self, radix: 16).uppercased()
    }
}
