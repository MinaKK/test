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

//函数响应式编程
import ReactiveCocoa

class SRegisterViewController: UIViewController {

    //给time设置属性值
    dynamic var time:Int = -1
    
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

        
        //注册按钮
        let registerBtn = UIButton(type: .Custom)
        
        registerBtn.setTitle("注册", forState: .Normal)
        
        registerBtn.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        
        registerBtn.jk_setBackgroundColor(UIColor.greenColor(), forState: .Normal)
        
        registerBtn.jk_setBackgroundColor(UIColor.darkGrayColor(), forState: .Disabled)
        
        registerBtn.jk_setBackgroundColor(UIColor.lightGrayColor(), forState: .Highlighted)
        
        //注册的点击事件
        registerBtn.jk_handleControlEvents(UIControlEvents.TouchUpInside) { (sender) -> Void in
            
            Alamofire.request(.POST, "https://www.1000phone.tk", parameters: ["service":"User.Register","phone":userName.text!,"password":(password.text! as NSString).jk_md5String,"verificationCode":markText.text!], encoding: ParameterEncoding.URLEncodedInURL, headers: nil).responseJSON(completionHandler: { (request, response, result) -> Void in
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
        codeRightBtn.jk_setBackgroundColor(UIColor.yellowColor(),forState:UIControlState.Disabled)
        
        
        codeRightBtn.jk_setBackgroundColor(UIColor.blackColor(),forState:UIControlState.Highlighted)

        codeRightBtn.jk_setBackgroundColor(UIColor.whiteColor(),forState:UIControlState.Normal)
        
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
        
        registerBtn.enabled = false
        
        codeRightBtn.enabled = false
        
//        userName.jk_handleControlEvents(.EditingChanged) { (sender) in
//            
//            markText.enabled = userName.text?.lengthOfBytesUsingEncoding(NSStringEncoding.init(NSUTF8StringEncoding)) == 11
//            
//        }
//      
        
        //输入框文本改变的信号，我们可以订阅该信号,从而改变按钮的状态
        userName.rac_textSignal().subscribeNext { (sender) in
            
            let name = sender as! NSString
            
            //两个条件决定获取验证码的状态
            codeRightBtn.enabled = name.length == 11 && self.time == -1
          
            //判断手机号的位数是否大于11位
            if name.length >= 11{
                
                //让密码框成为第一响应者
                password.becomeFirstResponder()
                
            }
        }
        //将几个信号合并为一个信号，订阅并改变按钮的状态
        userName.rac_textSignal()
        .combineLatestWith(password.rac_textSignal())
        .combineLatestWith(markText.rac_textSignal())
        .subscribeNext { (sender) in

            //print(sender)
            
            registerBtn.enabled = ((userName.text! as NSString).length == 11 && (password.text! as NSString).length >= 6 && (markText.text! as NSString).length == 4)
            
        }
        //用热信号的方法处理,不需要订阅但是要start
//        userName.rac_textSignal().toSignalProducer()
//        .combineLatestWith(password.rac_textSignal().toSignalProducer())
//        .combineLatestWith(markText.rac_textSignal().toSignalProducer())
//        .startWithNext { (signal1, signal2) in
//            
//            print("signal1:\(signal1) signal2:\(signal2)")
//        }
        
        //也可以把按钮的点击事件当做信号来订阅
        registerBtn.rac_signalForControlEvents(.TouchUpInside).subscribeNext { (sender) in
            
            print(sender as! UIButton)
        }
        
        //将变量的改变当做信号来订阅（代替kvo）
        self.rac_valuesForKeyPath("time", observer: self).subscribeNext { (time) in
            
            print(time)
            
            //time为-1时是正常状态
            codeRightBtn.enabled = self.time == -1
            
            if self.time == -1{
                
                codeRightBtn.setTitle("点击获取验证码", forState: .Normal)
                
            }else{
                
                codeRightBtn.setTitle("\(self.time)秒后重新发送", forState: .Normal)
                
            }
        }
        //获取验证码的点击事件
        codeRightBtn.jk_handleControlEvents(UIControlEvents.TouchUpInside) { (sender) in
            
            self.time = 60
            //改变按钮的状态
            //codeRightBtn.enabled = false
            
            SMSSDK.getVerificationCodeByMethod(SMSGetCodeMethod.init(0), phoneNumber: userName.text, zone: "86", customIdentifier: nil) { (error) in
               
                if error != nil{
                
                  print(error)
                
                
                  self.time = -1
                  //codeRightBtn.enabled = true
                
                }else{
                
                    //此时需要获取验证码，time=60，然后逐渐减1
                   NSTimer.jk_scheduledTimerWithTimeInterval(1, block: { 
                    
                    self.time = self.time - 1
                    
                    }, repeats: true)
                    
            }
            
          }
            
        }
        //处理键盘遮挡视图的问题(用arc代理通知中心)
        NSNotificationCenter.defaultCenter().rac_addObserverForName(UIKeyboardWillChangeFrameNotification, object: nil).subscribeNext { (noti) in
            
            //取出通知携带的键盘的信息
            let userInfo = (noti as! NSNotification).userInfo
            
            let rect = userInfo![UIKeyboardFrameEndUserInfoKey] as! NSValue
            
            print(rect.CGRectValue())
            
            //用SnapKit给注册按钮做一个动画
            //如果更改需要一个视图的约束，需要用到snp_update
            registerBtn.snp_updateConstraints(closure: { (make) in
                
                make.top.equalTo(markText.snp_bottom).offset(50)
                
            })
            
            UIView.animateWithDuration(0.25, animations: { 
                
                //如果需要的话就重新布局
                registerBtn.layoutIfNeeded()
                
            })
            
            
        }
        
        //键盘消失的时候
        NSNotificationCenter.defaultCenter().rac_addObserverForName(UIKeyboardDidHideNotification, object: nil).subscribeNext { (noti) in
            
            //当键盘消失我们只需要将约束重新更新为原始状态即可
            registerBtn
            
            
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //点击空白处，收起键盘
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        self.view.endEditing(true)
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