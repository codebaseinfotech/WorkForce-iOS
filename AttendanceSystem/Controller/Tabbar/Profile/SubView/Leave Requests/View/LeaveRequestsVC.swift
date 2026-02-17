//
//  LeaveRequestsVC.swift
//  AttendanceSystem
//
//  Created by Ankit on 17/02/26.
//

import UIKit

enum LeaveStatus: Int {
    case pending = 0
    case approved = 1
    case rejected = 2
}

class LeaveRequestsVC: UIViewController {
    
    @IBOutlet weak var statusSegment: UISegmentedControl!
    
    @IBOutlet weak var svMainPending: UIStackView!
    @IBOutlet weak var svMainAccepted: UIStackView!
    @IBOutlet weak var svMainRejected: UIStackView!
    
    @IBOutlet weak var tblViewPending: UITableView! {
        didSet {
            tblViewPending.register(LeaveRequestListTVCell.nib, forCellReuseIdentifier: LeaveRequestListTVCell.identifier)
            tblViewPending.dataSource = self
            tblViewPending.delegate = self
        }
    }
    @IBOutlet weak var tblViewAccepted: UITableView! {
        didSet {
            tblViewAccepted.register(LeaveRequestListTVCell.nib, forCellReuseIdentifier: LeaveRequestListTVCell.identifier)
            tblViewAccepted.dataSource = self
            tblViewAccepted.delegate = self
        }
    }
    @IBOutlet weak var tblViewRejected: UITableView! {
        didSet {
            tblViewRejected.register(LeaveRequestListTVCell.nib, forCellReuseIdentifier: LeaveRequestListTVCell.identifier)
            tblViewRejected.dataSource = self
            tblViewRejected.delegate = self
        }
    }
    
    @IBOutlet weak var viewPendingNoData: UIView!
    @IBOutlet weak var viewAcceptedNoData: UIView!
    @IBOutlet weak var viewRejectedNoData: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupSegment()
        updateSegmentTitles()
        // Do any additional setup after loading the view.
    }
    
    func updateSegmentTitles() {
        statusSegment.setTitle("Pending (\(3))", forSegmentAt: 0)
        statusSegment.setTitle("Approved (\(5))", forSegmentAt: 1)
        statusSegment.setTitle("Rejected (\(0))", forSegmentAt: 2)
    }

    @IBAction func tappedBack(_ sender: Any) {
        
    }
    
    private func setupSegment() {
        statusSegment.selectedSegmentIndex = 0
        statusSegment.addTarget(self, action: #selector(segmentChanged(_:)), for: .valueChanged)
        
        // Default load
        if let status = LeaveStatus(rawValue: statusSegment.selectedSegmentIndex) {
            handleSegmentChange(status: status)
        }
    }
    
    @objc private func segmentChanged(_ sender: UISegmentedControl) {
        guard let status = LeaveStatus(rawValue: sender.selectedSegmentIndex) else { return }
        handleSegmentChange(status: status)
    }
    
    private func handleSegmentChange(status: LeaveStatus) {
        switch status {
        case .pending:
            svMainPending.isHidden = false
            svMainAccepted.isHidden = true
            svMainRejected.isHidden = true
            
        case .approved:
            svMainPending.isHidden = true
            svMainAccepted.isHidden = false
            svMainRejected.isHidden = true
            
        case .rejected:
            svMainPending.isHidden = true
            svMainAccepted.isHidden = true
            svMainRejected.isHidden = false
        }
    }

}

extension LeaveRequestsVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == tblViewPending {
            return 5
        } else if tableView == tblViewAccepted {
            return 4
        } else if tableView == tblViewRejected {
            return 3
        }
        
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tblViewPending.dequeueReusableCell(withIdentifier: "LeaveRequestListTVCell") as! LeaveRequestListTVCell
        
        return cell
    }
    
    
}
