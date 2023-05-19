//
//  LUListView.swift
//  LineUp
//
//  Created by Steven Wijaya on 24.02.2023.
//

import SwiftUI

struct LUListView: View {
    
    @State private var listLU : [LUItem] = mockupList
    @State private var todayListLU: [LUItem] = [LUItem]()
    @State private var multiSelection = Set<UUID>()
    
    @State private var currDateOfTheWeek: DayOfTheWeek = DayOfTheWeek.daysOfTheWeek[0]
    
    var body: some View {
        NavigationView {
            ZStack {
                List($todayListLU, editActions: .delete) { $item in
                    LURowView(luItem: item, currDay: currDateOfTheWeek).onTapGesture { withAnimation { item.updateStatus(day: currDateOfTheWeek) } }
                }
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        NavigationLink {
                            LUAddView(list: $listLU)
                        } label: {
                            Image(systemName: "plus")
                                .font(.largeTitle)
                                .frame(width: 75, height: 75)
                                .foregroundColor(.white)
                                .background(Color.brandPrimary)
                                .clipShape(Circle())
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
