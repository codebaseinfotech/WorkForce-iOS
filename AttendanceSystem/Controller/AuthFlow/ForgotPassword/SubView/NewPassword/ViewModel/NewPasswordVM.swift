//
//  NewPasswordVM.swift
//  Work Force
//
//  Created by Ankit on 13/03/26.
//

import Foundation
import Alamofire

class NewPasswordVM {
    var successNewPassword: (()->Void)?
    var failureNewPassword: ((String)->Void)?
    
    var forgotPasswordResponse: InitialResponse?
    
    func setNewPassword(email: String, otp: String, password: String, confirmPassword: String) {
        APIClient.sharedInstance.showIndicaor()
        
        let parameters: [String: Any] = [
            "email": email,
            "otp": otp,
            "password": password,
            "password_confirmation": confirmPassword
        ]
        
        APIClient.sharedInstance.request(
            method: .post,
            url: APIEndPoint.resetPassword,
            parameters: parameters,
            needUserToken: true,
            responseType: InitialResponse.self
        ) { [weak self] response, errorMessage, statusCode in
            
            guard let self = self else { return }
            APIClient.sharedInstance.hideIndicator()
            
            guard let response = response else {
                debugPrint("ERROR:", errorMessage ?? "")
                self.failureNewPassword?(errorMessage ?? "Something went wrong")
                return
            }
            
            self.forgotPasswordResponse = response
            debugPrint("SUCCESS:", response.message ?? "")
            
            if statusCode == 200 && response.status == true {
                self.successNewPassword?()
            } else {
                self.failureNewPassword?(response.message ?? "Reset password failed")
            }
        }
    }
}
