//
//  StringExtensions.swift
//  APOD-iOS-CLEAN
//
//  Created by Jorge Luis Rivera Ladino on 25/01/22.
//

import Foundation

extension String {
    
    func toDate(formatter: String = "yyyy-MM-dd") -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = formatter
        return dateFormatter.date(from: self) ?? Date()
    }
    
}
