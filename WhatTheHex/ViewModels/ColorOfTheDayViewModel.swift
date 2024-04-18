//
//  ColorOfTheDayViewModel.swift
//  WhatTheHex
//
//  Created by Tyler Lawrence1 on 4/10/24.
//

import Foundation

/// When testing, make sure you are signed into iCloud on the simulator

@Observable
class ColorOfTheDayViewModel: AccuracyGameViewModel {
    
    private let service: ColorOfDayService
    var completedColorOfTheDay = false
    var datesCompletedColorOfDay: [Date] = []
    
    var colorOfTheDayStreak: Int {
        datesCompletedColorOfDay.streakCount()
    }
    var lastRefresh: Date = Date.now
    
    private var calendar = Calendar(identifier: .gregorian)
    
    private func toDate() -> DateComponents {
        calendar.dateComponents([.year, .month, .day], from: lastRefresh)
    }
    
    /// check to see if we need to refresh the colorOfTheDay
    func refresh() {
        let lastMidnight: Date = calendar.startOfDay(for: Date.now)
        if lastRefresh < lastMidnight {
            completedColorOfTheDay = false
        }
        lastRefresh = Date.now
    }
    
    init(service: ColorOfDayService) {
        self.service = service
        super.init()
        refresh()
    }
    
    func getHexcodeOfDay() async -> Hexcode? {
        
        do {
            let colorOfTheDay: String = try await service.fetchColorOfDay(for: NSDate())
            guard let hexcode = Hexcode(from: colorOfTheDay) else { return nil}
            targetHexcode = hexcode
            return hexcode
        } catch {
            print("\(error.localizedDescription)")
        }
        
        return nil
    }
    
    override func submitGuess() {
        completedColorOfTheDay = true
        gameOver = true
        datesCompletedColorOfDay.append(Date.now)
    }
}

#if DEBUG
extension ColorOfTheDayViewModel {
    static var sample = ColorOfTheDayViewModel(service: CloudKitService())
}
#endif
