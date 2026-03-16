//
//  PersonalDataVM.swift
//  Work Force
//
//  Created by Ankit on 16/03/26.
//

import Foundation

class PersonalDataVM {
    
    var successPersonalData: (()->Void)?
    var failurePersonalData: ((String)->Void)?
    
    var personalDataResponse: LoginUser?
    
    /*func updateUserData() {
        APIClient.sharedInstance.showIndicaor()
        
        var params: [String: Any] = [
            "first_name": String,
            "last_name": String,
            "phone": String
        ]
        
        var files: [MultipartFile] = []
        
        if let profileImage = profileImage,
           let imageData = profileImage.jpegData(compressionQuality: 0.7) {
            files.append(
                MultipartFile(
                    key: "p_image",
                    fileName: "profile.jpg",
                    data: imageData,
                    mimeType: "image/jpeg"
                )
            )
        }
        
        if let signatureImage = signatureImage,
           let imageData = signatureImage.jpegData(compressionQuality: 0.7) {
            files.append(
                MultipartFile(
                    key: "signature_image",
                    fileName: "signature.jpg",
                    data: imageData,
                    mimeType: "image/jpeg"
                )
            )
        }
        
        APIClient.sharedInstance.uploadMultipart(
            urlString: APIEndPoint.userAdd,
            needUserToken: true,
            parameters: params,
            files: files
        ) { [weak self] result in
            
            guard let self = self else { return }
            APIClient.sharedInstance.hideIndicator()
            
            switch result {
            case .success(let data):
                do {
                    let response = try JSONDecoder().decode(LoginUser.self, from: data)
                    self.personalDataResponse = response
                    
                    if response.status == true {
                        self.successPersonalData?()
                    } else {
                        self.failurePersonalData?(response.message ?? "Update failed")
                    }
                } catch {
                    self.failurePersonalData?("Decoding error: \(error.localizedDescription)")
                }
                
            case .failure(let error):
                self.failurePersonalData?(error.localizedDescription)
            }
        }
    }*/
}
