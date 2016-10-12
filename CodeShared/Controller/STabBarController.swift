//
//  STabBarController.swift
//  CodeShared
//
//  Created by qianfeng on 2016/10/11.
//  Copyright © 2016年 SunPiaoLiang. All rights reserved.
//

import UIKit

class STabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

       configViewControllers()
        
        
    }
    //搭建TabBar的标签视图控制器
    func configViewControllers(){
        
        let vcInfos = [
            
            ["title":"主页","image":"tabbar_1","class":"CodeShared.ViewController"],
            ["title":"消息","image":"tabbar_1","class":"CodeShared.ViewController"],
            ["title":"聊天","image":"tabbar_1","class":"CodeShared.ViewController"],
            ["title":"我的","image":"tabbar_1","class":"CodeShared.ViewController"]
        
        ]
        
        var vcArr : [UINavigationController] = []
        
        for vcInfo in vcInfos{
            
            let vc = (NSClassFromString(vcInfo["class"]!) as!  UIViewController.Type).init()
            
            vc.title = vcInfo["title"]
            
            vc.view.backgroundColor = UIColor.whiteColor()
            
            let navVC = UINavigationController.init(rootViewController: vc)
            
            vcArr.append(navVC)
            
        }
        //设置ViewControll
        self.viewControllers = vcArr
        
    }
    override func viewDidAppear(animated: Bool) {
        
        //重写控制器的声明周期方法时最好调用父类的实现
        super.viewDidAppear(animated)
        
        let loginVC = UINavigationController.init(rootViewController: SLoginViewController.init())
        
        self.presentViewController(loginVC, animated: true, completion: nil)
        
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
