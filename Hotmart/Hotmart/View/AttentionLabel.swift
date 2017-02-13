//
//  AlertLabel.swift
//  Hotmart
//
//  Created by Richard Leh on 05/02/2017.
//  Copyright © 2017 Richard Leh. All rights reserved.
//

import UIKit

@IBDesignable class AttentionLabel: UILabel {

    @IBInspectable var padding: CGFloat = 5.0
    
    override func drawText(in rect: CGRect) {
        let insets = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
        super.drawText(in: UIEdgeInsetsInsetRect(rect, insets))
        
        self.backgroundColor = UIColor(defaultColor: .lightOrange)
    }

    override var intrinsicContentSize: CGSize {
        get {
            var contentSize = super.intrinsicContentSize
            contentSize.height += padding * 2
            contentSize.width += padding * 2
            return contentSize
        }
    }
}
