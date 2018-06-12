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
    static func findByUserId(Id: String) -> UserModel? {
        guard let object = dao.findFirst(key: Id as AnyObject) else {
            return nil
        }
        return object
    }
    
    //查询所有数据
    static func findAll() -> [UserModel] {
        return dao.findAll().map {UserModel(value: $0)}
    }
}
