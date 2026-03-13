//
//  LogoutVM.swift
//  Work Force
//
//  Created by Ankit on 13/03/26.
//

import Foundation
import Alamofire

class LogoutVM {
    
    var successLogout: (()->Void)?
    
    func logoutUser() {
        APIClient.sharedInstance.showIndicaor()
        
        APIClient.sharedInstance.request(
            method: .post,
            url: APIEndPoint.logoutUser,
            needUserToken: true,
            responseType: LogoutResponse.self) { [self] response, error, statusCode in
                APIClient.sharedInstance.hideIndicator()
                
                let _ = response?.message ?? ""
                if statusCode == 200 {
                    if let status = response?.status, status {
                        WFUtilites.saveCurrentUserToken("")
                        WFUtilites.saveIsCurrentLoginUser(false)
                        WFUtilites.saveCurrentUser(nil)
                        successLogout?()
                    } else {
                        WFUtilites.saveCurrentUserToken("")
                        WFUtilites.saveIsCurrentLoginUser(false)
                        WFUtilites.saveCurrentUser(nil)
                        
                        successLogout?()
                    }
                } else {
                    WFUtilites.saveCurrentUserToken("")
                    WFUtilites.saveIsCurrentLoginUser(false)
                    WFUtilites.saveCurrentUser(nil)
                    
                    successLogout?()
                }
            }
    }
}
