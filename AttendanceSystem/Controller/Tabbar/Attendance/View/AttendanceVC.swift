//
//  AttendanceVC.swift
//  AttendanceSystem
//
//  Created by Ankit on 11/02/26.
//

import UIKit

class AttendanceVC: UIViewController {

    @IBOutlet weak var tblViewAttendanceList: UITableView! {
        didSet {
            tblViewAttendanceList.register(UINib(nibName: "AttendanceListTVCell", bundle: nil), forCellReuseIdentifier: "AttendanceListTVCell")
            tblViewAttendanceList.dataSource = self
            tblViewAttendanceList.delegate = self
            tblViewAttendanceList.addObserver(self, forKeyPath: "contentSize", options: .new, context: nil)
        }
    }
    
    @IBOutlet weak var scrollView: UIScrollView! {
        didSet {
            scrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 80, right: 0)
        }
    }
    @IBOutlet weak var tblVIewHeightConst: NSLayoutConstraint!
    @IBOutlet weak var lblGreeting: UILabel!
    @IBOutlet weak var lblUserName: UILabel!
    @IBOutlet weak var imgUser: UIImageView!
    
    var viewModel = AttendanceVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tblVIewHeightConst.constant = tblViewAttendanceList.rowHeight
        
        lblGreeting.text = "\(getGreeting())"
        lblUserName.text = "\(WFUtilites.getCurrentUser()?.user?.firstName ?? "") \(WFUtilites.getCurrentUser()?.user?.lastName ?? "")"
        
        setupCallbacks()
        // Do any additional setup after loading the view.
    }
    
    func setupCallbacks() {
        viewModel.getAttendanceList()
        viewModel.successAttendanceData = { [self] in
                        
            tblViewAttendanceList.reloadData()
        }
        viewModel.failureAttendanceData = { msg in
            self.setUpMakeToast(msg: msg)
        }
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
    
    // MARK: - TV height set
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if(keyPath == "contentSize"){
            if let newvalue = change?[.newKey] {
                let newsize  = newvalue as! CGSize
                self.tblVIewHeightConst.constant = newsize.height
            }
        }
    }
    
    func getGreeting() -> String {
        let hour = Calendar.current.component(.hour, from: Date())
        
        switch hour {
        case 0..<12:
            return "Good Morning"
        case 12..<17:
            return "Good Afternoon"
        case 17..<21:
            return "Good Evening"
        default:
            return "Good Night"
        }
    }

}

extension AttendanceVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.attendanceResponse?.attendances?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tblViewAttendanceList.dequeueReusableCell(withIdentifier: "AttendanceListTVCell", for: indexPath) as! AttendanceListTVCell
        
        let item = viewModel.attendanceResponse?.attendances?[indexPath.row]
        cell.lblDate.text = item?.date?.toDisplayDate()
        cell.lblCheckInTime.text = item?.checkIn ?? ""
        cell.lblCheckOutTime.text = item?.checkOut ?? ""
        
        cell.onViewTapped = {
            let vc = AttendanceDetailsVC()
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
