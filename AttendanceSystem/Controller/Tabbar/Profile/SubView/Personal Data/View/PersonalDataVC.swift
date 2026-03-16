//
//  PersonalDataVC.swift
//  AttendanceSystem
//
//  Created by Ankit on 16/02/26.
//

import UIKit

class PersonalDataVC: UIViewController {
    
    @IBOutlet weak var imgUser: UIImageView!
    @IBOutlet weak var lblUserName: UILabel!
    @IBOutlet weak var lblUserProfession: UILabel!
    @IBOutlet weak var txtFirstName: UITextField!
    @IBOutlet weak var txtLastName: UITextField!
    @IBOutlet weak var txtDOB: UITextField!
    @IBOutlet weak var txtPhoneNum: UITextField!
    @IBOutlet weak var txtPosition: UITextField!
    @IBOutlet weak var txtAddress: UITextField!
    
    var datePicker = UIDatePicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupDatePicker()
        getPersonalDate()
        // Do any additional setup after loading the view.
    }
    
    func getPersonalDate() {
        lblUserName.text = "\(WFUtilites.getCurrentUser()?.user?.firstName ?? "") \(WFUtilites.getCurrentUser()?.user?.lastName ?? "")"
        txtFirstName.text = WFUtilites.getCurrentUser()?.user?.firstName ?? ""
        txtLastName.text = WFUtilites.getCurrentUser()?.user?.lastName ?? ""
        txtPhoneNum.text = WFUtilites.getCurrentUser()?.user?.phone ?? ""
    }
    
    func setupDatePicker() {
        
        datePicker.datePickerMode = .date
        
        if #available(iOS 14.0, *) {
            datePicker.preferredDatePickerStyle = .wheels
        }
        
        datePicker.maximumDate = Date()
        
        txtDOB.inputView = datePicker
        
        // Toolbar
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneDatePicker))
        
        let space = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        toolbar.setItems([space, doneButton], animated: false)
        
        txtDOB.inputAccessoryView = toolbar
    }
    
    @objc func doneDatePicker() {
        
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMM yyyy"
        
        txtDOB.text = formatter.string(from: datePicker.date)
        
        view.endEditing(true)
    }

    @IBAction func tappedBack(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func tappedUpdateProfile(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
}
