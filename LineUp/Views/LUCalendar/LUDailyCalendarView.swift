//
//  LUDailyCalendarView.swift
//  LineUp
//
//  Created by Steven Wijaya on 20.05.2023.
//

import SwiftUI

struct LUDailyCalendarView: View {
    
    @EnvironmentObject var vm: LUItemViewModel
    
    @State private var selection: Int = 0
    
    var body: some View {
        TabView(selection: $selection) {
            ForEach(vm.weeklyList.indices, id: \.self) { i in
                LUDailyList(dailyList: vm.weeklyList[i], currentDay: DayOfTheWeek.daysOfTheWeek[i])
                    .tag(i)
            }.navigationTitle(DayOfTheWeek.daysOfTheWeek[selection].rawValue)
        }
        .tabViewStyle(.page)
        .indexViewStyle(.page(backgroundDisplayMode: .always))
        .onAppear {
            selection = getTodayDateInt()
        }
    }
}

struct LUDailyCalendarView_Previews: PreviewProvider {
    static var previews: some View {
        LUDailyCalendarView()
    }
}
