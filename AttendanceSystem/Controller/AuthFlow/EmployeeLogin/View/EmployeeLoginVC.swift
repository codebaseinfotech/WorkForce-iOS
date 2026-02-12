//
//  EmployeeLoginVC.swift
//  AttendanceSystem
//
//  Created by Kenil on 09/02/26.
//

import UIKit

class EmployeeLoginVC: UIViewController {

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
    @IBOutlet weak var txtEmployeeId: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var imgPassword: UIImageView!
    @IBOutlet weak var imgRemmeber: UIImageView!
    
    var isHiddanPassword: Bool = false
    var isRemember: Bool = false

    // MARK: - view Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    // MARK: - Action Method
    @IBAction func tappedPassword(_ sender: Any) {
        isHiddanPassword.toggle()
        
        let changePassword = isHiddanPassword ? "ic_hide_password".image : "ic_show_password".image
        imgPassword.image = changePassword
        txtPassword.isSecureTextEntry = !isHiddanPassword
    }
    @IBAction func tappedRemember(_ sender: Any) {
        isRemember.toggle()
        let changeRemember = isRemember ? "ic_check_remineder".image : "ic_un_check_reminder".image
        imgRemmeber.image = changeRemember
    }
    @IBAction func tappedForgotPassword(_ sender: Any) {
    }
    @IBAction func tappedSignIn(_ sender: Any) {
    }
    @IBAction func tappedSignInEmail(_ sender: Any) {
        let vc = EmailLoginVC()
        self.navigationController?.pushViewController(vc, animated: false)
    }
    @IBAction func tappedSignInPhone(_ sender: Any) {
        let vc = PhoneLoginVC()
        self.navigationController?.pushViewController(vc, animated: false)
    }
    @IBAction func tappedSignUp(_ sender: Any) {
    }
    

}
