//
//  WeightModel.swift
//  JoyfulFit
//
//  Created by 林佳明 on 2018/6/5.
//  Copyright © 2018年 Linjiaming. All rights reserved.
//

import Foundation
import RealmSwift
import ObjectMapper
import ObjectMapper_Realm
//体重数据模型
class WeightModel: Object, Mappable{
    @objc dynamic var ref = ""
    @objc dynamic var id = ""
    @objc dynamic var email = ""
    @objc dynamic var weight = ""
    @objc dynamic var bmi = ""
    @objc dynamic var fat = ""
    @objc dynamic var muscle = ""
    @objc dynamic var bone = ""
    @objc dynamic var bmr = ""
    @objc dynamic var water = ""
    @objc dynamic var comment = ""
    @objc dynamic var create_date = ""
    @objc dynamic var status = ""
    
    required convenience init?(map: Map){
        self.init()
    }
    //这个体重数据主键
    override static func primaryKey() -> String?{
        return "ref"
    }
    
    func mapping(map: Map) {
        ref                 <- map["ref"]
        id                  <- map["id"]
        email               <- map["email"]
        weight              <- map["weight"]
        bmi                 <- map["bmi"]
        fat                 <- map["fat"]
        muscle              <- map["muscle"]
        bone                <- map["bone"]
        bmr                 <- map["bmr"]
        water               <- map["water"]
        comment             <- map["comment"]
        create_date         <- map["create_date"]
        status              <- map["status"]
    }
    
}

