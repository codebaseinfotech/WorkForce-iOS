//
//  PhoneLoginVC.swift
//  AttendanceSystem
//
//  Created by Kenil on 09/02/26.
//

import UIKit

class PhoneLoginVC: UIViewController {

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
    @IBOutlet weak var imgCountryCode: UIImageView!
    @IBOutlet weak var txtMobileNumber: UITextField!
    @IBOutlet weak var imgRemember: UIImageView!
    
    var isRemember: Bool = false

    // MARK: - view Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // MARK: - Action Method
    @IBAction func tappedCountryCode(_ sender: Any) {
    }
    @IBAction func tappedRemember(_ sender: Any) {
        isRemember.toggle()
        let changeRemember = isRemember ? "ic_check_remineder".image : "ic_un_check_reminder".image
        imgRemember.image = changeRemember
    }
    @IBAction func tappedSignIn(_ sender: Any) {
        let vc = VerifyPhoneVC()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func tappedSignInEmployeeId(_ sender: Any) {
        let vc = EmployeeLoginVC()
        self.navigationController?.pushViewController(vc, animated: false)
    }
    @IBAction func tappedSignEmail(_ sender: Any) {
        let vc = EmailLoginVC()
        navigationController?.pushViewController(vc, animated: false)
    }
    @IBAction func tappedSignUp(_ sender: Any) {
    }
    

  

}
