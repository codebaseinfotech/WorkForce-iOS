//
//  CheckInAndOutVC.swift
//  AttendanceSystem
//
//  Created by Ankit on 11/02/26.
//

import UIKit

class CheckInAndOutVC: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView! {
        didSet {
            scrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 50, right: 0)
        }
    }
    
    @IBOutlet weak var lblCurrentTime: UILabel!
    @IBOutlet weak var lblCurrentDate: UILabel!
    @IBOutlet weak var lblShiftTiming: UILabel!
    @IBOutlet weak var lblWorkingHours: UILabel!
    @IBOutlet weak var lblBreakHours: UILabel!
    @IBOutlet weak var lblCheckIn: UILabel!
    @IBOutlet weak var lblBreakIn: UILabel!
    @IBOutlet weak var lblBreakOut: UILabel!
    @IBOutlet weak var lblCheckOut: UILabel!
    @IBOutlet weak var lblTotalHoursBreaked: UILabel!
    @IBOutlet weak var lblTotalHoursWorked: UILabel!
    
    @IBOutlet weak var tblViewUpcomingShift: UITableView! {
        didSet {
            tblViewUpcomingShift.register(UINib(nibName: "UpcomingShiftsTVCell", bundle: nil), forCellReuseIdentifier: "UpcomingShiftsTVCell")
            tblViewUpcomingShift.dataSource = self
            tblViewUpcomingShift.delegate = self
            tblViewUpcomingShift.addObserver(self, forKeyPath: "contentSize", options: .new, context: nil)
        }
    }
    @IBOutlet weak var heightConstTblView: NSLayoutConstraint!
    @IBOutlet weak var lblGreeting: UILabel!
    @IBOutlet weak var lblUserName: UILabel!
    
    var arrDay = ["Tuesday", "Wednesday", "Thursday"]
    var arrTime = ["09:00 AM - 06:00 PM", "09:00 AM - 06:00 PM", "09:00 AM - 06:00 PM"]
    
    var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        lblGreeting.text = "\(getGreeting())"
        lblUserName.text = "\(WFUtilites.getCurrentUser()?.user?.firstName ?? "") \(WFUtilites.getCurrentUser()?.user?.lastName ?? "")"
        
        startTimer()
        // Do any additional setup after loading the view.
    }
    
    // MARK: - TV height set
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if(keyPath == "contentSize"){
            if let newvalue = change?[.newKey] {
                let newsize  = newvalue as! CGSize
                self.heightConstTblView.constant = newsize.height
            }
        }
    }
    
    func startTimer() {
        updateDateTime()
        timer = Timer.scheduledTimer(timeInterval: 1,
                                     target: self,
                                     selector: #selector(updateDateTime),
                                     userInfo: nil,
                                     repeats: true)
    }
    
    @objc func updateDateTime() {
        
        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = "hh:mm:ss a"
        lblCurrentTime.text = timeFormatter.string(from: Date())
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE, MMMM d, yyyy"
        lblCurrentDate.text = dateFormatter.string(from: Date())
    }

    // MARK: - Tabbar Action
    @IBAction func tappedTHome(_ sender: Any) {
        let vc = HomeVC()
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

extension CheckInAndOutVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrDay.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tblViewUpcomingShift.dequeueReusableCell(withIdentifier: "UpcomingShiftsTVCell") as! UpcomingShiftsTVCell
        
        cell.lblUpcomingShiftDay.text = arrDay[indexPath.row]
        cell.lblUpcomingShiftTime.text = arrTime[indexPath.row]
        
        return cell
    }
}
