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

let current: AppEnviroment = .dev
var isDebugPrint: Bool = true

// ************************* LIVE ***********************
let BASE_URL = current == .live ? "http://192.168.1.64:8000/api/" : "http://192.168.1.64:8000/api/"

// MARK: - APIEndPoint
enum APIEndPoint: String {
    
    case loginUser = "sign-in"
    case logoutUser = "v1/logout"
    case forgotPassword = "forgot-password"
    case verifyOtp = "verify-otp"
    case resetPassword = "reset-password"
}
