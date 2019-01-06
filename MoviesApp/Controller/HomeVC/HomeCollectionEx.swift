//
//  HomeEx.swift
//  MoviesApp
//
//  Created by a7med on 1/4/19.
//  Copyright © 2019 a7med. All rights reserved.
//

import UIKit

extension HomeVC: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        //1
        switch kind {
        //2
        case UICollectionView.elementKindSectionHeader:
            //3
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                             withReuseIdentifier: "HomeSectionCell",
                                                                             for: indexPath) as! HomeSectionCell
            headerView.sectionTitle.text = " Latest Movies"
            return headerView
        default:
            //4
            assert(false, "Unexpected element kind")
        }

    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource?.results?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCell", for: indexPath) as! HomeCell
        let mt = dataSource?.results?[indexPath.row].original_title ?? ""
        let img = URLs.imageUrl + (dataSource?.results?[indexPath.row].poster_path ?? "")
        cell.delegate = self
        cell.configureCell(MovieTitle: mt , MovieImage: img)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.frame.width / 2) - 16
        let height = (collectionView.frame.height / 2.3) - 32
        
        return CGSize(width: width, height: height)
    }
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        print("item\(indexPath.item)")
        print("row\(indexPath.row)")
        var itemCount = indexPath.item
        let arrayCount = dataSource?.results?.count ?? 0
        if itemCount == (arrayCount - 1) {
          
            
        }else{
           print("No scrolling ")
        }
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       let vc = self.storyboard?.instantiateViewController(withIdentifier: "MovieVC") as! MovieVC
        vc.movieId = dataSource?.results?[indexPath.row].id ?? 0
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
}
