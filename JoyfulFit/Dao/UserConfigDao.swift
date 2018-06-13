//
//  UserConfigDao.swift
//  JoyfulFit
//
//  Created by 林佳明 on 2018/6/12.
//  Copyright © 2018年 Linjiaming. All rights reserved.
//

import UIKit
import RealmSwift
final class UserConfigDao{
    //实例化一个UserConfig
    static let userConfig = UserConfig()
    //实例化一个RealmDaoHelper
    static let dao = RealmDaoHelper<UserConfig>()
    
    //添加UserConfig
    static func addUserConfig(object: UserConfig){
        dao.add(object:object)
    }
    //修改UserConfig
    static func updateUserConfig(object: UserConfig){
        dao.update(object: object)
    }
    //删除UserConfig
    static func deleteUserConfig(){
        dao.deleteAll()
    }
    
    //查询UserConfig
    static func findAll() -> [UserConfig] {
        return dao.findAll().map {UserConfig(value: $0)}
    }
    
    //判断是否登录
    static func isLogin() -> Bool{
        return self.userConfig.email != ""
    }
    
    
}
