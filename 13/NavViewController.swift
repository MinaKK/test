//
//  NavViewController.swift
//  13
//
//  Created by qianfeng on 16/9/26.
//  Copyright © 2016年 SunPiaoLiang. All rights reserved.
//

import UIKit

class NavViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

         view.backgroundColor = UIColor.whiteColor()
        
    }
    func addTitleLabel(title:String){
        
        let label = MyUtil.createTitleLabel(CGRectMake(414/2-50, 0, 100, 20), title: title)
        label.font = UIFont.systemFontOfSize(25)
        
        label.textColor = UIColor(red:CGFloat( Float(arc4random_uniform(10))/10.0), green: CGFloat( Float(arc4random_uniform(10))/10.0), blue: CGFloat( Float(arc4random_uniform(10))/10.0), alpha:0.5)
        
        label.textAlignment = .Center
        
        navigationItem.titleView = label
    }
    func addLeftBtn(title:String,target:AnyObject?,action:Selector){
        
        let btn = MyUtil.createLeftBtn(CGRectMake(10, 0, 80, 40), title: title,bgImage:"buttonbar_action", target:target, action: action)
        
        btn.setTitleColor(UIColor.blackColor(), forState: .Normal)
        
       let leftBtn = UIBarButtonItem(customView: btn)
    
       navigationItem.leftBarButtonItem = leftBtn
    }
    func addRightBtn(title:String,target:AnyObject?,action:Selector){
        
        let btn = MyUtil.createRightBtn(CGRectMake(414-90, 0, 80, 40), title: title, bgImage: "buttonbar_action", target: target, action:action)
        
        btn.setTitleColor(UIColor.blackColor(), forState: .Normal)
        
        let rightBtn = UIBarButtonItem(customView: btn)
        
        navigationItem.rightBarButtonItem = rightBtn
        
    }
    func addBackBtn(title:String,target:AnyObject,action:Selector){
        
        let btn = MyUtil.createLeftBtn(CGRectMake(10, 0, 80, 40), title: title, bgImage: "buttonbar_back", target: target, action: action)
        
        btn.setTitleColor(UIColor.blackColor(), forState: .Normal)
        
        let bbtn = UIBarButtonItem(customView: btn)
        
        navigationItem.leftBarButtonItem = bbtn
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
