//
//  AppManager.swift
//  JoyfulFit
//
//  Created by 林佳明 on 2018/6/12.
//  Copyright © 2018年 Linjiaming. All rights reserved.
//

import UIKit
class AppManager: NSObject {
    static let manager : AppManager = AppManager()
    var settingManager: SettingManager?
    
    class func shareInstance() -> AppManager{
        return manager
    }
    
}
