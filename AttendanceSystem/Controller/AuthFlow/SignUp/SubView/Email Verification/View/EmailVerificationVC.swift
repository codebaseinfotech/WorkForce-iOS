//
//  EmailVerificationVC.swift
//  AttendanceSystem
//
//  Created by Ankit on 10/02/26.
//

import UIKit

class EmailVerificationVC: UIViewController {

    @IBOutlet weak var imgTopLogo: UIImageView!
    @IBOutlet weak var otpView: OTPFieldView!
    
    var enteredOtp: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupOtpView()
        // Do any additional setup after loading the view.
    }

    func setupOtpView(){
        self.otpView.fieldsCount = 6
        self.otpView.fieldBorderWidth = 1
        self.otpView.defaultBorderColor = UIColor.black.withAlphaComponent(0.1)
        self.otpView.filledBorderColor = UIColor.black.withAlphaComponent(0.1)
        self.otpView.cursorColor = UIColor.black
        self.otpView.displayType = .roundedCorner
        self.otpView.fieldSize = 42
        self.otpView.separatorSpace = 8
        self.otpView.shouldAllowIntermediateEditing = false
        self.otpView.delegate = self
        self.otpView.initializeUI()
    }
    
    @IBAction func tappedResendIt(_ sender: Any) {
    }
    
    @IBAction func tappedSubmit(_ sender: Any) {
    }
    
}

// MARK: - otpView Delegate
extension EmailVerificationVC: OTPFieldViewDelegate {
    func hasEnteredAllOTP(hasEnteredAll hasEntered: Bool) -> Bool {
        print("Has entered all OTP? \(hasEntered)")
        return false
    }
    
    func shouldBecomeFirstResponderForOTP(otpTextFieldIndex index: Int) -> Bool {
        return true
    }
    
    func enteredOTP(otp otpString: String) {
        print("OTPString: \(otpString)")
        self.enteredOtp = otpString
    }
}
