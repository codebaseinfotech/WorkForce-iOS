//
//  InitialResponse.swift
//  Work Force
//
//  Created by Ankit on 13/03/26.
//

import Foundation

struct InitialResponse: Codable {
    let status: Bool?
    let otp: Int?
    let message: String?
}
