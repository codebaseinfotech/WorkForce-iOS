//
//  HomeVC.swift
//  AttendanceSystem
//
//  Created by Ankit on 10/02/26.
//

import UIKit

class HomeVC: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView! {
        didSet {
            scrollView.contentInset.bottom = 80
        }
    }
    @IBOutlet weak var imgUser: UIImageView!
    @IBOutlet weak var lblUserName: UILabel!
    @IBOutlet weak var lblUserprofession: UILabel!
    @IBOutlet weak var lblTodayDate: UILabel!
    @IBOutlet weak var lblCurrentTime: UILabel!
    @IBOutlet weak var lblShiftTiming: UILabel!
    @IBOutlet weak var lblWorkingHours: UILabel!
    @IBOutlet weak var btnBreakIn: UIButton!
    @IBOutlet weak var btnCheckOut: UIButton!
    @IBOutlet weak var lblCheckIn: UILabel!
    @IBOutlet weak var lblBreakIn: UILabel!
    @IBOutlet weak var lblBreakOut: UILabel!
    @IBOutlet weak var lblCheckOut: UILabel!
    @IBOutlet weak var lblTotalHourBreaked: UILabel!
    @IBOutlet weak var lblTotalHourWorked: UILabel!
    @IBOutlet weak var viewPriority: UIView!
    @IBOutlet weak var lblPriority: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var imgImployee1: UIImageView!
    @IBOutlet weak var imgImployee2: UIImageView!
    @IBOutlet weak var imgImployee3: UIImageView!
    @IBOutlet weak var lblCurrentTaskDate: UILabel!
    @IBOutlet weak var lblCurrentTaskMessage: UILabel!
    @IBOutlet weak var btnCheckIn: UIButton!
    @IBOutlet weak var btnBreakOut: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    // MARK: - Tabbar Action
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
    
    @IBAction func tappedBreakIn(_ sender: Any) {
    }
    
    @IBAction func tappedCheckOut(_ sender: Any) {
    }
    
    @IBAction func tappedViewTask(_ sender: Any) {
    }
    
    @IBAction func tappedCheckIn(_ sender: Any) {
    }
    
    @IBAction func tappedBreakOut(_ sender: Any) {
    }
}
