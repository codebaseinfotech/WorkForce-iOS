//
//  VerifyPasswordVM.swift
//  Work Force
//
//  Created by Ankit on 13/03/26.
//

import Foundation
import Alamofire

class VerifyPasswordVM {
    var successVerifyPassword: (()->Void)?
    var failureVerifyPassword: ((String)->Void)?
    
    var forgotPasswordResponse: InitialResponse?
    
    func verifyPassword(email: String, otp: String) {
        APIClient.sharedInstance.showIndicaor()
        
        let parameters: [String: Any] = [
            "email": email,
            "otp": otp
        ]
        
        APIClient.sharedInstance.request(
            method: .post,
            url: APIEndPoint.verifyOtp,
            parameters: parameters,
            needUserToken: true,
            responseType: InitialResponse.self
        ) { [weak self] response, errorMessage, statusCode in
            
            guard let self = self else { return }
            APIClient.sharedInstance.hideIndicator()
            
            guard let response = response else {
                debugPrint("ERROR:", errorMessage ?? "")
                self.failureVerifyPassword?(errorMessage ?? "Something went wrong")
                return
            }
            
            self.forgotPasswordResponse = response
            debugPrint("SUCCESS:", response.message ?? "")
            
            if statusCode == 200 && response.status == true {
                self.successVerifyPassword?()
            } else {
                self.failureVerifyPassword?(response.message ?? "OTP verification failed")
            }
        }
    }
    
}
