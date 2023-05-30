//
//  DayOfTheWeek.swift
//  LineUp
//
//  Created by Steven Wijaya on 24.02.2023.
//

import Foundation
import CloudKit

struct DayOfTheWeek: Identifiable, Equatable {
    let id: CKRecord.ID
    let shortValue: String
    let rawValue: String
    
    init(record: CKRecord) {
        id = record.recordID
        shortValue = record[DayOfTheWeek.kShortValue] as? String ?? "N/A"
        rawValue = record[DayOfTheWeek.kRawValue] as? String ?? "N/A"
    }
    
    init(id: CKRecord.ID, shortValue: String, rawValue: String) {
        self.id = id
        self.shortValue = shortValue
        self.rawValue = rawValue
    }
    
    static let kShortValue: String = "shortValue"
    static let kRawValue: String = "rawValue"
    
    static let daysOfTheWeek: [DayOfTheWeek] = [
        DayOfTheWeek(id: CKRecord.ID(recordName: "Monday"), shortValue: "Mo",rawValue: "Monday"),
        DayOfTheWeek(id: CKRecord.ID(recordName: "Tuesday"), shortValue: "Tu",rawValue: "Tuesday"),
        DayOfTheWeek(id: CKRecord.ID(recordName: "Wednesday"), shortValue: "We",rawValue: "Wednesday"),
        DayOfTheWeek(id: CKRecord.ID(recordName: "Thursday"), shortValue: "Th",rawValue: "Thursday"),
        DayOfTheWeek(id: CKRecord.ID(recordName: "Friday"), shortValue: "Fr",rawValue: "Friday"),
        DayOfTheWeek(id: CKRecord.ID(recordName: "Saturday"), shortValue: "Sa",rawValue: "Saturday"),
        DayOfTheWeek(id: CKRecord.ID(recordName: "Sunday"), shortValue: "Su",rawValue: "Sunday")
    ]
}
