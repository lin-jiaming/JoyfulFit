//
//  UserConfigDao.swift
//  JoyfulFit
//
//  Created by 林佳明 on 2018/6/12.
//  Copyright © 2018年 Linjiaming. All rights reserved.
//

import UIKit
import RealmSwift
class UserConfigDao{

    //实例化一个RealmDaoHelper
    let dao = RealmDaoHelper<UserConfig>()
    
    //添加UserConfig
    func addUserConfig(object: UserConfig){
        dao.add(object:object)
    }
    //修改UserConfig
    func updateUserConfig(object: UserConfig){
        dao.update(object: object)
    }
    //删除UserConfig
    func deleteUserConfig(){
        dao.deleteAll()
    }
    
    //查询UserConfig
    func findAll() -> [UserConfig] {
        return dao.findAll().map {UserConfig(value: $0)}
    }
    
    func findFirst() -> UserConfig? {
        let resultList = dao.findAll()
        if (resultList.count > 0) {
            return resultList.first!
        }else{
//            assert(true, "UserConfig 数据库为空")
            return nil
        }
    }
    
    //判断是否登录
    func isLogin() -> Bool{
        return (AppManager.shareInstance().settingManager.userConfig != nil)
    }
    
    
}
