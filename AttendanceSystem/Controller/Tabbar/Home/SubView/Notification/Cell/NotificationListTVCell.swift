//
//  NotificationListTVCell.swift
//  AttendanceSystem
//
//  Created by Ankit on 12/02/26.
//

import UIKit

class NotificationListTVCell: UITableViewCell {
    
    @IBOutlet weak var lblNotiTitle: UILabel!
    @IBOutlet weak var lblNotiTime: UILabel!
    @IBOutlet weak var lblNotiDis: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
