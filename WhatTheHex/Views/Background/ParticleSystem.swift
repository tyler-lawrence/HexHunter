//
//  ParticleSystem.swift
//  WhatTheHex
//
//  Created by Tyler Lawrence1 on 4/2/24.
//

import Foundation

class ParticleSystem {
    let particles: [Particle]
    var lastUpdate = Date.now.timeIntervalSinceReferenceDate
    func update(date: TimeInterval) {
        let delta = date - lastUpdate
        lastUpdate = date
        for particle in particles {
            if particle.isMovingDown {
                particle.yPosition += particle.speed * delta
                if particle.yPosition > 1.25 {
                    particle.isMovingDown = false
                }
            } else {
                particle.yPosition -= particle.speed * delta
                if particle.yPosition < -0.25 {
                    particle.isMovingDown = true
                }
            }
            if particle.isMovingRight {
                particle.xPosition += particle.speed * delta
                if particle.xPosition > 1.25 {
                    particle.isMovingRight = false
                }
            } else {
                particle.xPosition -= particle.speed * delta
                if particle.xPosition < -1.25 {
                    particle.isMovingRight = true
                }
            }
        }
    }
    init(count: Int) {
        particles = (0..<count).map { _ in Particle() }
    }
}
