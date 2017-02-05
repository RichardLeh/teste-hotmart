//
//  MinhasVendasViewController.swift
//  Hotmart
//
//  Created by Richard Leh on 05/02/2017.
//  Copyright © 2017 Richard Leh. All rights reserved.
//

import UIKit

class MySalesViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let nav = self.navigationController?.navigationBar
        let color = UIColor(defaultColor: .navMySales)
        nav?.barTintColor = color
        
        self.title = "Minhas Vendas"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension MySalesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "saleCell")// as! MenuTableViewCell
        //cell.menuTitle.text = menuItens[indexPath.row].title
        //cell.menuImage.image = menuItens[indexPath.row].image
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        /*if !menuItens[indexPath.row].link.isEmpty {
            sideMenuController?.performSegue(withIdentifier: menuItens[indexPath.row].link, sender: nil)
        }*/
    }
}
