//
//  MessageScrollView.swift
//  Hotmart
//
//  Created by Richard on 08/02/17.
//  Copyright © 2017 Richard Leh. All rights reserved.
//

import UIKit

class MessageScrollView: UIScrollView {

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        print("m scroll!! :)")
    }

    func createMessagesViews(with messages:[Message]){
        print(messages)
    }
    
}
