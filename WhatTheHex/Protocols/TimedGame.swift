//
//  TimedGame.swift
//  WhatTheHex
//
//  Created by Tyler Lawrence1 on 4/6/24.
//

import Foundation
import Combine

protocol TimedGame {
    var timer: Timer.TimerPublisher { get set }
    var timerSubscription: Cancellable? { get set }
    var gameTimeMax: Int { get }
    var timeRemaining: Int { get set }
}
