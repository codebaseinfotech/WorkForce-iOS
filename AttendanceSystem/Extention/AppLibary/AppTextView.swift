//
//  AppTextView.swift
//  Toretto Recovery UAE
//
//  Created by Ankit on 08/01/26.
//

import Foundation
import UIKit

@IBDesignable
class AppTextView: UITextView {

    @IBInspectable var localizedKey: String = "" {
        didSet {
            text = localizedKey.localized
        }
    }
}
