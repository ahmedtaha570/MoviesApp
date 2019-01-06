//
//  DesignableUITextField.swift
//  SkyApp
//
//  Created by Mark Moeykens on 12/16/16.
//  Copyright © 2016 Mark Moeykens. All rights reserved.
//

import UIKit

@IBDesignable

class UITextFieldX: UITextField {
    
    @IBInspectable var leftImage: UIImage? {
        didSet {
            self.updateView()
        }
    }
    
  
    
    @IBInspectable var leftPadding: CGFloat = 0 {
        didSet {
            updateView()
        }
    }
  
    @IBInspectable var hieghtImage: CGFloat = 0 {
        didSet {
            updateView()
        }
    }
    @IBInspectable var widthImage: CGFloat = 0 {
        didSet {
            updateView()
        }
    }
    
    @IBInspectable var rightImage: UIImage? {
        didSet {
            updateView()
        }
    }
    
    @IBInspectable var rightPadding: CGFloat = 0 {
        didSet {
            updateView()
        }
    }
    
    private var _isRightViewVisible: Bool = true
    var isRightViewVisible: Bool {
        get {
            return _isRightViewVisible
        }
        set {
            _isRightViewVisible = newValue
            updateView()
        }
    }
    
    func updateView() {
        setLeftImage()
        setRightImage()
        
        // Placeholder text color
        self.attributedPlaceholder = NSAttributedString(string: placeholder != nil ?  placeholder! : "", attributes:[NSAttributedString.Key.foregroundColor: tintColor])
    }
    
    func setLeftImage() {
        leftViewMode = UITextField.ViewMode.always
        var view: UIView
        
        if let image = leftImage {
            let imageView = UIImageView(frame: CGRect(x: leftPadding, y: 0, width: widthImage, height: hieghtImage))
            imageView.image = image
            // Note: In order for your image to use the tint color, you have to select the image in the Assets.xcassets and change the "Render As" property to "Template Image".
            imageView.tintColor = tintColor
            
            var width = imageView.frame.width + leftPadding
            
            if borderStyle == UITextField.BorderStyle.none || borderStyle == UITextField.BorderStyle.line {
                width += 5
            }
            
            view = UIView(frame: CGRect(x: 0, y: 0, width: width, height: hieghtImage))
            view.addSubview(imageView)
        } else {
            view = UIView(frame: CGRect(x: 0, y: 0, width: leftPadding, height: hieghtImage))
        }
        
        leftView = view
    }
    
    func setLeftlbl(text: String) {
        leftViewMode = UITextField.ViewMode.always
        var view: UIView
                       let lblView = UILabel(frame: CGRect(x: leftPadding, y: 0, width: 40, height: 20))
            lblView.text = text
        lblView.backgroundColor = .clear
        lblView.textColor = .white
            // Note: In order for your image to use the tint color, you have to select the image in the Assets.xcassets and change the "Render As" property to "Template Image".
            lblView.tintColor = tintColor
            
            var width = lblView.frame.width + leftPadding
            
            if borderStyle == UITextField.BorderStyle.none || borderStyle == UITextField.BorderStyle.line {
                width += 5
            }
                        view = UIView(frame: CGRect(x: 0, y: 0, width: width, height: hieghtImage))
            view.addSubview(lblView)
               leftView = view
    }
    
 
    
    func setRightImage() {
        rightViewMode = UITextField.ViewMode.always
        
        var view: UIView
        
        if let image = rightImage, isRightViewVisible {
            let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: widthImage, height: hieghtImage))
            imageView.image = image
            // Note: In order for your image to use the tint color, you have to select the image in the Assets.xcassets and change the "Render As" property to "Template Image".
            imageView.tintColor = tintColor
            
            var width = imageView.frame.width + rightPadding
            
            if borderStyle == UITextField.BorderStyle.none || borderStyle == UITextField.BorderStyle.line {
                width += 5
            }
            
            view = UIView(frame: CGRect(x: 0, y: 0, width: width, height: hieghtImage))
            view.addSubview(imageView)
            
        } else {
            view = UIView(frame: CGRect(x: 0, y: 0, width: rightPadding, height: hieghtImage))
        }
        
        rightView = view
    }
    
    
    // MARK: - Corner Radius
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }
//    @IBInspectable public var topLeftCorner: CGFloat = 0 {
//        didSet {
//            layer.cornerRadius = topLeftCorner
//            layer.maskedCorners = [.layerMinXMinYCorner]
//        }
//    }
//    @IBInspectable public var bottomRightCorner: CGFloat = 0 {
//        didSet {
//            layer.cornerRadius = bottomRightCorner
//            layer.maskedCorners = [.layerMaxXMaxYCorner]
//        }
//    }
//    @IBInspectable public var bottomleftCorner: CGFloat = 0 {
//        didSet {
//            layer.cornerRadius = bottomleftCorner
//            layer.maskedCorners = [.layerMinXMaxYCorner]
//        }
//    }
//    @IBInspectable public var toprightCorner: CGFloat = 0 {
//        didSet {
//            layer.cornerRadius = toprightCorner
//            layer.maskedCorners = [.layerMaxXMinYCorner]
//        }
//    }
    
    
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            self.layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var borderColor: UIColor = UIColor.clear {
        didSet {
            layer.borderColor = borderColor.cgColor
        }
    }
    
}
