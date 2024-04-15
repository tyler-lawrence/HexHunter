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
    
    func fetchColorOfDay(for date: NSDate = NSDate()) async throws -> String {
        
        let predicate = NSPredicate(format: "Date <= %@", date)
        let query = CKQuery(recordType: "HexOfTheDay", predicate: predicate)
        
        let fetchedRecords: (matchResults: [(CKRecord.ID, Result<CKRecord, any Error>)], queryCursor: CKQueryOperation.Cursor?) = try await database.records(matching: query)
     
        guard let firstRecord = fetchedRecords.matchResults.first else { throw CKError.noRecords }
        
        let record: CKRecord = try firstRecord.1.get()
        guard let hexcode: String = record.value(forKey: "Hexcode") as? String else { throw CKError.invalidKey }
        
        return hexcode

    }
}
