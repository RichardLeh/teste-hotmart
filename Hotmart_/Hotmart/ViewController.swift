//
//  ViewController.swift
//  Hotmart
//
//  Created by Richard Leh on 03/02/2017.
//  Copyright © 2017 Richard Leh. All rights reserved.
//

import UIKit
import SideMenuController

class ViewController: SideMenuController {

    required init?(coder aDecoder: NSCoder) {
        SideMenuController.preferences.drawing.menuButtonImage = #imageLiteral(resourceName: "ico_menu")
        SideMenuController.preferences.drawing.sidePanelPosition = .overCenterPanelLeft
        SideMenuController.preferences.drawing.sidePanelWidth = 280
        SideMenuController.preferences.drawing.centerPanelShadow = true
        SideMenuController.preferences.animating.statusBarBehaviour = .horizontalPan
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        performSegue(withIdentifier: "showViewController1", sender: nil)
        performSegue(withIdentifier: "showViewController2", sender: nil)
        performSegue(withIdentifier: "containSideMenu", sender: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

