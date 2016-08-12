//
//  CDH_Const.swift
//  QQZone
//
//  Created by chendehao on 16/8/12.
//  Copyright © 2016年 CDHao. All rights reserved.
//

import UIKit

/// 当前屏幕方向是否为横屏
var isLandscape = UIScreen.mainScreen().bounds.width > UIScreen.mainScreen().bounds.height
/// 横屏时 dock 的宽度
let kDockLandscapeWidth : CGFloat = 270
/// 竖屏时 dock 的宽度
let kDockProtraitWidth : CGFloat = 70

/// DockItem 高度
let kDockItemH :CGFloat = 70

/// IconButton 横屏宽度
let kIconButtonLandscapeW :CGFloat = 90
/// IconButton 横屏文字宽度
let kIconButtonTitleLandscapeW : CGFloat = 30
/// IconButton 横屏时的高度
let kIconButtonLandscapeH : CGFloat = kIconButtonLandscapeW + kIconButtonTitleLandscapeW

/// IconButton 竖屏时的宽高
let kIconButtonProtraitWH : CGFloat = 60

/// IconButton 的 Y 值
let kIconButtonY : CGFloat = 40





















