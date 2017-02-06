//
//  MenuTableViewCell.swift
//  Hotmart
//
//  Created by Richard Leh on 04/02/2017.
//  Copyright © 2017 Richard Leh. All rights reserved.
//

import UIKit

class MenuTableViewCell: UITableViewCell {

    @IBOutlet weak var menuImage: UIImageView!
    @IBOutlet weak var menuTitle: UILabel!
    @IBOutlet weak var attentionLabel: AttentionLabel!
    
    func set(with menu:MenuItem){
        menuTitle.text = menu.title
        menuImage.image = menu.image
        
        attentionLabel.isHidden = true
        if !menu.attention.isEmpty {
            attentionLabel.text = "\(menu.attention)"
            attentionLabel.isHidden = false
        }
    }

}
