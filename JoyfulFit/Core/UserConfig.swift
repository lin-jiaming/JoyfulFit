//
//  UserConfig.swift
//  JoyfulFit
//
//  Created by 林佳明 on 2018/6/12.
//  Copyright © 2018年 Linjiaming. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift
import ObjectMapper
class UserConfig: Object,Mappable {
    @objc dynamic var email = ""
    @objc dynamic var deviceIdentifier: String = ""
    @objc dynamic var deviceMacAddress: String = ""
    required convenience init?(map: Map) {
        self.init()
    }
    func mapping(map: Map) {
        email       <- map[""]
    }
      
    
}
