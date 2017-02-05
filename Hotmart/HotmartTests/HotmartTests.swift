//
//  HotmartTests.swift
//  HotmartTests
//
//  Created by Richard Leh on 03/02/2017.
//  Copyright © 2017 Richard Leh. All rights reserved.
//

import XCTest
@testable import Hotmart

class HotmartTests: XCTestCase {
    
    let menuViewController = MenuViewController()
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testMenuCount() {
        let itensPlist = menuViewController.getMenuPlist()
        XCTAssertTrue(itensPlist.count > 0)
    }
    
    func testMenuSetUp() {
        let itensPlist = menuViewController.getMenuPlist()
        menuViewController.setUpMenu(withDict: itensPlist)
        let itensMenu = menuViewController.menuItens
        
        XCTAssertTrue(itensPlist.count == itensMenu.count)
    }
    
}
