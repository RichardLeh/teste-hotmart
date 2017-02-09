//
//  General.swift
//  Hotmart
//
//  Created by Richard Leh on 05/02/2017.
//  Copyright © 2017 Richard Leh. All rights reserved.
//

import Foundation

typealias DictionaryType = Dictionary<String, Any>

let currentLanguage:String? = NSLocale.current.languageCode

enum Colors: String {
    case darkOrange = "#d04f2a"
    case lightOrange = "#e7ad45"
    case blue = "#4982c5"
    case lightGreen = "#a3c74b"
    case pink = "#ce4251"
    
    case lightGrayBG = "#f4f4f4"
}

struct Segues {
    static let sideMenu = "sideMenu"
    static let menuDashboard = "segueMenuDashboard"
    static let menuMySales = "segueMenuMySales"
    static let menuMessages = "segueMenuMessages"
}

struct Titles {
    static let dashboard = "Dashboard"
    static let mysales   = (currentLanguage == "pt") ? "Minhas Vendas" : "My Sales"
    static let messages  = (currentLanguage == "pt") ? "Mensagens" : "Messages"
}
