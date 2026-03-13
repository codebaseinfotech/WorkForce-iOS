//
//  WFUtilites.swift
//  Work Force
//
//  Created by Ankit on 13/03/26.
//

import Foundation
import UIKit

class WFUtilites {
    
    static let userDefaults = UserDefaults.standard
    
    // MARK: - Login Status
    class func saveIsCurrentLoginUser(_ isCurrentUser: Bool) {
        userDefaults.set(isCurrentUser, forKey: "isCurrentUser")
    }
    
    class func getIsCurrntUserLogin() -> Bool {
        return userDefaults.bool(forKey: "isCurrentUser")
    }
    
    // MARK: - Token
    class func saveCurrentUserToken(_ accessToken: String) {
        userDefaults.set(accessToken, forKey: "access_token")
    }
    
    class func getCurrentUserToken() -> String {
        return userDefaults.string(forKey: "access_token") ?? ""
    }
    
    // MARK: - Save User
    class func saveCurrentUser(_ user: LoginUser?) {
        guard let user = user else { return }
        
        if let encodedUser = try? PropertyListEncoder().encode(user) {
            userDefaults.set(encodedUser, forKey: "currentUser")
        }
    }
    
    // MARK: - Get User
    class func getCurrentUser() -> LoginUser? {
        guard let data = userDefaults.data(forKey: "currentUser") else { return nil }
        return try? PropertyListDecoder().decode(LoginUser.self, from: data)
    }
    
    // MARK: - Logout
    class func logout() {
        userDefaults.removeObject(forKey: "currentUser")
        userDefaults.removeObject(forKey: "access_token")
        userDefaults.set(false, forKey: "isCurrentUser")
    }
    
    // MARK: - Platform
    class func platform() -> String {
        return "mobile"
    }
}
