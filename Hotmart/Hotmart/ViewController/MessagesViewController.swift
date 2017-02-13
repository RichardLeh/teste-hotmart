//
//  MessagensViewController.swift
//  Hotmart
//
//  Created by Richard Leh on 05/02/2017.
//  Copyright © 2017 Richard Leh. All rights reserved.
//

import UIKit

class MessagesViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let nav = self.navigationController?.navigationBar
        let color = UIColor(defaultColor: .lightOrange)
        nav?.barTintColor = color
        
        self.title = Titles.messages
    }
}
