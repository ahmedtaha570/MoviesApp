//
//  MovieEx.swift
//  MoviesApp
//
//  Created by a7med on 1/6/19.
//  Copyright © 2019 a7med. All rights reserved.
//

import UIKit

extension MovieVC: UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView.tag {
        case 0:
            return similarDatasource?.results?.count ?? 0
        case 1:
            return castDatasource?.cast?.count ?? 0
        default:
            return castDatasource?.crew?.count ?? 0
        }
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCell", for: indexPath) as! HomeCell

        switch collectionView.tag {
        case 0:
          
            let mt = similarDatasource?.results?[indexPath.row].original_title ?? ""
            let img = URLs.imageUrl + (similarDatasource?.results?[indexPath.row].poster_path ?? "")
            
            cell.configureCell(MovieTitle: mt , MovieImage: img)
        case 1:
            let mt = castDatasource?.cast?[indexPath.row].name ?? ""
            let img = URLs.imageUrl + (castDatasource?.cast?[indexPath.row].profile_path ?? "")
            
            cell.configureCell(MovieTitle: mt , MovieImage: img)
           
        default:
            let mt = castDatasource?.crew?[indexPath.row].name ?? ""
            let img = URLs.imageUrl + (castDatasource?.crew?[indexPath.row].profile_path ?? "")
            
            cell.configureCell(MovieTitle: mt , MovieImage: img)
        }
         return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.frame.width / 1.5) - 16
        let height = (collectionView.frame.height) - 16
        
        return CGSize(width: width, height: height)
    }
    
    
}
