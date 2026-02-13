//
//  ReciverChatTVCell.swift
//  AttendanceSystem
//
//  Created by iMac on 12/02/26.
//

import UIKit

class ReciverChatTVCell: UITableViewCell {

    @IBOutlet weak var lblMessage: AppLabel!
    @IBOutlet weak var lblTIme: AppLabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
