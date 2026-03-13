//
//  EmailLoginVC.swift
//  AttendanceSystem
//
//  Created by Kenil on 09/02/26.
//

import UIKit

class EmailLoginVC: UIViewController {

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
    @IBOutlet weak var txxEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    
    @IBOutlet weak var imgPassword: UIImageView!
    @IBOutlet weak var imgRemember: UIImageView!
    
    var isHiddanPassword: Bool = false
    var isRemember: Bool = false
    
    var viewModel = LoginVM()
    
    // MARK: - View Cycle
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
        imgRemember.image = changeRemember
    }
    @IBAction func tappedForgotPassword(_ sender: Any) {
        let vc = ForgotPasswordVC()
        if let sheet = vc.sheetPresentationController {
            // Create a custom detent that returns a fixed height
            let fixedDetent = UISheetPresentationController.Detent.custom(identifier: .init("fixed326")) { context in
                return 260
            }
            sheet.detents = [fixedDetent]
            sheet.prefersGrabberVisible = true
        }
        vc.sheetPresentationController?.delegate = self
        self.present(vc, animated: true)
    }
    @IBAction func tappedSignIn(_ sender: Any) {
        guard let employeeId = txxEmail.text, !employeeId.isEmpty else {
            self.setUpMakeToast(msg: "Please enter employee Id")
            return
        }
        
        guard let password = txtPassword.text, !password.isEmpty else {
            self.setUpMakeToast(msg: "Please enter password")
            return
        }
        
        viewModel.login(login: employeeId, password: password)
        viewModel.successLogin = { [weak self] in
            AppDelegate.appDelegate.setUpHome()
        }
        viewModel.failureLogin = { [weak self] msg in
            self?.setUpMakeToast(msg: msg)
        }
    }
    @IBAction func tappedSignInEmployeeId(_ sender: Any) {
        let vc = EmployeeLoginVC()
        self.navigationController?.pushViewController(vc, animated: false)
    }
    @IBAction func tappedSignInPhone(_ sender: Any) {
        let vc = PhoneLoginVC()
        self.navigationController?.pushViewController(vc, animated: false)
    }
    @IBAction func tappedSignu(_ sender: Any) {
        let vc = SignUpVC()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    

}

extension EmailLoginVC: UISheetPresentationControllerDelegate {
    func presentationControllerDidDismiss(_ presentationController: UIPresentationController) {
        if let overlayView = view.viewWithTag(999) {
            UIView.animate(withDuration: 0.1, delay: 0, options: .curveEaseInOut, animations: {
                overlayView.alpha = 0
            }, completion: { _ in
                overlayView.removeFromSuperview()
            })
            
        }
    }
}
