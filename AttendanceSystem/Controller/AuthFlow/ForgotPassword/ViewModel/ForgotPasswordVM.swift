//
//  ForgotPasswordVM.swift
//  Work Force
//
//  Created by Ankit on 13/03/26.
//

import Foundation
import Alamofire

class ForgotPasswordVM {
    var successForgotPass: (()->Void)?
    var failureForgotPass: ((String)->Void)?
    
    var forgotPasswordResponse: InitialResponse?
    
    func changePassword(email: String) {
        APIClient.sharedInstance.showIndicaor()
        
        let parameters: [String: Any] = [
            "email": email
        ]
        
        APIClient.sharedInstance.request(
            method: .post,
            url: APIEndPoint.forgotPassword,
            parameters: parameters,
            needUserToken: true,
            responseType: InitialResponse.self
        ) { [weak self] response, errorMessage, statusCode in
            
            guard let self = self else { return }
            APIClient.sharedInstance.hideIndicator()
            
            guard let response = response else {
                debugPrint("ERROR:", errorMessage ?? "")
                self.failureForgotPass?(errorMessage ?? "Something went wrong")
                return
            }
            
            self.forgotPasswordResponse = response
            debugPrint("SUCCESS:", response.message ?? "")
            debugPrint("OTP:", response.otp ?? 0)
            
            if statusCode == 200 && response.status == true {
                self.successForgotPass?()
            } else {
                self.failureForgotPass?(response.message ?? "Forgot password failed")
            }
        }
    }
}
