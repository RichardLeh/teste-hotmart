//
//  AppDelegate.swift
//  Hotmart
//
//  Created by Richard Leh on 03/02/2017.
//  Copyright © 2017 Richard Leh. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        UIApplication.shared.setStatusBarHidden(false, with: .slide)
        
        return true
    }
}

