//
//  LoginVM.swift
//  Work Force
//
//  Created by Ankit on 13/03/26.
//

import Foundation
import Alamofire

class LoginVM {
    
    var successLogin: (()->Void)?
    var failureLogin: ((String)->Void)?
    
    var loginResponse: LoginUser?
    
    func login(login: String, password: String) {
        APIClient.sharedInstance.showIndicaor()
        
        let parameters: [String: Any] = [
            "login": login,
            "password": password
        ]
        
        APIClient.sharedInstance.request(
            method: .post,
            url: APIEndPoint.loginUser,
            parameters: parameters,
            needUserToken: false,
            responseType: LoginUser.self
        ) { [weak self] response, errorMessage, statusCode in
            
            guard let self = self else { return }
            APIClient.sharedInstance.hideIndicator()
            
            if let response = response {
                self.loginResponse = response
                debugPrint("SUCCESS:", response.message ?? "")
                
                if statusCode == 200 && response.status == true {
                    WFUtilites.saveCurrentUserToken(response.token ?? "")
                    WFUtilites.saveIsCurrentLoginUser(true)
                    WFUtilites.saveCurrentUser(response)
                    self.successLogin?()
                } else {
                    self.failureLogin?(response.message ?? "Login failed")
                }
            } else {
                debugPrint("ERROR:", errorMessage ?? "")
                self.failureLogin?(errorMessage ?? "Something went wrong")
            }
        }
    }
}
