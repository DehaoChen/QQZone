//
//  CDH_LoginViewController.swift
//  QQZone
//
//  Created by chendehao on 16/8/12.
//  Copyright © 2016年 CDHao. All rights reserved.
//

import UIKit

class CDH_LoginViewController: UIViewController {

    // MARK : - 属性控件
    @IBOutlet weak var loginView: UIView!
    @IBOutlet weak var accountTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var remPasswordButton: UIButton!
    @IBOutlet weak var autoLoginButton: UIButton!
    // 登入时的转圈动画菊花
    @IBOutlet weak var activityView: UIActivityIndicatorView!
    
    // MARK : - 系统回调函数
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 隐藏登入时转圈动画菊花
        activityView.hidesWhenStopped = true
    }
}

// MARK : - 按钮点击事件函数
extension CDH_LoginViewController {
    /// 登入按钮点击事件
    @IBAction func loginButtonClick(sender: UIButton) {
        
        // 1.先退出键盘
        view.endEditing(true)
        
        // 2.获取用户的名称和密码
        let account = accountTextField.text
        let password = passwordTextField.text
        
        // 3.判断用户的账号和密码是否都有输入, 如果有其中一个没有输入这, 提示用户输入
        guard account?.characters.count != 0 && password?.characters.count != 0 else {
            print("账号或密码输入不正确")
            return
        }
        
        // 4.判断用户名和密码是否正确
        // 开启动如动画
        activityView.startAnimating()
        // 取消交互使能
        view.userInteractionEnabled = false
        let time = dispatch_time(DISPATCH_TIME_NOW, Int64(2 * NSEC_PER_SEC))
        dispatch_after(time, dispatch_get_main_queue()) {
            // 停止正在登入动画
            self.activityView.stopAnimating()
            // 开启交互使能
            self.view.userInteractionEnabled = true
            if account == "123" && password == "123" {
                print("登入成功, 跳转到下一界面")
                
            }else {
                print("账号或密码错误, 请重新输入!")
                
            }
            
        }
        
        
    }
    /// 记住密码按钮点击调用函数
    @IBAction func remPasswordButtonClick(sender: UIButton) {
        sender.selected = !sender.selected
        if sender.selected == false {
            autoLoginButton.selected = false
        }
    }
    
    /// 自动登入按钮点击调用函数
    @IBAction func autoLoginButtonClick(sender: UIButton) {
        sender.selected = !sender.selected
        if sender.selected {
            remPasswordButton.selected = true
        }
    }
}


