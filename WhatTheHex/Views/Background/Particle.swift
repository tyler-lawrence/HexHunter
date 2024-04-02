//
//  Particle.swift
//  WhatTheHex
//
//  Created by Tyler Lawrence1 on 4/2/24.
//

import Foundation

class Particle: Identifiable {
    let id = UUID()
    var size = Double.random(in: 100 ... 250)
    
    var x = Double.random(in: -0.1 ... 1.1)
    var y = Double.random(in: -0.25 ... 1.25)
    
    var isMovingDown = Bool.random()
    var isMovingRight = Bool.random()
    
    var speed = Double.random(in: 0.01 ... 0.1)
}
