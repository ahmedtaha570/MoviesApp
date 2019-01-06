//
//  HomeCell.swift
//  MoviesApp
//
//  Created by a7med on 1/4/19.
//  Copyright © 2019 a7med. All rights reserved.
//

import UIKit
import SDWebImage

class HomeCell: UICollectionViewCell {
    weak var delegate: HomeVC?
    
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieImage: UIImageView!
    
    func configureCell(MovieTitle title: String ,MovieImage img: String )  {
        movieTitle.text = title
        DispatchQueue.main.async {
            self.movieImage.sd_setImage(with: URL(string: img), completed: nil)
            
        }
        
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.shadowOffset = CGSize(width: 5.0, height: 5.0)
        self.layer.shadowColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        self.layer.shadowOpacity = 1
        self.layer.cornerRadius = 5
        self.layer.shadowRadius = 5
    
       
       
        
    }
    @IBAction func likeBtnPressed(_ sender: UIButton) {
        delegate?.FavoriteCellBtnPressed(self)
    }
    
    @IBAction func ShareBtnPressed(_ sender: UIButton) {
        delegate?.shareCellBtnPressed(self)
    }
}
