//
//  AttendanceDetailsVC.swift
//  AttendanceSystem
//
//  Created by Ankit on 17/02/26.
//

import UIKit

class AttendanceDetailsVC: UIViewController {
    
    @IBOutlet weak var viewMap: UIView!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var lblLocation: UILabel!
    @IBOutlet weak var lblCheckIn: UILabel!
    @IBOutlet weak var lblBreakIn: UILabel!
    @IBOutlet weak var lblBreakout: UILabel!
    @IBOutlet weak var lblCheckOut: UILabel!
    @IBOutlet weak var lblTotalHours: UILabel!
    @IBOutlet weak var lblHoursWorked: UILabel!
    @IBOutlet weak var lblBreak: UILabel!
    @IBOutlet weak var lblExtraHours: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func tappedBack(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    

}
