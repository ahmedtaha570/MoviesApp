//
//  ShadowView.swift
//  Toys
//
//  Created by apple on 6/20/18.
//  Copyright © 2018 apple. All rights reserved.
//

import UIKit


class ShadowView: UIView {
   
    override func awakeFromNib() {
        //self.layer.masksToBounds = true
        self.layer.cornerRadius = 10
        self.layer.shadowOpacity = 0.75
        self.layer.shadowRadius = 5
        self.layer.shadowColor = UIColor.black.cgColor
        super.awakeFromNib()
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
