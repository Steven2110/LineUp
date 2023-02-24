//
//  DayOfTheWeek.swift
//  LineUp
//
//  Created by Steven Wijaya on 24.02.2023.
//

import Foundation

struct DayOfTheWeek: Identifiable, Equatable {
    let id: UUID = UUID()
    let shortValue: String
    let rawValue: String
    
    static let daysOfTheWeek: [DayOfTheWeek] = [
        DayOfTheWeek(shortValue: "Mo",rawValue: "Monday"),
        DayOfTheWeek(shortValue: "Tu",rawValue: "Tuesday"),
        DayOfTheWeek(shortValue: "We",rawValue: "Wednesday"),
        DayOfTheWeek(shortValue: "Th",rawValue: "Thursday"),
        DayOfTheWeek(shortValue: "Fr",rawValue: "Friday"),
        DayOfTheWeek(shortValue: "Sa",rawValue: "Saturday"),
        DayOfTheWeek(shortValue: "Su",rawValue: "Sunday")
    ]
}
