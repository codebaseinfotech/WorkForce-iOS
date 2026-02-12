//
//  SignatureView.swift
//  Toretto Recovery UAE
//
//  Created by Ankit on 19/01/26.
//

import Foundation
import UIKit

class SignatureView: UIView {

    private var path = UIBezierPath()
    private var previousPoint: CGPoint = .zero
    private var isDrawing = false

    // MARK: - Customization
    var strokeColor: UIColor = .black
    var strokeWidth: CGFloat = 3.0

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }

    private func commonInit() {
        backgroundColor = .clear
        isMultipleTouchEnabled = false
        path.lineCapStyle = .round
        path.lineJoinStyle = .round
    }

    // MARK: - Drawing
    override func draw(_ rect: CGRect) {
        strokeColor.setStroke()
        path.stroke()
    }

    // MARK: - Touch Handling
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        isDrawing = true
        previousPoint = touch.location(in: self)
        path.move(to: previousPoint)
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first, isDrawing else { return }
        let currentPoint = touch.location(in: self)
        path.addLine(to: currentPoint)
        previousPoint = currentPoint
        setNeedsDisplay()
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        isDrawing = false
    }

    // MARK: - Public Methods
    func clear() {
        path.removeAllPoints()
        setNeedsDisplay()
    }

    func getSignatureImage() -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(bounds.size, false, UIScreen.main.scale)
        drawHierarchy(in: bounds, afterScreenUpdates: true)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }

    func isSignatureEmpty() -> Bool {
        return path.isEmpty
    }
}
