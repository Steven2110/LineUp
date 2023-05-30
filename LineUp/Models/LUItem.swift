//
//  LUItem.swift
//  LineUp
//
//  Created by Steven Wijaya on 24.02.2023.
//

import CloudKit


struct LUItem: Identifiable {
    let id: UUID = UUID()
//    let ckRecordId: CKRecord.ID
    var name: String
    var labelIcon: String
    var isCompletes: [Complete] = [Complete]()
    var reminderDay: [DayOfTheWeek] = [DayOfTheWeek]()
    
    static let kName = "name"
    static let kLabelIcon = "labelIcon"
    static let kIsCompletes = "isCompletes"
    static let kReminderDay = "reminderDay"
    
    init(name: String, labelIcon: String, reminderDay: [DayOfTheWeek]) {
        self.name = name
        self.labelIcon = labelIcon
        self.reminderDay = reminderDay
        for day in reminderDay {
            isCompletes.append(Complete(day: day))
        }
    }
    
    init(record: CKRecord) {
//        ckRecordId = record.recordID
        name = record[LUItem.kName] as? String ?? "N/A"
        labelIcon = record[LUItem.kLabelIcon] as? String ?? "N/A"
//        isCompletes = record[LUItem.kIsCompletes] as? String ?? "N/A"
    }
    
    init(name: String, labelIcon: String, isCompletes: [Bool], reminderDay: [DayOfTheWeek]) {
        self.name = name
        self.labelIcon = labelIcon
        self.reminderDay = reminderDay
        for (i, day) in reminderDay.enumerated() {
            let complete = Complete(day: day, isComplete: isCompletes[i])
            self.isCompletes.append(complete)
        }
    }
    
    struct Complete {
        var day: DayOfTheWeek
        var isComplete: Bool = false
    }
    
    func getStatus(day: DayOfTheWeek) -> Bool {
        let dayInt = reminderDay.firstIndex(of: day)!
        return isCompletes[dayInt].isComplete
    }
    
    mutating func updateStatus(day: DayOfTheWeek) {
        let dayInt = reminderDay.firstIndex(of: day)!
        isCompletes[dayInt].isComplete.toggle()
    }
    
    mutating func resetCompletes() {
        for (index, _) in isCompletes.enumerated() {
            isCompletes[index].isComplete = false
        }
    }
}

