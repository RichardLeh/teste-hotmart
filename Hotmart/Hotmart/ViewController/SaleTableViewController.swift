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
    var saleItens = [SaleItem]()
    
    fileprivate let reuseIdentifier = "saleCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: "SaleItemTableViewCell", bundle: nil), forCellReuseIdentifier: reuseIdentifier)
        tableView.rowHeight = 110
        
        getSalesItens()
    }
    
    func getSalesItens(){
        
        let titles = ["Como decorar uma festa",
                      "Desenvolvendo seus negócios de forma efeciênte",
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit",
                      "Vivamus ornare porta tortor, ac condimentum eros imperdiet vel",
                      "Quisque vel lacus sapien. In id mattis felis",
                      "Meu produto, Meu produto, Meu produto, Meu produto, Meu produto"]
        
        for index in 0...5 {
            var attention = false
            if index < 3 {
                attention = true
            }
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd/MM/yyyy"
            let dateString = dateFormatter.string(from: Date())
            
            let item = SaleItem(id: "354\(index)",
                title: titles[index],
                date: dateString,
                price: Int(arc4random_uniform(400000)),
                attention: attention)
            
            self.saleItens.append(item)
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier) as! SaleItemTableViewCell
        cell.set(with: saleItens[indexPath.row])
        
        cell.backgroundColor = UIColor.white
        if indexPath.row % 2 == 0{
            cell.backgroundColor = UIColor(defaultColor: .lightGrayBG)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return saleItens.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
