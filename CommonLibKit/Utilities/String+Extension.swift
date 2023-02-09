//
//  String+Extension.swift
//  GitHubRepo
//
//  Created by Sushant Hegde on 10/02/23.
//

import Foundation

public extension String {
    var toDate: Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy'-'MM'-'dd'T'HH':'mm':'ssZZZ"
        let date = dateFormatter.date(from: self)
        return date
    }
}
