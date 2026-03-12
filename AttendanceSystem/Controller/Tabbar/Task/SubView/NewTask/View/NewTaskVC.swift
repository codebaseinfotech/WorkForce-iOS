//
//  NewTaskVC.swift
//  AttendanceSystem
//
//  Created by Ankit on 12/03/26.
//

import UIKit

class NewTaskVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func tappedBack(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    

}
