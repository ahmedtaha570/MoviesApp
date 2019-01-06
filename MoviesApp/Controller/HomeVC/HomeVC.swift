//
//  HomeVC.swift
//  MoviesApp
//
//  Created by a7med on 1/4/19.
//  Copyright © 2019 a7med. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {
    
    lazy   var searchBar = UISearchBar(frame: CGRect(x: 0, y: 0, width: ((self.navigationController?.navigationBar.frame.width ?? 0) / 1.5)  , height: 20))
    lazy var favorite = UIBarButtonItem(image:#imageLiteral(resourceName: "favorite"), style: .plain, target: self, action: #selector(self.favoritePressed))
    lazy var srch = UIBarButtonItem(image: #imageLiteral(resourceName: "search"), style: .plain, target: self, action: #selector(self.searchPressed))
    var dataSource : Home_Base?
    
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    @IBOutlet weak var collection: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.backBarButtonItem?.title = ""
        searchBar.placeholder = "Search for a Movie "
        let leftNavBarButton = UIBarButtonItem(customView:searchBar)
        self.navigationItem.rightBarButtonItems = [favorite,srch,leftNavBarButton]
        GetLatestMovies()
        
        // Do any additional setup after loading the view.
    }
    
  
    @objc func searchPressed() {
        GetSearchMovie(searchBar.text ?? "")
    }
    @objc func favoritePressed()  {
        print("favbarPressed")
    }
    func FavoriteCellBtnPressed(_ cell: HomeCell) {
        print("FavoriteBtnPressed")
    }
    func shareCellBtnPressed(_ cell: HomeCell) {
        print("shareBtnPressed")
    }
    
    
}
