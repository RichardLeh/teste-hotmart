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
        
        let menuName = (currentLanguage == "pt") ? RequestSettings.localMenuPt : RequestSettings.localMenuEn
        
        setUpMenu(withDict: Request.getMenuPlist(withName: menuName))
    }

    func setUpUser(with user:User?){
        userNameLabel.text = user?.name.uppercased()
        emailUserLabel.text = user?.email.lowercased()
        
        defer {
            backgroundImageView.blurImage()
        }
        
        let defaultImage = #imageLiteral(resourceName: "user")
    
        picImageView.image = defaultImage
        backgroundImageView.image = defaultImage
        
        guard let urlString = user?.pictureUrl, let picUrl = URL(string: urlString) else {
            return
        }
        
        if let data = try? Data(contentsOf: picUrl){
            picImageView.image = UIImage(data: data)
            backgroundImageView.image = UIImage(data: data)
        }
        
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
