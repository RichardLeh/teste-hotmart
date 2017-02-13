//
//  DataBase.swift
//  Hotmart
//
//  Created by Richard on 07/02/17.
//  Copyright © 2017 Richard Leh. All rights reserved.
//

import Foundation
import RealmSwift

class DataBase {
    
    class func getRealm() -> Realm? {
        return try? Realm()
    }
    
    class func startSync(){
        guard let realm = getRealm() else {
            print("there's an error accessing Realm!")
            return
        }
        
        let jsonName = (currentLanguage == "pt") ? RequestSettings.localJsonPt : RequestSettings.localJsonEn
        
        if let data = Request.getLocalJsonData(withName: jsonName) as? DictionaryType {
            print(data)
            
            if let userData = data[RequestSettings.jsonProperties.user] as? DictionaryType {
                print(userData)
                
                let user = User(withData: userData)
                
                try? realm.write {
                    realm.add(user, update:true)
                }
                
            }
            
            if let salesData = data[RequestSettings.jsonProperties.sales] as? [DictionaryType] {
                
                for sale in salesData {
                    let saleItem = SaleItem(withData: sale)
                    
                    try? realm.write {
                        realm.add(saleItem, update:true)
                    }
                    
                }
            }
            
            if let messagesData = data[RequestSettings.jsonProperties.messages] as? [DictionaryType] {
                
                for message in messagesData {
                    let messageItem = Message(withData: message)
                    
                    try? realm.write {
                        realm.add(messageItem, update:true)
                    }
                    
                }
            }
        }
    }
}
