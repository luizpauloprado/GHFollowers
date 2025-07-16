//
//  Date+Ext.swift
//  GHFollowers
//
//  Created by Luiz Paulo on 15/07/25.
//

import Foundation

extension Date {
    func convertToMonthYearFormat() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM yyyy"
        
        return dateFormatter.string(from: self)
    }
}
