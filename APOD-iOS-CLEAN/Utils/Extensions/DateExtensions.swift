//
//  DateExtensions.swift
//  APOD-iOS-CLEAN
//
//  Created by Jorge Luis Rivera Ladino on 25/01/22.
//

import Foundation

extension Date {
    
    func toString(formatter: String = "yyyy-MM-dd") -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = formatter
        return dateFormatter.string(from: self)
    }
    
    func inc(num: Int) -> Date {
        Calendar.current.date(byAdding: .day, value: num, to: self) ?? Date()
    }
    
    func dec(num: Int) -> Date {
        Calendar.current.date(byAdding: .day, value: -num, to: self) ?? Date()
    }
    
}
