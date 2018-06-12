//
//  SettingManager.swift
//  JoyfulFit
//
//  Created by 林佳明 on 2018/6/12.
//  Copyright © 2018年 Linjiaming. All rights reserved.
//

import UIKit
class SettingManager: NSObject {
    var userConfig: UserConfig
    
    init(userConfig : UserConfig) {
        self.userConfig = userConfig
        super.init()
    }
}
