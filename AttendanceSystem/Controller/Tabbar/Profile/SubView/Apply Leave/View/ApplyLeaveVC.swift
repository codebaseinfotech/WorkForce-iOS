//
//  ApplyLeaveVC.swift
//  AttendanceSystem
//
//  Created by Ankit on 11/02/26.
//

import UIKit

class ApplyLeaveVC: UIViewController {
    
    @IBOutlet weak var txtLeaveType: UITextField!
    @IBOutlet weak var txtFromDate: UITextField!
    @IBOutlet weak var txtToDate: UITextField!
    @IBOutlet weak var txtTotalLeaveDays: UITextField!
    @IBOutlet weak var txtViewReasonForLeave: UITextView!
    @IBOutlet weak var lblSelectedDate: UILabel!
    @IBOutlet weak var switchHalfDay: UISwitch!
    @IBOutlet weak var imgDocument: UIImageView!
    @IBOutlet weak var svUploadPhoto: UIStackView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        let scaleX: CGFloat = 44.0 / 61.0
        let scaleY: CGFloat = 25.0 / 28.0
        
        switchHalfDay.transform = CGAffineTransform(scaleX: scaleX, y: scaleY)
        // Do any additional setup after loading the view.
    }

    @IBAction func tappedBack(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func tappedLeaveType(_ sender: Any) {
    }
    
    @IBAction func tappedFromDate(_ sender: Any) {
    }
    
    @IBAction func tappedToDate(_ sender: Any) {
    }
    
    @IBAction func tappedUploadDocument(_ sender: Any) {
    }
    
    @IBAction func tappedCancel(_ sender: Any) {
    }
    
    @IBAction func tappedSubmitLeave(_ sender: Any) {
    }
    
    
}
