//
//  Request.swift
//  Hotmart
//
//  Created by Richard on 07/02/17.
//  Copyright © 2017 Richard Leh. All rights reserved.
//

import Foundation

class Request {
    
    func getLocalJsonData(name: String) -> Any? {
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
}
