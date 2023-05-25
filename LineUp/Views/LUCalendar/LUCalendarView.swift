//
//  LUCalendarView.swift
//  LineUp
//
//  Created by Steven Wijaya on 19.05.2023.
//

import SwiftUI

struct LUCalendarView: View {
    
    @State private var selection: CalendarViewType = .weekly
    
    private var mondayList: [LUItem] {
        mockupList.filter{ $0.reminderDay.contains(DayOfTheWeek.daysOfTheWeek[0])}
    }
    private var tuesdayList: [LUItem] {
        mockupList.filter{ $0.reminderDay.contains(DayOfTheWeek.daysOfTheWeek[1])}
    }
    private var wednesdayList: [LUItem] {
        mockupList.filter{ $0.reminderDay.contains(DayOfTheWeek.daysOfTheWeek[2])}
    }
    private var thursdayList: [LUItem] {
        mockupList.filter{ $0.reminderDay.contains(DayOfTheWeek.daysOfTheWeek[3])}
    }
    private var fridayList: [LUItem] {
        mockupList.filter{ $0.reminderDay.contains(DayOfTheWeek.daysOfTheWeek[4])}
    }
    private var saturdayList: [LUItem] {
        mockupList.filter{ $0.reminderDay.contains(DayOfTheWeek.daysOfTheWeek[5])}
    }
    private var sundayList: [LUItem] {
        mockupList.filter{ $0.reminderDay.contains(DayOfTheWeek.daysOfTheWeek[6])}
    }
    private var weeksList: [[LUItem]] {
        [mondayList, tuesdayList, wednesdayList, thursdayList, fridayList, saturdayList, sundayList]
    }
    
    var body: some View {
        NavigationView {
            VStack {
                switch selection {
                case .weekly:
                    LUWeeklyCalendarView()
                case .daily:
                    LUDailyCalendarView()
                }
            }
            .toolbar {
                ToolbarItem {
                    Picker("View type", selection: $selection.animation(.easeIn)) {
                        ForEach(CalendarViewType.allCases) { option in
                            Text(String(describing: option))
                        }
                    }.pickerStyle(MenuPickerStyle())
                }
            }
        }
    }
}

struct LUCalendarView_Previews: PreviewProvider {
    static var previews: some View {
        LUCalendarView()
    }
}
