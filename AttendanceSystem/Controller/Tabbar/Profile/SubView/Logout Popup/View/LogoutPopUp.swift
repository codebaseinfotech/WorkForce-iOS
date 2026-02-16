//
//  LogoutPopUp.swift
//  AttendanceSystem
//
//  Created by Ankit on 16/02/26.
//

import UIKit

enum PopupType: String {
    case logout
    case delete
}

class LogoutPopUp: UIViewController {

    @IBOutlet weak var imgLogout: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDis: UILabel!
    @IBOutlet weak var btnLogout: UIButton!
    
    var screen: PopupType?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpScreens()
        // Do any additional setup after loading the view.
    }
    
    func setUpScreens() {
        switch screen {
        case .logout:
            imgLogout.image = UIImage(named: "img_logout")
            lblTitle.text = "Logout"
            lblDis.text = "Are you sure you want to log out?"
            btnLogout.setTitle("Logout", for: .normal)
        case .delete:
            imgLogout.image = UIImage(named: "img_delete")
            lblTitle.text = "Are you sure?"
            lblDis.text = "This action is permanent and cannot be reversed."
            btnLogout.setTitle("Delete", for: .normal)
        case nil:
            break
        }
    }

    @IBAction func tappedCancel(_ sender: Any) {
        self.dismiss(animated: false)
    }
    
    @IBAction func tappedLogout(_ sender: Any) {
    }
    
}
