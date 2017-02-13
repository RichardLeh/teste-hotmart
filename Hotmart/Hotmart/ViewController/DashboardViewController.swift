//
//  DashboardViewController.swift
//  Hotmart
//
//  Created by Richard Leh on 05/02/2017.
//  Copyright © 2017 Richard Leh. All rights reserved.
//

import UIKit


class DashboardViewController: SaleTableViewController {
    
    @IBOutlet weak var statusView: UIView!
    @IBOutlet weak var saldoAtualLabel: UILabel!
    @IBOutlet weak var mensagensNãoLidas: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let nav = self.navigationController?.navigationBar
        let color = UIColor(defaultColor: .darkOrange)
        nav?.barTintColor = color
        statusView.backgroundColor = color
        
        self.title = Titles.dashboard
        
        saldoAtualLabel.text = User.getCurrentUser()?.balance
        mensagensNãoLidas.text = "\(Message.getCountUnreadMessages())"
    }
}
