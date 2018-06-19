//
//  UserApiResponse.swift
//  JoyfulFit
//
//  Created by 林佳明 on 2018/6/19.
//  Copyright © 2018年 Linjiaming. All rights reserved.
//

import Foundation
import ObjectMapper

class UserApiReponse: Mappable {
    
    @objc dynamic var sqlite_id = ""
    @objc dynamic var id = ""
    @objc dynamic var syn = ""
    
    required convenience init?(map: Map){
        self.init()
    }
    
    func mapping(map: Map) {
        sqlite_id           <- map["sqlite_id"]
        id                  <- map["id"]
        syn                 <- map["syn"]
    }
    
}
