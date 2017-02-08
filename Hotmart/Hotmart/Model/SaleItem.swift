//
//  SaleItem.swift
//  Hotmart
//
//  Created by Richard Leh on 05/02/2017.
//  Copyright © 2017 Richard Leh. All rights reserved.
//

import Foundation
import RealmSwift

struct SaleItemAtributtes {
    static let id = "id"
    static let title = "title"
    static let date = "date"
    static let price = "price"
    static let warning = "warning"
}

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
        
        if let id = data[SaleItemAtributtes.id] as? Int{
            self.id = id
        }
        if let title = data[SaleItemAtributtes.title] as? String{
            self.title = title
        }
        if let price = data[SaleItemAtributtes.price] as? String{
            self.price = price
        }
        if let date = data[SaleItemAtributtes.date] as? String{
            self.date = date
        }
        if let warning = data[SaleItemAtributtes.warning] as? Bool{
            self.warning = warning
        }
    }
}
