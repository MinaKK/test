//
//  DataModel.swift
//  13
//
//  Created by qianfeng on 16/9/26.
//  Copyright © 2016年 SunPiaoLiang. All rights reserved.
//

import UIKit

class DataModel: NSObject {

    var applicationId: String?
    
    var categoryId: NSNumber?
    
    var categoryName: String?
    
    var currentPrice: String?
    
    //var description: String?
    var desc: String?
    
    var downloads: String?
    
    var expireDatetime: String?
    
    var favorites: String?
    
    var fileSize: String?
    
    var iconUrl: String?
    
    var ipa: String?
    
    var itunesUrl: String?
    
    var lastPrice: String?
    
    var name: String?
    
    var priceTrend: String?
    
    var ratingOverall: String?
    
    var releaseDate: String?
    
    var releaseNotes: String?
    
    var shares: String?
    
    var slug: String?
    
    var starCurrent: String?
    
    var starOverall: String?
    
    var updateDate: String?
    
    var version: String?
   
    //解决属性和父类方法的冲突
    func setDescription(desc:String){
        
        self.desc = desc
        
    }

    //一个空方法，为了防止出错
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {
        
        
    }
}
