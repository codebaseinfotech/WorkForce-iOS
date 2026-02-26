//
//  TaskListTVCell.swift
//  AttendanceSystem
//
//  Created by Ankit on 25/02/26.
//

import UIKit

class TaskListTVCell: UITableViewCell {
    
    @IBOutlet weak var lblTaskTitle: UILabel!
    @IBOutlet weak var lblTaskDis: UILabel!
    @IBOutlet weak var viewPriority: UIView!
    @IBOutlet weak var lblPriority: UILabel!
    @IBOutlet weak var lblTaskDate: UILabel!
    @IBOutlet weak var lblMessageCount: UILabel!
    @IBOutlet weak var imgUser1: UIImageView!
    @IBOutlet weak var imgUser2: UIImageView!
    @IBOutlet weak var imgUser3: UIImageView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
