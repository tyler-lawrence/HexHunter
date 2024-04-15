//
//  Component+Equatable.swift
//  WhatTheHex
//
//  Created by Tyler Lawrence1 on 4/12/24.
//

import Foundation

extension Component: Equatable {
    static func == (lhs: Component, rhs: Component) -> Bool {
        (lhs.digit1 == rhs.digit1) && 
        (lhs.digit2 == rhs.digit2) &&
        (lhs.hexCategory == rhs.hexCategory)
    }
}
