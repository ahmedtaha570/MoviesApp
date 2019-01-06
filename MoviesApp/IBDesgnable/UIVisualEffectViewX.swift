//
//  UIVisualEffectViewX.swift
//  DesignableXTesting
//
//  Created by Mark Moeykens on 2/3/17.
//  Copyright © 2017 Moeykens. All rights reserved.
//

import UIKit

class UIVisualEffectViewX: UIVisualEffectView {

    // MARK: - Border
    
    @IBInspectable public var borderColor: UIColor = UIColor.clear {
        didSet {
            layer.borderColor = borderColor.cgColor
        }
    }
    
    @IBInspectable public var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable public var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
            if cornerRadius > 0 {
                clipsToBounds = true
            } else {
                clipsToBounds = false
            }
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
    
}
