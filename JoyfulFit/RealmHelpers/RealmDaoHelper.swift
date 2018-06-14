//
//  RealmDaoHelper.swift
//  RealmDemo
//
//  Created by Linjiaming on 2018/5/9.
//  Copyright © 2018年 Linjiaming. All rights reserved.
//

import RealmSwift
//Realm工具类
final class RealmDaoHelper <T : RealmSwift.Object>{
    let realm: Realm
    init() {
        try! realm = Realm()
        print("Realm数据库打开成功")
        defer {
            realm.invalidate()
        }
    }
    
    /*
     设置主键
     */
    func newId() -> Int?{
        guard let key = T.primaryKey() else{
            //primaryKey未设定
            return nil
        }
        
        let realm = try! Realm()
        return (realm.objects(T.self).max(ofProperty: key) as Int? ?? 0) + 1
    }
    
    /**
     *查询所有数据
     */
    func findAll() -> Results<T> {
        return realm.objects(T.self)
    }
    
    
    /**
     *获取第一个数据
     */
    func findFirst() -> T? {
        return findAll().first
    }
    
    /**
     *通过主键获取数据
     */
    func findFirst(key: AnyObject) -> T? {
        return realm.object(ofType: T.self, forPrimaryKey: key)
    }
    
    /**
     *获取最后的数据
     */
    func findLast() -> T? {
        return findAll().last
    }
    
    /**
     *根据邮箱获取数据
     *
     ***/
    func findByEmail(email: String) -> Results<T>{
        return realm.objects(T.self).filter("email = %@", email)
    }
    
    
    /**
     *添加数据
     */
    func add(object: T) {
        do {
            try realm.write {
                realm.add(object, update: true)
            }
        }catch let error {
            print(error.localizedDescription)
        }
    }
    
    /**
     *添加多个数据
     */
    func add(objects: [T])  {
        do {
            try realm.write {
                realm.add(objects, update: true)
            }
        }catch let error{
            print(error.localizedDescription)
        }
    }
    
    /**
     *修改
     */
    @discardableResult
    func update(object: T,block:(() -> Void)? = nil) -> Bool {
        do {
            try realm.write {
                block?()
                realm.add(object, update: true)
            }
            return true
        }catch let error {
            print(error.localizedDescription)
        }
        return false
    }
    
    @discardableResult
    func update(objects:[T],block:(() -> Void)? = nil) -> Bool {
        do{
            try realm.write {
                block?()
                realm.add(objects,update: true)
            }
            return true
        }catch let error{
            print(error.localizedDescription)
        }
        return false
    }
    
    /**
     *删除数据
     */
    func delete(object: T) {
        do{
            try realm.write {
                realm.delete(object)
            }
        }catch let error{
            print(error.localizedDescription)
        }
    }
    
    /**
     *删除所有数据
     */
    func deleteAll() {
        let objs = realm.objects(T.self)
        do{
            try realm.write {
                realm.delete(objs)
            }
        }catch let error {
            print(error.localizedDescription)
        }
    }
}
