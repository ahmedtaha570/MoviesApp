//
//  URLs.swift
//  wuzfone
//
//  Created by Donna on 10/6/18.
//  Copyright © 2018 Madonna. All rights reserved.
//

import Foundation

class URLs{
    
    static let url   = "https://api.themoviedb.org/"
    
    static let imageUrl = "https://image.tmdb.org/t/p/w185_and_h278_bestv2"
    static let basic     = url   + "3/"
    static let guest_session     = basic   + "authentication/guest_session/new?api_key=\(APIManager.sharedInstance.api_key)"
    
   
    static let discover = basic + "discover/movie?api_key=\(APIManager.sharedInstance.api_key)"
    static let search = basic + "search/movie?api_key=\(APIManager.sharedInstance.api_key)"

    
static let movie = basic + "movie/"
    
  
}
