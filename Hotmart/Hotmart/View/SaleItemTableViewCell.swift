//
//  SaleItemTableViewCell.swift
//  Hotmart
//
//  Created by Richard Leh on 05/02/2017.
//  Copyright © 2017 Richard Leh. All rights reserved.
//

import UIKit

class SaleItemTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var idDateLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var attentionIcon: UIImageView!
        
    func set(with item:SaleItem?){
        guard let item = item else {
            return
        }
        
        titleLabel.text = item.title
        idDateLabel.text = "\(item.id)" + " - " + item.date
        priceLabel.text = item.price
        attentionIcon.isHidden = !item.warning
    }
}
