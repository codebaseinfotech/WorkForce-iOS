//
//  AppLabel.swift
//  Toretto Recovery UAE
//
//  Created by Ankit on 08/01/26.
//

import Foundation
import UIKit

@IBDesignable
class AppLabel: UILabel {
    
    @IBInspectable var localizedKey: String = "" {
        didSet {
            text = localizedKey.localized
        }
    }
    
    @IBInspectable
    var lineHeight: CGFloat {
        get {
            return 0
        }
        set {
            guard let text = text else { return }
            
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.minimumLineHeight = newValue
            paragraphStyle.maximumLineHeight = newValue
            paragraphStyle.alignment = textAlignment
            
            attributedText = NSAttributedString(
                string: text,
                attributes: [
                    .paragraphStyle: paragraphStyle,
                    .font: font as Any,
                    .foregroundColor: textColor as Any
                ]
            )
        }
    }
}
