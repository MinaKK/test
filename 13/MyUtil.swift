//
//  MyUtil.swift
//  13
//
//  Created by qianfeng on 16/9/26.
//  Copyright © 2016年 SunPiaoLiang. All rights reserved.
//

import UIKit

class MyUtil: NSObject {

    //标题
    class func createTitleLabel(frame:CGRect,title:String?)->UILabel{
        
        let label = UILabel()
        
        label.frame = frame
        
        if let tmpTitle = title{
            
            label.text = tmpTitle
            
        }
        
        return label
    }
    //左按钮
    class func createLeftBtn(frame:CGRect,title:String?,bgImage:String?,target:AnyObject?,action:Selector?)->UIButton{
        
        let leftBtn = UIButton()
        
        leftBtn.frame = frame
        
        if let tmpTitle = title{
            
            leftBtn.setTitle(tmpTitle, forState: .Normal)
            
        }
        if let imageName = bgImage{
            
            leftBtn.setBackgroundImage(UIImage(named: imageName), forState: .Normal)
            
        }

        if target != nil && action != nil{
            
            leftBtn.addTarget(target, action: action!, forControlEvents: .TouchUpInside)
            
        }
        
        return leftBtn
    }
    //右按钮
    class func createRightBtn(frame:CGRect,title:String?,bgImage:String?,target:AnyObject?,action:Selector?)->UIButton{
        
        let rightBtn = UIButton()
        
        rightBtn.frame = frame
        
        if let tmpTitle = title{
            
            rightBtn.setTitle(tmpTitle, forState: .Normal)
            
        }
        if let imageName = bgImage{
            
            rightBtn.setBackgroundImage(UIImage(named: imageName), forState: .Normal)
            
        }
        if target != nil && action != nil{
            
            rightBtn.addTarget(target, action: action!, forControlEvents: .TouchUpInside)
            
        }
        
        return rightBtn
    }
    
}
