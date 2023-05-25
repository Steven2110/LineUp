//
//  LUCalendarView.swift
//  LineUp
//
//  Created by Steven Wijaya on 19.05.2023.
//

import SwiftUI

struct LUCalendarView: View {
    
    @EnvironmentObject var vm: LUItemViewModel
    
    @State private var selection: CalendarViewType = .weekly
    
    var body: some View {
        NavigationView {
            VStack {
                switch selection {
                case .weekly:
                    LUWeeklyCalendarView()
                        .environmentObject(vm)
                case .daily:
                    LUDailyCalendarView()
                        .environmentObject(vm)
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
