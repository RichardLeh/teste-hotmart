//
//  DataBase.swift
//  Hotmart
//
//  Created by Richard on 07/02/17.
//  Copyright © 2017 Richard Leh. All rights reserved.
//

import Foundation
import RealmSwift

struct DataBaseSettings {
    static let name = "database.realm"
    static let localJson = "server"
    
    struct jsonProperties {
        static let user = "user"
        static let sales = "sales"
        static let messages = "messages"
    }
}

class DataBase {
    
    private func setUpRealmConfig(){
        var config = Realm.Configuration()
        
        config.fileURL = config.fileURL!.deletingLastPathComponent()
            .appendingPathComponent(DataBaseSettings.name)
        
        Realm.Configuration.defaultConfiguration = config
    }
    
    func startSync(){
        self.setUpRealmConfig()
        
        if let data = Request().getLocalJsonData(name: DataBaseSettings.localJson) as? DictionaryType {
            print(data)
            
            let realm = try! Realm()
            
            if let userData = data[DataBaseSettings.jsonProperties.user] as? DictionaryType {
                print(userData)
                
                let user = User(withData: userData)
                
                try? realm.write {
                    realm.add(user, update:true)
                }
                
            }
            
            if let salesData = data[DataBaseSettings.jsonProperties.sales] as? [DictionaryType] {
                
                for sale in salesData {
                    let saleItem = SaleItem(withData: sale)
                    
                    try? realm.write {
                        realm.add(saleItem, update:true)
                    }
                    
                }
            }
            
            if let messagesData = data[DataBaseSettings.jsonProperties.messages] as? [DictionaryType] {
                
                for message in messagesData {
                    let messageItem = Message(withData: message)
                    
                    try? realm.write {
                        realm.add(messageItem, update:true)
                    }
                    
                }
            }
        }
    }
    
    func getCurrentUser() -> User{
        var user = User()//name: "Richard Leh", email: "richardleh@gmail.com", picture: #imageLiteral(resourceName: "user"))
        
        let realm = try? Realm()
        if let realm = realm {
            if let userdb = realm.objects(User.self).first {
                user = userdb
            }
        }
        
        return user
    }
    
    func getSalesItens() -> [SaleItem]{
        var saleItens = [SaleItem]()
        
        let realm = try? Realm()
        if let realm = realm {
            saleItens = Array(realm.objects(SaleItem.self))
        }
        
        return saleItens
    }
}
