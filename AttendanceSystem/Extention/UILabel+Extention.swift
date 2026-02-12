//
//  UILabel+Extention.swift
//  Toretto Recovery UAE
//
//  Created by Ankit on 08/01/26.
//

import Foundation
import UIKit

extension UILabel {
    func setLineHeight(_ lineHeight: CGFloat) {
        guard let text = self.text else { return }
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.minimumLineHeight = lineHeight
        paragraphStyle.maximumLineHeight = lineHeight
        paragraphStyle.alignment = self.textAlignment
        
        self.attributedText = NSAttributedString(
            string: text,
            attributes: [
                .paragraphStyle: paragraphStyle,
                .font: self.font!,
                .foregroundColor: self.textColor!
            ]
        )
    }
}

extension AppLabel {

    /// Sets label text with underline and required (*) mark
    func setRequiredText(
        _ text: String,
        underlineColor: UIColor = .systemBlue,
        textColor: UIColor = .label,
        requiredColor: UIColor = .systemRed,
        font: UIFont? = nil
    ) {

        let fullText = "\(text) *"

        let attributed = NSMutableAttributedString(
            string: fullText,
            attributes: [
                .font: font ?? self.font as Any,
                .foregroundColor: textColor
            ]
        )

        // Underline only main text
        attributed.addAttributes(
            [
                .underlineStyle: NSUnderlineStyle.single.rawValue,
                .underlineColor: underlineColor
            ],
            range: NSRange(location: 0, length: text.count)
        )

        // Red color for *
        attributed.addAttribute(
            .foregroundColor,
            value: requiredColor,
            range: NSRange(location: text.count + 1, length: 1)
        )

        self.attributedText = attributed
    }
}



extension UITapGestureRecognizer {
    func didTapAttributedText(in label: UILabel, inRange targetRange: NSRange) -> Bool {
        guard let attributedText = label.attributedText else { return false }

        let layoutManager = NSLayoutManager()
        let textContainer = NSTextContainer(size: label.bounds.size)
        let textStorage = NSTextStorage(attributedString: attributedText)

        layoutManager.addTextContainer(textContainer)
        textStorage.addLayoutManager(layoutManager)

        textContainer.lineFragmentPadding = 0
        textContainer.maximumNumberOfLines = label.numberOfLines
        textContainer.lineBreakMode = label.lineBreakMode

        let location = self.location(in: label)
        let index = layoutManager.characterIndex(
            for: location,
            in: textContainer,
            fractionOfDistanceBetweenInsertionPoints: nil
        )

        return NSLocationInRange(index, targetRange)
    }
}
