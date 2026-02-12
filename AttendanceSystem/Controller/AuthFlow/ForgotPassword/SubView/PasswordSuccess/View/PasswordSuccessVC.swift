//
//  PasswordSuccessVC.swift
//  AttendanceSystem
//
//  Created by Ankit on 10/02/26.
//

import UIKit

class PasswordSuccessVC: UIViewController {

    @IBOutlet weak var imgSuccess: UIImageView!
    
    var onSignIn: (() -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func tappedSignIn(_ sender: Any) {
        dismiss(animated: false) { [weak self] in
            self?.onSignIn?()
        }
    }
    

}
