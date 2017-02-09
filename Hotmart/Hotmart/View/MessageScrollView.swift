//
//  MessageScrollView.swift
//  Hotmart
//
//  Created by Richard on 08/02/17.
//  Copyright © 2017 Richard Leh. All rights reserved.
//

import UIKit

class MessageScrollView: UIScrollView {

    private let messageViewSize = (width: 74.0, height: 108.0)
    
    private let messageViewMarginLeft = 18.5
    private let messageViewMarginBetween = 27.0
    private var messageViewMarginTop = 18.5
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        messageViewMarginTop = Double((self.frame.height / 2)) - (messageViewSize.height / 2)
        createMessagesViews()
    }

    func createMessagesViews(){
        
        guard let messages = Message.getMessages() else { return }
        
        let bgColors = [UIColor(defaultColor: .lightGreen), UIColor(defaultColor: .blue), UIColor(defaultColor: .darkOrange)]
        var indexColor = 0
        
        for (index, message) in messages.enumerated() {
            
            let messageView = MessageView.instanceFromNib()
            let sender = message.sender
            
            let x = messageViewMarginLeft
                  + (messageViewSize.width * Double(index))
                  + (messageViewMarginBetween * Double(index))
            
            messageView.frame = CGRect(
                x: x,
                y: messageViewMarginTop,
                width: messageViewSize.width,
                height: messageViewSize.height)
            
            messageView.updateRadius()
            
            let firstLetter = sender[sender.startIndex]
            messageView.imgButton.setTitle("\(firstLetter)", for: .normal)
            
            let color = bgColors[indexColor]
            indexColor += 1
            if indexColor > 2 { indexColor = 0 }
            
            messageView.imgButton.backgroundColor = color
            messageView.imgButton.tag = message.id
            messageView.imgButton.addTarget(self, action: #selector(self.openMessage), for: .touchUpInside)

            messageView.nameLabel.text = sender
            
            self.addSubview(messageView)
        }
        
        let width = messageViewMarginLeft + (messageViewMarginBetween * Double(messages.count)) + (messageViewSize.width * Double(messages.count))
        self.contentSize = CGSize(width: width, height: 0)
    }
    
    func openMessage(sender:Any?){
        if let button = sender as? UIButton{
            print(button.tag)
            print(Message.getMessage(byId: button.tag))
        }
    }
}
