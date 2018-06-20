//
//  SettingManager.swift
//  JoyfulFit
//
//  Created by 林佳明 on 2018/6/12.
//  Copyright © 2018年 Linjiaming. All rights reserved.
//

import UIKit
class SettingManager: NSObject {
    var userConfig: UserConfig?
    let userConfigDao = UserConfigDao()

    override init() {
        self.userConfig = userConfigDao.findFirst()
        super.init()
    }
}
