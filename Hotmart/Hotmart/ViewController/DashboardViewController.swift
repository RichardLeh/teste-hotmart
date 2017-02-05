//
//  DashboardViewController.swift
//  Hotmart
//
//  Created by Richard Leh on 05/02/2017.
//  Copyright © 2017 Richard Leh. All rights reserved.
//

import UIKit

class DashboardViewController: UIViewController {
    
    @IBOutlet weak var statusView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()

        let nav = self.navigationController?.navigationBar
        let color = UIColor(defaultColor: .navDashboard)
        nav?.barTintColor = color
        statusView.backgroundColor = color
        
        self.title = "Dashboard"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
