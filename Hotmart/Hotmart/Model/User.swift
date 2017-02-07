//
//  User.swift
//  Hotmart
//
//  Created by Richard Leh on 05/02/2017.
//  Copyright © 2017 Richard Leh. All rights reserved.
//

import Foundation
import RealmSwift

class User: Object{
    dynamic var id = 0
    dynamic var name  = ""
    dynamic var email = ""
    dynamic var balance = ""
    dynamic var pictureUrl  = ""
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    convenience init(withData data: DictionaryType) {
        self.init()
        
        if let id = data["id"] as? Int{
            self.id = id
        }
        if let name = data["name"] as? String{
            self.name = name
        }
        if let email = data["email"] as? String{
            self.email = email
        }
        if let balance = data["balance"] as? String{
            self.balance = balance
        }
        if let pictureUrl = data["pictureUrl"] as? String{
            self.pictureUrl = pictureUrl
        }
    }
}
