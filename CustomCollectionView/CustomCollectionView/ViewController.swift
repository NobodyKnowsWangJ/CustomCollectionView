//
//  ViewController.swift
//  CustomCollectionView
//
//  Created by 王 on 2017/07/19.
//  Copyright © 2017年 WangJun. All rights reserved.
//

import UIKit

class ViewController: UIViewController,MyViewControllerDelegate,UICollectionViewDataSource,UICollectionViewDelegate {
    
    @IBOutlet weak var collectionView: MyCustomCollectionView!
    
    let SCREEN_SIZE = UIScreen.main.bounds.size
    let viewModel = CustomViewModel()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.delegate = self
        viewModel.customDataSource = InputCollectionDataHelper.getMoneyCategoryDataSets()
        
        collectionView.register(UINib(nibName: "TypeCategoryCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "TypeCategoryCell")
        
        let layOut = UICollectionViewFlowLayout()
        layOut.itemSize = CGSize(width: (SCREEN_SIZE.width-25)/4, height: (SCREEN_SIZE.width-25)/4)
        layOut.minimumLineSpacing = 5
        layOut.minimumInteritemSpacing = 5
        collectionView.collectionViewLayout = layOut
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    func reloadView(){
        
    }
    func getCollectionViewStatus()->Bool{
        return collectionView.eidteStatus
    }
    
    
    //MARK: -UICollcetionViewDelegate
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.customDataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:TypeCategoryCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "TypeCategoryCell", for: indexPath) as! TypeCategoryCollectionViewCell
        
        let model:MoneyCategoryModel = (viewModel.customDataSource[indexPath.row])
        cell.titleLabel.text = model.type
        cell.categoryImage.image = UIImage(named: model.categoryImage)
        let status:Bool = getCollectionViewStatus()
        if status {
            cell.setDeleteBtnHidden(hidden: false)
            cell.deleteHandler = {
                () in
                self.viewModel.customDataSource.remove(at: indexPath.row)
                self.collectionView.eidteStatus = false
            }
            cell.shakeWithEdite()
        }else{
            cell.setDeleteBtnHidden(hidden: true)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Selected IndexPath:\(indexPath)")
    }
    
    //MARK: -iOS9+
    func collectionView(_ collectionView: UICollectionView, canMoveItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func collectionView(_ collectionView: UICollectionView, moveItemAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let obj = viewModel.customDataSource[sourceIndexPath.row]
        viewModel.customDataSource.remove(at: sourceIndexPath.row)
        viewModel.customDataSource.insert(obj, at: destinationIndexPath.row)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

