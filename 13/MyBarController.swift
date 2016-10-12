//
//  MyBarController.swift
//  13
//
//  Created by qianfeng on 16/9/26.
//  Copyright © 2016年 SunPiaoLiang. All rights reserved.
//

import UIKit

class MyBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

       view.backgroundColor = UIColor.whiteColor()
        
       createViewControllers()
        
    }
    //封装一个方法来管理子视图控制器
    func createViewControllers(){
        
        let titleArray = ["限免","降价","免费","专题","热榜"]
        
        let imageArray = ["tabbar_limitfree","tabbar_reduceprice","tabbar_appfree","tabbar_subject","tabbar_rank"]
        
        //视图控制器数组------工程名加上视图控制器名
        let viewControllerArray = ["_3.OneViewController","_3.TwoViewController","_3.ThreeViewController","_3.FourViewController","_3.FiveViewController"]
        
        //创建视图控制器
        var array = [UINavigationController]()
        
        for i in 0..<titleArray.count{
            
            let ctlName = viewControllerArray[i]
            
            let ctls = NSClassFromString(ctlName) as! UIViewController.Type
            
            let ctrl = ctls.init()
            
            ctrl.tabBarItem.title = titleArray[i]
            
            let imageName = imageArray[i]
            
            ctrl.tabBarItem.image = UIImage(named: imageName)
            
            //选中的图片
            ctrl.tabBarItem.image = UIImage(named: (imageName + "_press"))//?.imageWithRenderingMode(.AlwaysOriginal)
            
            let navCtrl = UINavigationController(rootViewController: ctrl)
            
            array.append(navCtrl)
            
        }
        
        //UITabBarController的属性
        viewControllers = array
    
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
