//
//  HomeVM.swift
//  Work Force
//
//  Created by Kenil on 13/03/26.
//

import Foundation
import Alamofire

class HomeVM {
    
    var successHomeData: (()->Void)?
    var failureHomeData: ((String)->Void)?
    
    var attendanceResponse: AttendanceResponse?
    
    var currentDate: String = ""
    var currentTime: String = ""
    var action: String = ""
    
    func getHomeData(isAction: Bool = false) {
        APIClient.sharedInstance.showIndicaor()
        
        var parameters: [String: Any] = [
            "company_id": WFUtilites.getCurrentUser()?.user?.companyId ?? 0,
            "date": "2026-03-14",
            "time": currentTime,
            "latitude": "25.131144",
            "longitude": "55.387855"
        ]
        
        if isAction {
            parameters["action"] = action
        }
        
        APIClient.sharedInstance.request(
            method: .post,
            url: APIEndPoint.attendancesMark,
            parameters: parameters,
            needUserToken: true,
            responseType: AttendanceResponse.self
        ) { [weak self] response, errorMessage, statusCode in
            
            guard let self = self else { return }
            APIClient.sharedInstance.hideIndicator()
            
            guard let response = response else {
                debugPrint("ERROR:", errorMessage ?? "")
                self.failureHomeData?(errorMessage ?? "Something went wrong")
                return
            }
            
            self.attendanceResponse = response
            debugPrint("SUCCESS:", response.message ?? "")
            
            if statusCode == 200 && response.success == true {
                self.successHomeData?()
            } else {
                if statusCode == 401 {
                    WFUtilites.saveIsCurrentLoginUser(false)
                    WFUtilites.saveCurrentUser(nil)
                    AppDelegate.appDelegate.setUpLogin()
                }
                self.failureHomeData?(response.message ?? "Home data failed")
            }
            
            
        }
    }
    
}
