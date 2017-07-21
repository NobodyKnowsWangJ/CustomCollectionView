//
//  MyCustomCollectionView.swift
//  CustomCollectionView
//
//  Created by 王 on 2017/07/20.
//  Copyright © 2017年 WangJun. All rights reserved.
//

import UIKit

class MyCustomCollectionView: UICollectionView {

    var eidteStatus:Bool = false{
        didSet{
            if eidteStatus {
                tap?.isEnabled = true
                longPress?.removeTarget(self, action: #selector(longpressHandler(sender:)))
                longPress?.addTarget(self, action: #selector(moveItemWithLP(sender:)))
            }else{
                tap?.isEnabled = false
                longPress?.removeTarget(self, action: #selector(moveItemWithLP(sender:)))
                longPress?.addTarget(self, action: #selector(longpressHandler(sender:)))
            }
            self.reloadData()
        }
    }
    
    var longPress:UILongPressGestureRecognizer?
    
    var tap:UITapGestureRecognizer?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        longPress = UILongPressGestureRecognizer(target: self, action: #selector(longpressHandler(sender:)))
        tap = UITapGestureRecognizer(target: self, action: #selector(tapHandler(sender:)))
        tap?.require(toFail: longPress!)
        tap?.isEnabled = false
        self.addGestureRecognizer(longPress!)
        self.addGestureRecognizer(tap!)
    }
    
    func longpressHandler(sender:UILongPressGestureRecognizer) {
        if !eidteStatus {
            eidteStatus = true
        }
    }
    
    func moveItemWithLP(sender:UILongPressGestureRecognizer) {
        switch sender.state {
        case .began:
            let indexpath = self.indexPathForItem(at: sender.location(in: sender.view))
            self.beginInteractiveMovementForItem(at: indexpath!)
        case .changed:
            self.updateInteractiveMovementTargetPosition(sender.location(in: self))
        case .ended:
            self.endInteractiveMovement()
        default:
            self.cancelInteractiveMovement()
        }
    }
    
    func tapHandler(sender:UITapGestureRecognizer) {
        if eidteStatus {
            eidteStatus = false
        }
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}



