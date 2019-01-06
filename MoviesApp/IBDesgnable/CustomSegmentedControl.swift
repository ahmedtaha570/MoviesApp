//
//  CustomSegmentedControl.swift
//  Green Arrow
//
//  Created by OSX on 7/3/18.
//  Copyright © 2018 2Grand. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
class CustomSegmentedControl: UIControl {
    // change UIView to UIControl to be able for taking the view as Action
    var buttons = [UIButton]()
    var selector: UIView!
    var selectedSegmentIndex = 0
    
    @IBInspectable var borderColor: UIColor = UIColor.clear {
        didSet {
            layer.borderColor = borderColor.cgColor
        }
    }
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    @IBInspectable var commaSeparatedButtonTitles: String = "" {
        didSet {
            updateView()
        }
    }
    @IBInspectable var textColor: UIColor = .lightGray {
        didSet {
            updateView()
        }
    }
    @IBInspectable var hilightedColor: UIColor = .lightGray {
        didSet {
            updateView()
        }
    }
    @IBInspectable var selectorColor: UIColor = .lightGray {
        didSet {
            updateView()
        }
    }
    @IBInspectable var selectorTextColor: UIColor = .white {
        didSet {
            updateView()
        }
    }
    
    
    
    func updateView() {
        buttons.removeAll()
        subviews.forEach { $0.removeFromSuperview() }
        
        let buttonTitles = commaSeparatedButtonTitles.components(separatedBy: ",")
        for buttonTitle in buttonTitles {
            let button = UIButton(type: .system)
            button.setTitle(buttonTitle, for: .normal)
            button.setTitleColor(textColor, for: .normal)
            button.titleLabel?.adjustsFontSizeToFitWidth = true
            button.setTitleColor(hilightedColor, for: .highlighted)
            button.addTarget(self, action: #selector(buttonTapped(sender:)), for: .touchUpInside)
            buttons.append(button)
        }
        buttons[0].setTitleColor(selectorTextColor, for: .normal)
        
        let selectorWidth = self.frame.width / CGFloat(buttonTitles.count)
        selector = UIView(frame: CGRect(x: 0, y: 0, width: selectorWidth, height: frame.height))
        selector.backgroundColor = selectorColor
        //        selector.layer.cornerRadius = frame.height / 2
        self.addSubview(selector)
        
        let stackView = UIStackView(arrangedSubviews: buttons)
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height)
        self.addSubview(stackView)
        //        stackView.translatesAutoresizingMaskIntoConstraints = false
        //        stackView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        //        stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        //        stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        //        stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        
    }
    
    override func draw(_ rect: CGRect) {
        // Drawing code
        self.layer.cornerRadius = frame.height/2
        selector.layer.cornerRadius = frame.height/2
    }
    @objc func buttonTapped(sender: UIButton) {
        for (buttonIndex, btn) in buttons.enumerated() {
            btn.setTitleColor(textColor, for: .normal)
            if btn == sender {
                selectedSegmentIndex = buttonIndex
                btn.setTitleColor(selectorTextColor, for: .normal)
                let startedPosition = self.frame.width / CGFloat(buttons.count) * CGFloat(buttonIndex)
                print(startedPosition)
                UIView.animate(withDuration: 0.3, animations: {
                    self.selector.frame.origin.x = startedPosition
                })
            }
        }
        sendActions(for: .valueChanged)
    }
}
