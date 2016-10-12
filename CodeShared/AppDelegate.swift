
//  AppDelegate.swift
//  CodeShared
//
//  Created by qianfeng on 2016/10/11.
//  Copyright © 2016年 SunPiaoLiang. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        //封装一个设置Window的方法
        configRootVC()
        
        //告诉第三方库打开了app，即设置MobSMSSDK
        setupMod()
        
        return true
    }
    func setupMod(){

        SMSSDK.registerApp(MobApp, withSecret: MobSecret)
        
    }
    //生成window,并将标签栏视图控制器作为他的根视图
    func configRootVC(){
        
        window = UIWindow.init(frame:UIScreen.mainScreen().bounds)
        
        window?.rootViewController = STabBarController()
        
        window?.makeKeyAndVisible()
        
        
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

