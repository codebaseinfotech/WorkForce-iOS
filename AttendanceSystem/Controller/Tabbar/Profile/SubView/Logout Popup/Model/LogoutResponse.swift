//
//  LogoutResponse.swift
//  Work Force
//
//  Created by Ankit on 13/03/26.
//

import Foundation

struct LogoutResponse: Codable {
    let status: Bool
    let message: String
    let data: EmptyData?
}

struct EmptyData: Codable {}
