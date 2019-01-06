//
//  UITextViewX.swift
//  Wuzfone
//
//  Created by apple on 10/8/18.
//  Copyright © 2018 grand. All rights reserved.
//

import UIKit
@IBDesignable
class UITextViewX: UITextView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }
 
    @IBInspectable public var topLeftCorner: CGFloat = 0 {
        didSet {
            layer.cornerRadius = topLeftCorner
            layer.maskedCorners = [.layerMinXMinYCorner]
        }
    }
    @IBInspectable public var bottomRightCorner: CGFloat = 0 {
        didSet {
            layer.cornerRadius = bottomRightCorner
            layer.maskedCorners = [.layerMaxXMaxYCorner]
        }
    }
    @IBInspectable public var bottomleftCorner: CGFloat = 0 {
        didSet {
            layer.cornerRadius = bottomleftCorner
            layer.maskedCorners = [.layerMinXMaxYCorner]
        }
    }
    @IBInspectable public var toprightCorner: CGFloat = 0 {
        didSet {
            layer.cornerRadius = toprightCorner
            layer.maskedCorners = [.layerMaxXMinYCorner]
        }
    }
    
    @IBInspectable var borderColor: UIColor = .white {
        didSet {
            self.layer.borderColor = borderColor.cgColor
        }
    }
    @IBInspectable var borderwidth: CGFloat = 0 {
        didSet {
            self.layer.borderWidth = borderwidth
        }
    }
    @IBInspectable public var shadowOpacity: CGFloat = 0 {
        didSet {
            layer.shadowOpacity = Float(shadowOpacity)
        }
    }
    
    @IBInspectable public var shadowColor: UIColor = UIColor.gray {
        didSet {
            layer.shadowColor = shadowColor.cgColor
        }
    }
    
    @IBInspectable public var shadowRadius: CGFloat = 0 {
        didSet {
            layer.shadowRadius = shadowRadius
        }
    }
    
    @IBInspectable public var shadowOffsetY: CGFloat = 0 {
        didSet {
            layer.shadowOffset.height = shadowOffsetY
        }
    }

}
