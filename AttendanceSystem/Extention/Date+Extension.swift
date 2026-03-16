//
//  Date+Extension.swift
//  Work Force
//
//  Created by Kenil on 13/03/26.
//

import Foundation

extension Date {
    
    static func currentDateString() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter.string(from: Date())
    }
    
    static func currentTimeString() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        return formatter.string(from: Date())
    }
}
