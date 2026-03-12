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

struct CalendarDayModel {
    let date: String
    let day: String
    let fullDate: Date
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
            tblViewInProgress.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 100, right: 0)
        }
    }
    @IBOutlet weak var tblViewPending: UITableView! {
        didSet {
            tblViewPending.register(TaskListTVCell.nib, forCellReuseIdentifier: TaskListTVCell.identifier)
            tblViewPending.dataSource = self
            tblViewPending.delegate = self
            tblViewPending.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 100, right: 0)
        }
    }
    @IBOutlet weak var tblVIewCompleted: UITableView! {
        didSet {
            tblVIewCompleted.register(TaskListTVCell.nib, forCellReuseIdentifier: TaskListTVCell.identifier)
            tblVIewCompleted.dataSource = self
            tblVIewCompleted.delegate = self
            tblVIewCompleted.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 100, right: 0)
        }
    }
    
    @IBOutlet weak var viewNoDataInProgress: UIView!
    @IBOutlet weak var viewNoDataPending: UIView!
    @IBOutlet weak var viewNoDataCompleted: UIView!
    
    @IBOutlet weak var viewCalander: UIView!
    @IBOutlet weak var calendarCollectionView: UICollectionView! {
        didSet {
            calendarCollectionView.delegate = self
            calendarCollectionView.dataSource = self
            calendarCollectionView.collectionViewLayout = flowLayout
            calendarCollectionView.register(CalendarDayCVCell.nib, forCellWithReuseIdentifier: CalendarDayCVCell.identifier)
        }
    }
    @IBOutlet weak var lblMonthAndYear: UILabel!
    
    
    var dates: [CalendarDayModel] = []
    var selectedIndex: Int = 0
    
    let calendar = Calendar.current
    var currentMonthDate = Date()
    
    let sectionInsets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
    let itemsPerRow: CGFloat = 1

    var flowLayout: UICollectionViewFlowLayout {
        let flowLayout = UICollectionViewFlowLayout()

        DispatchQueue.main.async {
            let paddingSpace = self.sectionInsets.left * (self.itemsPerRow + 1)
            let availableWidth = self.calendarCollectionView.frame.width - paddingSpace
            let widthPerItem = availableWidth / self.itemsPerRow

            flowLayout.itemSize = CGSize(width: 37, height: 60)

            flowLayout.sectionInset = self.sectionInsets
            flowLayout.scrollDirection = UICollectionView.ScrollDirection.horizontal
            flowLayout.minimumInteritemSpacing = 0
            flowLayout.minimumLineSpacing = 6
        }

        return flowLayout
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        segmentControl.selectedSegmentIndex = 0
        updateSegmentUI(selectedIndex: 0)
        
        setCurrentMonthTitle()
        generateDatesForCurrentMonth()
        setTodaySelected()
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
    
    @IBAction func tappedNewTask(_ sender: Any) {
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
    
    func setCurrentMonthTitle() {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM yyyy"
        lblMonthAndYear.text = formatter.string(from: currentMonthDate)
        print(formatter.string(from: currentMonthDate))
    }
    
    func generateDatesForCurrentMonth() {
        dates.removeAll()
        
        guard let monthRange = calendar.range(of: .day, in: .month, for: currentMonthDate),
              let startOfMonth = calendar.date(from: calendar.dateComponents([.year, .month], from: currentMonthDate)) else {
            return
        }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d"
        
        let dayFormatter = DateFormatter()
        dayFormatter.dateFormat = "EEE"
        
        for day in monthRange {
            if let date = calendar.date(byAdding: .day, value: day - 1, to: startOfMonth) {
                let model = CalendarDayModel(
                    date: dateFormatter.string(from: date),
                    day: dayFormatter.string(from: date),
                    fullDate: date
                )
                dates.append(model)
            }
        }
        
        calendarCollectionView.reloadData()
    }
    
    func setTodaySelected() {
        let today = Date()
        
        if let index = dates.firstIndex(where: { calendar.isDate($0.fullDate, inSameDayAs: today) }) {
            selectedIndex = index
            
            DispatchQueue.main.async {
                self.calendarCollectionView.reloadData()
                self.calendarCollectionView.scrollToItem(at: IndexPath(item: index, section: 0),
                                                         at: .centeredHorizontally,
                                                         animated: false)
            }
        } else {
            selectedIndex = 0
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

extension TaskVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dates.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = self.calendarCollectionView.dequeueReusableCell(withReuseIdentifier: "CalendarDayCVCell", for: indexPath) as! CalendarDayCVCell
        
        cell.configure(data: dates[indexPath.item], isSelected: selectedIndex == indexPath.item)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedIndex = indexPath.item
        calendarCollectionView.reloadData()
    }
}
