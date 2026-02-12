//
//  ForgotPasswordVC.swift
//  AttendanceSystem
//
//  Created by Ankit on 10/02/26.
//

import UIKit

class ForgotPasswordVC: UIViewController {

    @IBOutlet weak var viewMain: UIView! {
        didSet {
            viewMain.layer.cornerRadius = 24
            viewMain.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
            
            viewMain.layer.applySketchShadow(color: .black,
                                             alpha: 0.1,
                                             x: 0,
                                             y: 4,
                                             blur: 25,
                                             spread: 0)
        }
    }
    
    @IBOutlet weak var txtEmailAddress: UITextField!
    @IBOutlet weak var btnSendVerification: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        txtEmailAddress.addTarget(
            self,
            action: #selector(emailTextDidChange),
            for: .editingChanged
        )
        
        updateSendButton(isValid: false)
        // Do any additional setup after loading the view.
    }

    @IBAction func tappedSendVerification(_ sender: Any) {
        let email = txtEmailAddress.text?
            .trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
        
        if email.isEmpty {
            setUpMakeToast(msg: "Please enter email address")
            return
        }
        
        let vc = VerifyForgotPasswordVC()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func emailTextDidChange() {
        let email = txtEmailAddress.text?
            .trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
        
        updateSendButton(isValid: !email.isEmpty)
    }
    
    func updateSendButton(isValid: Bool) {
        btnSendVerification.isEnabled = isValid
        
        if isValid {
            btnSendVerification.backgroundColor = .primery
            btnSendVerification.setTitleColor(.white, for: .normal)
        } else {
            btnSendVerification.backgroundColor = .white
            btnSendVerification.setTitleColor(.primery, for: .normal)
        }
    }
    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "^[A-Z0-9a-z._%+\\-]+@[A-Za-z0-9.\\-]+\\.[A-Za-z]{2,64}$"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: email)
    }
    
}
