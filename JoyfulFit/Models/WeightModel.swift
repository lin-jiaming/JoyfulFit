//
//  WeightModel.swift
//  JoyfulFit
//
//  Created by 林佳明 on 2018/6/5.
//  Copyright © 2018年 Linjiaming. All rights reserved.
//

import Foundation
import RealmSwift
class WeightModel: Object{
    @objc dynamic var res = ""
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
    
    //这个体重数据主键
    override static func primaryKey() -> String?{
        return "res"
    }
    
}

