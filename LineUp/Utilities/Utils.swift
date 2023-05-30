//
//  Utils.swift
//  LineUp
//
//  Created by Steven Wijaya on 25.05.2023.
//

import Foundation

func getTodayDateInt() -> Int {
    var dateInt = Date.now.dayNumberOfWeek()!
    if dateInt == 0 {
        dateInt = 6
    } else {
        dateInt -= 2
    }
    return dateInt
}
