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
    
    static func addUser(object: UserModel) {
        dao.add(object: object)
    }
    
    static func addUsers(objects: [UserModel]){
        dao.add(objects: objects)
    }
    
    static func updateUser(objects: [UserModel]) {
        dao.update(objects: objects)
    }
    
    static func deleteUser(Id: String) {
        guard  let object = dao.findFirst(key: Id as AnyObject) else {
            return
        }
        dao.delete(object: object)
    }
    
    static func deleteAll(){
        dao.deleteAll()
    }
    
    static func findByUserId(Id: String) -> UserModel? {
        guard let object = dao.findFirst(key: Id as AnyObject) else {
            return nil
        }
        return object
    }
    
    static func findAll() -> [UserModel] {
        return dao.findAll().map {UserModel(value: $0)}
    }
}
