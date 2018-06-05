//
//  UserInfo.swift
//  JoyfulFit
//
//  Created by Linjiaming on 2018/5/25.
//  Copyright © 2018年 Linjiaming. All rights reserved.
//

import Foundation
import RealmSwift
//用户数据模型
class UserModel: Object {
    @objc dynamic var id = ""                //主键id
    @objc dynamic var admin_user = ""        //主用户id
    @objc dynamic var username = ""         //用户姓名
    @objc dynamic var email = ""            //用户邮箱
    @objc dynamic var password = ""         //用户密码
    @objc dynamic var gender =  ""          //性别
    @objc dynamic var dob = ""              //生日日期
    @objc dynamic var height = ""           //身高
    @objc dynamic var weight = ""           //体重
    @objc dynamic var target_weight = ""    //目标体重
    @objc dynamic var height_metric = ""    //身高单位
    @objc dynamic var weight_metric = ""    //体重单位
    @objc dynamic var language = ""         //语言
    @objc dynamic var status = ""            //状态
    @objc dynamic var create_date = ""        //创建时间
    @objc dynamic var update_date = ""        //修改时间
    @objc dynamic var photo = ""                //用户图片
    
    //设置主键
    override static func primaryKey() -> String?{
        return "id"
    }
}
