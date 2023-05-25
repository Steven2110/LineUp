//
//  Constants.swift
//  LineUp
//
//  Created by Steven Wijaya on 19.05.2023.
//

import Foundation

let mockupList: [LUItem] = [
    LUItem(
        name: "List 1",
        labelIcon: "😆",
        isCompletes: [true, true, false],
        reminderDay: [
            DayOfTheWeek.daysOfTheWeek[0],
            DayOfTheWeek.daysOfTheWeek[2],
            DayOfTheWeek.daysOfTheWeek[5]
        ]
    ),
    LUItem(
        name: "List 2",
        labelIcon: "😎",
        isCompletes: [true, false, true, true],
        reminderDay: [
            DayOfTheWeek.daysOfTheWeek[0],
            DayOfTheWeek.daysOfTheWeek[2],
            DayOfTheWeek.daysOfTheWeek[3],
            DayOfTheWeek.daysOfTheWeek[4]
        ]
    ),
    LUItem(
        name: "Crazy list 3",
        labelIcon: "🤬",
        reminderDay: [
            DayOfTheWeek.daysOfTheWeek[0],
            DayOfTheWeek.daysOfTheWeek[1],
            DayOfTheWeek.daysOfTheWeek[3],
            DayOfTheWeek.daysOfTheWeek[6]
        ]
    )
]

var mondayList: [LUItem] {
    mockupList.filter{ $0.reminderDay.contains(DayOfTheWeek.daysOfTheWeek[0])}
}
var tuesdayList: [LUItem] {
    mockupList.filter{ $0.reminderDay.contains(DayOfTheWeek.daysOfTheWeek[1])}
}
var wednesdayList: [LUItem] {
    mockupList.filter{ $0.reminderDay.contains(DayOfTheWeek.daysOfTheWeek[2])}
}
var thursdayList: [LUItem] {
    mockupList.filter{ $0.reminderDay.contains(DayOfTheWeek.daysOfTheWeek[3])}
}
var fridayList: [LUItem] {
    mockupList.filter{ $0.reminderDay.contains(DayOfTheWeek.daysOfTheWeek[4])}
}
var saturdayList: [LUItem] {
    mockupList.filter{ $0.reminderDay.contains(DayOfTheWeek.daysOfTheWeek[5])}
}
var sundayList: [LUItem] {
    mockupList.filter{ $0.reminderDay.contains(DayOfTheWeek.daysOfTheWeek[6])}
}
var weeksList: [[LUItem]] {
    [mondayList, tuesdayList, wednesdayList, thursdayList, fridayList, saturdayList, sundayList]
}

enum CalendarViewType: CaseIterable, Identifiable, CustomStringConvertible {
    case weekly
    case daily
    
    var id: Self { self }
    
    var description: String {
        switch self {
        case .weekly:
            return "Weekly"
        case .daily:
            return "Daily"
        }
    }
}
