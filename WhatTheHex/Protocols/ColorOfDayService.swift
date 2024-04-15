//
//  Service.swift
//  WhatTheHex
//
//  Created by Tyler Lawrence1 on 4/11/24.
//

import Foundation

protocol ColorOfDayService {
    func fetchColorOfDay(for date: NSDate) async throws ->  String
}
