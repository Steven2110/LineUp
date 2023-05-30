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

enum RecordType {
    static let item = "LUItem"
    static let dayOfTheWeek = "LUDayOfTheWeek"
    static let complete = "LUComplete"
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
