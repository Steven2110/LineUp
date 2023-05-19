//
//  LUItem.swift
//  LineUp
//
//  Created by Steven Wijaya on 24.02.2023.
//

import SwiftUI


struct LUItem: Identifiable {
    let id: UUID = UUID()
    var name: String
    var labelIcon: String
    var isComplete: Bool = false
    var reminderDay: [DayOfTheWeek] = [DayOfTheWeek]()
    
    mutating func updateComplete() {
        isComplete.toggle()
    }
}

