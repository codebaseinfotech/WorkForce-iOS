//
//  TaskVC.swift
//  AttendanceSystem
//
//  Created by Ankit on 11/02/26.
//

import UIKit

class TaskVC: UIViewController {
    
    @IBOutlet weak var segmentControl: UISegmentedControl!
    @IBOutlet weak var imgUserProfile: UIImageView!
    @IBOutlet weak var lblUserName: UILabel!
    @IBOutlet weak var lblUserProfesion: UILabel!
    
    @IBOutlet weak var svInProgress: UIStackView!
    @IBOutlet weak var svPending: UIStackView!
    @IBOutlet weak var svCompleted: UIStackView!
    
    @IBOutlet weak var tblViewInProgress: UITableView!
    @IBOutlet weak var tblViewPending: UITableView!
    @IBOutlet weak var tblVIewCompleted: UITableView!
    
    @IBOutlet weak var viewNoDataInProgress: UIView!
    @IBOutlet weak var viewNoDataPending: UIView!
    @IBOutlet weak var viewNoDataCompleted: UIView!
    
    
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
    
    @IBAction func tappedTAttendance(_ sender: Any) {
        let vc = AttendanceVC()
        navigationController?.pushViewController(vc, animated: false)
    }
    
    @IBAction func tappedTProfile(_ sender: Any) {
        let vc = ProfileVC()
        navigationController?.pushViewController(vc, animated: false)
    }
    
    // MARK: - Actions
    @IBAction func tappedChat(_ sender: Any) {
        let vc = ChatVC()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func tappedNotification(_ sender: Any) {
        let vc = NotificationVC()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func tappedYearDropDown(_ sender: Any) {
    }
    
    
    
}
