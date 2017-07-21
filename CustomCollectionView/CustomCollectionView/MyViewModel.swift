//
//  MyViewModel.swift
//  CustomCollectionView
//
//  Created by 王 on 2017/07/20.
//  Copyright © 2017年 WangJun. All rights reserved.
//

import Foundation
import UIKit

@objc protocol MyViewControllerDelegate {
    func reloadView()
    func getCollectionViewStatus()->Bool
}

protocol ViewInterface {
    weak var delegate:MyViewControllerDelegate?{get set}
    
}

class CustomViewModel:NSObject,ViewInterface,UICollectionViewDelegate,UICollectionViewDataSource {

    weak var delegate: MyViewControllerDelegate?
    var customDataSource:[MoneyCategoryModel] = []
    
    //MARK: -UICollcetionViewDelegate
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return customDataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:TypeCategoryCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "TypeCategoryCell", for: indexPath) as! TypeCategoryCollectionViewCell
        
        let model:MoneyCategoryModel = (customDataSource[indexPath.row])
        cell.titleLabel.text = model.type
        cell.categoryImage.image = UIImage(named: model.categoryImage)
        if let tempDelegate = delegate {
            let status:Bool = tempDelegate.getCollectionViewStatus()
            if status {
                cell.shakeWithEdite()
            }
        }
        return cell
    }
}
