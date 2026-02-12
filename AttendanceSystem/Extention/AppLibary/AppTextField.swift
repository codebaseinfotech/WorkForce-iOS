//
//  AppTextField.swift
//  Toretto Recovery UAE
//
//  Created by Ankit on 08/01/26.
//

import Foundation
import UIKit

@IBDesignable
class AppTextField: UITextField {

    @IBInspectable var localizedKey: String = "" {
        didSet {
            placeholder = localizedKey.localized
        }
    }
}
