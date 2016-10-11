//
//  LoginViewController.swift
//  CodeShared
//
//  Created by qianfeng on 2016/10/11.
//  Copyright © 2016年 SunPiaoLiang. All rights reserved.
//

import UIKit

import SnapKit

import JKCategories

import Alamofire

class SLoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "登录"
        
        self.view.backgroundColor = UIColor.whiteColor()
        
        let userName = UITextField()
        
        userName.placeholder = "请输入邮箱或手机号"
        
        userName.font = UIFont.systemFontOfSize(15)
        
        userName.backgroundColor = UIColor.whiteColor()
        
        //利用snapKit给视图添加约束
        //必须先将这个视图加到父视图上
        self.view.addSubview(userName)
        
        //设置的约束必须要能唯一确定视图的位置和大小
        userName.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(100)
            
            make.left.equalTo(0)
            
            make.right.equalTo(0)
            
            make.height.equalTo(48)
            
        }
        
        //设置边框约束
        userName.layer.borderColor = UIColor.grayColor().CGColor
        
        userName.layer.borderWidth = 1.0
        
        let password = UITextField()
        
        password.placeholder = "请输入密码"
        
        password.font = UIFont.systemFontOfSize(15)
        
        password.backgroundColor = UIColor.whiteColor()
        
        self.view.addSubview(password)
        
        //设置边框约束
        password.snp_makeConstraints { (make) -> Void in
            
            make.top.equalTo(userName.snp_bottom)
            
            make.left.right.equalTo(0)
            
            make.height.equalTo(48)
            
            
        }
        password.layer.borderColor = UIColor.grayColor().CGColor
        
        password.layer.borderWidth = 1.0
        
        
        
        let nameLeft = UIView()
        
        let passwordLeft = UIView()
        //设置输入框左边的图片
        let nameImage = UIImageView.init(image:UIImage.init(named:"用户图标"))
        
        nameLeft.addSubview(nameImage)
        
        userName.leftView = nameLeft
        
        userName.leftViewMode = UITextFieldViewMode.Always
        
        nameLeft.snp_makeConstraints { (make) -> Void in
            
            make.size.equalTo(CGSizeMake(64, 48))
        }
        nameImage.snp_makeConstraints { (make) -> Void in
            
            make.center.equalTo(0)
            
        }
        //设置输入框右边的图片
        let passwordImage = UIImageView.init(image:UIImage.init(named:"密码图标"))
        
        passwordLeft.addSubview(passwordImage)
        
        password.leftView = passwordLeft
        
        password.leftViewMode = UITextFieldViewMode.Always
        
        passwordLeft.snp_makeConstraints { (make) -> Void in
            
            make.size.equalTo(CGSizeMake(64, 48))
            
        }
        passwordImage.snp_makeConstraints { (make) -> Void in
            
            make.center.equalTo(0)
            
        }
        
        password.secureTextEntry = true
        
        //设置忘记密码
        let forgetPass = UIButton(type: .Custom)
        
        forgetPass.titleLabel?.font = UIFont.systemFontOfSize(15)
        
        forgetPass.setTitle("忘记密码?", forState: .Normal)
        
        forgetPass.setTitleColor(UIColor.darkGrayColor(), forState: .Normal)
        
        self.view.addSubview(forgetPass)
        
        forgetPass.snp_makeConstraints { (make) -> Void in
            
            make.right.equalTo(0)
            
            make.top.equalTo(password.snp_bottom)
            
            make.width.equalTo(72)
            
            make.height.equalTo(56)
        }
        //登录按钮
        let loginBtn = UIButton(type: .Custom)
        
        loginBtn.titleLabel?.font = UIFont.systemFontOfSize(15)
        
        loginBtn.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        
        loginBtn.setTitle("登录", forState: .Normal)
        
       // loginBtn.backgroundColor = UIColor(red: 0.5, green: 0.5, blue: 0.2, alpha: 1)
        
        //设置登录按钮三种不同状态下的背景颜色
        loginBtn.jk_setBackgroundColor(UIColor.greenColor(), forState: .Normal)
        
        loginBtn.jk_setBackgroundColor(UIColor.lightGrayColor(), forState: .Disabled)
        
        loginBtn.jk_setBackgroundColor(UIColor.darkGrayColor(), forState: .Highlighted)
        
        //登录按钮的点击事件
        loginBtn.jk_handleControlEvents(UIControlEvents.TouchUpInside){
            
            (sender) in
            
            print("点击按钮")
            
            Alamofire.request(.POST, "https://www.1000phone.tk", parameters: ["service":"User.Login","phone":userName.text!,"password":password.text!], encoding: ParameterEncoding.JSON, headers: nil).responseJSON(completionHandler: { (request, response, result) -> Void in
                
                if result.isSuccess{
                    
                    self.navigationController?.dismissViewControllerAnimated(true, completion: nil)
                    
                }else{
                    
                    print("网络不给力")
                    
                }
                
                
            })
    
            
        }
        
        self.view.addSubview(loginBtn)
        
        loginBtn.snp_makeConstraints { (make) -> Void in
            
            make.left.equalTo(0)
            
            make.top.equalTo(forgetPass.snp_bottom).offset(100)//忘记密码栏偏移100为键盘
            make.width.equalTo(414)
            
            make.height.equalTo(48)
        }
        //导航条上的按钮
        
        //左按钮
        let backBtn = UIButton(type: .Custom)
        
        backBtn.setImage(UIImage(named: "返回按钮"), forState: .Normal)
        
        backBtn.addTarget(self, action: "backAction", forControlEvents: .
            TouchUpInside)
        
        let backBarBtn = UIBarButtonItem(customView: backBtn)
        
        self.navigationItem.leftBarButtonItem = backBarBtn
        
        backBtn.frame = CGRectMake(0, 0, 24, 32)
        
        //右按钮
        let registerBtn = UIButton(type: .Custom)
        
        registerBtn.frame = CGRectMake(0, 0, 44, 32)
        
        registerBtn.setTitle("注册", forState: .Normal)
        
        registerBtn.setTitleColor(UIColor.blackColor(), forState: .Normal)
        
        registerBtn.addTarget(self, action: "registerAction", forControlEvents: .TouchUpInside)
        
        let registerBarBtn = UIBarButtonItem(customView: registerBtn)
        
        self.navigationItem.rightBarButtonItem = registerBarBtn
        
       
        
        
    }
    func backAction(){
        
        self.navigationController?.dismissViewControllerAnimated(true, completion: nil)
        
    }
    func registerAction(){
        
        self.navigationController?.pushViewController(SRegisterViewController(), animated: true)
        
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
