//
//  Date+Extension.swift
//  GitHubRepo
//
//  Created by Sushant Hegde on 10/02/23.
//

import Foundation

extension Formatter {
    static let date = DateFormatter()
}

public extension Date {
    
    // o/p: 15 January 2023
    var datelongMonthYear: String {
        Formatter.date.dateFormat = "d MMMM yyyy"
        Formatter.date.timeZone = NSTimeZone.local
        Formatter.date.locale = .current
        return Formatter.date.string(from: self)
    }
    
}
