//
//  CDH_TabbarView.swift
//  QQZone
//
//  Created by chendehao on 16/8/12.
//  Copyright © 2016年 CDHao. All rights reserved.
//

import UIKit

class CDH_TabbarView: UIView {
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // 初始化 items
        setUpItems(UIImage(named: "tab_bar_feed_icon")!, title: "全部动态")
        setUpItems(UIImage(named: "tab_bar_passive_feed_icon")!, title: "与我相关")
        setUpItems(UIImage(named: "tab_bar_pic_wall_icon")!, title: "照片墙")
        setUpItems(UIImage(named: "tab_bar_e_album_icon")!, title: "电子相框")
        setUpItems(UIImage(named: "tab_bar_friend_icon")!, title: "好友")
        setUpItems(UIImage(named: "tab_bar_e_more_icon")!, title: "其他")
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

// MARK: - 初始化子控件
extension CDH_TabbarView {
    private func setUpItems(image : UIImage , title : String){
        
    }
}

// MARK: - 布局子控件
extension CDH_TabbarView {

}


