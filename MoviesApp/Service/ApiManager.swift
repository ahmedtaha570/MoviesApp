//
//  apiManager.swift
//  wuzfone
//
//  Created by Donna on 10/6/18.
//  Copyright © 2018 Madonna. All rights reserved.
//

import UIKit
//
//  apiManager.swift
//  adabBook
//
//  Created by apple on 9/17/18.
//  Copyright © 2018 Madonna. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class APIManager {
    
    let api_key = "b10db872d8a598d83dc4446f188f25ea"
    let API_Read_Access_Token = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJiMTBkYjg3MmQ4YTU5OGQ4M2RjNDQ0NmYxODhmMjVlYSIsInN1YiI6IjVjMmU2OGUwOTI1MTQxNWE5ODZjYjFhNSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.MZ7-GMW2QlzCkVbJ6jT94QrsTn2jV56Mf3_1Arq7jSk"
    let date = Date()
    let formatter = DateFormatter()
   
    
    //MARK: - Singlton
    class var sharedInstance : APIManager {
        struct Singlton {
            static let instance = APIManager()
        }
        
        return Singlton.instance
    }
    
    
    // MARK: - general request
    func getRequest(_ url : String ,completionHandler :@escaping (DataResponse<Any>) -> Void) {
        _ = Alamofire.request(url,method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseJSON { response in
            completionHandler(response)
        }
    }
    
    func getRequest(_ url : URL ,completionHandler :@escaping (DataResponse<Any>) -> Void) {
        _ = Alamofire.request(url,method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseJSON { response in
            completionHandler(response)
        }
    }
    
    
    func postRequest(_ url : String ,Parameters : [String: Any]?,completionHandler :@escaping (DataResponse<Any>) -> Void) {
        _ = Alamofire.request(url,method: .post, parameters: Parameters, encoding: JSONEncoding.default, headers: nil).responseJSON { response in
            completionHandler(response)
        }
    }
    func returnDate()-> String  {
        formatter.dateFormat = "yyyy-MM-dd"
        let result = formatter.string(from: date)
        return result
        
    }
   

}
