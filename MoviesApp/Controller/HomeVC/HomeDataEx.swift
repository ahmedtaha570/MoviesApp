//
//  HomeDataEx.swift
//  MoviesApp
//
//  Created by a7med on 1/5/19.
//  Copyright © 2019 a7med. All rights reserved.
//

import UIKit

extension HomeVC{
    func GetLatestMovies() {
        dataSource = nil
        spinner.isHidden = false
        spinner.startAnimating()
        collection.isHidden = true
        APIManager.sharedInstance.getRequest("\(URLs.discover)&primary_release_date.lte=\(APIManager.sharedInstance.returnDate())") { (res) in
            if res.error != nil{
                SharedHandler.alertDialog(self, "Alert", res.error?.localizedDescription ?? "", BtnTitle: "Dismiss")
            }else{
                let decoder = JSONDecoder()
                do{
                    let model = try decoder.decode(Home_Base.self, from: res.data!)
                    self.dataSource = model
                    self.collection.reloadData()
                    
                }catch{
                    SharedHandler.alertDialog(self, "Alert", error.localizedDescription, BtnTitle: "Dismiss")
                }
                self.spinner.isHidden = true
                self.spinner.stopAnimating()
                self.collection.isHidden = false
            }
        }
    }
    func GetSearchMovie(_ query: String) {
        spinner.isHidden = false
        spinner.startAnimating()
        collection.isHidden = true
        APIManager.sharedInstance.getRequest("\(URLs.search)&query=\(query)") { (res) in
            if res.error != nil{
                SharedHandler.alertDialog(self, "Alert", res.error?.localizedDescription ?? "", BtnTitle: "Dismiss")
            }else{
                let decoder = JSONDecoder()
                do{
                    let model = try decoder.decode(Home_Base.self, from: res.data!)
                    self.dataSource = model
                    self.collection.reloadData()
                    
                }catch{
                    SharedHandler.alertDialog(self, "Alert", error.localizedDescription, BtnTitle: "Dismiss")
                }
                self.spinner.isHidden = true
                self.spinner.stopAnimating()
                self.collection.isHidden = false
            }
        }
    }
   
}
