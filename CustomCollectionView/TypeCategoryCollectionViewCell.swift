//
//  TypeCategoryCollectionViewCell.swift
//  CuteMoneyRecord
//
//  Created by 王 on 2017/07/12.
//  Copyright © 2017年 WangJun. All rights reserved.
//

import UIKit

typealias deleteItemBtnHandler = ()->Void

class TypeCategoryCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var categoryImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var deleteBtn: UIButton!
    var deleteHandler:deleteItemBtnHandler?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    @IBAction func deleteCellFromCollectionView(_ sender: UIButton) {
        print("Delete Button Clicked!")
        if let handler = deleteHandler {
            handler()
        }
    }
    
    func setDeleteBtnHidden(hidden:Bool) {
        deleteBtn.isHidden = hidden
    }
    
    func shakeWithEdite() {
        
        let shakeAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
        shakeAnimation.fromValue = -CGFloat.pi/60
        shakeAnimation.toValue = CGFloat.pi/60
        shakeAnimation.duration = 0.08
        shakeAnimation.repeatCount = MAXFLOAT
        shakeAnimation.autoreverses = true
        self.layer.add(shakeAnimation, forKey: "transform.rotation.z")
        
        
//        UIView.animateKeyframes(withDuration: 0.2, delay: 0, options: [.repeat], animations: {
//            let transform = CGAffineTransformFromString("AAA")
//            UIView.addKeyframe(withRelativeStartTime: 0.001, relativeDuration: 0.25, animations: {
//                self.categoryImage.transform = transform.rotated(by: -CGFloat.pi/60)
//                self.titleLabel.transform = transform.rotated(by: -CGFloat.pi/60)
//                self.deleteBtn.transform = transform.rotated(by: -CGFloat.pi/60)
//            })
//            UIView.addKeyframe(withRelativeStartTime: 0.25, relativeDuration: 0.25, animations: {
//                self.categoryImage.transform = CGAffineTransformFromString("BBB")
//                self.titleLabel.transform = CGAffineTransformFromString("BBB")
//                self.deleteBtn.transform = CGAffineTransformFromString("BBB")
//            })
//            UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.25, animations: {
//                self.categoryImage.transform = transform.rotated(by: CGFloat.pi/60)
//                self.titleLabel.transform = transform.rotated(by: CGFloat.pi/60)
//                self.deleteBtn.transform = transform.rotated(by: CGFloat.pi/60)
//            })
//            UIView.addKeyframe(withRelativeStartTime: 0.75, relativeDuration: 0.25, animations: {
//                self.categoryImage.transform = CGAffineTransformFromString("BBB")
//                self.titleLabel.transform = CGAffineTransformFromString("BBB")
//                self.deleteBtn.transform = CGAffineTransformFromString("BBB")
//            })
//        }) { (complete) in
//            
//        }
    }
}
