//
//  Hexcode.swift
//  WhatTheHex
//
//  Created by Tyler Lawrence1 on 3/29/24.
//

struct Hexcode {
    
    var h0: Int = 0
    var h1: Int = 0
    var h2: Int = 0
    var h3: Int = 0
    var h4: Int = 0
    var h5: Int = 0
    
    static let lookup: [Int: String] = [
        0:"0",
        1:"1",
        2:"2",
        3:"3",
        4:"4",
        5:"5",
        6:"6",
        7:"7",
        8:"8",
        9:"9",
        10:"A",
        11:"B",
        12:"C",
        13:"D",
        14:"E",
        15:"F"
    ]
    static var sortedKeys: [Int] = Array(lookup.keys).sorted(by: <)
}
