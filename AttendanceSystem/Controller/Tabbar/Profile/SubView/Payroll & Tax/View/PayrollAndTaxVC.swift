//
//  PayrollAndTaxVC.swift
//  AttendanceSystem
//
//  Created by Ankit on 16/02/26.
//

import UIKit

class PayrollAndTaxVC: UIViewController {
    
    @IBOutlet weak var lblSelectedDate: UILabel!
    @IBOutlet weak var lblEmployeeId: UILabel!
    @IBOutlet weak var lblTotalWorkingDay: UILabel!
    @IBOutlet weak var lblPresentDays: UILabel!
    @IBOutlet weak var lblLeaveDays: UILabel!
    @IBOutlet weak var lblPaidLeaveDis: UILabel!
    @IBOutlet weak var lblTotalHours: UILabel!
    @IBOutlet weak var lblTotalWorkingHours: UILabel!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func tappedBack(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func tappedChangeDate(_ sender: Any) {
    }
    
    @IBAction func tappedSalaryCalculation(_ sender: Any) {
        let vc = SalaryCalculationVC()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func tappedDownloadSheet(_ sender: Any) {
    }
    

}
