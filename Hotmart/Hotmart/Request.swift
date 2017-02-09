//
//  Request.swift
//  Hotmart
//
//  Created by Richard on 07/02/17.
//  Copyright © 2017 Richard Leh. All rights reserved.
//

import Foundation

struct RequestSettings {
    static let localJsonEn = "server"
    static let localJsonPt = "server-pt"
    
    static let localMenuEn = "Menu"
    static let localMenuPt = "Menu-pt"
    
    struct jsonProperties {
        static let user = "user"
        static let sales = "sales"
        static let messages = "messages"
    }
}

class Request {
    
    class func getLocalJsonData(withName name: String) -> Any? {
        if let path = Bundle.main.path(forResource: name, ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
                return json
            }catch {
                print("local json data error: \(error.localizedDescription)")
            }
        }
        return nil
    }
    
    class func getMenuPlist(withName name: String) -> [Dictionary<String, String>] {
        
        var menuItensArrDict = [Dictionary<String, String>]()
        if  let fileUrl = Bundle.main.url(forResource: name, withExtension: "plist"),
            let data = try? Data(contentsOf: fileUrl) {
            if let menuItensArr = try? PropertyListSerialization.propertyList(from: data, options: [], format: nil) as? [Dictionary<String, String>] {
                if let menuItensArr = menuItensArr{
                    menuItensArrDict = menuItensArr
                }
            }
        }
        
        return menuItensArrDict
    }
}
