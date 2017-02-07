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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let nav = self.navigationController?.navigationBar
        let color = UIColor(defaultColor: .navDashboard)
        nav?.barTintColor = color
        statusView.backgroundColor = color
        
        self.title = "Dashboard"
        self.saldoAtualLabel.text = DataBase().getCurrentUser().balance
    }
}
