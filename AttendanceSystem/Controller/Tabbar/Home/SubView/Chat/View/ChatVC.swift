//
//  ChatVC.swift
//  AttendanceSystem
//
//  Created by Ankit on 12/02/26.
//

import UIKit

class ChatVC: UIViewController {
    
    @IBOutlet weak var tblViewChatList: UITableView! {
        didSet {
            tblViewChatList.register(UINib(nibName: "ChatListTVCell", bundle: nil), forCellReuseIdentifier: "ChatListTVCell")
            tblViewChatList.dataSource = self
            tblViewChatList.delegate = self
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

extension ChatVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tblViewChatList.dequeueReusableCell(withIdentifier: "ChatListTVCell") as! ChatListTVCell
        
        return cell
    }
}
