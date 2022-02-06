//
//  DateHelper.swift
//  APOD-iOS-CLEAN
//
//  Created by Jorge Luis Rivera Ladino on 25/01/22.
//

import Foundation

class DateHelper {
    
    class func getCurrendDateWith(formatter: String = "yyyy-MM-dd") -> String {
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = formatter
        return dateFormatter.string(from: date)
    }
    
}
