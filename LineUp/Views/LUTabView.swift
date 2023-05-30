//
//  LUTabView.swift
//  LineUp
//
//  Created by Steven Wijaya on 24.02.2023.
//

import SwiftUI

struct LUTabView: View {
    @ObservedObject var vmLUItem: LUItemViewModel = LUItemViewModel()
    
    var body: some View {
        TabView {
            LUListView()
                .environmentObject(vmLUItem)
                .tabItem {
                    Label("LineUp", systemImage: "list.bullet.clipboard")
                }
            LUCalendarView()
                .environmentObject(vmLUItem)
                .tabItem {
                    Label("Calendar", systemImage: "calendar")
                }
            Text("Hello, Profile!")
                .tabItem {
                    Label("Profile", systemImage: "person.text.rectangle")
                }
        }
        .accentColor(.brandPrimary)
        .task {
            vmLUItem.dayOfTheWeek = await CloudKitManager.shared.fetchReminderDateData()
        }
    }
}

struct LUTabView_Previews: PreviewProvider {
    static var previews: some View {
        LUTabView()
    }
}
