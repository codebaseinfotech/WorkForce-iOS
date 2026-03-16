//
//  AttendanceVM.swift
//  Work Force
//
//  Created by Ankit on 16/03/26.
//

import Foundation
import Alamofire

class AttendanceVM {
    var successAttendanceData: (()->Void)?
    var failureAttendanceData: ((String)->Void)?
    
    var attendanceResponse: AttendanceMarkResponse?
    
    func getAttendanceList() {
        
        APIClient.sharedInstance.showIndicaor()
        
        APIClient.sharedInstance.request(
            method: .get,
            url: APIEndPoint.attendanceList,
            needUserToken: true,
            responseType: AttendanceMarkResponse.self,
            parameterEncoding: .url
        ) { [weak self] response, errorMessage, statusCode in
            
            guard let self = self else { return }
            
            APIClient.sharedInstance.hideIndicator()
            
            guard let response = response else {
                self.failureAttendanceData?(errorMessage ?? "Something went wrong")
                return
            }
            
            self.attendanceResponse = response
            
            if statusCode == 200 && response.success == true {
                self.successAttendanceData?()
            } else {
                self.failureAttendanceData?("Failed to load attendance list")
            }
        }
    }
}
