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
    
    @IBOutlet weak var btnCheckIn: UIButton!
    @IBOutlet weak var btnBreakIn: UIButton!
    @IBOutlet weak var btnBreakOut: UIButton!
    @IBOutlet weak var btnCheckOut: UIButton!
    
    var arrDay = ["Tuesday", "Wednesday", "Thursday"]
    var arrTime = ["09:00 AM - 06:00 PM", "09:00 AM - 06:00 PM", "09:00 AM - 06:00 PM"]
    
    var timer: Timer?
    
    var viewModel = HomeVM()
    var selectedAction: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        lblGreeting.text = "\(getGreeting())"
        lblUserName.text = "\(WFUtilites.getCurrentUser()?.user?.firstName ?? "") \(WFUtilites.getCurrentUser()?.user?.lastName ?? "")"
        
        bindViewModel()
        startTimer()
        callHomeAPI()
        // Do any additional setup after loading the view.
    }
    
    // MARK: - Bind ViewModel
    func bindViewModel() {
        viewModel.successHomeData = { [weak self] in
            guard let self = self else { return }
            self.setHomeData()
            self.showSuccessPopup()
        }
        
        viewModel.failureHomeData = { errorMessage in
            self.setUpMakeToast(msg: errorMessage)
        }
    }
    
    func callHomeAPI(isAction: Bool = false, action: String = "") {
        selectedAction = action
        viewModel.currentDate = Date.currentDateString()
        viewModel.currentTime = Date.currentTimeString()
        viewModel.action = action
        viewModel.getHomeData(isAction: isAction)
    }
    
    func setHomeData() {
        guard let data = viewModel.attendanceResponse else { return }
        
        lblShiftTiming.text = "\(data.workSchedule?.startTime ?? "--") - \(data.workSchedule?.endTime ?? "--")"
        lblWorkingHours.text = data.workSchedule?.workingHours ?? "--"
        lblBreakHours.text = "\(data.workSchedule?.breakMinutes ?? 0) Min"
        
        lblCheckIn.text = data.todaySummary?.checkIn ?? "--"
        lblBreakIn.text = data.todaySummary?.breakIn ?? "--"
        lblBreakOut.text = data.todaySummary?.breakOut ?? "--"
        lblCheckOut.text = data.todaySummary?.checkOut ?? "--"
        lblTotalHoursWorked.text = data.todaySummary?.totalHoursWorked ?? "--"
        lblTotalHoursBreaked.text = data.todaySummary?.totalHoursBreaked ?? "--"
    }
    
    func showSuccessPopup() {
        guard !selectedAction.isEmpty else { return }
        
        let vc = SuccessPopUp()
        vc.modalPresentationStyle = .overFullScreen
        
        switch selectedAction {
        case "check_in":
            vc.type = .checkIn
        case "break_in":
            vc.type = .breakIn
        case "break_out":
            vc.type = .breakOut
        case "check_out":
            vc.type = .checkOut
        default:
            return
        }
        
        self.present(vc, animated: false)
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
    
    @IBAction func tappedCheckIn(_ sender: Any) {
        callHomeAPI(isAction: true, action: "check_in")
    }
    
    @IBAction func tappedBreakIn(_ sender: Any) {
        callHomeAPI(isAction: true, action: "break_in")
    }
    
    @IBAction func tappedBreakOut(_ sender: Any) {
        callHomeAPI(isAction: true, action: "break_out")
    }
    
    @IBAction func tappedCheckOut(_ sender: Any) {
        callHomeAPI(isAction: true, action: "check_out")
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
