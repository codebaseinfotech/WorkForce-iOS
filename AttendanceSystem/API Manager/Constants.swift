//
//  Constants.swift
//  TorettoRecovery
//
//  Created by Ankit Gabani on 29/12/25.
//

import Foundation

enum AppEnviroment {
    case live
    case dev
}

let current: AppEnviroment = .live

// ************************* LIVE ***********************
let BASE_URL = current == .live ? "" : ""
let v1 = "v1/"

// MARK: - APIEndPoint
enum APIEndPoint: String {
    
    case loginUser = ""
    
}
