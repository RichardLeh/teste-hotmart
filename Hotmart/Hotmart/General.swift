//
//  General.swift
//  Hotmart
//
//  Created by Richard Leh on 05/02/2017.
//  Copyright © 2017 Richard Leh. All rights reserved.
//

import Foundation

typealias DictionaryType = Dictionary<String, Any>

enum Colors: String {
    case darkOrange = "#d04f2a" //navDashboard
    case lightOrange = "#e7ad45" // navMessages
    case blue = "#4982c5" // navMySales
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
    static let mysales   = "Minhas Vendas"
    static let messages  = "Mensagens"
}
