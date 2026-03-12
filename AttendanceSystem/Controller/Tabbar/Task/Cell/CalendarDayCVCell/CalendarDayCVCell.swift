//
//  CalendarDayCVCell.swift
//  AttendanceSystem
//
//  Created by Ankit on 09/03/26.
//

import UIKit

class CalendarDayCVCell: UICollectionViewCell {
    
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var lblDay: UILabel!
    @IBOutlet weak var viewMain: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(data: CalendarDayModel, isSelected: Bool) {
        lblDate.text = data.date
        lblDay.text = data.day
        
        if isSelected {
            viewMain.backgroundColor = #colorLiteral(red: 0.6745098039, green: 0.4156862745, blue: 0.9490196078, alpha: 1)
            viewMain.layer.borderColor = #colorLiteral(red: 0.8705882353, green: 0.8705882353, blue: 0.8705882353, alpha: 1)
            lblDate.textColor = .white
            lblDay.textColor = .white
        } else {
            viewMain.backgroundColor = .white
            viewMain.layer.borderColor = #colorLiteral(red: 0.8705882353, green: 0.8705882353, blue: 0.8705882353, alpha: 1)
            lblDate.textColor = .black
            lblDay.textColor = #colorLiteral(red: 0.5098039216, green: 0.5098039216, blue: 0.5098039216, alpha: 1)
        }
    }

}
