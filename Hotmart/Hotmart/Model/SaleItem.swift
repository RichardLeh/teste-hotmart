//
//  SaleItem.swift
//  Hotmart
//
//  Created by Richard Leh on 05/02/2017.
//  Copyright © 2017 Richard Leh. All rights reserved.
//

import Foundation
import RealmSwift

class SaleItem: Object {
    dynamic var id = 0
    dynamic var title = ""
    dynamic var date = ""
    dynamic var price = ""
    dynamic var warning = false
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    convenience init(withData data: DictionaryType) {
        self.init()
        
        if let id = data["id"] as? Int{
            self.id = id
        }
        if let title = data["title"] as? String{
            self.title = title
        }
        if let price = data["price"] as? String{
            self.price = price
        }
        if let date = data["date"] as? String{
            self.date = date
        }
        if let warning = data["warning"] as? Bool{
            self.warning = warning
        }
    }
}
