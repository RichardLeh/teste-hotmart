//
//  MenuViewController.swift
//  Hotmart
//
//  Created by Richard Leh on 04/02/2017.
//  Copyright © 2017 Richard Leh. All rights reserved.
//

import UIKit

typealias MenuItem = (title:String, image:UIImage)

class MenuViewController: UIViewController {

    let menuItens = [MenuItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpMenu()
    }

    func setUpMenu(){
        
        //let menuItens = ["Dashboard", "Minhas Vendas", "Meus Produtos", "Afiliados", "Mensagens", "Notificações", "Minha Conta", "Sobre o App"]
    
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension MenuViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "menuCell") as! MenuTableViewCell
        cell.menuTitle.text = "teste \(indexPath.row)"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
}
