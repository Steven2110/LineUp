//
//  LUItemViewModel.swift
//  LineUp
//
//  Created by Steven Wijaya on 25.05.2023.
//

import Foundation
import CloudKit

final class LUItemViewModel: ObservableObject {
    
    @Published var listLU: [LUItem]
    @Published var dayOfTheWeek: [DayOfTheWeek]?
    
    
    var weeklyList: [[LUItem]] {
        generateWeeklyList()
    }
    var todayList: [LUItem] {
        listLU.filter{ $0.reminderDay.contains(currDateOfTheWeek) }
    }
    
    private var currDateOfTheWeek: DayOfTheWeek = DayOfTheWeek.daysOfTheWeek[0]
    
    init() {
        listLU = mockupList
        currDateOfTheWeek = DayOfTheWeek.daysOfTheWeek[getTodayDateInt()]
    }
    
    func generateWeeklyList() -> [[LUItem]] {
        var lMondayList: [LUItem] {
            listLU.filter{ $0.reminderDay.contains(DayOfTheWeek.daysOfTheWeek[0]) }
        }
        var lTuesdayList: [LUItem] {
            listLU.filter{ $0.reminderDay.contains(DayOfTheWeek.daysOfTheWeek[1]) }
        }
        var lWednesdayList: [LUItem] {
            listLU.filter{ $0.reminderDay.contains(DayOfTheWeek.daysOfTheWeek[2]) }
        }
        var lThursdayList: [LUItem] {
            listLU.filter{ $0.reminderDay.contains(DayOfTheWeek.daysOfTheWeek[3]) }
        }
        var lFridayList: [LUItem] {
            listLU.filter{ $0.reminderDay.contains(DayOfTheWeek.daysOfTheWeek[4]) }
        }
        var lSaturdayList: [LUItem] {
            listLU.filter{ $0.reminderDay.contains(DayOfTheWeek.daysOfTheWeek[5]) }
        }
        var lSundayList: [LUItem] {
            listLU.filter{ $0.reminderDay.contains(DayOfTheWeek.daysOfTheWeek[6]) }
        }
        
        return [lMondayList, lTuesdayList, lWednesdayList, lThursdayList, lFridayList, lSaturdayList, lSundayList]
    }
    
    func getTodayList(_ day: DayOfTheWeek) -> [LUItem] {
        listLU.filter{ $0.reminderDay.contains(day) }
    }
    
    func updateStatus(forItem item: LUItem) {
        let indexOfItem: Int = listLU.firstIndex{ $0.id == item.id }!
        listLU[indexOfItem].updateStatus(day: currDateOfTheWeek)
    }
    
    func addItem(_ item: LUItem) {
        guard dayOfTheWeek != nil else {
            print("ERROR FETCHING DAY OF THE WEEK")
            return
        }
        
        var selectedDayString = [String]()
        for day in item.reminderDay {
            selectedDayString.append(day.rawValue)
        }
        
        // Create CKRecord
        let LURecord = CKRecord(recordType: RecordType.item)
        
        LURecord[LUItem.kName] = item.name
        LURecord[LUItem.kLabelIcon] = item.labelIcon
        
        var reminderDayReferences: [CKRecord.Reference] = [CKRecord.Reference]()

        for reminderDay in dayOfTheWeek! {
            if selectedDayString.contains(reminderDay.rawValue) {
                reminderDayReferences.append(CKRecord.Reference(recordID: reminderDay.id, action: .deleteSelf))
            }
        }

        LURecord[LUItem.kReminderDay] = reminderDayReferences
        
        CloudKitManager.shared.saveRecord(LURecord)
        
        DispatchQueue.main.async {
            self.listLU.append(item)
        }
    }
}
