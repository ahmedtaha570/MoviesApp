//
//  extentions.swift
//  Green Arrow
//
//  Created by OSX on 7/4/18.
//  Copyright © 2018 2Grand. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    
    
  

    //Hide Keyboard
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    //Remove ViewController
    func removeViewControllerWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.removeViewController))
        view.addGestureRecognizer(tap)
    }
    
    @objc func removeViewController() {
        popUpDismissVC()
    }
    
    
    // POPUP PRESENT
    func popUpPresent(_ uivewController: UIViewController) {
        let transition = CATransition()
        transition.duration = 0.3
        transition.type = CATransitionType.fade
        transition.subtype = CATransitionSubtype.fromTop
        self.view.window?.layer.add(transition, forKey: kCATransition)
        present(uivewController, animated: false, completion: nil)
    }
    
    // CUSTOM PRESENT
    func CustomPresent(_ uivewController: UIViewController) {
        let transition = CATransition()
      transition.duration = 0.3
        transition.type = CATransitionType.fade
        transition.subtype = CATransitionSubtype.fromBottom
        self.view.window?.layer.add(transition, forKey: kCATransition)
        present(uivewController, animated: false, completion: nil)
    }
    
    func CustomPresentFromRight(_ uivewController: UIViewController) {
        let transition = CATransition()
        transition.duration = 0.3
        transition.type     = CATransitionType.push
        transition.subtype  = CATransitionSubtype.fromRight
        self.view.window?.layer.add(transition, forKey: kCATransition)
        present(uivewController, animated: false, completion: nil)
    }

    
    // POPUP DISMISS
    func popUpDismissVC() {
        let transition = CATransition()
        transition.duration = 0.3
        transition.type = CATransitionType.fade
        transition.subtype = CATransitionSubtype.fromRight
        self.view.window?.layer.add(transition, forKey: kCATransition)
        dismiss(animated: false, completion: nil)
    }
    
    func popUpDismissFromLeft() {
        let transition = CATransition()
        transition.duration = 0.3
        transition.type = CATransitionType.fade
        transition.subtype = CATransitionSubtype.fromLeft
        self.view.window?.layer.add(transition, forKey: kCATransition)
        dismiss(animated: false, completion: nil)
    }

    
    //View Controller Animation
    func showAnimate() {
        self.view.transform = CGAffineTransform(scaleX: 1.3 , y: 1.3)
        self.view.alpha = 0.0;
        UIView.animate(withDuration: 0.25) {
            self.view.alpha = 1.0
            self.view.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        }
    }
    
    func removeAnimation() {
        UIView.animate(withDuration: 0.25, animations: {
            self.view.transform = CGAffineTransform(scaleX: 1.3 , y: 1.3)
            self.view.alpha = 0.0;
        }) { (finished : Bool) in
            if finished {
                self.dismiss(animated: true, completion: nil)
            }
        }
    }
    
}
extension UILabel {
    @IBInspectable var localizedString: String {
        get {
            return ""
        }
        set(value) {
            self.text = NSLocalizedString(value, comment: "")
        }
    }
}

extension UITextField {
    
    @IBInspectable var localizedString: String {
        get {
            return ""
        }
        set(value) {
            self.text = NSLocalizedString(value, comment: "")
        }
    }
    
    @IBInspectable var PlaceholderLocalized: String {
        get {
            return ""
        }
        set(value) {
            self.placeholder = NSLocalizedString(value, comment: "")
        }
    }
}

extension UITextView {
    @IBInspectable var localizedString: String {
        get {
            return ""
        }
        set(value) {
            self.text = NSLocalizedString(value, comment: "")
        }
    }
}
extension CALayer {
    
    func addBorder(edge: UIRectEdge, color: UIColor, thickness: CGFloat) {
        
        let border = CALayer()
        
        switch edge {
        case UIRectEdge.top:
            border.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: thickness)
            break
        case UIRectEdge.bottom:
            border.frame = CGRect(x: 0, y: self.frame.height - thickness, width: self.frame.width, height: thickness)
            break
        case UIRectEdge.left:
            border.frame = CGRect(x: 0, y: 0, width: thickness, height: self.frame.height)
            break
        case UIRectEdge.right:
            border.frame = CGRect(x: self.frame.width - thickness, y: 0, width: thickness, height: self.frame.height)
            break
        default:
            //For Center Line
            border.frame = CGRect(x: self.frame.width/2 - thickness, y: 0, width: thickness, height: self.frame.height)
            break
        }
        
        border.backgroundColor = color.cgColor;
        self.addSublayer(border)
    }
}

extension  UITextField {
    
    static func isValidEmail(testStr: UITextField) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr.text)
    }
    
    
    static func compare(testStr: String , confirm: String) -> Bool{
        if testStr == confirm {
            return true
        }
        return false
    }
    
    static func isValidPassword(testStr: UITextField) -> Bool {
        if (testStr.text?.count)! >= 6 {
            return true
        }
        return false
    }

    
}


extension String {
    public func isPhone() -> Bool {
        if self.isAllDigits() == true {
            let phoneRegex = "966[0-9]{9}"
            let predicate = NSPredicate(format: "SELF MATCHES %@", phoneRegex)
            return  predicate.evaluate(with: self)
        } else {
            return false
        }
    }
    
    public func isNum() -> Bool {
        if self.isAllDigits() {
            return true
        } else {
            return false
        }
    }
    
    private func isAllDigits() -> Bool {
        let charcterSet  = NSCharacterSet(charactersIn: "+0123456789").inverted
        let inputString = self.components(separatedBy: charcterSet)
        let filtered = inputString.joined(separator: "")
        return  self == filtered
    }
    
    func encodeUrl() -> String
    {
        return self.addingPercentEncoding( withAllowedCharacters: NSCharacterSet.urlQueryAllowed)!
    }
    
    var fixedArabicURL: String?  {
        return self.addingPercentEncoding(withAllowedCharacters: CharacterSet.alphanumerics
            .union(CharacterSet.urlPathAllowed)
            .union(CharacterSet.urlHostAllowed))
    }
    
}


extension Int {
    init(_ range: Range<Int> ) {
        let delta = range.lowerBound < 0 ? abs(range.lowerBound) : 0
        let min = UInt32(range.lowerBound + delta)
        let max = UInt32(range.upperBound   + delta)
        self.init(Int(min + arc4random_uniform(max - min)) - delta)
    }
}


//function that receive the number of digits requested, calculates the range of the random number
func random(_ digits:Int) -> Int {
    let min = Int(pow(Double(10), Double(digits-1))) - 1
    let max = Int(pow(Double(10), Double(digits))) - 1
    return Int(Range(uncheckedBounds: (min, max)))
}

