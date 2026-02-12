//
//  AppButton.swift
//  Toretto Recovery UAE
//
//  Created by Ankit on 08/01/26.
//

import Foundation
import UIKit

@IBDesignable
class AppButton: UIButton {

    @IBInspectable var localizedKey: String = "" {
        didSet {
            setTitle(localizedKey.localized, for: .normal)
        }
    }
}
