//
//  Constants.swift
//  Kadi
//
//  Created by apple on 12/4/17.
//  Copyright © 2017 apple. All rights reserved.
//

// Constant.swift
import Foundation
import UIKit
// User info
let _IsAdmin = "isadmin"
let _Token = "FireBaseToken"
let _Type = "type"
let _LoggedIn = "loggedIn"
let _Registered = "registered"
let _Mail = "mail"
let _Phone = "phone"
let _ID = "id"
let _IMAGE = "image"
let _Verified = "verified"
let _DeviceID = "DeviceId"
let _Name = "name"
let _Address = "Address"
let _Gender = "gender"
let _IsParent = "isparent"
// About app = true , about school = false
var _AboutTag = false
// Device info
let APPversion = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as! String
let buildNumber = Bundle.main.object(forInfoDictionaryKey: "CFBundleVersion") as! String
let systemVersion = UIDevice.current.systemVersion
let DeviceModel = UIDevice.current.model
let DEVICE_ID = UIDevice.current.identifierForVendor!.uuidString
//typealias CompletionHandlerStatus = (_ success: Bool,_ status: String?) -> ()
//typealias CompletionHandler = (_ success: Bool,_ error: String? ,_ model: Any?) -> ()
////

//
//typealias CompletionHandlerBool = (_ success: Bool) -> ()
typealias CompletionHandler = (_ model: Any?) -> ()

let def = UserDefaults.standard


//   var arrcach = [SliderCell?](repeating: nil, count: 5)
