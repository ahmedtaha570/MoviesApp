//
//  MovieVC.swift
//  MoviesApp
//
//  Created by a7med on 1/5/19.
//  Copyright © 2019 a7med. All rights reserved.
//

import UIKit

class MovieVC: UIViewController {
    @IBOutlet weak var movieTitle: UILabel!
    
    @IBOutlet weak var crewCollection: UICollectionView!
    @IBOutlet weak var castCollection: UICollectionView!
    @IBOutlet weak var collection: UICollectionView!
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var moviegenres: UILabel!
    @IBOutlet weak var movieDescription: UILabel!
    @IBOutlet weak var sview: UIView!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    var movieId: Int?
    var datasource: Movie_Base?
    var similarDatasource: Similar_Base?
     var castDatasource: Cast_Base?
    override func viewDidLoad() {
        super.viewDidLoad()
        print("movie id ==>>\(movieId ?? 0)")
        getMovie()
        getSimilarMovie()
        getMovieCast()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func imdbBtnPrssed(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "webVC") as! webVC
        vc.link = "https://www.imdb.com/title/\(datasource?.imdb_id ?? "")"
        self.navigationController?.pushViewController(vc, animated: true)
    }
 
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        movieTitle.layer.shadowOffset = CGSize(width: 5.0, height: 5.0)
        movieTitle.layer.shadowColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        movieTitle.layer.shadowOpacity = 1
        movieTitle.layer.cornerRadius = 5
        movieTitle.layer.shadowRadius = 5
    }
    
    
   
    
}
