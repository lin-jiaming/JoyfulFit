//
//  WeightDao.swift
//  JoyfulFit
//
//  Created by 林佳明 on 2018/6/5.
//  Copyright © 2018年 Linjiaming. All rights reserved.
//

import Foundation
import RealmSwift
final class WeightDao {
    static let dao = RealmDaoHelper<WeightModel>()
    
    //添加单条数据
    static func addWeight(object: WeightModel) {
        dao.add(object: object)
    }
    
    //添加多条数据
    static func addWeights(objects: [WeightModel]) {
        dao.add(objects: objects)
    }
    
    //修改单条数据
    static func updateWeight(object: WeightModel) {
        dao.update(object: object)
    }
    
    //修改多条数据
    static func updateWeights(objects: [WeightModel]){
        dao.update(objects: objects)
    }
    
    //根据ref(Id)删除数据
    static func deleteWeight(ref: String){
        guard let object = dao.findFirst(key: ref as AnyObject) else {
            return
        }
        dao.delete(object: object)
    }
    
    //删除所有数据
    static func deleteAll() {
        dao.deleteAll()
    }
    
    //根据ref查询单条数据
    static func findWeightByRes(ref: String) -> WeightModel?{
        guard let object = dao.findFirst(key: ref as AnyObject) else {
            return nil
        }
        return object
    }
    
    //查询所有数据
    static func findAll() -> [WeightModel] {
        return dao.findAll().map {WeightModel(value: $0)}
    }
    
    //根据email查询数据
    static func findWeightByEamil(email: String) -> [WeightModel]{
        return dao.findByEmail(email: email).map{WeightModel(value: $0)}
    }
}
