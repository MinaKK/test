//
//  DetailModel.swift
//  13
//
//  Created by qianfeng on 16/9/29.
//  Copyright © 2016年 SunPiaoLiang. All rights reserved.
//

import UIKit

class DetailModel: NSObject {

    var applicationId:String?
    
    var appurl:String?
    
    var categoryId:String?
    
    var categoryName:String?
    
    var currentPrice:String?
    
    var currentVersion:String?
    
    //var description:String?
    var desc:String?
    func setDescription(desc:String){
        
        self.desc = desc
        
    }
    
    var description_long:String?
    
    var downloads:String?
    
    var expireDatetime:String?
    
    var fileSize:String?
    
    var iconUrl: String?
    
    var itunesUrl:String?
    
    var language:String?
    
    var lastPrice:String?
    
    var name:String?
    
    var newversion:String?
    
    var photos:Array<Photos>?
    
    var priceTrend:String?
    
    var ratingOverall:String?
    
    var releaseDate:String?
    
    var releaseNotes:String?
    
    var sellerId:String?
    
    var sellerName:String?
    
    var slug:String?
    
    var starCurrent:String?
    
    var starOverall:String?
    
    var systemRequirements:String?
    
    var updateDate:String?
    
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {
        
    }
    
    
}
class Photos:NSObject{
    
    var originalUrl:String?
    
    var smallUrl:String?
    
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {
        
    }
    
}
