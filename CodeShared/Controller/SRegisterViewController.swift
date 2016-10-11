//
//  SRegisterViewController.swift
//  CodeShared
//
//  Created by qianfeng on 2016/10/11.
//  Copyright © 2016年 SunPiaoLiang. All rights reserved.
//

import UIKit

import Alamofire

import JKCategories

class SRegisterViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.whiteColor()
        
        self.title = "注册"
        
        //账户名
        let userName = UITextField()
        
        userName.placeholder = "请输入注册账号(邮箱或手机号)"
        
        userName.font = UIFont.systemFontOfSize(15)
        
        self.view.addSubview(userName)
        
        userName.snp_makeConstraints { (make) -> Void in
            
            make.top.equalTo(100)
            
            make.height.equalTo(48)
            
            make.left.equalTo(0)
            
            make.right.equalTo(0)
            
        }
        //设置边框约束
        userName.layer.borderColor = UIColor.lightGrayColor().CGColor
        
        userName.layer.borderWidth = 1.0
        
        //用户密码
        let password = UITextField()
        
        password.placeholder = "请输入密码"
        
        password.secureTextEntry = true
        
        password.font = UIFont.systemFontOfSize(15)
    
        self.view.addSubview(password)
        
        password.snp_makeConstraints { (make) -> Void in
            
            make.top.equalTo(userName.snp_bottom)
            
            make.width.equalTo(414)
            
            make.height.equalTo(48)
            
        }
        
        password.layer.borderWidth = 1.0
        
        password.layer.borderColor = UIColor.lightGrayColor().CGColor
        
        //重复密码
        let repassword = UITextField()
        
        repassword.placeholder = "请再次输入密码"
        
        repassword.secureTextEntry = true
        
        repassword.font = UIFont.systemFontOfSize(15)
        
        self.view.addSubview(repassword)
        
        repassword.snp_makeConstraints { (make) -> Void in
            
            make.top.equalTo(password.snp_bottom)
            
            make.width.equalTo(414)
            
            make.height.equalTo(48)
            
        }
        
        repassword.layer.borderColor = UIColor.lightGrayColor().CGColor
        
        repassword.layer.borderWidth = 1.0
        
        //设置图片
        let nameLeft = UIView()
        
        let passLeft = UIView()
        
        let repassLeft = UIView()
        
        let nameImage = UIImageView(image: UIImage(named: "手机邮箱图标"))
        
        nameLeft.addSubview(nameImage)
        
        userName.leftView = nameLeft
        
        userName.leftViewMode = .Always
        
        nameLeft.snp_makeConstraints { (make) -> Void in
            
            make.size.equalTo(CGSizeMake(64, 48))
        }
        
        nameImage.snp_makeConstraints { (make) -> Void in
            
            make.center.equalTo(0)
        }
        
        let passImage = UIImageView(image: UIImage(named: "密码图标"))
        
        passLeft.addSubview(passImage)
        
        password.leftView = passLeft
        
        password.leftViewMode = .Always
        
        passLeft.snp_makeConstraints { (make) -> Void in
            
            make.size.equalTo(CGSizeMake(64, 48))
            
        }
        
        passImage.snp_makeConstraints { (make) -> Void in
            
            make.center.equalTo(0)
        }
        
        let repassImage = UIImageView(image: UIImage(named: "密码图标"))
        
        repassLeft.addSubview(repassImage)
        
        repassword.leftView = repassLeft
        
        repassword.leftViewMode = .Always

        repassLeft.snp_makeConstraints { (make) -> Void in
            
            make.size.equalTo(CGSizeMake(64, 48))
        }
        
        repassImage.snp_makeConstraints { (make) -> Void in
            
            make.center.equalTo(0)
        }
        
        //输入验证码
        let markText = UITextField()
        
        markText.placeholder = "请输入输入验证码"
        
        markText.font = UIFont.systemFontOfSize(15)
        
        self.view.addSubview(markText)
        
        markText.snp_makeConstraints { (make) -> Void in
            
            make.top.equalTo(repassword.snp_bottom).offset(50)
            
            make.left.equalTo(0)
            
            make.right.equalTo(0)
            
            make.width.equalTo(414)
            
            make.height.equalTo(48)
            
        }
        
        markText.layer.borderColor = UIColor.lightGrayColor().CGColor
        
        markText.layer.borderWidth = 1.0
    
        //图片
        let markLeft = UIView()
        
        let markImage = UIImageView(image: UIImage(named: "验证信息图标"))
        
        markLeft.addSubview(markImage)
        
        markText.leftView = markLeft
        
        markText.leftViewMode = .Always
        
        markLeft.snp_makeConstraints { (make) -> Void in
            
            make.size.equalTo(CGSizeMake(64, 48))
            
        }
        
        markImage.snp_makeConstraints { (make) -> Void in
            
            make.center.equalTo(0)
        }
        //点击获取验证码
        let codeRight = UIView()
        
        let codeRightBtn = UIButton(type: .Custom)
        
        codeRightBtn.setTitle("获取验证码", forState: .Normal)
        
        codeRightBtn.titleLabel?.font = UIFont.systemFontOfSize(13)
        
        codeRightBtn.setTitleColor(UIColor.purpleColor(), forState: .Normal)
        
        codeRightBtn.layer.borderColor = UIColor.lightGrayColor().CGColor
        
        codeRightBtn.layer.borderWidth = 1.0
        
        //设置视图的圆角
        codeRightBtn.layer.cornerRadius = 3.0
        
        //让背景颜色的范围在视图范围内
        codeRightBtn.layer.masksToBounds = true

        //设置三种不同状态下的按钮颜色
        codeRightBtn.jk_setBackgroundColor(UIColor.lightGrayColor(),forState:UIControlState.Disabled)
        
        
        codeRightBtn.jk_setBackgroundColor(UIColor.darkGrayColor(),forState:UIControlState.Highlighted)

        codeRightBtn.jk_setBackgroundColor(UIColor.yellowColor(),forState:UIControlState.Normal)
        
        codeRight.addSubview(codeRightBtn)
        
        markText.rightView = codeRight
        
        markText.rightViewMode = .Always
        
        codeRight.snp_makeConstraints { (make) -> Void in
        
        
            make.height.equalTo(48)
            
            make.width.equalTo(120)
            
            
        }
        codeRightBtn.snp_makeConstraints { (make) -> Void in
            
            make.width.equalTo(100)
            
            make.height.equalTo(40)
            
            make.top.equalTo(4)
            
            make.left.equalTo(8)
            
        }
        
        //注册按钮
        let registerBtn = UIButton(type: .Custom)
        
        registerBtn.setTitle("注册", forState: .Normal)
        
        registerBtn.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        
        registerBtn.jk_setBackgroundColor(UIColor.greenColor(), forState: .Normal)
        
        registerBtn.jk_setBackgroundColor(UIColor.darkGrayColor(), forState: .Disabled)
        
        registerBtn.jk_setBackgroundColor(UIColor.lightGrayColor(), forState: .Highlighted)
        
        //注册的点击事件
        registerBtn.jk_handleControlEvents(UIControlEvents.TouchUpInside) { (sender) -> Void in
            
           Alamofire.request(.POST, "https://www.1000phone.tk", parameters: ["service":"User.Register","phone":userName.text!,"password":password.text!,"verificationCode":markText.text!], encoding: ParameterEncoding.URLEncodedInURL, headers: nil).responseJSON(completionHandler: { (request, response, result) -> Void in
            if result.isSuccess {
                
                self.navigationController?.popViewControllerAnimated(true)
                
            }else{
                
                print("网络不给力")
                
            }
            
           })
        }
        
        self.view.addSubview(registerBtn)
        
        registerBtn.snp_makeConstraints { (make) -> Void in
            
            make.top.equalTo(repassword.snp_bottom).offset(150)
            
            make.left.equalTo(0)
            
            make.right.equalTo(0)
            
            make.height.equalTo(48)
            
            
        }
        
        
        
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
