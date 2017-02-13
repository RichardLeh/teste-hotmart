//
//  Message.swift
//  Hotmart
//
//  Created by Richard on 07/02/17.
//  Copyright © 2017 Richard Leh. All rights reserved.
//

import Foundation
import RealmSwift

typealias ArrayMessage = Results<Message>

struct MessageAtributtes {
    static let id = "id"
    static let sender = "sender"
    static let content = "content"
    static let date = "date"
    static let unread = "unread"
}

class Message: Object {
    dynamic var id = 0
    dynamic var sender = ""
    dynamic var content = ""
    dynamic var date = ""
    dynamic var unread = true
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    convenience init(withData data: DictionaryType) {
        self.init()
        
        if let id = data[MessageAtributtes.id] as? Int{
            self.id = id
        }
        if let sender = data[MessageAtributtes.sender] as? String{
            self.sender = sender
        }
        if let content = data[MessageAtributtes.content] as? String{
            self.content = content
        }
        if let date = data[MessageAtributtes.date] as? String{
            self.date = date
        }
        if let unread = data[MessageAtributtes.unread] as? Bool{
            self.unread = unread
        }
    }
}

extension Message {
    class func getMessages() -> ArrayMessage? {
        return DataBase.getRealm()?.objects(Message.self)
    }
    class func getCountUnreadMessages() -> Int{
        if let data = getMessages() {
            return data.filter("unread = true").count
        }
        return 0
    }
    class func getMessage(byId id:Int) -> Message? {
        if let data = getMessages() {
            return data.filter("id = %@", id).first
        }
        return nil
    }
}
