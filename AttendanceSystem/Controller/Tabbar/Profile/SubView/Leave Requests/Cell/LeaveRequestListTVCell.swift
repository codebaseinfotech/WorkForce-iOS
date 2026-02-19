//
//  LeaveRequestListTVCell.swift
//  AttendanceSystem
//
//  Created by Ankit on 17/02/26.
//

import UIKit

class LeaveRequestListTVCell: UITableViewCell {
    
    @IBOutlet weak var viewMessageCount: UIView!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var viewStatus: UIView!
    @IBOutlet weak var lblStatus: UILabel!
    @IBOutlet weak var lblLeaveType: UILabel!
    @IBOutlet weak var lblStartDate: UILabel!
    @IBOutlet weak var lblEndDate: UILabel!
    @IBOutlet weak var imgProfile: UIImageView!
    @IBOutlet weak var lblMessageCount: UILabel!
    @IBOutlet weak var imgVerticleLine: UIImageView!
    @IBOutlet weak var imgFilledCircle: UIImageView!
    @IBOutlet weak var imgCheck: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
