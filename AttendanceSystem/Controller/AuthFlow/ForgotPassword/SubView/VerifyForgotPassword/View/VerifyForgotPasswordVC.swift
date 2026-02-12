//
//  VerifyForgotPasswordVC.swift
//  AttendanceSystem
//
//  Created by Ankit on 10/02/26.
//

import UIKit

class VerifyForgotPasswordVC: UIViewController {

    @IBOutlet weak var otpView: OTPFieldView!
    @IBOutlet weak var lblEmailDis: UILabel!
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
        let vc = NewPasswordVC()
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

// MARK: - otpView Delegate
extension VerifyForgotPasswordVC: OTPFieldViewDelegate {
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
