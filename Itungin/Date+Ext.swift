//
//  Date+Ext.swift
//  Itungin
//
//  Created by Ditha Nurcahya Avianty on 25/02/23.
//

import Foundation

extension Date {
    func dateToString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d MMM yyyy"
        return dateFormatter.string(from: self)
    }
}
