//
//  LUDailyList.swift
//  LineUp
//
//  Created by Steven Wijaya on 20.05.2023.
//

import SwiftUI

struct LUDailyList: View {
    
    var dailyList: [LUItem]
    var currentDay: DayOfTheWeek
    
    var body: some View {
        List(dailyList) { list in
            LURowView(luItem: list, currDay: currentDay)
        }
    }
}

struct LUDailyList_Previews: PreviewProvider {
    static var previews: some View {
        LUDailyList(
            dailyList: [
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
                                labelIcon: "😆",
                                isCompletes: [true, false, false],
                                reminderDay: [
                                    DayOfTheWeek.daysOfTheWeek[0],
                                    DayOfTheWeek.daysOfTheWeek[2],
                                    DayOfTheWeek.daysOfTheWeek[5]
                                ]
                            )
            ],
            currentDay: DayOfTheWeek.daysOfTheWeek[0]
        )
    }
}
