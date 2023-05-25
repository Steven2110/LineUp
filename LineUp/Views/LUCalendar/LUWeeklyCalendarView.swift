//
//  LUWeeklyCalendarView.swift
//  LineUp
//
//  Created by Steven Wijaya on 25.05.2023.
//

import SwiftUI

struct LUWeeklyCalendarView: View {
    
    @EnvironmentObject var vm: LUItemViewModel
    
    var body: some View {
        List {
            ForEach(vm.weeklyList.indices, id: \.self) { i in
                Section {
                    ForEach(vm.weeklyList[i], id: \.id) { item in
                        LURowView(luItem: item, currDay: DayOfTheWeek.daysOfTheWeek[i])
                    }
                } header: {
                    Text("\(DayOfTheWeek.daysOfTheWeek[i].rawValue)")
                }.headerProminence(.increased)
            }
        }.navigationTitle("Weekly List")
    }
}

struct LUWeeklyCalendarView_Previews: PreviewProvider {
    static var previews: some View {
        LUWeeklyCalendarView()
    }
}
