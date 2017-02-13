//
//  User.swift
//  Hotmart
//
//  Created by Richard Leh on 05/02/2017.
//  Copyright © 2017 Richard Leh. All rights reserved.
//

import Foundation
import RealmSwift

struct UserAtributtes {
    static let id = "id"
    static let name = "name"
    static let email = "email"
    static let balance = "balance"
    static let pictureUrl = "pictureUrl"
}

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
        
        if let id = data[UserAtributtes.id] as? Int{
            self.id = id
        }
        if let name = data[UserAtributtes.name] as? String{
            self.name = name
        }
        if let email = data[UserAtributtes.email] as? String{
            self.email = email
        }
        if let balance = data[UserAtributtes.balance] as? String{
            self.balance = balance
        }
        if let pictureUrl = data[UserAtributtes.pictureUrl] as? String{
            self.pictureUrl = pictureUrl
        }
    }
}

extension User {
    class func getCurrentUser() -> User? {
        return DataBase.getRealm()?.objects(User.self).first
    }
}
