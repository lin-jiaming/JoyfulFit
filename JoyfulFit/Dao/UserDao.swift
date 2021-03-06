//
//  UserDao.swift
//  JoyfulFit
//
//  Created by 林佳明 on 2018/6/5.
//  Copyright © 2018年 Linjiaming. All rights reserved.
//

import Foundation
import RealmSwift

final class UserDao{
    static let dao = RealmDaoHelper<UserModel>()
    
    //添加单条数据
    static func addUser(object: UserModel) {
        dao.add(object: object)
    }
    
    //添加多条数据
    static func addUsers(objects: [UserModel]){
        dao.add(objects: objects)
    }
    
    //修改单条数据
    static func updateUser(object: UserModel){
        dao.update(object: object)
    }
    
    //修改多条数据
    static func updateUsers(objects: [UserModel]) {
        dao.update(objects: objects)
    }
    
    //根据Id删除数据
    static func deleteUser(Id: String) {
        guard  let object = dao.findFirst(key: Id as AnyObject) else {
            return
        }
        dao.delete(object: object)
    }
    
    //删除所有数据
    static func deleteAll(){
        dao.deleteAll()
    }
    
    //根据Id查询数据
    static func findUserById(Id: String) -> UserModel? {
        guard let object = dao.findFirst(key: Id as AnyObject) else {
            return nil
        }
        return object
    }
    //根据email查询数据
    static func findUserByEamil(email: String) -> [UserModel]{
        return dao.findByEmail(email: email).map{UserModel(value: $0)}
    }
    
    //查询所有数据
    static func findAll() -> [UserModel] {
        let userConfig = AppManager.shareInstance().settingManager.userConfigDao.findFirst()
        if userConfig != nil {
            let email = userConfig!.email
            let realm = try! Realm()
            let result =  realm.objects(UserModel.self).filter("email = %@", email)
//            let result = dao.findByEmail(email: email)
            return result.map{UserModel(value: $0)}
        }else{
            return [];
        }
        
    }
}
