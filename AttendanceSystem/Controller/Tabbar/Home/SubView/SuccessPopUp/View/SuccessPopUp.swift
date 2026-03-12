//
//  SuccessPopUp.swift
//  AttendanceSystem
//
//  Created by Ankit on 12/03/26.
//

import UIKit

enum SuccessType {
    case checkIn
    case checkOut
    case breakIn
    case breakOut
}

class SuccessPopUp: UIViewController {
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDis: UILabel!
    
    var type: SuccessType?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        switch type {
        case .checkIn:
            lblTitle.text = "Check-In Successful"
            lblDis.text = "Your attendance has been recorded for the scheduled shift."
            
        case .checkOut:
            lblTitle.text = "Check-Out Successful"
            lblDis.text = "Your attendance has been recorded for the end of today’s shift."
            
        case .breakIn:
            lblTitle.text = "Break Started Successfully"
            lblDis.text = "Your break has been recorded as per your schedule."
            
        case .breakOut:
            lblTitle.text = "Break Ended Successfully"
            lblDis.text = "Your break period has been recorded as completed."
            
        default:
            break
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.dismiss(animated: false)
        }
        // Do any additional setup after loading the view.
    }



}
