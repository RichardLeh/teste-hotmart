//
//  MinhasVendasViewController.swift
//  Hotmart
//
//  Created by Richard Leh on 05/02/2017.
//  Copyright © 2017 Richard Leh. All rights reserved.
//

import UIKit

class MySalesViewController: UIViewController {

    var saleItens = [SaleItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let nav = self.navigationController?.navigationBar
        let color = UIColor(defaultColor: .navMySales)
        nav?.barTintColor = color
        
        self.title = "Minhas Vendas"
        
        getSalesItens()
    }

    func getSalesItens(){
        
        let titles = ["Como decorar uma festa",
                      ""]
        
        for index in 0...5 {
            var attention = false
            if index < 3 {
                attention = true
            }
            
            let item = SaleItem(id: "354\(index)",
                                title: "Como decorar uma festa",
                                date: Date().description,
                                price: Int(arc4random_uniform(400000)),
                                attention: attention)
            
            self.saleItens.append(item)
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension MySalesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "saleCell") as! SaleItemTableViewCell
        cell.set(with: saleItens[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return saleItens.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        /*if !menuItens[indexPath.row].link.isEmpty {
            sideMenuController?.performSegue(withIdentifier: menuItens[indexPath.row].link, sender: nil)
        }*/
    }
}
