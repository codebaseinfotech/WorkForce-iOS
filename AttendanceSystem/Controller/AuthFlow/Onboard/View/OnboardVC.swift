//
//  OnboardVC.swift
//  AttendanceSystem
//
//  Created by Kenil on 09/02/26.
//

import UIKit

class OnboardVC: UIViewController {

    
    // MARK: - view Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // MARK: - Action Method
    @IBAction func tappedSignIn(_ sender: Any) {
        let vc = EmailLoginVC()
        navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func tappedSignUp(_ sender: Any) {
        let vc = SignUpVC()
        navigationController?.pushViewController(vc, animated: true)
    }
    

     

}
