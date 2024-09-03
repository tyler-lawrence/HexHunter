//
//  CloudKitService.swift
//  WhatTheHex
//
//  Created by Tyler Lawrence1 on 4/15/24.
//

import Foundation
import CloudKit

class CloudKitService {
    let container: CKContainer = CKContainer(identifier: "iCloud.hexhunter")
    let database: CKDatabase
    init() {
        self.database = container.publicCloudDatabase
    }
}

extension CloudKitService: ColorOfDayService {
    typealias QueryResult = (
        matchResults: [(CKRecord.ID, Result<CKRecord, any Error>)],
        queryCursor: CKQueryOperation.Cursor?
    )
    /// try to get the color of the day stored in CloudKit .
    /// - Parameter date: default: current datetime in UTC
    /// - Returns: string representation of hexcode (ex: #FF00FF)
    func fetchColorOfDay(for date: NSDate = NSDate()) async throws -> String {
        // get all days where Date < date (default is current datetime)
        let dateInPast = NSPredicate(format: "Date <= %@", date)
        let query = CKQuery(recordType: "HexOfTheDay", predicate: dateInPast)
        // sorts so the most recent date should be first
        query.sortDescriptors = [NSSortDescriptor(key: "Date", ascending: false)]
        let fetchedRecords: QueryResult = try await database.records(matching: query)
        guard let firstRecord = fetchedRecords.matchResults.first else { throw CKError.noRecords }
        let record: CKRecord = try firstRecord.1.get()
        guard let hexcode: String = record.value(forKey: "Hexcode") as? String else { throw CKError.invalidKey }
        return hexcode
    }
}
