//
//  RecordDataModels.swift
//  CuteMoneyRecord
//
//  Created by 王 on 2017/07/13.
//  Copyright © 2017年 WangJun. All rights reserved.
//

import UIKit
import Foundation

class MoneyCategoryModel {
    dynamic var type:String
    dynamic var categoryImage:String
    dynamic var date:Date
    var colorRGB:(CGFloat,CGFloat,CGFloat)
    
    init(cType:String,cImage:String,cDate:Date,cRGB:(CGFloat,CGFloat,CGFloat)) {
        type = cType
        categoryImage = cImage
        date = cDate
        colorRGB = cRGB
    }
}

class MoneyCostModel {
    
}

class InputCollectionDataHelper {
    class func getMoneyCategoryDataSets() -> [MoneyCategoryModel] {
        
        var types:[String]
        var images:[String]
        var RGBs:[(CGFloat,CGFloat,CGFloat)]
        var dataSets:[MoneyCategoryModel] = []
        
        types = ["一般","旅行","化妆品","租房","电子产品","饮食","母婴","生活用品","学习","购物"]
        
        images = ["tab_so","tab_me","tab_chat","tab_user","tab_so_actived","tab_me_actived","tab_chat_actived","tab_user_actived","tab_so","tab_me"]
        RGBs = [(0,255.0,155.0),(0,255.0,0.0),(255.0,0.0,155.0),(155.0,255.0,155.0),(100.0,0,100.0),(50.0,26.0,15.0),(0,0.0,100.0),(0,0.0,255.0),(100.0,100.0,100.0),(90,5.0,255.0)]
        
        let cnt:Int = types.count
        for _ in 0...20 {
            for i in 0..<cnt {
                let model:MoneyCategoryModel = MoneyCategoryModel(cType: types[i], cImage: images[i], cDate: Date(), cRGB: RGBs[i])
                dataSets.append(model)
            }
        }
        return dataSets
    }
    
}
