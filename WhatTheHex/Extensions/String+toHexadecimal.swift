//
//  String+toHexadecimal.swift
//  WhatTheHex
//
//  Created by Tyler Lawrence1 on 4/11/24.
//

import Foundation

extension String {
    func toHexadecimal() -> Int? {
        Int(self, radix: 16)
    }
}
