//
//  CloudKitManager.swift
//  LineUp
//
//  Created by Steven Wijaya on 26.05.2023.
//

import CloudKit

final class CloudKitManager {
    
    static let shared = CloudKitManager()
    
    private init() { }
    
 
    private let container: CKContainer = CKContainer.default()
    
    func fetchLUItem() async -> [CKRecord] {
        let predicate = NSPredicate(value: true)
        let query = CKQuery(recordType: RecordType.item, predicate: predicate)
        var records: [CKRecord] = [CKRecord]()
        
        do {
            let returnedRecord = try await container.privateCloudDatabase.records(matching: query)
            for eachRecord in returnedRecord.matchResults {
                switch eachRecord.1 {
                case .success(let record):
                    records.append(record)
                case .failure(let error):
                    print("Error: \(error.localizedDescription)")
                }
            }
            return records
        } catch {
            return records
        }
    }
    
    func saveRecord(_ record: CKRecord) {
        container.privateCloudDatabase.save(record) { returnedRecord, returnedError in
            print("Record: \(String(describing: returnedRecord))")
            print("Error: \(String(describing: returnedError))")
        }
    }
    
    func fetchReminderDateData() async -> [DayOfTheWeek] {
        let predicate = NSPredicate(value: true)
        let query = CKQuery(recordType: RecordType.dayOfTheWeek, predicate: predicate)
        var records: [DayOfTheWeek] = [DayOfTheWeek]()
        
        do {
            let record = try await container.publicCloudDatabase.records(matching: query)
            print("THIS RECORD: \(record)")
            print(type(of: record))
            print("Type of matchResults: \(type(of: record.matchResults))")
            for eachRecord in record.matchResults {
                switch eachRecord.1 {
                case .success(let record):
                    records.append(DayOfTheWeek(record: record))
                case .failure(let error):
                    print("Error: \(error.localizedDescription)")
                }
            }
            return records
        } catch {
            return records
        }
    }
    
    
}
