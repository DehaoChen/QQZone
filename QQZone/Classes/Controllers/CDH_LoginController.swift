//
//  CDH_LoginController.swift
//  QQZone
//
//  Created by chendehao on 16/8/12.
//  Copyright © 2016年 CDHao. All rights reserved.
//

import UIKit

class CDH_LoginController: UIViewController {

    // MARK : - 属性控件
    @IBOutlet weak var loginView: UIView!
    @IBOutlet weak var accountTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var remPasswordButton: UIButton!
    @IBOutlet weak var autoLoginButton: UIButton!
    // 登入时的转圈句话菊花
    @IBOutlet weak var activityView: UIActivityIndicatorView!
    
    // MARK : - 系统回调函数
    override func viewDidLoad() {
        super.viewDidLoad()

    }
}
