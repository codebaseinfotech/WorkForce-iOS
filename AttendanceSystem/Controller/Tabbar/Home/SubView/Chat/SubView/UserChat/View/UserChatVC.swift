//
//  UserChatVC.swift
//  AttendanceSystem
//
//  Created by Ankit on 12/02/26.
//

import UIKit

class UserChatVC: UIViewController {
    
    @IBOutlet weak var tblViewMessages: UITableView! {
        didSet {
            tblViewMessages.register(SenderChatTVCell.nib, forCellReuseIdentifier: SenderChatTVCell.identifier)
            tblViewMessages.register(ReciverChatTVCell.nib, forCellReuseIdentifier: ReciverChatTVCell.identifier)
            tblViewMessages.delegate = self
            tblViewMessages.dataSource = self
        }
    }
    @IBOutlet weak var imgUser: UIImageView!
    @IBOutlet weak var lblUserName: UILabel!
    @IBOutlet weak var lblTyping: UILabel!
    @IBOutlet weak var viewUserLive: UIView!
    @IBOutlet weak var txtChat: AppTextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func tappedBack(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func tappedVoiceMessage(_ sender: Any) {
    }
    
    @IBAction func tappedSendMessage(_ sender: Any) {
    }
    
    
}

extension UserChatVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tblViewMessages.dequeueReusableCell(withIdentifier: SenderChatTVCell.identifier) as! SenderChatTVCell
            
            return cell
        } else {
            let cell = tblViewMessages.dequeueReusableCell(withIdentifier: ReciverChatTVCell.identifier) as! ReciverChatTVCell
            
            return cell
        }
        
    }
    
    
}
