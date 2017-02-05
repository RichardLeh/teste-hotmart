//
//  MenuViewController.swift
//  Hotmart
//
//  Created by Richard Leh on 04/02/2017.
//  Copyright © 2017 Richard Leh. All rights reserved.
//

import UIKit

struct MenuItem {
    let title:String
    let image:UIImage
    let link:String
}

class MenuViewController: UIViewController {

    var menuItens = [MenuItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpMenu(withDict: getMenuPlist())
    }

    func getMenuPlist() -> [Dictionary<String, String>] {
        var menuItensArrDict = [Dictionary<String, String>]()
        if  let fileUrl = Bundle.main.url(forResource: "Menu", withExtension: "plist"),
            let data = try? Data(contentsOf: fileUrl) {
            if let menuItensArr = try? PropertyListSerialization.propertyList(from: data, options: [], format: nil) as? [Dictionary<String, String>] { // [String: Any] which ever it is
                if let menuItensArr = menuItensArr{
                    menuItensArrDict = menuItensArr
                }
            }
        }
        
        return menuItensArrDict
    }
    
    func setUpMenu(withDict itens:[Dictionary<String, String>]){
        for item in itens {
            if let title = item["title"],
               let imageString = item["image"],
               let image = UIImage(named: imageString) {
                
                var menuLink = ""
                if let link = item["link"] {
                    menuLink = link
                }
                
                let menuItem = MenuItem(title: title, image: image, link: menuLink)
                menuItens.append(menuItem)
            }
        }
    }

}

extension MenuViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "menuCell") as! MenuTableViewCell
        cell.menuTitle.text = menuItens[indexPath.row].title
        cell.menuImage.image = menuItens[indexPath.row].image
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItens.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if !menuItens[indexPath.row].link.isEmpty {
            sideMenuController?.performSegue(withIdentifier: menuItens[indexPath.row].link, sender: nil)
        }
    }
}
