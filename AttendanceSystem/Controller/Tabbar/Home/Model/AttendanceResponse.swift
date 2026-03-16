//
//  AttendanceResponse.swift
//  Work Force
//
//  Created by Kenil on 13/03/26.
//

import Foundation

struct AttendanceResponse: Codable {
    let success: Bool?
    let message: String?
    let distanceMeters: Double?
    let allowedRadius: Int?
    let workSchedule: WorkSchedule?
    let isShowOvertime: Bool?
    let user: AttendanceUser?
    let todayAttendance: TodayAttendance?
    let todaySummary: TodaySummary?
    let assignedTasks: [AssignedTask]?
    let attendances: [Attendance]?
    
    enum CodingKeys: String, CodingKey {
        case success
        case message
        case distanceMeters = "distance_meters"
        case allowedRadius = "allowed_radius"
        case workSchedule = "work_schedule"
        case isShowOvertime = "is_show_overtime"
        case user
        case todayAttendance = "today_attendance"
        case todaySummary = "today_summary"
        case assignedTasks = "assigned_tasks"
        case attendances
    }
}

struct WorkSchedule: Codable {
    let companyId: Int?
    let roleId: Int?
    let startTime: String?
    let endTime: String?
    let breakMinutes: Int?
    let shiftTotal: String?
    let workingHours: String?
    
    enum CodingKeys: String, CodingKey {
        case companyId = "company_id"
        case roleId = "role_id"
        case startTime = "start_time"
        case endTime = "end_time"
        case breakMinutes = "break_minutes"
        case shiftTotal = "shift_total"
        case workingHours = "working_hours"
    }
}

struct AttendanceUser: Codable {
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

struct TodayAttendance: Codable {
    let id: Int?
    let date: String?
    let checkIn: String?
    let checkOut: String?
    let breakIn: String?
    let breakOut: String?
    let overtimeIn: String?
    let overtimeOut: String?
    let totalMinutes: Int?
    let overtimeMinutes: Int?
    
    enum CodingKeys: String, CodingKey {
        case id
        case date
        case checkIn = "check_in"
        case checkOut = "check_out"
        case breakIn = "break_in"
        case breakOut = "break_out"
        case overtimeIn = "overtime_in"
        case overtimeOut = "overtime_out"
        case totalMinutes = "total_minutes"
        case overtimeMinutes = "overtime_minutes"
    }
}

struct TodaySummary: Codable {
    let date: String?
    let checkIn: String?
    let breakIn: String?
    let breakOut: String?
    let checkOut: String?
    let totalHoursBreaked: String?
    let totalHoursWorked: String?
    
    enum CodingKeys: String, CodingKey {
        case date
        case checkIn = "check_in"
        case breakIn = "break_in"
        case breakOut = "break_out"
        case checkOut = "check_out"
        case totalHoursBreaked = "total_hours_breaked"
        case totalHoursWorked = "total_hours_worked"
    }
}

struct Attendance: Codable {
    let id: Int?
    let companyId: Int?
    let date: String?
    let checkIn: String?
    let breakIn: String?
    let breakOut: String?
    let checkOut: String?
    let totalHoursBreaked: String?
    let totalHoursWorked: String?
    let totalMinutes: Int?
    let overtimeMinutes: Int?
    
    enum CodingKeys: String, CodingKey {
        case id
        case companyId = "company_id"
        case date
        case checkIn = "check_in"
        case breakIn = "break_in"
        case breakOut = "break_out"
        case checkOut = "check_out"
        case totalHoursBreaked = "total_hours_breaked"
        case totalHoursWorked = "total_hours_worked"
        case totalMinutes = "total_minutes"
        case overtimeMinutes = "overtime_minutes"
    }
}

struct AssignedTask: Codable {
}
