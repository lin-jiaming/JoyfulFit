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
    
    static func add(object: WeightModel) {
        dao.add(object: object)
    }
    
    static func add(objects: [WeightModel]) {
        dao.add(objects: objects)
    }
    
    static func updateWeight(object: WeightModel) {
        dao.update(object: object)
    }
    
    static func updateWeights(objects: [WeightModel]){
        dao.update(objects: objects)
    }
    
    static func deleteWeight(res: String){
        guard let object = dao.findFirst(key: res as AnyObject) else {
            return
        }
        dao.delete(object: object)
    }
    
    static func deleteAll() {
        dao.deleteAll()
    }
    
    static func findWeightByRes(res: String) -> WeightModel?{
        guard let object = dao.findFirst(key: res as AnyObject) else {
            return nil
        }
        return object
    }
    
    static func findAll() -> [WeightModel] {
        return dao.findAll().map {WeightModel(value: $0)}
    }
}
