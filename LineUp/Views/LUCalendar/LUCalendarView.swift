//
//  LUCalendarView.swift
//  LineUp
//
//  Created by Steven Wijaya on 19.05.2023.
//

import SwiftUI

struct LUCalendarView: View {
    
    @State private var listLU : [LUItem] = mockupList
    
    private var mondayList: [LUItem] {
        listLU.filter{ $0.reminderDay.contains(DayOfTheWeek.daysOfTheWeek[0])}
    }
    private var tuesdayList: [LUItem] {
        listLU.filter{ $0.reminderDay.contains(DayOfTheWeek.daysOfTheWeek[1])}
    }
    private var wednesdayList: [LUItem] {
        listLU.filter{ $0.reminderDay.contains(DayOfTheWeek.daysOfTheWeek[2])}
    }
    private var thursdayList: [LUItem] {
        listLU.filter{ $0.reminderDay.contains(DayOfTheWeek.daysOfTheWeek[3])}
    }
    private var fridayList: [LUItem] {
        listLU.filter{ $0.reminderDay.contains(DayOfTheWeek.daysOfTheWeek[4])}
    }
    private var saturdayList: [LUItem] {
        listLU.filter{ $0.reminderDay.contains(DayOfTheWeek.daysOfTheWeek[5])}
    }
    private var sundayList: [LUItem] {
        listLU.filter{ $0.reminderDay.contains(DayOfTheWeek.daysOfTheWeek[6])}
    }
    private var weeksList: [[LUItem]] {
        [mondayList, tuesdayList, wednesdayList, thursdayList, fridayList, saturdayList, sundayList]
    }
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(weeksList.indices, id: \.self) { i in
                        Section {
                            ForEach(weeksList[i], id: \.id) { item in
                                LURowView(luItem: item, currDay: DayOfTheWeek.daysOfTheWeek[i])
                            }
                        } header: {
                            Text("\(DayOfTheWeek.daysOfTheWeek[i].rawValue)")
                        }.headerProminence(.increased)
                    }
                }
            }.navigationTitle("Weekly List")
        }
    }
}

struct LUCalendarView_Previews: PreviewProvider {
    static var previews: some View {
        LUCalendarView()
    }
}
