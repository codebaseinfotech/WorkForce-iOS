//
//  SalaryCalculationVC.swift
//  AttendanceSystem
//
//  Created by Ankit on 16/02/26.
//

import UIKit

class SalaryCalculationVC: UIViewController {
    
    @IBOutlet weak var lblSalaryMonth: UILabel!
    @IBOutlet weak var lblBaseMonthlySalary: UILabel!
    @IBOutlet weak var lblPerDaySalary: UILabel!
    @IBOutlet weak var lblPresentDaysAmount: UILabel!
    @IBOutlet weak var lblLeaveDeductionAmount: UILabel!
    @IBOutlet weak var lblTotalPayableSalary: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func tappedBack(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    


}
