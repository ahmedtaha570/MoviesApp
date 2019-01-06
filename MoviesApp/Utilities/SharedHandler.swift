//
//  SharedHandler.swift
//  wuzfone
//
//  Created by Donna on 10/6/18.
//  Copyright © 2018 Madonna. All rights reserved.
//



import Foundation
import UIKit

class SharedHandler{
    
    static var sideButton : UIBarButtonItem!
    
    static func setSideImage()  {
        let image = UIImage(named: "ic_menu-web")
        
        sideButton = UIBarButtonItem(image: image,  style: .plain , target: self, action: Selector(("didTapEditButton:")))
    }
  
  
   
  
    static func getUserID() -> Int{
        let y = UserDefaults.standard.object(forKey: _ID) as? Int ?? 0
        return y
    }
    static func getUserType() -> Int{
        // false = jobSeeker , true = employer
        let y = UserDefaults.standard.object(forKey: _Type) as? Int ?? 0
        return y
    }
    
  static func ByGrand(flag: Bool) {
    let def = UserDefaults.standard
        def.setValue(flag,forKey: "Grand")
        def.synchronize()
    }
   
    
    static func createViewController( storyboardID : String ) -> UIViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: storyboardID )
        return controller
        
    }
   
    
    
    
    static  func roundCorners(_ lbl: UILabel,cornerRadius: Double) {
        let path = UIBezierPath(roundedRect: lbl.bounds, byRoundingCorners: [.topLeft, .bottomLeft], cornerRadii: CGSize(width: cornerRadius, height: cornerRadius))
        let maskLayer = CAShapeLayer()
        maskLayer.frame = lbl.bounds
        maskLayer.path = path.cgPath
        lbl.layer.mask = maskLayer
    }
    
    static func alertDialogawithSegue(_ sourceViewController: UIViewController,_ destinationViewController: UIViewController,_ title: String , _ message: String ,BtnTitle: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        
        // add an action (button)
        alert.addAction(UIAlertAction(title: BtnTitle, style: UIAlertAction.Style.default, handler: { (action) in
            
            sourceViewController.present(destinationViewController, animated: true, completion: nil)
        }))
        
        // show the alert
        sourceViewController.present(alert, animated: true, completion: nil)
        
    }
    
    static func alertDialogawithPopNavigationVC(_ sourceViewController: UIViewController,_ title: String , _ message: String ,BtnTitle: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        
        // add an action (button)
        alert.addAction(UIAlertAction(title: BtnTitle, style: UIAlertAction.Style.default, handler: { (action) in
            
            sourceViewController.navigationController?.popViewController(animated: true)
        }))
        
        // show the alert
        sourceViewController.present(alert, animated: true, completion: nil)
        
    }
    
 

   
    
    static func DissapearMessage(viewController: UIViewController,message: String,myHandler: (() -> Swift.Void)? = nil)
    {
        let alert = UIAlertController(title: "", message: message , preferredStyle: UIAlertController.Style.alert)
        
        viewController.present(alert, animated: true, completion: nil)
        
        // change to desired number of seconds
        let when = DispatchTime.now() + 1
        DispatchQueue.main.asyncAfter(deadline: when){
            alert.dismiss(animated: true, completion: nil)
        }
    }
    static func IsLogin() -> Bool{
       
        let y = UserDefaults.standard.object(forKey: _LoggedIn) as? Bool ?? false
        return y
    }
    static func getUserName() -> String{
        let y = UserDefaults.standard.object(forKey: _Name) as? String ?? ""
        return y
    }
    static func getUserDefault(of userDeafult : String) -> String {
        let y = UserDefaults.standard.object(forKey: userDeafult) as? String ?? ""
        return y
    }
    
    static func setUserDefault(_ Value : String, forKey : String)  {
        UserDefaults.standard.set(Value, forKey: forKey)
        UserDefaults.standard.synchronize()
        
    }
    static func getUserMail() -> String{
        let y = UserDefaults.standard.object(forKey: _Mail) as? String ?? ""
        return y
    }
    static func getUserID() -> String{
        let y = UserDefaults.standard.object(forKey: _ID) as? String ?? ""
        return y
    }
    static func getUserPhone() -> String{
        let y = UserDefaults.standard.object(forKey: _Phone) as? String ?? ""
        return y
    }
    static func getUserImage() -> String{
        let y = UserDefaults.standard.object(forKey: _IMAGE) as? String ?? ""
        return y
    }
    static func getUserGender(_ number: String) -> String{
        if number == "0"{
            return "Male"
            
        }else if number == "1" {
            return "Female"
            
        } else{
            return "Both"
        }
        
    }
    static func logout(){
//        UserDefaults.standard.set("", forKey: "firstname")
//        UserDefaults.standard.set("", forKey: "lastname")
        UserDefaults.standard.set("", forKey: _Name)
    UserDefaults.standard.set("", forKey: _ID)
        UserDefaults.standard.set("", forKey: _Type)
    UserDefaults.standard.set("", forKey: _Gender)
    UserDefaults.standard.set("", forKey: _Mail)
    UserDefaults.standard.set(false, forKey: _LoggedIn)
    UserDefaults.standard.set("", forKey: _Phone)
//    UserDefaults.standard.set("", forKey: "birth_date")
        UserDefaults.standard.set("", forKey: _IMAGE)
//    UserDefaults.standard.set("", forKey: "password")
    }
    
    
    static func startSpinner (_ Spinner: UIActivityIndicatorView, _ View: UIView){
        Spinner.startAnimating()
        Spinner.isHidden = false
        View.isHidden = true
        
    }
    static func stopSpinner (_ Spinner: UIActivityIndicatorView,_ View: UIView){
        Spinner.stopAnimating()
        Spinner.isHidden = true
         View.isHidden = false
        
    }
    static func alertDialog(_ viewController: UIViewController,_ title: String , _ message: String ,BtnTitle: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        
        // add an action (button)
        alert.addAction(UIAlertAction(title: BtnTitle, style: UIAlertAction.Style.default, handler: nil))
        
        // show the alert
        viewController.present(alert, animated: true, completion: nil)
        
    }
  
   
    
    
    static func alertDialogWithDismiss(_ viewController: UIViewController,_ title: String , _ message: String ,BtnTitle: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        
        // add an action (button) UIAlertAction(title: BtnTitle, style: UIAlertActionStyle.default, handler: nil)
        alert.addAction(UIAlertAction(title: BtnTitle, style: UIAlertAction.Style.default, handler: { (uialertaction) in
            print("inside alert closure")
            viewController.dismiss(animated: true, completion: nil)
        }))
        
        // show the alert
        viewController.present(alert, animated: true, completion: nil)
        
    }
    static func alertDialogWithPOpRootNavigation(_ viewController: UIViewController,_ title: String , _ message: String ,BtnTitle: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        
        // add an action (button) UIAlertAction(title: BtnTitle, style: UIAlertActionStyle.default, handler: nil)
        alert.addAction(UIAlertAction(title: BtnTitle, style: UIAlertAction.Style.default, handler: { (uialertaction) in
            print("inside alert closure")
            viewController.dismiss(animated: true, completion: nil)
        }))
        
        // show the alert
        viewController.navigationController?.popToRootViewController(animated: true)
        
    }
    
    static func createLabelNoResult(_ viewController : UIViewController){
        // CGRectMake has been deprecated - and should be let, not var
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: viewController.view.frame.width , height: 60 ))
        
        // you will probably want to set the font (remember to use Dynamic Type!)
        label.font = UIFont.preferredFont(forTextStyle: .headline)
        
        // and set the text color too - remember good contrast
        label.textColor = .black
        
        // may not be necessary (e.g., if the width & height match the superview)
        // if you do need to center, CGPointMake has been deprecated, so use this
        label.center = CGPoint(x: viewController.view.frame.width / 2.0, y: viewController.view.frame.height / 2.0)
        
        // this changed in Swift 3 (much better, no?)
        label.textAlignment = .center
        label.font = label.font.withSize(18)
            label.text = "No Data."
       
        
        viewController.view.addSubview(label)
    }
    
    static func isValidAction(textFeilds: [UITextField]) -> Bool {
        
        for myTextFeild in textFeilds {
            if (myTextFeild.text!.isEmpty) {
                return false
            }
        }
        return true
    }
}
