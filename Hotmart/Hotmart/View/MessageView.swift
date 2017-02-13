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
    
    class func instanceFromNib() -> MessageView {
        return UINib(nibName: "MessageView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! MessageView
    }
    
    func updateRadius(){
        self.imgButton.cornerRadius = self.frame.width / 2
    }
}
