//
//  MessageView.swift
//  Hotmart
//
//  Created by Richard on 08/02/17.
//  Copyright © 2017 Richard Leh. All rights reserved.
//

import UIKit

class MessageView: UIView {

    @IBOutlet weak var imgButton: UIButton!
    @IBOutlet weak var nameLabel: UILabel!
    
    func set(with message: Message){
        nameLabel.text = message.sender
    }

}
