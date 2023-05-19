//
//  LURowView.swift
//  LineUp
//
//  Created by Steven Wijaya on 19.05.2023.
//

import SwiftUI

struct LURowView: View {
    
    var luItem: LUItem
    var currDay: DayOfTheWeek
    
    var body: some View {
        HStack(spacing: 15) {
            Text(luItem.labelIcon)
                .rotationEffect(luItem.getStatus(day: currDay) ? .degrees(0) : .degrees(180))
            VStack(alignment: .leading) {
                Text(luItem.name)
                    .strikethrough(luItem.getStatus(day: currDay), color: .red)
                    .foregroundColor(luItem.getStatus(day: currDay) ? .secondary : .primary)
                HStack {
                    ForEach(luItem.reminderDay) { day in
                        Text(day.shortValue)
                    }
                }
            }
        }
    }
}

struct LURowView_Previews: PreviewProvider {
    static var previews: some View {
        LURowView(luItem: LUItem(name: "Test", labelIcon: "🥹", reminderDay: [DayOfTheWeek]()), currDay: DayOfTheWeek.daysOfTheWeek[0])
    }
}
