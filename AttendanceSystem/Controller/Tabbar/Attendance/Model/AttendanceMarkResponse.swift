//
//  AttendanceMarkResponse.swift
//  Work Force
//
//  Created by Ankit on 16/03/26.
//

import Foundation

struct AttendanceMarkResponse: Codable {
    let success: Bool?
    let user: AttendanceMarkUser?
    let todaySummary: AttendanceMarkTodaySummary?
    let attendances: [AttendanceMarkItem]?
    
    enum CodingKeys: String, CodingKey {
        case success
        case user
        case todaySummary = "today_summary"
        case attendances
    }
}

struct AttendanceMarkUser: Codable {
    let id: Int?
    let name: String?
    let companyId: Int?
    let companyName: String?
    let currentTime: String?
    let todayDate: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case companyId = "company_id"
        case companyName = "company_name"
        case currentTime = "current_time"
        case todayDate = "today_date"
    }
}

struct AttendanceMarkTodaySummary: Codable {
    let date: String?
    let checkIn: String?
    let breakIn: String?
    let breakOut: String?
    let checkOut: String?
    let overtimeIn: String?
    let overtimeOut: String?
    let totalHoursBreaked: String?
    let totalHoursWorked: String?
    let overtimeMinutes: Int?
    
    enum CodingKeys: String, CodingKey {
        case date
        case checkIn = "check_in"
        case breakIn = "break_in"
        case breakOut = "break_out"
        case checkOut = "check_out"
        case overtimeIn = "overtime_in"
        case overtimeOut = "overtime_out"
        case totalHoursBreaked = "total_hours_breaked"
        case totalHoursWorked = "total_hours_worked"
        case overtimeMinutes = "overtime_minutes"
    }
}

struct AttendanceMarkItem: Codable {
    let id: Int?
    let date: String?
    let checkIn: String?
    let breakIn: String?
    let breakOut: String?
    let checkOut: String?
    let overtimeIn: String?
    let overtimeOut: String?
    let totalHoursWorked: String?
    let overtimeMinutes: Int?
    
    enum CodingKeys: String, CodingKey {
        case id
        case date
        case checkIn = "check_in"
        case breakIn = "break_in"
        case breakOut = "break_out"
        case checkOut = "check_out"
        case overtimeIn = "overtime_in"
        case overtimeOut = "overtime_out"
        case totalHoursWorked = "total_hours_worked"
        case overtimeMinutes = "overtime_minutes"
    }
}
