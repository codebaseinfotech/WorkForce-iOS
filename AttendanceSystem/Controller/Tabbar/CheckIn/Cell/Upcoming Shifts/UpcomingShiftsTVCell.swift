//
//  UpcomingShiftsTVCell.swift
//  AttendanceSystem
//
//  Created by Ankit on 16/02/26.
//

import UIKit

class UpcomingShiftsTVCell: UITableViewCell {
    
    @IBOutlet weak var lblUpcomingShiftDay: UILabel!
    @IBOutlet weak var lblUpcomingShiftTime: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
