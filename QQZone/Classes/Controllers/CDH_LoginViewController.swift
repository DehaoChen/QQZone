//
//  CDH_LoginViewController.swift
//  QQZone
//
//  Created by chendehao on 16/8/12.
//  Copyright © 2016年 CDHao. All rights reserved.
//

/**
 本模块功能:
 1.登入判断是否账号和密码都有输入, 若没有输入这打印提示(后续改为弹框提示)
 2.登入时显示登入网络请求(菊花转动)
 3.记住密码和自动登入关联: 自动登入一定记住密码, 不记住密码一定不能自动登入
 4.正在输入账号是 Enter 显示的是 Next , 点击next 则直接跳转到密码输入的文本框中
 5.在密码输入文本框时 enter 显示的是 Go , 点击 Go 则直接登入
 6.账号或密码只要有一个还没输入时点击了登入按钮都要以抖动输入框提示用户完成输入
 7.账号或密码不正确, 则也抖动提示用户, 重新输入
 8.密码正确则直接跳转到到主页
 */

import UIKit

class CDH_LoginViewController: UIViewController {

    // MARK: - 属性控件
    @IBOutlet weak var loginView: UIView!
    @IBOutlet weak var accountTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var remPasswordButton: UIButton!
    @IBOutlet weak var autoLoginButton: UIButton!
    // 登入时的转圈动画菊花
    @IBOutlet weak var activityView: UIActivityIndicatorView!
    
    // MARK: - 系统回调函数
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 隐藏登入时转圈动画菊花
        activityView.hidesWhenStopped = true
        
        // 给 textField 设置代理
        accountTextField.delegate = self
        passwordTextField.delegate = self
    }
}

// MARK: - 按钮点击事件函数
extension CDH_LoginViewController {
    /// 登入按钮点击事件
    @IBAction func loginButtonClick() {
        
        // 1.先退出键盘
        view.endEditing(true)
        
        // 2.获取用户的名称和密码
        let account = accountTextField.text
        let password = passwordTextField.text
        
        // 3.判断用户的账号和密码是否都有输入, 如果有其中一个没有输入这, 提示用户输入
        guard account?.characters.count != 0 && password?.characters.count != 0 else {
            // print("账号或密码输入不正确")
            showsErrorInfo("提示", errorInfo: "账号或密码未输入!!!")
            return
        }
        
        // 4.判断用户名和密码是否正确
        // 开启动如动画
        activityView.startAnimating()
        // 取消交互使能
        view.userInteractionEnabled = false
        let time = dispatch_time(DISPATCH_TIME_NOW, Int64(1 * NSEC_PER_SEC))
        dispatch_after(time, dispatch_get_main_queue()) {
            // 停止正在登入动画
            self.activityView.stopAnimating()
            // 开启交互使能
            self.view.userInteractionEnabled = true
            if account == "123" && password == "123" {
                print("登入成功, 跳转到下一界面")
                
                // 页面跳转到主页
                self.view.window?.rootViewController = CDH_HomeViewController()
            }else {
                //print("账号或密码错误, 请重新输入!")
                self.showsErrorInfo("登入提示", errorInfo: "账号或密码错误, 请重新输入!")
                
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

// MARK: - 遵守UITextFieldDelegate
extension CDH_LoginViewController : UITextFieldDelegate {
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        if textField == accountTextField {
            passwordTextField.becomeFirstResponder()
        }else {
            loginButtonClick()
        }
        return true
    }
}

// MARK: - 公共函数
extension CDH_LoginViewController {
    /// 弹框提示用户
    private func showsErrorInfo(title : String , errorInfo : String){
        // 1.创建弹窗
        // 1.1 创建 UIAlertController // 注意这里的控制器类要选 Alert 类型
        let alterVc = UIAlertController(title: title, message: errorInfo, preferredStyle: .Alert)
        // 1.2创建 UIAlertAction
        let action = UIAlertAction(title: "确定", style: .Default , handler: nil)
        
        // 1.3将 action添加到 UIAlertController 中
        alterVc.addAction(action)
        
        // 1.4弹出 UIAlertController 
        presentViewController(alterVc, animated: true, completion: nil)
        
        // 2.添加抖动动画
        // 2.1创建动画(核心动画: 基本动画(只能闯入两个值), 帧动画(可以闯入一个数组),转场动画
        let shakeAnimation = CAKeyframeAnimation(keyPath: "transform.translation.x")
        
        // 2.2设置动画属性
        shakeAnimation.values = [0, -10, 0 , 10, 0]
        shakeAnimation.repeatCount = 5
        shakeAnimation.duration = 0.2
        
        // 2.3将动画添加到对应的 View 的 layer 中
        loginView.layer.addAnimation(shakeAnimation, forKey: nil)
    }
}
