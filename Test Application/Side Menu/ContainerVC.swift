//
//  ContainerVC.swift
//  Test Application
//
//  Created by Vaibhav Mehta on 17/10/19.
//  Copyright © 2019 TDH. All rights reserved.
//

import UIKit

class ContainerVC: UIViewController {
    
    
    @IBOutlet weak var sideMenuConstraint: NSLayoutConstraint!
    
    
    var sideMenuOpen = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(menu), name: NSNotification.Name("ToggleSideMenu"), object: nil)
    }
    
    @objc func menu(){
        
        if sideMenuOpen{
            
            sideMenuOpen = false
            
            sideMenuConstraint.constant = -240
        }
        else{
            
            sideMenuOpen = true
            
            sideMenuConstraint.constant = 0
            
        }
        
        UIView.animate(withDuration: 0.3){
            
            self.view.layoutIfNeeded()
            
        }
        
    }
}
