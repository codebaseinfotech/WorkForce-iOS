//
//  ProfileVC.swift
//  AttendanceSystem
//
//  Created by Ankit on 11/02/26.
//

import UIKit

class ProfileVC: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView! {
        didSet {
            scrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 70, right: 0)
        }
    }
    
    @IBOutlet weak var imgProfile: UIImageView!
    @IBOutlet weak var lblUserName: UILabel!
    @IBOutlet weak var lblUserProfession: UILabel!
    @IBOutlet weak var lblEmail: UILabel!
    @IBOutlet weak var lblPhoneNum: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    // MARK: - Tabbar Action
    @IBAction func tappedTHome(_ sender: Any) {
        let vc = HomeVC()
        navigationController?.pushViewController(vc, animated: false)
    }
    
    @IBAction func tappedTCheckIn(_ sender: Any) {
        let vc = CheckInAndOutVC()
        navigationController?.pushViewController(vc, animated: false)
    }
    
    @IBAction func tappedTTask(_ sender: Any) {
        let vc = TaskVC()
        navigationController?.pushViewController(vc, animated: false)
    }
    
    @IBAction func tappedTAttendance(_ sender: Any) {
        let vc = AttendanceVC()
        navigationController?.pushViewController(vc, animated: false)
    }
    
    // MARK: - Actions
    @IBAction func tappedPersonalDate(_ sender: Any) {
    }
    
    @IBAction func tappedLocation(_ sender: Any) {
    }
    
    @IBAction func tappedLeaveReq(_ sender: Any) {
        let vc = ApplyLeaveVC()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func tappedPayroll(_ sender: Any) {
    }
    
    @IBAction func tappedChangePass(_ sender: Any) {
        let vc = ChangePasswordVC()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func tappedVersioning(_ sender: Any) {
    }
    
    @IBAction func tappedFaqs(_ sender: Any) {
    }
    
    @IBAction func tappedLogout(_ sender: Any) {
        let vc = LogoutPopUp()
        vc.modalPresentationStyle = .overFullScreen
        vc.screen = .logout
        self.present(vc, animated: false)
    }
    
    @IBAction func tappedDeleteAccount(_ sender: Any) {
        let vc = LogoutPopUp()
        vc.modalPresentationStyle = .overFullScreen
        vc.screen = .delete
        self.present(vc, animated: false)
    }
    
    

}
