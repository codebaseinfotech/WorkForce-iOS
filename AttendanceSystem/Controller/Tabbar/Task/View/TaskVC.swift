//
//  TaskVC.swift
//  AttendanceSystem
//
//  Created by Ankit on 11/02/26.
//

import UIKit

enum TaskSegment: Int {
    case inProgress = 0
    case pending = 1
    case completed = 2
}

class TaskVC: UIViewController {
    
    @IBOutlet weak var segmentControl: UISegmentedControl!
    @IBOutlet weak var imgUserProfile: UIImageView!
    @IBOutlet weak var lblUserName: UILabel!
    @IBOutlet weak var lblUserProfesion: UILabel!
    
    @IBOutlet weak var svInProgress: UIStackView!
    @IBOutlet weak var svPending: UIStackView!
    @IBOutlet weak var svCompleted: UIStackView!
    
    @IBOutlet weak var tblViewInProgress: UITableView! {
        didSet {
            tblViewInProgress.register(TaskListTVCell.nib, forCellReuseIdentifier: TaskListTVCell.identifier)
            tblViewInProgress.dataSource = self
            tblViewInProgress.delegate = self
            tblViewInProgress.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 60, right: 0)
        }
    }
    @IBOutlet weak var tblViewPending: UITableView! {
        didSet {
            tblViewPending.register(TaskListTVCell.nib, forCellReuseIdentifier: TaskListTVCell.identifier)
            tblViewPending.dataSource = self
            tblViewPending.delegate = self
            tblViewPending.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 60, right: 0)
        }
    }
    @IBOutlet weak var tblVIewCompleted: UITableView! {
        didSet {
            tblVIewCompleted.register(TaskListTVCell.nib, forCellReuseIdentifier: TaskListTVCell.identifier)
            tblVIewCompleted.dataSource = self
            tblVIewCompleted.delegate = self
            tblVIewCompleted.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 60, right: 0)
        }
    }
    
    @IBOutlet weak var viewNoDataInProgress: UIView!
    @IBOutlet weak var viewNoDataPending: UIView!
    @IBOutlet weak var viewNoDataCompleted: UIView!
    
    @IBOutlet weak var viewCalander: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        segmentControl.selectedSegmentIndex = 0
        updateSegmentUI(selectedIndex: 0)
        // Do any additional setup after loading the view.
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
    
    @IBAction func tappedYearDropDown(_ sender: Any) {
    }
    
    @IBAction func tappedSegmentControl(_ sender: UISegmentedControl) {
        updateSegmentUI(selectedIndex: sender.selectedSegmentIndex)
    }
    
    func updateSegmentUI(selectedIndex: Int) {
        
        guard let segment = TaskSegment(rawValue: selectedIndex) else { return }
        
        // Hide all first
        svInProgress.isHidden = true
        svPending.isHidden = true
        svCompleted.isHidden = true
        
        switch segment {
            
        case .inProgress:
            svInProgress.isHidden = false
            
        case .pending:
            svPending.isHidden = false
            
        case .completed:
            svCompleted.isHidden = false
        }
    }
    
}

extension TaskVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == tblViewInProgress {
            return 4
        } else if tableView == tblViewPending {
            return 3
        } else if tableView == tblVIewCompleted {
            return 2
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == tblViewInProgress {
            let cell = self.tblViewInProgress.dequeueReusableCell(withIdentifier: "TaskListTVCell") as! TaskListTVCell
            
            return cell
        } else if tableView == tblViewPending {
            let cell = self.tblViewInProgress.dequeueReusableCell(withIdentifier: "TaskListTVCell") as! TaskListTVCell
            
            return cell
        } else if tableView == tblVIewCompleted {
            let cell = self.tblViewInProgress.dequeueReusableCell(withIdentifier: "TaskListTVCell") as! TaskListTVCell
            
            return cell
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
