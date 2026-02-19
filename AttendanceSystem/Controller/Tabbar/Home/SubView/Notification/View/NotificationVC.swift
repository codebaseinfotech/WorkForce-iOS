//
//  NotificationVC.swift
//  AttendanceSystem
//
//  Created by Ankit on 12/02/26.
//

import UIKit

class NotificationVC: UIViewController {

    @IBOutlet weak var tblViewNotificationList: UITableView! {
        didSet {
            tblViewNotificationList.register(UINib(nibName: "NotificationListTVCell", bundle: nil), forCellReuseIdentifier: "NotificationListTVCell")
            tblViewNotificationList.dataSource = self
            tblViewNotificationList.delegate = self
            tblViewNotificationList.contentInset = UIEdgeInsets(top: 22, left: 0, bottom: 10, right: 0)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func tappedBack(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    

}

extension NotificationVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tblViewNotificationList.dequeueReusableCell(withIdentifier: "NotificationListTVCell") as! NotificationListTVCell
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
