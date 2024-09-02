//
//  String+ValidHexadecimal.swift
//  WhatTheHex
//
//  Created by Tyler Lawrence1 on 4/12/24.
//

import Foundation
import RegexBuilder

extension String {
    func isValidHexcode() -> Bool {
        let hexcodePattern = Regex {
            "#"
            Repeat(count: 6) {
                CharacterClass(
                    ("0" ... "9"),
                    ("A" ... "F"),
                    ("a" ... "f")
                )
            }
        }
        guard self.firstMatch(of: hexcodePattern) != nil else { return false }
        return true
    }
}
