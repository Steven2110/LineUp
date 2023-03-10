//
//  LUListView.swift
//  LineUp
//
//  Created by Steven Wijaya on 24.02.2023.
//

import SwiftUI

struct LUListView: View {
    
    private var listLU : [LUItem] = [
        LUItem(
            name: "List 1",
            labelIcon: "😆",
            reminderDay: [
                DayOfTheWeek.daysOfTheWeek[0],
                DayOfTheWeek.daysOfTheWeek[2],
                DayOfTheWeek.daysOfTheWeek[5]
            ]
        ),
        LUItem(
            name: "List 2",
            labelIcon: "😎",
            isComplete: true,
            reminderDay: [
                DayOfTheWeek.daysOfTheWeek[0],
                DayOfTheWeek.daysOfTheWeek[2],
                DayOfTheWeek.daysOfTheWeek[4],
                DayOfTheWeek.daysOfTheWeek[3]
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
    @State private var multiSelection = Set<UUID>()
    
    @State private var currDateOfTheWeek: DayOfTheWeek = DayOfTheWeek.daysOfTheWeek[0]
    
    var body: some View {
        NavigationView {
            ZStack {
                List(listLU.filter{ $0.reminderDay.contains(currDateOfTheWeek) }) { item in
                    VStack(alignment: .leading) {
                        HStack {
                            Text(item.labelIcon)
                                .rotationEffect(item.isComplete ? .degrees(0) : .degrees(180))
                            Text(item.name)
                                .strikethrough(item.isComplete, color: .red)
                                .foregroundColor(item.isComplete ? .secondary : .primary)
                        }
                        HStack {
                            ForEach(item.reminderDay) { day in
                                Text(day.shortValue)
                            }
                        }.padding(.leading, 31)
                    }
                }
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        NavigationLink {
                            LUAddView()
                        } label: {
                            Image(systemName: "plus")
                                .font(.largeTitle)
                                .frame(width: 75, height: 75)
                                .foregroundColor(.white)
                                .background(Color.blue)
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
            }
        }
    }
}

struct LUList_Previews: PreviewProvider {
    static var previews: some View {
        LUListView()
    }
}
