//
//  NewPasswordVC.swift
//  AttendanceSystem
//
//  Created by Ankit on 10/02/26.
//

import UIKit

class NewPasswordVC: UIViewController {
    
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtConfirmPass: UITextField!
    
    @IBOutlet weak var imgHidePassword: UIImageView!
    @IBOutlet weak var imgHideConfirmPass: UIImageView!
    
    var isHiddanPassword: Bool = false
    var isHiddanConfirmPassword: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func tappedHidePassword(_ sender: Any) {
        isHiddanPassword.toggle()
        
        let icon = isHiddanPassword ? "ic_show_password".image : "ic_hide_password".image
        imgHidePassword.image = icon
        
        let currentText = txtPassword.text
        txtPassword.isSecureTextEntry = !isHiddanPassword
        txtPassword.text = currentText
    }
    
    @IBAction func tappedHideConfirmPass(_ sender: Any) {
        isHiddanConfirmPassword.toggle()
        
        let icon = isHiddanConfirmPassword ? "ic_show_password".image : "ic_hide_password".image
        imgHideConfirmPass.image = icon
        
        let currentText = txtConfirmPass.text
        txtConfirmPass.isSecureTextEntry = !isHiddanConfirmPassword
        txtConfirmPass.text = currentText
    }
    
    @IBAction func tappedSubmit(_ sender: Any) {
        guard let parentVC = self.presentingViewController else { return }
        
        self.dismiss(animated: true) {
            let vc = PasswordSuccessVC()
            vc.modalPresentationStyle = .overFullScreen
            
            vc.onSignIn = { [weak parentVC] in
                guard let parentVC = parentVC else { return }
                let loginVC = EmailLoginVC()
                parentVC.navigationController?.setViewControllers([loginVC], animated: true)
            }
            
            parentVC.present(vc, animated: false)
        }
    }
    
    
}
