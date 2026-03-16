//
//  HomeVC.swift
//  AttendanceSystem
//
//  Created by Ankit on 10/02/26.
//

import UIKit

class HomeVC: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView! {
        didSet {
            scrollView.contentInset.bottom = 80
        }
    }
    @IBOutlet weak var imgUser: UIImageView!
    @IBOutlet weak var lblUserName: UILabel!
    @IBOutlet weak var lblUserprofession: UILabel!
    @IBOutlet weak var lblTodayDate: UILabel!
    @IBOutlet weak var lblCurrentTime: UILabel!
    @IBOutlet weak var lblShiftTiming: UILabel!
    @IBOutlet weak var lblWorkingHours: UILabel!
    @IBOutlet weak var btnBreakIn: UIButton!
    @IBOutlet weak var btnCheckOut: UIButton!
    @IBOutlet weak var lblCheckIn: UILabel!
    @IBOutlet weak var lblBreakIn: UILabel!
    @IBOutlet weak var lblBreakOut: UILabel!
    @IBOutlet weak var lblCheckOut: UILabel!
    @IBOutlet weak var lblTotalHourBreaked: UILabel!
    @IBOutlet weak var lblTotalHourWorked: UILabel!
    @IBOutlet weak var viewPriority: UIView!
    @IBOutlet weak var lblPriority: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var imgImployee1: UIImageView!
    @IBOutlet weak var imgImployee2: UIImageView!
    @IBOutlet weak var imgImployee3: UIImageView!
    @IBOutlet weak var lblCurrentTaskDate: UILabel!
    @IBOutlet weak var lblCurrentTaskMessage: UILabel!
    @IBOutlet weak var btnCheckIn: UIButton!
    @IBOutlet weak var btnBreakOut: UIButton!
    @IBOutlet weak var lblBreakDuration: UILabel!
    
    var timer: Timer?
    
    var viewModel = HomeVM()
    var selectedAction: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        lblUserName.text = "\(getGreeting())"
        lblUserprofession.text = "\(WFUtilites.getCurrentUser()?.user?.firstName ?? "") \(WFUtilites.getCurrentUser()?.user?.lastName ?? "")"
        
        bindViewModel()
        setCurrentDate()
        startTimer()
        
        callHomeAPI()
        // Do any additional setup after loading the view.
    }
    
    func bindViewModel() {
        viewModel.successHomeData = { [weak self] in
            guard let self = self else { return }
            self.setHomeData()
            self.showSuccessPopup()
        }
        
        viewModel.failureHomeData = { errorMessage in
            print("Home API Error:", errorMessage)
        }
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
        lblBreakDuration.text = "\(data.workSchedule?.breakMinutes ?? 0) Min"
        
        lblCheckIn.text = data.todaySummary?.checkIn ?? "--"
        lblBreakIn.text = data.todaySummary?.breakIn ?? "--"
        lblBreakOut.text = data.todaySummary?.breakOut ?? "--"
        lblCheckOut.text = data.todaySummary?.checkOut ?? "--"
        lblTotalHourWorked.text = data.todaySummary?.totalHoursWorked ?? "--"
        lblTotalHourBreaked.text = data.todaySummary?.totalHoursBreaked ?? "--"

    }
    
    func setCurrentDate() {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMM yyyy"
        
        let today = formatter.string(from: Date())
        lblTodayDate.text = "Today : \(today)"
    }
    
    func startTimer() {
        updateTime()
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
    }
    
    @objc func updateTime() {
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm a"
        
        let currentTime = formatter.string(from: Date())
        lblCurrentTime.text = "Current Time: \(currentTime)"
    }

    // MARK: - Tabbar Action
    @IBAction func tappedTCheckIn(_ sender: Any) {
        let vc = CheckInAndOutVC()
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
    
    @IBAction func tappedBreakIn(_ sender: Any) {
        callHomeAPI(isAction: true, action: "break_in")
    }
    
    @IBAction func tappedCheckOut(_ sender: Any) {
        callHomeAPI(isAction: true, action: "check_out")
    }
    
    @IBAction func tappedViewTask(_ sender: Any) {
    }
    
    @IBAction func tappedCheckIn(_ sender: Any) {
        callHomeAPI(isAction: true, action: "check_in")
    }
    
    @IBAction func tappedBreakOut(_ sender: Any) {
        callHomeAPI(isAction: true, action: "break_out")
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
