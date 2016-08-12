//
//  CDH_DockView.swift
//  QQZone
//
//  Created by chendehao on 16/8/12.
//  Copyright © 2016年 CDHao. All rights reserved.
//

import UIKit
class CDH_DockView: UIView {

    // MARK: - 控件懒加载
    private lazy var iconButton : CDH_IconButton = {
        let iconButton : CDH_IconButton = CDH_IconButton()
        iconButton.backgroundColor = UIColor.blueColor()
        return iconButton
    }()
    private lazy var bottomMenu : CDH_BottomMenuView = {
        let bottomMenu = CDH_BottomMenuView()
        bottomMenu.backgroundColor = UIColor.yellowColor()
        return bottomMenu
    }()
    private lazy var tabbarView : CDH_TabbarView = {
        let tabbarView = CDH_TabbarView()
        tabbarView.backgroundColor = UIColor.redColor()
        return tabbarView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        // 添加子控件
        self.addSubview(iconButton)
        self.addSubview(bottomMenu)
        self.addSubview(tabbarView)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: - 布局子控件
extension CDH_DockView {
    override func layoutSubviews() {
        
        iconButton.frame.size.width = isLandscape ? kIconButtonLandscapeW : kIconButtonProtraitWH
        iconButton.frame.size.height = isLandscape ? kIconButtonLandscapeH : kIconButtonProtraitWH
        iconButton.frame.origin.y = kIconButtonY
        iconButton.frame.origin.x = (self.frame.width - iconButton.frame.width) * 0.5

        bottomMenu.frame.size.width = self.frame.width
        bottomMenu.frame.size.height = isLandscape ? kDockItemH : kDockItemH * 3.0
        bottomMenu.frame.origin.y = self.frame.height - bottomMenu.frame.height

        tabbarView.frame.size.width = self.frame.width
        tabbarView.frame.size.height = kDockItemH * CGFloat(tabbarView.subviews.count)  
        tabbarView.frame.origin.y = self.frame.height - tabbarView.frame.height - self.bottomMenu.frame.height


        
    }
    

}

