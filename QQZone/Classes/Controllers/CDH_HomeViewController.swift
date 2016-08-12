//
//  CDH_HomeViewController.swift
//  QQZone
//
//  Created by chendehao on 16/8/12.
//  Copyright © 2016年 CDHao. All rights reserved.
//

import UIKit

class CDH_HomeViewController: UIViewController {

    // MARK: - 懒加载控件属性
    private lazy var dockView : CDH_DockView = {
        let dockView = CDH_DockView ()
        // 设置高度
        dockView.frame.size.height = self.view.frame.height - statusH
        dockView.frame.size.width = isLandscape ? kDockLandscapeWidth :  kDockProtraitWidth
        dockView.frame.origin.x = 0
        dockView.frame.origin.y = statusH
        // 高度跟随父控件的高度拉伸而拉伸 (默认是跟随父控件变化的)
//        dockView.autoresizingMask = .FlexibleHeight
        dockView.backgroundColor = UIColor.orangeColor()
        return dockView
    }()
    private lazy var contentView : UIView = {
        let contentView = UIView()
        // 设置frame 
        let x : CGFloat = self.dockView.frame.width
        let y : CGFloat = statusH
        let w : CGFloat = self.view.frame.size.width - self.dockView.frame.width
        let h : CGFloat = self.view.frame.height - statusH
        contentView.frame = CGRectMake(x, y, w, h)
        contentView.backgroundColor = UIColor.greenColor()
        return contentView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.purpleColor()
        
        // 将子控件添加到当前控制器的 View 中
        self.view.addSubview(dockView)
        self.view.addSubview(contentView)
    }
}

extension CDH_HomeViewController {
    /**
     当屏幕旋转的时候会来到该方法
     
     - parameter size:        即将旋转到的尺寸
     - parameter coordinator: 其他参数
     */
    override func viewWillTransitionToSize(size: CGSize, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
        // 1.获取即将旋转的屏幕方向
        // 注意: 这里不能用 frame.size , 因为这个方法是即将旋转(还没有旋转), 也就是 frame 中的值还是旋转之前的,
        // 然而函数中的参数 size 即将变化后的 size 也就是最新的了
        // isLandscape = self.view.frame.size.width > self.view.frame.size.height
        // 如果是非要用 frame.size 则, 这时候的判断是要反过来写的(但容易出现 bug , 有可能转到一半不转时, 用这个参数做判断就出错了)
        // isLandscape = self.view.frame.size.width < self.view.frame.size.height
        isLandscape = size.width >  size.height
        
        // 2.更新 dockView 的宽度
        // 2.1获取屏幕的旋转事件
        let duration = coordinator.transitionDuration()
        // 2.2执行动画
        UIView.animateWithDuration(duration) {
            // 设置 dock 的宽度高度
            self.dockView.frame.size.width = isLandscape ? kDockLandscapeWidth :kDockProtraitWidth
            self.dockView.frame.size.height = size.height - statusH
            // 设置 contentView 的 x 和高度
            self.contentView.frame.origin.x = self.dockView.frame.width
            self.contentView.frame.size.height = size.height - statusH
        }
        
    }
}












