//
//  LUListView.swift
//  LineUp
//
//  Created by Steven Wijaya on 24.02.2023.
//

import SwiftUI

struct LUListView: View {
    
    @EnvironmentObject var vm: LUItemViewModel
    @State private var listLU : [LUItem] = mockupList
    @State private var todayListLU: [LUItem] = [LUItem]()
    @State private var multiSelection = Set<UUID>()
    
    @State private var currDateOfTheWeek: DayOfTheWeek = DayOfTheWeek.daysOfTheWeek[0]
    
    var body: some View {
        NavigationView {
            ZStack {
                List(vm.todayList) { item in
                    LURowView(luItem: item, currDay: currDateOfTheWeek).onTapGesture { withAnimation { vm.updateStatus(forItem: item) } }
                }
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        NavigationLink {
                            LUAddView()
                                .environmentObject(vm)
                        } label: {
                            addButton
                        }.padding(20)
                    }
                }
            }
            .navigationTitle("LineUp - \(currDateOfTheWeek.rawValue)")
            .onAppear {
                var dateInt = Date.now.dayNumberOfWeek()!
                if dateInt == 0 {
                    dateInt = 6
                } else {
                    dateInt -= 2
                }
                currDateOfTheWeek = DayOfTheWeek.daysOfTheWeek[dateInt]
                todayListLU = listLU.filter{ $0.reminderDay.contains(currDateOfTheWeek) }
            }
        }
    }
}

struct LUList_Previews: PreviewProvider {
    static var previews: some View {
        LUListView()
    }
}

extension LUListView {
    private var addButton: some View {
        Image(systemName: "plus")
            .font(.largeTitle)
            .frame(width: 75, height: 75)
            .foregroundColor(.white)
            .background(Color.brandPrimary)
            .clipShape(Circle())
    }
}
