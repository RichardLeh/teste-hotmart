//
//  SaleTableViewController.swift
//  Hotmart
//
//  Created by Richard Leh on 07/02/2017.
//  Copyright © 2017 Richard Leh. All rights reserved.
//

import UIKit

class SaleTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var saleItens: ArraySaleItem?
    
    fileprivate let reuseIdentifier = "saleCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: "SaleItemTableViewCell", bundle: nil), forCellReuseIdentifier: reuseIdentifier)
        tableView.rowHeight = 110
        
        saleItens = SaleItem.getSalesItens()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier) as! SaleItemTableViewCell
        cell.set(with: saleItens?[indexPath.row])
        
        cell.backgroundColor = UIColor.white
        if indexPath.row % 2 == 0 {
            cell.backgroundColor = UIColor(defaultColor: .lightGrayBG)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let saleItens = saleItens else{ return 0 }
        return saleItens.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
