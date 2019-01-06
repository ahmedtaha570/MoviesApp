//
//  MovieDataEx.swift
//  MoviesApp
//
//  Created by a7med on 1/6/19.
//  Copyright © 2019 a7med. All rights reserved.
//

import UIKit

extension MovieVC{
    func setMovieData() {
        let img = URLs.imageUrl + (datasource?.poster_path ?? "")
        var genres = ""
        for index in (datasource?.genres)!{
            genres.append("\(index.name ?? ""),")
        }
        movieTitle.text = datasource?.original_title ?? ""
        movieDescription.text = datasource?.overview ?? ""
        moviegenres.text = genres
        DispatchQueue.main.async {
            self.movieImage.sd_setImage(with: URL(string: img), completed: nil)
            
        }
        
    }
    func getMovie() {
        spinner.startAnimating()
        sview.isHidden = true
        spinner.isHidden = false
        
        
        APIManager.sharedInstance.getRequest("\(URLs.movie)\(movieId ?? 0)?api_key=\(APIManager.sharedInstance.api_key)") { (res) in
            if res.error != nil{
                SharedHandler.alertDialog(self, "Alert", res.error?.localizedDescription ?? "", BtnTitle: "Dismiss")
            }else{
                let decoder = JSONDecoder()
                do{
                    let model = try decoder.decode(Movie_Base.self, from: res.data!)
                    self.datasource = model
                    print(model)
                    self.setMovieData()
                }catch{
                    SharedHandler.alertDialog(self, "Alert", error.localizedDescription, BtnTitle: "Dismiss")
                }
                self.spinner.stopAnimating()
                self.sview.isHidden = false
                self.spinner.isHidden = true
                
            }
        }
    }
    
    func getSimilarMovie() {
        spinner.startAnimating()
        sview.isHidden = true
        spinner.isHidden = false
        
        
        APIManager.sharedInstance.getRequest("\(URLs.movie)\(movieId ?? 0)/similar?api_key=\(APIManager.sharedInstance.api_key)") { (res) in
            if res.error != nil{
                SharedHandler.alertDialog(self, "Alert", res.error?.localizedDescription ?? "", BtnTitle: "Dismiss")
            }else{
                let decoder = JSONDecoder()
                do{
                    let model = try decoder.decode(Similar_Base.self, from: res.data!)
                    self.similarDatasource = model
                    print(model)
                    self.collection.reloadData()
                }catch{
                    SharedHandler.alertDialog(self, "Alert", error.localizedDescription, BtnTitle: "Dismiss")
                }
                self.spinner.stopAnimating()
                self.sview.isHidden = false
                self.spinner.isHidden = true
                
            }
        }
    }
    
    func getMovieCast() {
        spinner.startAnimating()
        sview.isHidden = true
        spinner.isHidden = false
        
        
        APIManager.sharedInstance.getRequest("\(URLs.movie)\(movieId ?? 0)/credits?api_key=\(APIManager.sharedInstance.api_key)") { (res) in
            if res.error != nil{
                SharedHandler.alertDialog(self, "Alert", res.error?.localizedDescription ?? "", BtnTitle: "Dismiss")
            }else{
                let decoder = JSONDecoder()
                do{
                    let model = try decoder.decode(Cast_Base.self, from: res.data!)
                    self.castDatasource = model
                    print(model)
                    self.castCollection.reloadData()
                    self.crewCollection.reloadData()
                }catch{
                    SharedHandler.alertDialog(self, "Alert", error.localizedDescription, BtnTitle: "Dismiss")
                }
                self.spinner.stopAnimating()
                self.sview.isHidden = false
                self.spinner.isHidden = true
                
            }
        }
    }


}
