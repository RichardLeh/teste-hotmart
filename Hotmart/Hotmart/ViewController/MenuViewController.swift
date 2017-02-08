//
//  MenuViewController.swift
//  Hotmart
//
//  Created by Richard Leh on 04/02/2017.
//  Copyright © 2017 Richard Leh. All rights reserved.
//

import UIKit
import RealmSwift

class MenuViewController: UIViewController {

    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var picImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var emailUserLabel: UILabel!
    
    var menuItens = [MenuItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpUser(with: User.getCurrentUser())
        setUpMenu(withDict: getMenuPlist())
    }

    func setUpUser(with user:User?){
        userNameLabel.text = user?.name.uppercased()
        emailUserLabel.text = user?.email.lowercased()
        
        if let urlString = user?.pictureUrl, let picUrl = URL(string: urlString) {
            
            if let data = try? Data(contentsOf: picUrl){
                picImageView.image = UIImage(data: data)
                backgroundImageView.image = UIImage(data: data)
            }
        }
        
        backgroundImageView.blurImage()
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
                var menuAttention = ""
                if let attention = item["attention"]{
                    menuAttention = attention
                }
                
                let menuItem = MenuItem(title: title, image: image, link: menuLink, attention: menuAttention)
                menuItens.append(menuItem)
            }
        }
    }

}

extension MenuViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "menuCell") as! MenuTableViewCell
        cell.set(with: menuItens[indexPath.row])
        
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
