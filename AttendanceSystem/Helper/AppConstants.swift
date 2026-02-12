//
//  AppConstants.swift
//  Look_Vendor
//
//  Created by Ankit Gabani on 24/07/23.
//

import Foundation
import UIKit


extension UIViewController: Identifiable {
    
    static func instantiate(_ storyBoardName: String = "Main") ->
        UIViewController {
            let sceneStoryboard = UIStoryboard(name: storyBoardName, bundle: .main)

            return sceneStoryboard.instantiateViewController(withIdentifier: identifier)
    }
}

protocol Identifiable: AnyObject {
   /**
    The identifier to use when registering and later dequeuing
    a reusable cell. This will also acts as storyboardIdentifiers.
    */
   static var identifier: String { get }
}

/**
Make your `UITableViewCell` and `UICollectionViewCell` subclasses
conform to this typealias when they *are* NIB-based
to be able to dequeue them in a type-safe manner
*/
typealias NibReusable = Identifiable & NibLoadable

// MARK: - Default implementation

extension Identifiable {
   /**
    By default, use the name of the class as String for its reuseIdentifier
    */
   static var identifier: String {
       return String(describing: self)
   }
}

protocol NibLoadable: AnyObject {
    /**
     A `get-only` stored property for getting the name of nib. This property
     should not be set from an external class/structure.
     */
    static var nibName: String { get }
}

// MARK: - Default implementation

extension NibLoadable where Self: UIView {
    /**
     By default, use the name of the class as String for its reuseIdentifier
     */
    static var nibName: String {
        return String(describing: self)
    }

    /**
     Returns a `UINib` object with the name of `nibName` of the view from XIB.
    */
    static func nibForFile() -> UINib {
        return UINib(nibName: self.nibName, bundle: Bundle(for: self))
    }

    /**
     Returns a `UIView` object instantiated from nib
     - returns: A `NibLoadable`, `UIView` instance
     */
    static func instantiateFromNib() -> Self {
        return nibForFile().instantiate(withOwner: nil, options: nil).first
            as! Self
    }

}
