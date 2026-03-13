//
//  LoginUser.swift
//  Work Force
//
//  Created by Ankit on 13/03/26.
//

import Foundation

// MARK: - LoginUser
struct LoginUser: Codable {
    let status: Bool?
    let message: String?
    let token: String?
    let platform: String?
    let user: User?
}

// MARK: - User
struct User: Codable {
    let id: Int?
    let employeeId: String?
    let firstName: String?
    let lastName: String?
    let email: String?
    let phone: String?
    let loginCount: Int?
    let lastLoginIp: String?
    let companyId: Int?
    let company: String?
    let companyLatitude: String?
    let companyLongitude: String?
    let companyRadius: String?
    let nationality: String?
    let signatureImageUrl: String?
    let pImageUrl: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case employeeId
        case firstName = "first_name"
        case lastName = "last_name"
        case email
        case phone
        case loginCount = "login_count"
        case lastLoginIp = "last_login_ip"
        case companyId = "company_id"
        case company
        case companyLatitude = "company_latitude"
        case companyLongitude = "company_longitude"
        case companyRadius = "company_radius"
        case nationality
        case signatureImageUrl = "signature_image_url"
        case pImageUrl = "p_image_url"
    }
}
