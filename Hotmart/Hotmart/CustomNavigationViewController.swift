//
//  CustomNavigationViewController.swift
//  Hotmart
//
//  Created by Richard Leh on 05/02/2017.
//  Copyright © 2017 Richard Leh. All rights reserved.
//

import UIKit

class CustomNavigationViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let nav = self.navigationBar
        
        nav.setBackgroundImage(UIImage(), for: .default)
        nav.backgroundColor = UIColor.red
        
        nav.isTranslucent = false
        nav.shadowImage = UIImage()
        
        nav.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
    }
}
