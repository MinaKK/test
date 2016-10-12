//
//  limitCell.swift
//  13
//
//  Created by qianfeng on 16/9/27.
//  Copyright © 2016年 SunPiaoLiang. All rights reserved.
//

import UIKit

class limitCell: UITableViewCell {

    @IBOutlet weak var starView: StarView!
    
    @IBOutlet weak var iconImageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var priceLabel: UILabel!
    
    @IBOutlet weak var shareLabel: UILabel!
    
    @IBOutlet weak var getLabel: UILabel!
    
    @IBOutlet weak var downLabel: UILabel!
    
    @IBOutlet weak var typeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func config(model:DataModel,atIndex index:Int){
        
        //1.图像
        let url = NSURL(string:model.iconUrl!)
        //使用第三方库下载图片
        iconImageView.kf_setImageWithURL(url!)
        
        //2.名字
        nameLabel.text = model.name
        
        //3.时间
        
        // "expireDatetime" : "2016-09-28 09:49:17 // .0 "
        let index = model.expireDatetime?.endIndex.advancedBy(-2)
        
        let expireDateStr = model.expireDatetime?.substringToIndex(index!)
        
        //时间对象
        let df = NSDateFormatter()
        
        df.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        let expireDate = df.dateFromString(expireDateStr!)
        
        //日历对象
        let cal = NSCalendar.currentCalendar()
        
        let unit = NSCalendarUnit(rawValue: NSCalendarUnit.Hour.rawValue | NSCalendarUnit.Minute.rawValue | NSCalendarUnit.Second.rawValue)
        
        let dateComps = cal.components(unit, fromDate: NSDate(), toDate:expireDate!, options: NSCalendarOptions.MatchStrictly)
        
        timeLabel.text = String(format: "剩余:%02ld:%02ld:%02ld", dateComps.hour,dateComps.minute,dateComps.second)
        
        //4.价钱
        let priceStr = "￥" + model.lastPrice!
        
        let arrtStr = NSAttributedString(string: priceStr, attributes: [NSStrikethroughStyleAttributeName:NSNumber(int: 1)])
        
        priceLabel.attributedText = arrtStr
        
        //5.星级
        starView.setRating(model.starCurrent!)
        
        //6.类型
        if model.categoryName == "Game"{
            
             model.categoryName = "游戏"
        }
        typeLabel.text = model.categoryName
        
        //7.分享  收藏  下载
        shareLabel.text = "分享:" + model.shares! + "次"
        
        getLabel.text = "收藏:" + model.favorites! + "次"
        
        downLabel.text = "下载:" + model.downloads! + "次"
        
        
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
